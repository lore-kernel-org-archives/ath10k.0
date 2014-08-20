Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x235.google.com ([2a00:1450:400c:c05::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XJzhU-0005Qx-TY
 for ath10k@lists.infradead.org; Wed, 20 Aug 2014 06:48:54 +0000
Received: by mail-wi0-f181.google.com with SMTP id bs8so6388213wib.8
 for <ath10k@lists.infradead.org>; Tue, 19 Aug 2014 23:48:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87zjez7m7t.fsf@kamboji.qca.qualcomm.com>
References: <CAD1M062MNW7y_hf+5btNA14xt9K69TqQy=Q-rCm+2xuHCZDEsA@mail.gmail.com>
 <53F39AB3.10601@candelatech.com>
 <CAD1M062FPxZyj86LvvaomwR3z2KeScnYDCNT_g6zMQzK10+vxA@mail.gmail.com>
 <87zjez7m7t.fsf@kamboji.qca.qualcomm.com>
Date: Wed, 20 Aug 2014 08:48:30 +0200
Message-ID: <CA+BoTQn1EiwajmmymkLSM6Nm0pJFOKqo89L4ZUiw6TGbQ-Cv_w@mail.gmail.com>
Subject: Re: Timeout Issues
From: Michal Kazior <michal.kazior@tieto.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Ben Greear <greearb@candelatech.com>, Pushpal Sidhu <psidhu@gateworks.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 20 August 2014 07:40, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Pushpal Sidhu <psidhu@gateworks.com> writes:
>
>> One interesting thing I found is if I use OpenWrt trunk, ath10k seems
>> to behave fine, but another distro seems to break things. I'll need to
>> dig further into that, but in the mean time, do you have any thoughts?
>
> What do you mean? On the exact same board ath10k works with openwrt but
> with another distribution it fails?
>
> What's this another distribution?

I'm rather interested in the toolchain differences. Perhaps the
compiler you used to build 3.16 reorders instructions so much it
breaks driver interaction with the hardware. This would suggests
ath10k is missing some compiler/memory barriers.

Can you apply the following patch and see if it changes anything, please?


From 3f5fc9bae19a0b429370025e781701472fc64529 Mon Sep 17 00:00:00 2001
From: Michal Kazior <michal.kazior@tieto.com>
Date: Wed, 20 Aug 2014 08:30:15 +0200
Subject: [PATCH] ath10k: add memory barries

Testing purposes.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htc.c | 1 +
 drivers/net/wireless/ath/ath10k/pci.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/htc.c
b/drivers/net/wireless/ath/ath10k/htc.c
index 7e08bb3..a1eb639 100644
--- a/drivers/net/wireless/ath/ath10k/htc.c
+++ b/drivers/net/wireless/ath/ath10k/htc.c
@@ -682,6 +682,7 @@ int ath10k_htc_connect_service(struct ath10k_htc *htc,
        req_msg->service_id = __cpu_to_le16(conn_req->service_id);

        reinit_completion(&htc->ctl_resp);
+       mb();

        status = ath10k_htc_send(htc, ATH10K_HTC_EP_0, skb);
        if (status) {
diff --git a/drivers/net/wireless/ath/ath10k/pci.c
b/drivers/net/wireless/ath/ath10k/pci.c
index 98c029b..673de9f 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1115,6 +1115,8 @@ static int ath10k_pci_hif_start(struct ath10k *ar)
                goto err_stop;
        }

+       mb();
+
        /* Post buffers once to start things off. */
        ret = ath10k_pci_post_rx(ar);
        if (ret) {
-- 
1.8.5.3

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
