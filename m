Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dyLix-0001Ou-8B
 for ath10k@lists.infradead.org; Sat, 30 Sep 2017 17:38:49 +0000
Received: by mail-pf0-x243.google.com with SMTP id m28so1627946pfi.0
 for <ath10k@lists.infradead.org>; Sat, 30 Sep 2017 10:38:30 -0700 (PDT)
From: silexcommon@gmail.com
Subject: [PATCH 02/11] ath10k_sdio: wb396 reference card fix
Date: Sat, 30 Sep 2017 23:07:39 +0530
Message-Id: <1506793068-27445-3-git-send-email-alagusankar@silex-india.com>
In-Reply-To: <1506793068-27445-1-git-send-email-alagusankar@silex-india.com>
References: <1506793068-27445-1-git-send-email-alagusankar@silex-india.com>
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
Cc: Alagu Sankar <alagusankar@silex-india.com>, linux-wireless@vger.kernel.org

From: Alagu Sankar <alagusankar@silex-india.com>

The QCA9377-3 WB396 sdio reference card does not get initialized
due to the conflict in uart gpio pins. This fix is not required
for other QCA9377 sdio cards.

Signed-off-by: Alagu Sankar <alagusankar@silex-india.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index b4f66cd..86247c8 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -1708,8 +1708,15 @@ static int ath10k_init_uart(struct ath10k *ar)
 		return ret;
 	}
 
-	if (!uart_print)
+	if (!uart_print) {
+		/* Hack: override dbg TX pin to avoid side effects of default
+		 * GPIO_6 in QCA9377 WB396 reference card
+		 */
+		if (ar->hif.bus == ATH10K_BUS_SDIO)
+			ath10k_bmi_write32(ar, hi_dbg_uart_txpin,
+					   ar->hw_params.uart_pin);
 		return 0;
+	}
 
 	ret = ath10k_bmi_write32(ar, hi_dbg_uart_txpin, ar->hw_params.uart_pin);
 	if (ret) {
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
