Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eNG30-0002aC-MA
 for ath10k@lists.infradead.org; Fri, 08 Dec 2017 10:38:29 +0000
Received: by mail-qt0-x242.google.com with SMTP id r39so24836446qtr.13
 for <ath10k@lists.infradead.org>; Fri, 08 Dec 2017 02:38:06 -0800 (PST)
From: Sven Eckelmann <sven.eckelmann@openmesh.com>
Subject: [PATCH v2 2/2] ath10k: search DT for qcom,ath10k-calibration-variant
Date: Fri,  8 Dec 2017 11:37:42 +0100
Message-Id: <20171208103742.3181-3-sven.eckelmann@openmesh.com>
In-Reply-To: <20171208103742.3181-1-sven.eckelmann@openmesh.com>
References: <20171208103742.3181-1-sven.eckelmann@openmesh.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, robh+dt@kernel.org, Sven Eckelmann <sven.eckelmann@openmesh.com>, ext.waldemar.rymarkiewicz@tieto.com, kvalo@codeaurora.org

Board Data File (BDF) is loaded upon driver boot-up procedure. The right
board data file is identified on QCA4019 using bus, bmi-chip-id and
bmi-board-id.

The problem, however, can occur when the (default) board data file cannot
fulfill with the vendor requirements and it is necessary to use a different
board data file.

This problem was solved for SMBIOS by adding a special SMBIOS type 0xF8.
Something similar has to be provided for systems without SMBIOS but with
device trees. No solution was specified by QCA and therefore a new one has
to be found for ath10k.

The device tree requires addition strings to define the variant name

    wifi@a000000 {
    	status = "okay";
    	qcom,ath10k-calibration-variant = "RT-AC58U";
    };

    wifi@a800000 {
    	status = "okay";
    	qcom,ath10k-calibration-variant = "RT-AC58U";
    };

This would create the boarddata identifiers for the board-2.bin search

 *  bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=RT-AC58U
 *  bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=RT-AC58U

Signed-off-by: Sven Eckelmann <sven.eckelmann@openmesh.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 40 ++++++++++++++++++++++++++++------
 1 file changed, 33 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index b29fdbd21ead..6264e2cc4c0d 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -860,6 +860,28 @@ static int ath10k_core_check_smbios(struct ath10k *ar)
 	return 0;
 }
 
+static int ath10k_core_check_dt(struct ath10k *ar)
+{
+	struct device_node *node;
+	const char *variant = NULL;
+
+	node = ar->dev->of_node;
+	if (!node)
+		return -ENOENT;
+
+	of_property_read_string(node, "qcom,ath10k-calibration-variant",
+				&variant);
+	if (!variant)
+		return -ENODATA;
+
+	if (strscpy(ar->id.bdf_ext, variant, sizeof(ar->id.bdf_ext)) < 0)
+		ath10k_dbg(ar, ATH10K_DBG_BOOT,
+			   "bdf variant string is longer than the buffer can accommodate (variant: %s)\n",
+			    variant);
+
+	return 0;
+}
+
 static int ath10k_download_and_run_otp(struct ath10k *ar)
 {
 	u32 result, address = ar->hw_params.patch_load_addr;
@@ -1231,19 +1253,19 @@ static int ath10k_core_create_board_name(struct ath10k *ar, char *name,
 	/* strlen(',variant=') + strlen(ar->id.bdf_ext) */
 	char variant[9 + ATH10K_SMBIOS_BDF_EXT_STR_LENGTH] = { 0 };
 
+	if (ar->id.bdf_ext[0] != '\0')
+		scnprintf(variant, sizeof(variant), ",variant=%s",
+			  ar->id.bdf_ext);
+
 	if (ar->id.bmi_ids_valid) {
 		scnprintf(name, name_len,
-			  "bus=%s,bmi-chip-id=%d,bmi-board-id=%d",
+			  "bus=%s,bmi-chip-id=%d,bmi-board-id=%d%s",
 			  ath10k_bus_str(ar->hif.bus),
 			  ar->id.bmi_chip_id,
-			  ar->id.bmi_board_id);
+			  ar->id.bmi_board_id, variant);
 		goto out;
 	}
 
-	if (ar->id.bdf_ext[0] != '\0')
-		scnprintf(variant, sizeof(variant), ",variant=%s",
-			  ar->id.bdf_ext);
-
 	scnprintf(name, name_len,
 		  "bus=%s,vendor=%04x,device=%04x,subsystem-vendor=%04x,subsystem-device=%04x%s",
 		  ath10k_bus_str(ar->hif.bus),
@@ -2343,7 +2365,11 @@ static int ath10k_core_probe_fw(struct ath10k *ar)
 
 	ret = ath10k_core_check_smbios(ar);
 	if (ret)
-		ath10k_dbg(ar, ATH10K_DBG_BOOT, "bdf variant name not set.\n");
+		ath10k_dbg(ar, ATH10K_DBG_BOOT, "SMBIOS bdf variant name not set.\n");
+
+	ret = ath10k_core_check_dt(ar);
+	if (ret)
+		ath10k_dbg(ar, ATH10K_DBG_BOOT, "DT bdf variant name not set.\n");
 
 	ret = ath10k_core_fetch_board_file(ar);
 	if (ret) {
-- 
2.11.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
