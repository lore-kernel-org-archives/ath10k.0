Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s72.web-hosting.com ([198.187.29.22])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y7zQp-0005lw-Nk
 for ath10k@lists.infradead.org; Mon, 05 Jan 2015 04:38:20 +0000
From: Sujith Manoharan <sujith@msujith.org>
Subject: [PATCH] ath10k: Remove unused variable
Date: Mon,  5 Jan 2015 10:10:22 +0530
Message-Id: <1420432822-10819-1-git-send-email-sujith@msujith.org>
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
Cc: linux-wireless@vger.kernel.org

From: Sujith Manoharan <c_manoha@qca.qualcomm.com>

htt->max_throughput_mbps is not used anywhere.

Signed-off-by: Sujith Manoharan <c_manoha@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/htt.c | 1 -
 drivers/net/wireless/ath/ath10k/htt.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt.c b/drivers/net/wireless/ath/ath10k/htt.c
index 56cb4ac..ceec764 100644
--- a/drivers/net/wireless/ath/ath10k/htt.c
+++ b/drivers/net/wireless/ath/ath10k/htt.c
@@ -53,7 +53,6 @@ int ath10k_htt_init(struct ath10k *ar)
 	struct ath10k_htt *htt = &ar->htt;
 
 	htt->ar = ar;
-	htt->max_throughput_mbps = 800;
 
 	/*
 	 * Prefetch enough data to satisfy target
diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
index 1aa5db1..1d2a8c5 100644
--- a/drivers/net/wireless/ath/ath10k/htt.h
+++ b/drivers/net/wireless/ath/ath10k/htt.h
@@ -1184,7 +1184,6 @@ struct ath10k_htt {
 	struct ath10k *ar;
 	enum ath10k_htc_ep_id eid;
 
-	int max_throughput_mbps;
 	u8 target_version_major;
 	u8 target_version_minor;
 	struct completion target_version_received;
-- 
2.2.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
