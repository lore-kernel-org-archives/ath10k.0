Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from youngberry.canonical.com ([91.189.89.112])
 by casper.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eQwxg-0003fi-LE
 for ath10k@lists.infradead.org; Mon, 18 Dec 2017 15:04:19 +0000
From: Colin King <colin.king@canonical.com>
Subject: [PATCH][next] ath10k: wmi: remove redundant integer fc
Date: Mon, 18 Dec 2017 15:02:45 +0000
Message-Id: <20171218150245.9073-1-colin.king@canonical.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>, ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable fc is being assigned but never used, so remove it. Cleans
up the clang warning:

warning: Value stored to 'fc' is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index 8d53063bd503..06fde53aa679 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -2494,7 +2494,6 @@ ath10k_wmi_tlv_op_gen_mgmt_tx(struct ath10k *ar, struct sk_buff *msdu)
 	void *ptr;
 	int len;
 	u32 buf_len = msdu->len;
-	u16 fc;
 	struct ath10k_vif *arvif;
 	dma_addr_t mgmt_frame_dma;
 	u32 vdev_id;
@@ -2503,7 +2502,6 @@ ath10k_wmi_tlv_op_gen_mgmt_tx(struct ath10k *ar, struct sk_buff *msdu)
 		return ERR_PTR(-EINVAL);
 
 	hdr = (struct ieee80211_hdr *)msdu->data;
-	fc = le16_to_cpu(hdr->frame_control);
 	arvif = (void *)cb->vif->drv_priv;
 	vdev_id = arvif->vdev_id;
 
-- 
2.14.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
