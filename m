Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jNhHy-0001kz-Q7
 for ath10k@lists.infradead.org; Sun, 12 Apr 2020 18:25:04 +0000
Received: by mail-pg1-x543.google.com with SMTP id t11so1581011pgg.2
 for <ath10k@lists.infradead.org>; Sun, 12 Apr 2020 11:24:58 -0700 (PDT)
From: Mamatha Telu <telumamatha36@gmail.com>
Subject: [PATCH] ath10k: Fix typo in warning messages
Date: Sun, 12 Apr 2020 23:54:35 +0530
Message-Id: <1586715875-5182-1-git-send-email-telumamatha36@gmail.com>
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
Cc: Mamatha Telu <telumamatha36@gmail.com>, linux-wireless@vger.kernel.org

Fix some typo:
  s/fnrom/from
  s/pkgs/pkts/
  s/AMSUs/AMSDUs/

Signed-off-by: Mamatha Telu <telumamatha36@gmail.com>
---
 drivers/net/wireless/ath/ath10k/debug.c | 2 +-
 drivers/net/wireless/ath/ath10k/sdio.c  | 2 +-
 drivers/net/wireless/ath/ath10k/wmi.c   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index f811e69..69139c2 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -778,7 +778,7 @@ static ssize_t ath10k_mem_value_read(struct file *file,
 
 	ret = ath10k_hif_diag_read(ar, *ppos, buf, count);
 	if (ret) {
-		ath10k_warn(ar, "failed to read address 0x%08x via diagnose window fnrom debugfs: %d\n",
+		ath10k_warn(ar, "failed to read address 0x%08x via diagnose window from debugfs: %d\n",
 			    (u32)(*ppos), ret);
 		goto exit;
 	}
diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index 5a0db34..943db9f 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -542,7 +542,7 @@ static int ath10k_sdio_mbox_rx_alloc(struct ath10k *ar,
 	int pkt_cnt = 0;
 
 	if (n_lookaheads > ATH10K_SDIO_MAX_RX_MSGS) {
-		ath10k_warn(ar, "the total number of pkgs to be fetched (%u) exceeds maximum %u\n",
+		ath10k_warn(ar, "the total number of pkts to be fetched (%u) exceeds maximum %u\n",
 			    n_lookaheads, ATH10K_SDIO_MAX_RX_MSGS);
 		ret = -ENOMEM;
 		goto err;
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 4a3a698..a81a1ab 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -8336,7 +8336,7 @@ ath10k_wmi_fw_pdev_rx_stats_fill(const struct ath10k_fw_stats_pdev *pdev,
 	len += scnprintf(buf + len, buf_len - len, "%30s %10d\n",
 			 "MPDUs delivered to stack", pdev->loc_mpdus);
 	len += scnprintf(buf + len, buf_len - len, "%30s %10d\n",
-			 "Oversized AMSUs", pdev->oversize_amsdu);
+			 "Oversized AMSDUs", pdev->oversize_amsdu);
 	len += scnprintf(buf + len, buf_len - len, "%30s %10d\n",
 			 "PHY errors", pdev->phy_errs);
 	len += scnprintf(buf + len, buf_len - len, "%30s %10d\n",
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
