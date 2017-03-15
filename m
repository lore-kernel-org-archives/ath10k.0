Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1coB8u-0006uM-E5
 for ath10k@lists.infradead.org; Wed, 15 Mar 2017 15:47:18 +0000
Subject: [PATCH v6 09/10] ath10k: different fw file names for usb and sdio
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Wed, 15 Mar 2017 17:46:44 +0200
Message-ID: <148959280431.31432.16087997710973721077.stgit@potku.adurom.net>
In-Reply-To: <148959263520.31432.8488419244476213373.stgit@potku.adurom.net>
References: <148959263520.31432.8488419244476213373.stgit@potku.adurom.net>
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

From: Erik Stromdahl <erik.stromdahl@gmail.com>

Since both SDIO and USB based chipsets will use different
firmware from the PCIe and AHB chipsets, the fw file name
must be different depending on bus type.

The new firmware names are:

For PCIe and AHB:
firmware-<api_version>.bin (same as before)

For SDIO:
firmware-sdio-<api_version>.bin

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c |   13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index d7fb11107df4..d2648d09a772 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -1398,7 +1398,18 @@ int ath10k_core_fetch_firmware_api_n(struct ath10k *ar, const char *name,
 static void ath10k_core_get_fw_name(struct ath10k *ar, char *fw_name,
 				    size_t fw_name_len, int fw_api)
 {
-	scnprintf(fw_name, fw_name_len, "%s-%d.bin", ATH10K_FW_FILE_BASE, fw_api);
+	switch (ar->hif.bus) {
+	case ATH10K_BUS_SDIO:
+		scnprintf(fw_name, fw_name_len, "%s-%s-%d.bin",
+			  ATH10K_FW_FILE_BASE, ath10k_bus_str(ar->hif.bus),
+			  fw_api);
+		break;
+	case ATH10K_BUS_PCI:
+	case ATH10K_BUS_AHB:
+		scnprintf(fw_name, fw_name_len, "%s-%d.bin",
+			  ATH10K_FW_FILE_BASE, fw_api);
+		break;
+	}
 }
 
 static int ath10k_core_fetch_firmware_files(struct ath10k *ar)


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
