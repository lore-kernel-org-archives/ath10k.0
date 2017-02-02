Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cZEwM-0005kR-ED
 for ath10k@lists.infradead.org; Thu, 02 Feb 2017 10:48:36 +0000
Subject: [PATCH 2/3] ath10k: use names in function definition arguments
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Thu, 2 Feb 2017 12:47:56 +0200
Message-ID: <148603247602.7275.16142503022595625609.stgit@potku.adurom.net>
In-Reply-To: <148603246555.7275.3348416808167032391.stgit@potku.adurom.net>
References: <148603246555.7275.3348416808167032391.stgit@potku.adurom.net>
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
Cc: linux-wireless@vger.kernel.org

Fixes new checkpatch warnings:

drivers/net/wireless/ath/ath10k/htt.h:1823: function definition argument 'struct sk_buff *' should also have an identifier name
drivers/net/wireless/ath/ath10k/wmi.h:6607: function definition argument 'struct wmi_start_scan_arg *' should also have an identifier name

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/htt.h |    2 +-
 drivers/net/wireless/ath/ath10k/wmi.h |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
index dfe9627df7d0..90c2f72666b8 100644
--- a/drivers/net/wireless/ath/ath10k/htt.h
+++ b/drivers/net/wireless/ath/ath10k/htt.h
@@ -1820,7 +1820,7 @@ int ath10k_htt_tx_mgmt_inc_pending(struct ath10k_htt *htt, bool is_mgmt,
 
 int ath10k_htt_tx_alloc_msdu_id(struct ath10k_htt *htt, struct sk_buff *skb);
 void ath10k_htt_tx_free_msdu_id(struct ath10k_htt *htt, u16 msdu_id);
-int ath10k_htt_mgmt_tx(struct ath10k_htt *htt, struct sk_buff *);
+int ath10k_htt_mgmt_tx(struct ath10k_htt *htt, struct sk_buff *msdu);
 int ath10k_htt_tx(struct ath10k_htt *htt,
 		  enum ath10k_hw_txrx_mode txmode,
 		  struct sk_buff *msdu);
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 861c2d8c6e8c..1333cbe48693 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -6604,7 +6604,7 @@ struct sk_buff *ath10k_wmi_alloc_skb(struct ath10k *ar, u32 len);
 int ath10k_wmi_cmd_send(struct ath10k *ar, struct sk_buff *skb, u32 cmd_id);
 int ath10k_wmi_cmd_send_nowait(struct ath10k *ar, struct sk_buff *skb,
 			       u32 cmd_id);
-void ath10k_wmi_start_scan_init(struct ath10k *ar, struct wmi_start_scan_arg *);
+void ath10k_wmi_start_scan_init(struct ath10k *ar, struct wmi_start_scan_arg *arg);
 
 void ath10k_wmi_pull_pdev_stats_base(const struct wmi_pdev_stats_base *src,
 				     struct ath10k_fw_stats_pdev *dst);


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
