Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cgD7L-0006gr-A3
 for ath10k@lists.infradead.org; Tue, 21 Feb 2017 16:16:46 +0000
Received: by mail-lf0-x243.google.com with SMTP id h67so3752155lfg.1
 for <ath10k@lists.infradead.org>; Tue, 21 Feb 2017 08:16:23 -0800 (PST)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [RFC v4 10/21] ath10k: various usb related definitions
Date: Tue, 21 Feb 2017 17:15:30 +0100
Message-Id: <1487693741-10042-11-git-send-email-erik.stromdahl@gmail.com>
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

Definitions for USB based chipsets

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
---
 drivers/net/wireless/ath/ath10k/core.h  | 3 +++
 drivers/net/wireless/ath/ath10k/debug.h | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 5965d18..2768b07 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -92,6 +92,7 @@ enum ath10k_bus {
 	ATH10K_BUS_PCI,
 	ATH10K_BUS_AHB,
 	ATH10K_BUS_SDIO,
+	ATH10K_BUS_USB,
 };
 
 static inline const char *ath10k_bus_str(enum ath10k_bus bus)
@@ -103,6 +104,8 @@ static inline const char *ath10k_bus_str(enum ath10k_bus bus)
 		return "ahb";
 	case ATH10K_BUS_SDIO:
 		return "sdio";
+	case ATH10K_BUS_USB:
+		return "usb";
 	}
 
 	return "unknown";
diff --git a/drivers/net/wireless/ath/ath10k/debug.h b/drivers/net/wireless/ath/ath10k/debug.h
index 257d109..548ad54 100644
--- a/drivers/net/wireless/ath/ath10k/debug.h
+++ b/drivers/net/wireless/ath/ath10k/debug.h
@@ -40,6 +40,8 @@ enum ath10k_debug_mask {
 	ATH10K_DBG_AHB		= 0x00008000,
 	ATH10K_DBG_SDIO		= 0x00010000,
 	ATH10K_DBG_SDIO_DUMP	= 0x00020000,
+	ATH10K_DBG_USB		= 0x00040000,
+	ATH10K_DBG_USB_BULK	= 0x00080000,
 	ATH10K_DBG_ANY		= 0xffffffff,
 };
 
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
