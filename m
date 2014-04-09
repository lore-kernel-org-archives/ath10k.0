Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x232.google.com ([2a00:1450:4013:c00::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXpQN-0004Gt-Vv
 for ath10k@lists.infradead.org; Wed, 09 Apr 2014 10:08:08 +0000
Received: by mail-ee0-f50.google.com with SMTP id c13so1658113eek.37
 for <ath10k@lists.infradead.org>; Wed, 09 Apr 2014 03:07:45 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 4/4] ath10k: fix firmware recovery with ap interface
Date: Wed,  9 Apr 2014 12:01:25 +0200
Message-Id: <1397037685-7485-5-git-send-email-michal.kazior@tieto.com>
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

Beacon data wasn't properly cleared during early
phase of recovery. This in turn caused firmware to
crash because the beacon data was submitted before
vdevs were fully re-configured. Ultimately the
device was considered wedged and nothing worked
until driver was reloaded.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 5a9da3a..143ea1c 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -2264,6 +2264,8 @@ static void ath10k_tx(struct ieee80211_hw *hw,
  */
 void ath10k_halt(struct ath10k *ar)
 {
+	struct ath10k_vif *arvif;
+
 	lockdep_assert_held(&ar->conf_mutex);
 
 	ath10k_stop_cac(ar);
@@ -2280,6 +2282,17 @@ void ath10k_halt(struct ath10k *ar)
 		ar->scan.in_progress = false;
 		ieee80211_scan_completed(ar->hw, true);
 	}
+
+	list_for_each_entry(arvif, &ar->arvifs, list) {
+		if (!arvif->beacon)
+			continue;
+
+		dma_unmap_single(arvif->ar->dev,
+				 ATH10K_SKB_CB(arvif->beacon)->paddr,
+				 arvif->beacon->len, DMA_TO_DEVICE);
+		dev_kfree_skb_any(arvif->beacon);
+		arvif->beacon = NULL;
+	}
 	spin_unlock_bh(&ar->data_lock);
 }
 
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
