Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fQBB4-0006gF-1E
 for ath10k@lists.infradead.org; Tue, 05 Jun 2018 12:35:07 +0000
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH v2 2/6] ath10k: Add support to create boardname for non-bmi
 target
Date: Tue,  5 Jun 2018 18:04:48 +0530
Message-Id: <20180605123448.32331-1-govinds@codeaurora.org>
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
To: andy.gross@linaro.org, bjorn.andersson@linaro.org, david.brown@linaro.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Cc: Govind Singh <govinds@codeaurora.org>, Rakesh Pillai <pillair@codeaurora.org>

From: Rakesh Pillai <pillair@codeaurora.org>

Add support to create the boardname for non-bmi targets
like WCN3990, which uses qmi for bdf download. This
boardname is used to parse the board data from board-2.bin.

Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/core.c | 14 ++++++++++++++
 drivers/net/wireless/ath/ath10k/core.h |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 4cf54a7ef09a..8a592019cc4d 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -1429,6 +1429,20 @@ static int ath10k_core_create_board_name(struct ath10k *ar, char *name,
 		goto out;
 	}
 
+	if (ar->id.qmi_ids_valid) {
+		if (ar->id.qmi_board_id > 0x99)
+			scnprintf(name, name_len,
+				  "bus=%s,qmi-board-id=%03x",
+				  ath10k_bus_str(ar->hif.bus),
+				  ar->id.qmi_board_id);
+		else
+			scnprintf(name, name_len,
+				  "bus=%s,qmi-board-id=b%02x",
+				  ath10k_bus_str(ar->hif.bus),
+				  ar->id.qmi_board_id);
+		goto out;
+	}
+
 	scnprintf(name, name_len,
 		  "bus=%s,vendor=%04x,device=%04x,subsystem-vendor=%04x,subsystem-device=%04x%s",
 		  ath10k_bus_str(ar->hif.bus),
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 951dbdd1c9eb..0a2e4a5c3612 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -940,7 +940,9 @@ struct ath10k {
 		u32 subsystem_device;
 
 		bool bmi_ids_valid;
+		bool qmi_ids_valid;
 		u8 bmi_board_id;
+		u8 qmi_board_id;
 		u8 bmi_chip_id;
 
 		char bdf_ext[ATH10K_SMBIOS_BDF_EXT_STR_LENGTH];
-- 
2.17.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
