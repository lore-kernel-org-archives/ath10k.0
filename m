Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZtwqF-0007ye-LF
 for ath10k@lists.infradead.org; Wed, 04 Nov 2015 12:07:04 +0000
From: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Subject: [PATCH V2 2/3] ath10k: Rename the helper which is used for
 off-channel tx
Date: Wed, 4 Nov 2015 17:35:36 +0530
Message-ID: <1446638737-7953-3-git-send-email-vthiagar@qti.qualcomm.com>
In-Reply-To: <1446638737-7953-1-git-send-email-vthiagar@qti.qualcomm.com>
References: <1446638737-7953-1-git-send-email-vthiagar@qti.qualcomm.com>
MIME-Version: 1.0
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
To: ath10k@lists.infradead.org
Cc: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, linux-wireless@vger.kernel.org

Rename ath10k_mac_need_offchan_tx_work() to ath10k_mac_tx_frm_has_freq()
to make it more meaningful. This helper will be used in the future
change. No functionality change.

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index a7411fe..f121021 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3280,7 +3280,7 @@ static void ath10k_tx_h_add_p2p_noa_ie(struct ath10k *ar,
 	}
 }
 
-static bool ath10k_mac_need_offchan_tx_work(struct ath10k *ar)
+static bool ath10k_mac_tx_frm_has_freq(struct ath10k *ar)
 {
 	/* FIXME: Not really sure since when the behaviour changed. At some
 	 * point new firmware stopped requiring creation of peer entries for
@@ -3288,8 +3288,8 @@ static bool ath10k_mac_need_offchan_tx_work(struct ath10k *ar)
 	 * tx credit replenishment and reliability). Assuming it's at least 3.4
 	 * because that's when the `freq` was introduced to TX_FRM HTT command.
 	 */
-	return !(ar->htt.target_version_major >= 3 &&
-		 ar->htt.target_version_minor >= 4);
+	return (ar->htt.target_version_major >= 3 &&
+		ar->htt.target_version_minor >= 4);
 }
 
 static int ath10k_mac_tx_wmi_mgmt(struct ath10k *ar, struct sk_buff *skb)
@@ -3673,7 +3673,7 @@ static void ath10k_tx(struct ieee80211_hw *hw,
 		ATH10K_SKB_CB(skb)->vdev_id = ar->scan.vdev_id;
 		spin_unlock_bh(&ar->data_lock);
 
-		if (ath10k_mac_need_offchan_tx_work(ar)) {
+		if (!ath10k_mac_tx_frm_has_freq(ar)) {
 			ATH10K_SKB_CB(skb)->htt.freq = 0;
 			ATH10K_SKB_CB(skb)->htt.is_offchan = true;
 
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
