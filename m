Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb05.tieto.com ([131.207.168.36])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V4S58-0007Oe-6E
 for ath10k@lists.infradead.org; Wed, 31 Jul 2013 08:48:30 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 2/2] ath10k: implement tx checksum offloading
Date: Wed, 31 Jul 2013 10:47:57 +0200
Message-ID: <1375260477-17030-3-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1375260477-17030-1-git-send-email-michal.kazior@tieto.com>
References: <1375260477-17030-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

HW supports L3/L4 tx checksum offloading.

This should reduce CPU load and improve
performance on slow host machines.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htt_tx.c |    2 ++
 drivers/net/wireless/ath/ath10k/mac.c    |    2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index dc3f3e8..656c254 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -465,6 +465,8 @@ int ath10k_htt_tx(struct ath10k_htt *htt, struct sk_buff *msdu)
 	flags1  = 0;
 	flags1 |= SM((u16)vdev_id, HTT_DATA_TX_DESC_FLAGS1_VDEV_ID);
 	flags1 |= SM((u16)tid, HTT_DATA_TX_DESC_FLAGS1_EXT_TID);
+	flags1 |= HTT_DATA_TX_DESC_FLAGS1_CKSUM_L3_OFFLOAD;
+	flags1 |= HTT_DATA_TX_DESC_FLAGS1_CKSUM_L4_OFFLOAD;
 
 	frags_paddr = ATH10K_SKB_CB(txfrag)->paddr;
 
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 344ad27..5784337 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3309,6 +3309,8 @@ int ath10k_mac_register(struct ath10k *ar)
 	ar->hw->wiphy->iface_combinations = &ath10k_if_comb;
 	ar->hw->wiphy->n_iface_combinations = 1;
 
+	ar->hw->netdev_features = NETIF_F_HW_CSUM;
+
 	ret = ath_regd_init(&ar->ath_common.regulatory, ar->hw->wiphy,
 			    ath10k_reg_notifier);
 	if (ret) {
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
