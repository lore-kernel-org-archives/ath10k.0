Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x233.google.com ([2a00:1450:4010:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XKoBp-0003SK-BH
 for ath10k@lists.infradead.org; Fri, 22 Aug 2014 12:43:33 +0000
Received: by mail-la0-f51.google.com with SMTP id pn19so9830672lab.38
 for <ath10k@lists.infradead.org>; Fri, 22 Aug 2014 05:43:11 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 5/5] ath10k: flush hif buffers before recovery
Date: Fri, 22 Aug 2014 14:33:18 +0200
Message-Id: <1408710798-25198-6-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1408710798-25198-1-git-send-email-michal.kazior@tieto.com>
References: <1408710798-25198-1-git-send-email-michal.kazior@tieto.com>
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

Notes:
    v2:
     * rebased with scan fixes
     * move hif_stop() before scan_finish()

 drivers/net/wireless/ath/ath10k/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 23ba321..157dcf9 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -665,6 +665,7 @@ static void ath10k_core_restart(struct work_struct *work)
 	switch (ar->state) {
 	case ATH10K_STATE_ON:
 		ar->state = ATH10K_STATE_RESTARTING;
+		ath10k_hif_stop(ar);
 		ath10k_scan_finish(ar);
 		ieee80211_restart_hw(ar->hw);
 		break;
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
