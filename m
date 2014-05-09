Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x236.google.com ([2a00:1450:4013:c00::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wik92-000127-FQ
 for ath10k@lists.infradead.org; Fri, 09 May 2014 12:43:20 +0000
Received: by mail-ee0-f54.google.com with SMTP id b57so2664372eek.13
 for <ath10k@lists.infradead.org>; Fri, 09 May 2014 05:42:58 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 6/7] ath10k: make wmi timeout trigger hw restart
Date: Fri,  9 May 2014 14:35:56 +0200
Message-Id: <1399638957-20449-7-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1399638957-20449-1-git-send-email-michal.kazior@tieto.com>
References: <1399638957-20449-1-git-send-email-michal.kazior@tieto.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

If tx credits aren't replenished for too long
firmware and driver state get out of sync. It
doesn't matter if firmware recovers a little later
on its own since by then it's already too late.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 159d744..e33c811 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -634,6 +634,11 @@ static int ath10k_wmi_cmd_send(struct ath10k *ar, struct sk_buff *skb,
 	if (ret)
 		dev_kfree_skb_any(skb);
 
+	if (ret == -EAGAIN) {
+		/* no credits for 3 seconds means fw is practically dead */
+		ath10k_core_restart(ar);
+	}
+
 	return ret;
 }
 
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
