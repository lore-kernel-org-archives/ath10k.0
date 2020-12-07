Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmPrD-00045P-5C
 for ath10k@lists.infradead.org; Mon, 07 Dec 2020 23:23:52 +0000
Received: by mail-pf1-x42e.google.com with SMTP id t8so11935238pfg.8
 for <ath10k@lists.infradead.org>; Mon, 07 Dec 2020 15:23:49 -0800 (PST)
From: Abhishek Kumar <kuabhs@chromium.org>
Subject: [PATCH v3] ath10k: add option for chip-id based BDF selection
Date: Mon,  7 Dec 2020 23:20:21 +0000
Message-Id: <20201207231824.v3.1.Ia6b95087ca566f77423f3802a78b946f7b593ff5@changeid>
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
Cc: kuabhs@chromium.org, netdev@vger.kernel.org, briannorris@chromium.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, dianders@chromium.org, pillair@codeaurora.org, Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>

In some devices difference in chip-id should be enough to pick
the right BDF. Add another support for chip-id based BDF selection.
With this new option, ath10k supports 2 fallback options.

The board name with chip-id as option looks as follows
board name 'bus=snoc,qmi-board-id=ff,qmi-chip-id=320'

Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.2.2-00696-QCAHLSWMTPL-1
Tested-on: QCA6174 HW3.2 WLAN.RM.4.4.1-00157-QCARMSWPZ-1
Signed-off-by: Abhishek Kumar <kuabhs@chromium.org>
---

Changes in v3:
- Resurreted Patch V1 because as per discussion we do need two
fallback board names and refactored ath10k_core_create_board_name.

 drivers/net/wireless/ath/ath10k/core.c | 41 +++++++++++++++++++-------
 1 file changed, 30 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index d73ad60b571c..09d0fdfa6693 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -1349,7 +1349,8 @@ static int ath10k_core_search_bd(struct ath10k *ar,
 
 static int ath10k_core_fetch_board_data_api_n(struct ath10k *ar,
 					      const char *boardname,
-					      const char *fallback_boardname,
+					      const char *fallback_boardname1,
+					      const char *fallback_boardname2,
 					      const char *filename)
 {
 	size_t len, magic_len;
@@ -1398,8 +1399,11 @@ static int ath10k_core_fetch_board_data_api_n(struct ath10k *ar,
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
@@ -1419,7 +1423,8 @@ static int ath10k_core_fetch_board_data_api_n(struct ath10k *ar,
 }
 
 static int ath10k_core_create_board_name(struct ath10k *ar, char *name,
-					 size_t name_len, bool with_variant)
+					 size_t name_len, bool with_variant,
+					 bool with_chip_id)
 {
 	/* strlen(',variant=') + strlen(ar->id.bdf_ext) */
 	char variant[9 + ATH10K_SMBIOS_BDF_EXT_STR_LENGTH] = { 0 };
@@ -1438,7 +1443,7 @@ static int ath10k_core_create_board_name(struct ath10k *ar, char *name,
 	}
 
 	if (ar->id.qmi_ids_valid) {
-		if (with_variant && ar->id.bdf_ext[0] != '\0')
+		if (with_chip_id)
 			scnprintf(name, name_len,
 				  "bus=%s,qmi-board-id=%x,qmi-chip-id=%x%s",
 				  ath10k_bus_str(ar->hif.bus),
@@ -1482,21 +1487,34 @@ static int ath10k_core_create_eboard_name(struct ath10k *ar, char *name,
 
 int ath10k_core_fetch_board_file(struct ath10k *ar, int bd_ie_type)
 {
-	char boardname[100], fallback_boardname[100];
+	char boardname[100], fallback_boardname1[100], fallback_boardname2[100];
 	int ret;
 
 	if (bd_ie_type == ATH10K_BD_IE_BOARD) {
+		/* With variant and chip id */
 		ret = ath10k_core_create_board_name(ar, boardname,
-						    sizeof(boardname), true);
+						    sizeof(boardname), true,
+						    true);
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
@@ -1510,7 +1528,8 @@ int ath10k_core_fetch_board_file(struct ath10k *ar, int bd_ie_type)
 
 	ar->bd_api = 2;
 	ret = ath10k_core_fetch_board_data_api_n(ar, boardname,
-						 fallback_boardname,
+						 fallback_boardname1,
+						 fallback_boardname2,
 						 ATH10K_BOARD_API2_FILE);
 	if (!ret)
 		goto success;
-- 
2.29.2.576.ga3fc446d84-goog


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
