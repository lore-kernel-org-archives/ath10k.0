Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eYhCz-0004H0-D6
 for ath10k@lists.infradead.org; Mon, 08 Jan 2018 23:52:02 +0000
From: ryanhsu@codeaurora.org
Subject: [PATCH] ath10k: add sanity check to ie_len before parsing fw/board ie
Date: Mon,  8 Jan 2018 15:51:01 -0800
Message-Id: <1515455461-19286-1-git-send-email-ryanhsu@codeaurora.org>
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
To: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org
Cc: ryanhsu@codeaurora.org

From: Ryan Hsu <ryanhsu@codeaurora.org>

Validate ie_len after the alignment padding before access the buffer
to avoid potential overflow.

Signed-off-by: Ryan Hsu <ryanhsu@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/core.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 51444d3..64713d1 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -1276,7 +1276,10 @@ static int ath10k_core_fetch_board_data_api_n(struct ath10k *ar,
 		len -= sizeof(*hdr);
 		data = hdr->data;
 
-		if (len < ALIGN(ie_len, 4)) {
+		/* jump over the padding */
+		ie_len = ALIGN(ie_len, 4);
+
+		if (len < ie_len) {
 			ath10k_err(ar, "invalid length for board ie_id %d ie_len %zu len %zu\n",
 				   ie_id, ie_len, len);
 			ret = -EINVAL;
@@ -1315,8 +1318,6 @@ static int ath10k_core_fetch_board_data_api_n(struct ath10k *ar,
 			goto out;
 		}
 
-		/* jump over the padding */
-		ie_len = ALIGN(ie_len, 4);
 
 		len -= ie_len;
 		data += ie_len;
@@ -1448,6 +1449,9 @@ int ath10k_core_fetch_firmware_api_n(struct ath10k *ar, const char *name,
 		len -= sizeof(*hdr);
 		data += sizeof(*hdr);
 
+		/* jump over the padding */
+		ie_len = ALIGN(ie_len, 4);
+
 		if (len < ie_len) {
 			ath10k_err(ar, "invalid length for FW IE %d (%zu < %zu)\n",
 				   ie_id, len, ie_len);
@@ -1553,9 +1557,6 @@ int ath10k_core_fetch_firmware_api_n(struct ath10k *ar, const char *name,
 			break;
 		}
 
-		/* jump over the padding */
-		ie_len = ALIGN(ie_len, 4);
-
 		len -= ie_len;
 		data += ie_len;
 	}
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
