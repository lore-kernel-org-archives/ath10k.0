Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-55.smtp-out.us-west-2.amazonses.com ([54.240.27.55])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZXjY-0008E3-I3
 for ath10k@lists.infradead.org; Tue, 26 Nov 2019 10:06:14 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH] ath10k: change bundle count for max rx bundle for sdio
Date: Tue, 26 Nov 2019 10:06:04 +0000
Message-ID: <0101016ea72cd7e7-72d2803f-29e8-4125-badf-2eda7651eb0a-000000@us-west-2.amazonses.com>
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

For max bundle size 32, the bundle mask is not same with 8/16.
Change it to match the max bundle size of htc. Otherwise it
will not match with firmware, for example, when bundle count
is 17, then flags of ath10k_htc_hdr is 0x4, if without this
patch, it will be considered as non-bundled packet because it
does not have mask 0xF0, then trigger error message later:
payload length 56747 exceeds max htc length: 4088.

htc->max_msgs_per_htc_bundle is the min value of
HTC_HOST_MAX_MSG_PER_RX_BUNDLE and
msg->ready_ext.max_msgs_per_htc_bundle of ath10k_htc_wait_target,
it will be sent to firmware later in ath10k_htc_start, then
firmware will use it as the final max rx bundle count, in
WLAN.RMH.4.4.1-00029, msg->ready_ext.max_msgs_per_htc_bundle
is 32, it is same with HTC_HOST_MAX_MSG_PER_RX_BUNDLE, so the
final max rx bundle count will be set to 32 in firmware.

This patch only effect sdio chips.

Tested with QCA6174 SDIO with firmware WLAN.RMH.4.4.1-00029.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
Fixes: 224776520ead69e ("ath10k: change max RX bundle size from 8 to 32 for sdio")
---
 drivers/net/wireless/ath/ath10k/htc.c  |  2 +-
 drivers/net/wireless/ath/ath10k/htc.h  | 10 ++++++----
 drivers/net/wireless/ath/ath10k/sdio.c | 10 ++++++----
 3 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
index 03c358cd16d4..4696d4ab5f6c 100644
--- a/drivers/net/wireless/ath/ath10k/htc.c
+++ b/drivers/net/wireless/ath/ath10k/htc.c
@@ -311,7 +311,7 @@ ath10k_htc_process_lookahead_bundle(struct ath10k_htc *htc,
 	struct ath10k *ar = htc->ar;
 	int bundle_cnt = len / sizeof(*report);
 
-	if (!bundle_cnt || (bundle_cnt > HTC_HOST_MAX_MSG_PER_RX_BUNDLE)) {
+	if (!bundle_cnt || (bundle_cnt > htc->max_msgs_per_htc_bundle)) {
 		ath10k_warn(ar, "Invalid lookahead bundle count: %d\n",
 			    bundle_cnt);
 		return -EINVAL;
diff --git a/drivers/net/wireless/ath/ath10k/htc.h b/drivers/net/wireless/ath/ath10k/htc.h
index b3f48fe7436e..0d25d2150ea5 100644
--- a/drivers/net/wireless/ath/ath10k/htc.h
+++ b/drivers/net/wireless/ath/ath10k/htc.h
@@ -58,13 +58,15 @@ enum ath10k_htc_rx_flags {
 #define ATH10K_HTC_BUNDLE_EXTRA_MASK GENMASK(3, 2)
 #define ATH10K_HTC_BUNDLE_EXTRA_SHIFT 4
 
-static inline unsigned int ath10k_htc_get_bundle_count(u8 flags)
+static inline unsigned int ath10k_htc_get_bundle_count(u8 max_msgs, u8 flags)
 {
-	unsigned int count, extra_count;
+	unsigned int count, extra_count = 0;
 
 	count = FIELD_GET(ATH10K_HTC_FLAG_BUNDLE_MASK, flags);
-	extra_count = FIELD_GET(ATH10K_HTC_BUNDLE_EXTRA_MASK, flags) <<
-		ATH10K_HTC_BUNDLE_EXTRA_SHIFT;
+
+	if (max_msgs > 16)
+		extra_count = FIELD_GET(ATH10K_HTC_BUNDLE_EXTRA_MASK, flags) <<
+			ATH10K_HTC_BUNDLE_EXTRA_SHIFT;
 
 	return count + extra_count;
 }
diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index 60849ab8088f..987d7c3eb32a 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -500,14 +500,15 @@ static int ath10k_sdio_mbox_alloc_bundle(struct ath10k *ar,
 					 size_t *bndl_cnt)
 {
 	int ret, i;
+	u8 max_msgs = ar->htc.max_msgs_per_htc_bundle;
 
-	*bndl_cnt = ath10k_htc_get_bundle_count(htc_hdr->flags);
+	*bndl_cnt = ath10k_htc_get_bundle_count(max_msgs, htc_hdr->flags);
 
-	if (*bndl_cnt > HTC_HOST_MAX_MSG_PER_RX_BUNDLE) {
+	if (*bndl_cnt > max_msgs) {
 		ath10k_warn(ar,
 			    "HTC bundle length %u exceeds maximum %u\n",
 			    le16_to_cpu(htc_hdr->len),
-			    HTC_HOST_MAX_MSG_PER_RX_BUNDLE);
+			    max_msgs);
 		return -ENOMEM;
 	}
 
@@ -570,7 +571,8 @@ static int ath10k_sdio_mbox_rx_alloc(struct ath10k *ar,
 			goto err;
 		}
 
-		if (htc_hdr->flags & ATH10K_HTC_FLAG_BUNDLE_MASK) {
+		if (ath10k_htc_get_bundle_count(
+			ar->htc.max_msgs_per_htc_bundle, htc_hdr->flags)) {
 			/* HTC header indicates that every packet to follow
 			 * has the same padded length so that it can be
 			 * optimally fetched as a full bundle.
-- 
2.23.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
