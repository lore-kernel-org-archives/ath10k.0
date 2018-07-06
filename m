Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fbMY0-00063P-Vs
 for ath10k@lists.infradead.org; Fri, 06 Jul 2018 08:57:06 +0000
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH v3 2/6] ath10k: Add support to create boardname for non-bmi
 target
Date: Fri,  6 Jul 2018 14:26:19 +0530
Message-Id: <20180706085622.27945-3-govinds@codeaurora.org>
In-Reply-To: <20180706085622.27945-1-govinds@codeaurora.org>
References: <20180706085622.27945-1-govinds@codeaurora.org>
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
To: bjorn.andersson@linaro.org, david.brown@linaro.org, andy.gross@linaro.org, niklas.cassel@linaro.org, ath10k@lists.infradead.org
Cc: Rakesh Pillai <pillair@codeaurora.org>, Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org

From: Rakesh Pillai <pillair@codeaurora.org>

Add support to create the boardname for non-bmi targets
like WCN3990, which uses qmi for bdf download. This
boardname is used to parse the board data from board-2.bin.

Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/core.c | 8 ++++++++
 drivers/net/wireless/ath/ath10k/core.h | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 85c58ebbfb26..840e301b6a6e 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -1440,6 +1440,14 @@ static int ath10k_core_create_board_name(struct ath10k *ar, char *name,
 		goto out;
 	}
 
+	if (ar->id.qmi_ids_valid) {
+		scnprintf(name, name_len,
+			  "bus=%s,qmi-board-id=%x",
+			  ath10k_bus_str(ar->hif.bus),
+			  ar->id.qmi_board_id);
+		goto out;
+	}
+
 	scnprintf(name, name_len,
 		  "bus=%s,vendor=%04x,device=%04x,subsystem-vendor=%04x,subsystem-device=%04x%s",
 		  ath10k_bus_str(ar->hif.bus),
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 427ee5752bb0..20f03f3a7080 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -941,7 +941,9 @@ struct ath10k {
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
