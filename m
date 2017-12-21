Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eRyqy-0000Hq-Kb
 for ath10k@lists.infradead.org; Thu, 21 Dec 2017 11:17:34 +0000
From: Rakesh Pillai <pillair@qti.qualcomm.com>
Subject: [PATCH 1/3] ath10k: Add SNOC bus type for WCN3990 target
Date: Thu, 21 Dec 2017 16:44:45 +0530
Message-Id: <1513854887-10759-2-git-send-email-pillair@qti.qualcomm.com>
In-Reply-To: <1513854887-10759-1-git-send-email-pillair@qti.qualcomm.com>
References: <1513854887-10759-1-git-send-email-pillair@qti.qualcomm.com>
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
Cc: Govind Singh <govinds@qti.qualcomm.com>, linux-wireless@vger.kernel.org, Rakesh Pillai <pillair@qti.qualcomm.com>

From: Govind Singh <govinds@qti.qualcomm.com>

WCN3990 is integrated chipset which uses system NOC.
Add SNOC bus type and related definitions.

Signed-off-by: Govind Singh <govinds@qti.qualcomm.com>
Signed-off-by: Rakesh Pillai <pillair@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 1 +
 drivers/net/wireless/ath/ath10k/core.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index a5a3eeb569c5..8374b05f72b2 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -1555,6 +1555,7 @@ static void ath10k_core_get_fw_name(struct ath10k *ar, char *fw_name,
 		break;
 	case ATH10K_BUS_PCI:
 	case ATH10K_BUS_AHB:
+	case ATH10K_BUS_SNOC:
 		scnprintf(fw_name, fw_name_len, "%s-%d.bin",
 			  ATH10K_FW_FILE_BASE, fw_api);
 		break;
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 30c4c07658d5..aeb446b4ff58 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -93,6 +93,7 @@ enum ath10k_bus {
 	ATH10K_BUS_AHB,
 	ATH10K_BUS_SDIO,
 	ATH10K_BUS_USB,
+	ATH10K_BUS_SNOC,
 };
 
 static inline const char *ath10k_bus_str(enum ath10k_bus bus)
@@ -106,6 +107,8 @@ static inline const char *ath10k_bus_str(enum ath10k_bus bus)
 		return "sdio";
 	case ATH10K_BUS_USB:
 		return "usb";
+	case ATH10K_BUS_SNOC:
+		return "snoc";
 	}
 
 	return "unknown";
-- 
2.11.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
