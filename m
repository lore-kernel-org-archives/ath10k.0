Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1av4rc-0004XL-7h
 for ath10k@lists.infradead.org; Tue, 26 Apr 2016 15:25:25 +0000
From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
Subject: [PATCH] ath10k: Move spectral related structures under ath10k debugfs
Date: Tue, 26 Apr 2016 20:54:36 +0530
Message-ID: <1461684276-4042-1-git-send-email-mohammed@qca.qualcomm.com>
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
Cc: mohammed@codeaurora.org, Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless@vger.kernel.org, kvalo@codeaurora.org, Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Spectral related structures are accessed / modified only if ath10k
debugfs is enabled, so it makes more sense to move them under
ATH10K_DEBUGFS

Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
---
[compile tested disabling ATH10K_DEBUGFS]

 drivers/net/wireless/ath/ath10k/core.h |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index c23c373..48fffef 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -868,8 +868,6 @@ struct ath10k {
 
 #ifdef CONFIG_ATH10K_DEBUGFS
 	struct ath10k_debug debug;
-#endif
-
 	struct {
 		/* relay(fs) channel for spectral scan */
 		struct rchan *rfs_chan_spec_scan;
@@ -878,6 +876,7 @@ struct ath10k {
 		enum ath10k_spectral_mode mode;
 		struct ath10k_spec_scan config;
 	} spectral;
+#endif
 
 	struct {
 		/* protected by conf_mutex */
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
