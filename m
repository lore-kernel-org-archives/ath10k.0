Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cgD7P-0007Gr-Sq
 for ath10k@lists.infradead.org; Tue, 21 Feb 2017 16:16:48 +0000
Received: by mail-lf0-x243.google.com with SMTP id z127so9537348lfa.2
 for <ath10k@lists.infradead.org>; Tue, 21 Feb 2017 08:16:26 -0800 (PST)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [RFC v4 13/21] ath10k: different fw file names for usb and sdio
Date: Tue, 21 Feb 2017 17:15:33 +0100
Message-Id: <1487693741-10042-14-git-send-email-erik.stromdahl@gmail.com>
In-Reply-To: <1487693741-10042-1-git-send-email-erik.stromdahl@gmail.com>
References: <1487693741-10042-1-git-send-email-erik.stromdahl@gmail.com>
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
To: kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Cc: Erik Stromdahl <erik.stromdahl@gmail.com>

Since both SDIO and USB based chipsets will use different
firmware from the PCIe and AHB chipsets, the fw file name
must be different depending on bus type.

The new firmware names are:

For PCIe and AHB:
firmware-<api_version>.bin (same as before)

For SDIO:
firmware-sdio-<api_version>.bin

For USB:
firmware-usb-<api_version>.bin

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 39c407e..9d60f4b 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -1387,7 +1387,13 @@ int ath10k_core_fetch_firmware_api_n(struct ath10k *ar, const char *name,
 static void ath10k_core_get_fw_name(struct ath10k *ar, char *fw_name,
 				    size_t fw_name_len, int fw_api)
 {
-	scnprintf(fw_name, fw_name_len, "%s-%d.bin", ATH10K_FW_FILE_BASE, fw_api);
+	if ((ar->hif.bus != ATH10K_BUS_PCI) && (ar->hif.bus != ATH10K_BUS_AHB))
+		scnprintf(fw_name, fw_name_len, "%s-%s-%d.bin",
+			  ATH10K_FW_FILE_BASE, ath10k_bus_str(ar->hif.bus),
+			  fw_api);
+	else
+		scnprintf(fw_name, fw_name_len, "%s-%d.bin",
+			  ATH10K_FW_FILE_BASE, fw_api);
 }
 
 static int ath10k_core_fetch_firmware_files(struct ath10k *ar)
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
