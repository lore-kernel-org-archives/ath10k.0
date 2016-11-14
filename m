Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c6KEZ-0000S9-FI
 for ath10k@lists.infradead.org; Mon, 14 Nov 2016 16:35:53 +0000
Received: by mail-lf0-x241.google.com with SMTP id o141so7513786lff.1
 for <ath10k@lists.infradead.org>; Mon, 14 Nov 2016 08:35:33 -0800 (PST)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [RFC 08/12] ath10k: Added ATH10K_BUS_SDIO enum
Date: Mon, 14 Nov 2016 17:33:38 +0100
Message-Id: <1479141222-8493-9-git-send-email-erik.stromdahl@gmail.com>
In-Reply-To: <1479141222-8493-1-git-send-email-erik.stromdahl@gmail.com>
References: <1479141222-8493-1-git-send-email-erik.stromdahl@gmail.com>
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

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
---
 drivers/net/wireless/ath/ath10k/core.h |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index b7067cc..8c7b080 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -74,6 +74,7 @@
 enum ath10k_bus {
 	ATH10K_BUS_PCI,
 	ATH10K_BUS_AHB,
+	ATH10K_BUS_SDIO,
 };
 
 static inline const char *ath10k_bus_str(enum ath10k_bus bus)
@@ -83,6 +84,8 @@ static inline const char *ath10k_bus_str(enum ath10k_bus bus)
 		return "pci";
 	case ATH10K_BUS_AHB:
 		return "ahb";
+	case ATH10K_BUS_SDIO:
+		return "sdio";
 	}
 
 	return "unknown";
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
