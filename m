Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb05.tieto.com ([131.207.168.36])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRye3-0001mt-Bd
 for ath10k@lists.infradead.org; Fri, 04 Oct 2013 06:13:47 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 2/2] ath10k: fix possible memory leak in new FW loading
Date: Fri, 4 Oct 2013 08:13:20 +0200
Message-ID: <1380867200-19714-3-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1380867200-19714-1-git-send-email-michal.kazior@tieto.com>
References: <1380867200-19714-1-git-send-email-michal.kazior@tieto.com>
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

Some failpaths did `return` instead of a `goto`
leaking requested firmware.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/core.c |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index bf85d34..5acb404 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -404,12 +404,14 @@ static int ath10k_core_fetch_firmware_api_n(struct ath10k *ar, const char *name)
 	if (len < magic_len) {
 		ath10k_err("firmware image too small to contain magic: %zu\n",
 			   len);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err;
 	}
 
 	if (memcmp(data, ATH10K_FIRMWARE_MAGIC, magic_len) != 0) {
 		ath10k_err("Invalid firmware magic\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err;
 	}
 
 	/* jump over the padding */
@@ -431,7 +433,8 @@ static int ath10k_core_fetch_firmware_api_n(struct ath10k *ar, const char *name)
 		if (len < ie_len) {
 			ath10k_err("Invalid length for FW IE %d (%zu < %zu)\n",
 				   ie_id, len, ie_len);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto err;
 		}
 
 		switch (ie_id) {
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
