Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUfsF-00063O-Me
 for ath10k@lists.infradead.org; Tue, 20 Oct 2020 00:51:36 +0000
Received: by mail-pg1-x544.google.com with SMTP id t14so1051825pgg.1
 for <ath10k@lists.infradead.org>; Mon, 19 Oct 2020 17:51:29 -0700 (PDT)
From: Abhishek Kumar <kuabhs@chromium.org>
Subject: [PATCH] ath10k: add option for chip-id based BDF selection
Date: Tue, 20 Oct 2020 00:51:00 +0000
Message-Id: <20201020000506.1.Ifbc28707942179f1cefc7491e995814564495270@changeid>
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
To: kvalo@codeaurora.org
Cc: kuabhs@chromium.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

In some devices difference in chip-id should be enough to pick
the right BDF. Add another support for chip-id based BDF selection.
With this new option, ath10k supports 2 fallback options.

The board name with chip-id as option looks as follows
board name 'bus=snoc,qmi-board-id=ff,qmi-chip-id=320'

Signed-off-by: Abhishek Kumar <kuabhs@chromium.org>
---

 drivers/net/wireless/ath/ath10k/core.c | 45 +++++++++++++++++++-------
 1 file changed, 34 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index a3f15cc89a10..767bb9d6a197 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -1343,7 +1343,8 @@ static int ath10k_core_search_bd(struct ath10k *ar,
 
 static int ath10k_core_fetch_board_data_api_n(struct ath10k *ar,
 					      const char *boardname,
-					      const char *fallback_boardname,
+					      const char *fallback_boardname1,
+					      const char *fallback_boardname2,
 					      const char *filename)
 {
 	size_t len, magic_len;
@@ -1392,8 +1393,11 @@ static int ath10k_core_fetch_board_data_api_n(struct ath10k *ar,
 	ret = ath10k_core_search_bd(ar, boardname, data, len);
 
 	/* if we didn't find it and have a fallback name, try that */
-	if (ret == -ENOENT && fallback_boardname)
-		ret = ath10k_core_search_bd(ar, fallback_boardname, data, len);
+	if (ret == -ENOENT && fallback_boardname1)
+		ret = ath10k_core_search_bd(ar, fallback_boardname1, data, len);
+
+	if (ret == -ENOENT && fallback_boardname2)
+		ret = ath10k_core_search_bd(ar, fallback_boardname2, data, len);
 
 	if (ret == -ENOENT) {
 		ath10k_err(ar,
@@ -1413,7 +1417,8 @@ static int ath10k_core_fetch_board_data_api_n(struct ath10k *ar,
 }
 
 static int ath10k_core_create_board_name(struct ath10k *ar, char *name,
-					 size_t name_len, bool with_variant)
+					 size_t name_len, bool with_variant,
+					 bool with_chip_id)
 {
 	/* strlen(',variant=') + strlen(ar->id.bdf_ext) */
 	char variant[9 + ATH10K_SMBIOS_BDF_EXT_STR_LENGTH] = { 0 };
@@ -1432,12 +1437,17 @@ static int ath10k_core_create_board_name(struct ath10k *ar, char *name,
 	}
 
 	if (ar->id.qmi_ids_valid) {
-		if (with_variant && ar->id.bdf_ext[0] != '\0')
+		if (with_variant && ar->id.bdf_ext[0] != '\0' && with_chip_id)
 			scnprintf(name, name_len,
 				  "bus=%s,qmi-board-id=%x,qmi-chip-id=%x%s",
 				  ath10k_bus_str(ar->hif.bus),
 				  ar->id.qmi_board_id, ar->id.qmi_chip_id,
 				  variant);
+		else if (with_chip_id)
+			scnprintf(name, name_len,
+				  "bus=%s,qmi-board-id=%x,qmi-chip-id=%x",
+				  ath10k_bus_str(ar->hif.bus),
+				  ar->id.qmi_board_id, ar->id.qmi_chip_id);
 		else
 			scnprintf(name, name_len,
 				  "bus=%s,qmi-board-id=%x",
@@ -1476,21 +1486,33 @@ static int ath10k_core_create_eboard_name(struct ath10k *ar, char *name,
 
 int ath10k_core_fetch_board_file(struct ath10k *ar, int bd_ie_type)
 {
-	char boardname[100], fallback_boardname[100];
+	char boardname[100], fallback_boardname1[100], fallback_boardname2[100];
 	int ret;
 
 	if (bd_ie_type == ATH10K_BD_IE_BOARD) {
+		/* With variant and chip id */
 		ret = ath10k_core_create_board_name(ar, boardname,
-						    sizeof(boardname), true);
+						sizeof(boardname), true, true);
 		if (ret) {
 			ath10k_err(ar, "failed to create board name: %d", ret);
 			return ret;
 		}
 
-		ret = ath10k_core_create_board_name(ar, fallback_boardname,
-						    sizeof(boardname), false);
+		/* Without variant and only chip-id */
+		ret = ath10k_core_create_board_name(ar, fallback_boardname1,
+						    sizeof(boardname), false,
+						    true);
+		if (ret) {
+			ath10k_err(ar, "failed to create 1st fallback board name: %d", ret);
+			return ret;
+		}
+
+		/* Without variant and without chip-id */
+		ret = ath10k_core_create_board_name(ar, fallback_boardname2,
+						    sizeof(boardname), false,
+						    false);
 		if (ret) {
-			ath10k_err(ar, "failed to create fallback board name: %d", ret);
+			ath10k_err(ar, "failed to create 2nd fallback board name: %d", ret);
 			return ret;
 		}
 	} else if (bd_ie_type == ATH10K_BD_IE_BOARD_EXT) {
@@ -1504,7 +1526,8 @@ int ath10k_core_fetch_board_file(struct ath10k *ar, int bd_ie_type)
 
 	ar->bd_api = 2;
 	ret = ath10k_core_fetch_board_data_api_n(ar, boardname,
-						 fallback_boardname,
+						 fallback_boardname1,
+						 fallback_boardname2,
 						 ATH10K_BOARD_API2_FILE);
 	if (!ret)
 		goto success;
-- 
2.29.0.rc1.297.gfa9743e501-goog


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
