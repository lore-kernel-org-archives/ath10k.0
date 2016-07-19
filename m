Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x22e.google.com ([2a00:1450:4010:c07::22e])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPUcD-0004Fq-1Y
 for ath10k@lists.infradead.org; Tue, 19 Jul 2016 12:59:23 +0000
Received: by mail-lf0-x22e.google.com with SMTP id l69so13517536lfg.1
 for <ath10k@lists.infradead.org>; Tue, 19 Jul 2016 05:58:50 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [RFC] ath10k: silence firmware file probing warnings
Date: Tue, 19 Jul 2016 15:00:37 +0200
Message-Id: <1468933237-5226-1-git-send-email-michal.kazior@tieto.com>
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
To: kvalo@qca.qualcomm.com
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org

Firmware files are versioned to prevent older
driver instances to load unsupported firmware
blobs. This is reflected with a fallback logic
which attempts to load several firmware files.

This however produced a lot of unnecessary
warnings sometimes confusing users and leading
them to rename firmware files making things even
more confusing.

Hence use request_firmware_direct() which does not
produce extra warnings. This shouldn't really
break anything because most modern systems don't
rely on udev/hotplug helpers to load firmware
files anymore.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/core.c     | 11 +++++------
 drivers/net/wireless/ath/ath10k/testmode.c |  5 ++++-
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index e88982921aa3..81bfb71fe876 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -431,7 +431,10 @@ static const struct firmware *ath10k_fetch_fw_file(struct ath10k *ar,
 		dir = ".";
 
 	snprintf(filename, sizeof(filename), "%s/%s", dir, file);
-	ret = request_firmware(&fw, filename, ar->dev);
+	ret = request_firmware_direct(&fw, filename, ar->dev);
+	ath10k_dbg(ar, ATH10K_DBG_BOOT, "boot fw request '%s': %d\n",
+		   filename, ret);
+
 	if (ret)
 		return ERR_PTR(ret);
 
@@ -1089,12 +1092,8 @@ int ath10k_core_fetch_firmware_api_n(struct ath10k *ar, const char *name,
 	/* first fetch the firmware file (firmware-*.bin) */
 	fw_file->firmware = ath10k_fetch_fw_file(ar, ar->hw_params.fw.dir,
 						 name);
-	if (IS_ERR(fw_file->firmware)) {
-		ath10k_err(ar, "could not fetch firmware file '%s/%s': %ld\n",
-			   ar->hw_params.fw.dir, name,
-			   PTR_ERR(fw_file->firmware));
+	if (IS_ERR(fw_file->firmware))
 		return PTR_ERR(fw_file->firmware);
-	}
 
 	data = fw_file->firmware->data;
 	len = fw_file->firmware->size;
diff --git a/drivers/net/wireless/ath/ath10k/testmode.c b/drivers/net/wireless/ath/ath10k/testmode.c
index 120f4234d3b0..fe49e7a83d00 100644
--- a/drivers/net/wireless/ath/ath10k/testmode.c
+++ b/drivers/net/wireless/ath/ath10k/testmode.c
@@ -149,7 +149,10 @@ static int ath10k_tm_fetch_utf_firmware_api_1(struct ath10k *ar,
 		 ar->hw_params.fw.dir, ATH10K_FW_UTF_FILE);
 
 	/* load utf firmware image */
-	ret = request_firmware(&fw_file->firmware, filename, ar->dev);
+	ret = request_firmware_direct(&fw_file->firmware, filename, ar->dev);
+	ath10k_dbg(ar, ATH10K_DBG_TESTMODE, "testmode fw request '%s': %d\n",
+		   filename, ret);
+
 	if (ret) {
 		ath10k_warn(ar, "failed to retrieve utf firmware '%s': %d\n",
 			    filename, ret);
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
