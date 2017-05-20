Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dCB4v-0005t4-Rj
 for ath10k@lists.infradead.org; Sat, 20 May 2017 20:34:24 +0000
Received: by mail-lf0-x243.google.com with SMTP id m18so2393513lfj.0
 for <ath10k@lists.infradead.org>; Sat, 20 May 2017 13:34:01 -0700 (PDT)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [RFC v2 2/3] ath10k: different fw file names for usb
Date: Sat, 20 May 2017 22:33:29 +0200
Message-Id: <1495312410-9937-3-git-send-email-erik.stromdahl@gmail.com>
In-Reply-To: <1495312410-9937-1-git-send-email-erik.stromdahl@gmail.com>
References: <1495312410-9937-1-git-send-email-erik.stromdahl@gmail.com>
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

USB firmware will be named in the same way as SDIO files,
i.e, the bus type will be added to the firmware file name.

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index eea111d..46ce263 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -1412,6 +1412,7 @@ static void ath10k_core_get_fw_name(struct ath10k *ar, char *fw_name,
 {
 	switch (ar->hif.bus) {
 	case ATH10K_BUS_SDIO:
+	case ATH10K_BUS_USB:
 		scnprintf(fw_name, fw_name_len, "%s-%s-%d.bin",
 			  ATH10K_FW_FILE_BASE, ath10k_bus_str(ar->hif.bus),
 			  fw_api);
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
