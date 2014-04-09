Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x236.google.com ([2a00:1450:4013:c00::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXpQM-0004GT-08
 for ath10k@lists.infradead.org; Wed, 09 Apr 2014 10:08:06 +0000
Received: by mail-ee0-f54.google.com with SMTP id d49so1658758eek.41
 for <ath10k@lists.infradead.org>; Wed, 09 Apr 2014 03:07:42 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 3/4] ath10k: prevent beacon memory leak
Date: Wed,  9 Apr 2014 12:01:24 +0200
Message-Id: <1397037685-7485-4-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1397037685-7485-1-git-send-email-michal.kazior@tieto.com>
References: <1397037685-7485-1-git-send-email-michal.kazior@tieto.com>
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

If DMA mapping of next beacon failed ath10k leaked
the beacon.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 35c7d52..ca51f17 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -1450,6 +1450,7 @@ static void ath10k_wmi_event_host_swba(struct ath10k *ar, struct sk_buff *skb)
 					ATH10K_SKB_CB(bcn)->paddr);
 		if (ret) {
 			ath10k_warn("failed to map beacon: %d\n", ret);
+			dev_kfree_skb_any(bcn);
 			goto skip;
 		}
 
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
