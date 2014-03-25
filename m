Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh01.mail.saunalahti.fi ([62.142.5.107])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSNSp-00058F-BE
 for ath10k@lists.infradead.org; Tue, 25 Mar 2014 09:16:07 +0000
Subject: [PATCH 8/8] ath10k: print chip id during boot
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Tue, 25 Mar 2014 11:15:46 +0200
Message-ID: <20140325091546.16651.33866.stgit@potku.adurom.net>
In-Reply-To: <20140325091311.16651.15747.stgit@potku.adurom.net>
References: <20140325091311.16651.15747.stgit@potku.adurom.net>
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

This makes it easier to debug what kind of board is used.

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 471c219e5137..0077ba17e5c0 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -844,9 +844,12 @@ int ath10k_core_start(struct ath10k *ar)
 	INIT_LIST_HEAD(&ar->arvifs);
 
 	if (!test_bit(ATH10K_FLAG_FIRST_BOOT_DONE, &ar->dev_flags))
-		ath10k_info("%s (0x%x) fw %s api %d htt %d.%d\n",
-			    ar->hw_params.name, ar->target_version,
-			    ar->hw->wiphy->fw_version, ar->fw_api,
+		ath10k_info("%s (0x%08x, 0x%08x) fw %s api %d htt %d.%d\n",
+			    ar->hw_params.name,
+			    ar->target_version,
+			    ar->chip_id,
+			    ar->hw->wiphy->fw_version,
+			    ar->fw_api,
 			    ar->htt.target_version_major,
 			    ar->htt.target_version_minor);
 


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
