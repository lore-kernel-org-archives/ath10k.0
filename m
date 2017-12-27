Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eUHuf-0000V2-JD
 for ath10k@lists.infradead.org; Wed, 27 Dec 2017 20:02:55 +0000
From: <ryanhsu@qti.qualcomm.com>
Subject: [PATCH] ath10k: add sanity check to ie_len before parsing fw/board ie
Date: Wed, 27 Dec 2017 12:02:11 -0800
Message-ID: <1514404931-9078-1-git-send-email-ryanhsu@qti.qualcomm.com>
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
To: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org
Cc: ryanhsu@qti.qualcomm.com

From: Ryan Hsu <ryanhsu@qti.qualcomm.com>

Validate ie_len after the alignment padding before access the buffer
to avoid potential overflow.

Signed-off-by: Ryan Hsu <ryanhsu@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 042175a..2f24c17 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -1240,7 +1240,10 @@ static int ath10k_core_fetch_board_data_api_n(struct ath10k *ar,
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
@@ -1279,8 +1282,6 @@ static int ath10k_core_fetch_board_data_api_n(struct ath10k *ar,
 			goto out;
 		}
 
-		/* jump over the padding */
-		ie_len = ALIGN(ie_len, 4);
 
 		len -= ie_len;
 		data += ie_len;
@@ -1412,6 +1413,9 @@ int ath10k_core_fetch_firmware_api_n(struct ath10k *ar, const char *name,
 		len -= sizeof(*hdr);
 		data += sizeof(*hdr);
 
+		/* jump over the padding */
+		ie_len = ALIGN(ie_len, 4);
+
 		if (len < ie_len) {
 			ath10k_err(ar, "invalid length for FW IE %d (%zu < %zu)\n",
 				   ie_id, len, ie_len);
@@ -1517,9 +1521,6 @@ int ath10k_core_fetch_firmware_api_n(struct ath10k *ar, const char *name,
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
