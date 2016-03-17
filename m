Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x230.google.com ([2a00:1450:4010:c07::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1agUZR-0003nJ-2x
 for ath10k@lists.infradead.org; Thu, 17 Mar 2016 09:50:23 +0000
Received: by mail-lf0-x230.google.com with SMTP id v130so11209424lfd.2
 for <ath10k@lists.infradead.org>; Thu, 17 Mar 2016 02:50:00 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: fix null deref if device crashes early
Date: Thu, 17 Mar 2016 10:52:08 +0100
Message-Id: <1458208328-16827-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

If device failed to init during early probing
(which is quite rare) it triggered driver to
compute crc before ar->firmware was ready causing
an oops.

Fixes: 3e58044b61a9 ("ath10k: print crc32 checksums for firmware and board files")
Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/debug.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index 076d29b53ddf..5587f167bcdc 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -127,6 +127,7 @@ EXPORT_SYMBOL(ath10k_info);
 void ath10k_debug_print_hwfw_info(struct ath10k *ar)
 {
 	char fw_features[128] = {};
+	u32 crc = 0;
 
 	ath10k_core_get_fw_features_str(ar, fw_features, sizeof(fw_features));
 
@@ -143,11 +144,14 @@ void ath10k_debug_print_hwfw_info(struct ath10k *ar)
 		    config_enabled(CONFIG_ATH10K_DFS_CERTIFIED),
 		    config_enabled(CONFIG_NL80211_TESTMODE));
 
+	if (ar->firmware)
+		crc = crc32_le(0, ar->firmware->data, ar->firmware->size);
+
 	ath10k_info(ar, "firmware ver %s api %d features %s crc32 %08x\n",
 		    ar->hw->wiphy->fw_version,
 		    ar->fw_api,
 		    fw_features,
-		    crc32_le(0, ar->firmware->data, ar->firmware->size));
+		    crc);
 }
 
 void ath10k_debug_print_board_info(struct ath10k *ar)
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
