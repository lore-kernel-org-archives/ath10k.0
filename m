Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hMEgs-0005rl-8p
 for ath10k@lists.infradead.org; Thu, 02 May 2019 16:36:12 +0000
Date: Fri, 3 May 2019 00:35:48 +0800
From: kbuild test robot <lkp@intel.com>
Subject: [RFC PATCH ath6kl] ath11k: ath11k_wmi_pull_pdev_stats_base() can be
 static
Message-ID: <20190502163548.GA11020@lkp-kbuild02>
References: <201905030017.UAWcRaLV%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <201905030017.UAWcRaLV%lkp@intel.com>
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
To: Sathishkumar Muruganandam <murugana@codeaurora.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, kbuild-all@01.org, ath10k@lists.infradead.org


Fixes: d25cb35c6f10 ("ath11k: add support for FW stats via WMI")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 wmi.c |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 8f116ee..1f969c9 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -4037,8 +4037,8 @@ int ath11k_pull_peer_assoc_conf_ev(struct ath11k_base *ab, u8 *evt_buf,
 	return 0;
 }
 
-void ath11k_wmi_pull_pdev_stats_base(const struct wmi_pdev_stats_base *src,
-				     struct ath11k_fw_stats_pdev *dst)
+static void ath11k_wmi_pull_pdev_stats_base(const struct wmi_pdev_stats_base *src,
+					    struct ath11k_fw_stats_pdev *dst)
 {
 	dst->ch_noise_floor = src->chan_nf;
 	dst->tx_frame_count = src->tx_frame_count;
@@ -4078,8 +4078,8 @@ ath11k_wmi_pull_pdev_stats_tx(const struct wmi_pdev_stats_tx *src,
 	dst->txop_ovf = src->txop_ovf;
 }
 
-void ath11k_wmi_pull_pdev_stats_rx(const struct wmi_pdev_stats_rx *src,
-				   struct ath11k_fw_stats_pdev *dst)
+static void ath11k_wmi_pull_pdev_stats_rx(const struct wmi_pdev_stats_rx *src,
+					  struct ath11k_fw_stats_pdev *dst)
 {
 	dst->mid_ppdu_route_change = src->mid_ppdu_route_change;
 	dst->status_rcvd = src->status_rcvd;
@@ -4354,7 +4354,7 @@ size_t ath11k_wmi_fw_stats_num_vdevs(struct list_head *head)
 	return num;
 }
 
-size_t ath11k_wmi_fw_stats_num_bcn(struct list_head *head)
+static size_t ath11k_wmi_fw_stats_num_bcn(struct list_head *head)
 {
 	struct ath11k_fw_stats_bcn *i;
 	size_t num = 0;
@@ -5600,7 +5600,7 @@ void ath11k_peer_assoc_conf_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 	complete(&ar->peer_assoc_done);
 }
 
-void ath11k_update_stats_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
+static void ath11k_update_stats_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 {
 	ath11k_debug_fw_stats_process(ab, evt_buf, len);
 }

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
