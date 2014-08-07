Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x236.google.com ([2a00:1450:400c:c05::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFJme-0002pF-Nd
 for ath10k@lists.infradead.org; Thu, 07 Aug 2014 09:14:53 +0000
Received: by mail-wi0-f182.google.com with SMTP id d1so4652740wiv.9
 for <ath10k@lists.infradead.org>; Thu, 07 Aug 2014 02:14:30 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 5/5] ath10k: flush hif buffers before recovery
Date: Thu,  7 Aug 2014 11:05:08 +0200
Message-Id: <1407402308-29899-6-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1407402308-29899-1-git-send-email-michal.kazior@tieto.com>
References: <1407402308-29899-1-git-send-email-michal.kazior@tieto.com>
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

Transport buffers weren't flushed and processed
before queueing hw recovery request to mac80211.

This could in theory result in an unwanted htt/wmi
rx events being processed while mac80211 recovers
the device and possibly interfere or even crash
the system.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index b5161c8..5c9620b 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -667,6 +667,7 @@ static void ath10k_core_restart(struct work_struct *work)
 		ar->state = ATH10K_STATE_RESTARTING;
 		del_timer_sync(&ar->scan.timeout);
 		ath10k_reset_scan((unsigned long)ar);
+		ath10k_hif_stop(ar);
 		ieee80211_restart_hw(ar->hw);
 		break;
 	case ATH10K_STATE_OFF:
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
