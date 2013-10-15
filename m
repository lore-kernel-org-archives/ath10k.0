Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb06.tieto.com ([131.207.168.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VVz1o-0007UJ-IB
 for ath10k@lists.infradead.org; Tue, 15 Oct 2013 07:26:53 +0000
From: Bartosz Markowski <bartosz.markowski@tieto.com>
Subject: [PATCH v2] ath10k: do not warn about unsupported vdev param
Date: Tue, 15 Oct 2013 09:26:20 +0200
Message-ID: <1381821980-7966-1-git-send-email-bartosz.markowski@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Bartosz Markowski <bartosz.markowski@tieto.com>

10.X firmware does not support WMI_VDEV_PARAM_TX_ENCAP_TYPE.
It's a known limitation and we should not warn about this.

Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c |    3 ++-
 drivers/net/wireless/ath/ath10k/wmi.c |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 049eca2..97d7111 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -2085,7 +2085,8 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 	vdev_param = ar->wmi.vdev_param->tx_encap_type;
 	ret = ath10k_wmi_vdev_set_param(ar, arvif->vdev_id, vdev_param,
 					ATH10K_HW_TXRX_NATIVE_WIFI);
-	if (ret)
+	/* 10.X firmware does not support this VDEV parameter. Do not warn */
+	if (ret && ret != -EOPNOTSUPP)
 		ath10k_warn("Failed to set TX encap: %d\n", ret);
 
 	if (arvif->vdev_type == WMI_VDEV_TYPE_AP) {
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index f9766fa..fa07388 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -2763,7 +2763,7 @@ int ath10k_wmi_vdev_set_param(struct ath10k *ar, u32 vdev_id,
 		ath10k_dbg(ATH10K_DBG_WMI,
 			   "vdev param %d not supported by firmware\n",
 			    param_id);
-		return -EINVAL;
+		return -EOPNOTSUPP;
 	}
 
 	skb = ath10k_wmi_alloc_skb(sizeof(*cmd));
-- 
1.7.10


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
