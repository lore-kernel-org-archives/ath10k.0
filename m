Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdIum-0005ti-Vf
 for ath10k@lists.infradead.org; Thu, 12 Nov 2020 20:09:53 +0000
Received: by mail-pg1-x541.google.com with SMTP id f27so5156944pgl.1
 for <ath10k@lists.infradead.org>; Thu, 12 Nov 2020 12:09:52 -0800 (PST)
From: Abhishek Kumar <kuabhs@chromium.org>
Subject: [PATCH v2 1/1] ath10k: add option for chip-id based BDF selection
Date: Thu, 12 Nov 2020 20:09:06 +0000
Message-Id: <20201112200856.v2.1.Ia526132a366886e3b5cf72433d0d58bb7bb1be0f@changeid>
In-Reply-To: <20201112200906.991086-1-kuabhs@chromium.org>
References: <20201112200906.991086-1-kuabhs@chromium.org>
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
To: kvalo@codeaurora.org, pillair@codeaurora.org
Cc: Abhishek Kumar <kuabhs@chromium.org>, netdev@vger.kernel.org, briannorris@chromium.org, linux-wireless@vger.kernel.org, dianders@chromium.org, ath10k@lists.infradead.org, linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>

In some devices difference in chip-id should be enough to pick
the right BDF. Add another support for chip-id based BDF selection.
With this new option, ath10k supports 2 fallback options.

The board name with chip-id as option looks as follows
board name 'bus=snoc,qmi-board-id=ff,qmi-chip-id=320'

Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.2.2-00696-QCAHLSWMTPL-1
Tested-on: QCA6174 HW3.2 WLAN.RM.4.4.1-00157-QCARMSWPZ-1
Signed-off-by: Abhishek Kumar <kuabhs@chromium.org>
---

(no changes since v1)

 drivers/net/wireless/ath/ath10k/core.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index d73ad60b571c..fa9e676b26d9 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -1419,12 +1419,13 @@ static int ath10k_core_fetch_board_data_api_n(struct ath10k *ar,
 }
 
 static int ath10k_core_create_board_name(struct ath10k *ar, char *name,
-					 size_t name_len, bool with_variant)
+					 size_t name_len,
+					 bool with_additional_params)
 {
 	/* strlen(',variant=') + strlen(ar->id.bdf_ext) */
 	char variant[9 + ATH10K_SMBIOS_BDF_EXT_STR_LENGTH] = { 0 };
 
-	if (with_variant && ar->id.bdf_ext[0] != '\0')
+	if (with_additional_params && ar->id.bdf_ext[0] != '\0')
 		scnprintf(variant, sizeof(variant), ",variant=%s",
 			  ar->id.bdf_ext);
 
@@ -1438,12 +1439,17 @@ static int ath10k_core_create_board_name(struct ath10k *ar, char *name,
 	}
 
 	if (ar->id.qmi_ids_valid) {
-		if (with_variant && ar->id.bdf_ext[0] != '\0')
+		if (with_additional_params && ar->id.bdf_ext[0] != '\0')
 			scnprintf(name, name_len,
 				  "bus=%s,qmi-board-id=%x,qmi-chip-id=%x%s",
 				  ath10k_bus_str(ar->hif.bus),
 				  ar->id.qmi_board_id, ar->id.qmi_chip_id,
 				  variant);
+		else if (with_additional_params)
+			scnprintf(name, name_len,
+				  "bus=%s,qmi-board-id=%x,qmi-chip-id=%x",
+				  ath10k_bus_str(ar->hif.bus),
+				  ar->id.qmi_board_id, ar->id.qmi_chip_id);
 		else
 			scnprintf(name, name_len,
 				  "bus=%s,qmi-board-id=%x",
-- 
2.29.2.222.g5d2a92d10f8-goog


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
