Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ccAIr-0004wf-74
 for ath10k@lists.infradead.org; Fri, 10 Feb 2017 12:27:55 +0000
Subject: [PATCH v2 3/4] ath10k: silence firmware file probing warnings
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Fri, 10 Feb 2017 14:26:56 +0200
Message-ID: <148672961596.8556.5270733641640682835.stgit@potku.adurom.net>
In-Reply-To: <148672934198.8556.5588600166627442652.stgit@potku.adurom.net>
References: <148672934198.8556.5588600166627442652.stgit@potku.adurom.net>
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

From: Michal Kazior <michal.kazior@tieto.com>

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
files anymore. For example it was confirmed that
LEDE does not user helper.

This also fixes a 60 second delay per _each_
unexistent firmware/calibration file with distros
which have CONFIG_FW_LOADER_USER_HELPER_FALLBACK
enabled, RHEL being a notable example. Using
ath10k with firmware-2.bin this might end up
into a five minute delay in boot.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
Patchwork-Id: 9237095
[kvalo@qca.qualcomm.com: add more info to the commit log]
Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c     |   11 +++++------
 drivers/net/wireless/ath/ath10k/testmode.c |    5 ++++-
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index f395d3a98bc5..6433fdd2c0c7 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -456,7 +456,10 @@ static const struct firmware *ath10k_fetch_fw_file(struct ath10k *ar,
 		dir = ".";
 
 	snprintf(filename, sizeof(filename), "%s/%s", dir, file);
-	ret = request_firmware(&fw, filename, ar->dev);
+	ret = request_firmware_direct(&fw, filename, ar->dev);
+	ath10k_dbg(ar, ATH10K_DBG_BOOT, "boot fw request '%s': %d\n",
+		   filename, ret);
+
 	if (ret)
 		return ERR_PTR(ret);
 
@@ -1190,12 +1193,8 @@ int ath10k_core_fetch_firmware_api_n(struct ath10k *ar, const char *name,
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
index ed85f938e3c0..8bb36c18a749 100644
--- a/drivers/net/wireless/ath/ath10k/testmode.c
+++ b/drivers/net/wireless/ath/ath10k/testmode.c
@@ -150,7 +150,10 @@ static int ath10k_tm_fetch_utf_firmware_api_1(struct ath10k *ar,
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


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
