Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x234.google.com ([2a00:1450:400c:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XJftt-0003Gd-Eu
 for ath10k@lists.infradead.org; Tue, 19 Aug 2014 09:40:21 +0000
Received: by mail-we0-f180.google.com with SMTP id w61so6164664wes.25
 for <ath10k@lists.infradead.org>; Tue, 19 Aug 2014 02:39:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20140819082300.16842.40769.stgit@potku.adurom.net>
References: <20140819082038.16842.46876.stgit@potku.adurom.net>
 <20140819082300.16842.40769.stgit@potku.adurom.net>
Date: Tue, 19 Aug 2014 11:39:59 +0200
Message-ID: <CA+BoTQmubLrvB1LHquFDNf8W06vePvEk6K3aNV9ngCAAXemY6w@mail.gmail.com>
Subject: Re: [PATCH v7 3/8] ath10k: save firmware debug log messages
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 19 August 2014 10:23, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> From: Ben Greear <greearb@candelatech.com>
>
> They may be dumped through the firmware dump debugfs
> file.
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath10k/wmi.c |   10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
> index 23acbadeb8fa..eafc565240f1 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -1290,6 +1290,16 @@ static int ath10k_wmi_event_debug_mesg(struct ath10k *ar, struct sk_buff *skb)
>
>         trace_ath10k_wmi_dbglog(skb->data, skb->len);
>
> +       spin_lock_bh(&ar->data_lock);
> +
> +       /* First 4 bytes are a messages-dropped-due-to-overflow counter,
> +        * and should not be recorded in the dbglog buffer, so we skip
> +        * them.
> +        */
> +       ath10k_debug_dbglog_add(ar, skb->data + 4, skb->len - 4);
> +
> +       spin_unlock_bh(&ar->data_lock);
> +
>         return 0;
>  }
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
