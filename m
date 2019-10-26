Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iOLx1-0007BL-BL
 for ath10k@lists.infradead.org; Sat, 26 Oct 2019 13:17:52 +0000
From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.3 60/99] ath10k: fix latency issue for QCA988x
Date: Sat, 26 Oct 2019 09:15:21 -0400
Message-Id: <20191026131600.2507-60-sashal@kernel.org>
In-Reply-To: <20191026131600.2507-1-sashal@kernel.org>
References: <20191026131600.2507-1-sashal@kernel.org>
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
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Sasha Levin <sashal@kernel.org>, Miaoqing Pan <miaoqing@codeaurora.org>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

From: Miaoqing Pan <miaoqing@codeaurora.org>

[ Upstream commit d79749f7716d9dc32fa2d5075f6ec29aac63c76d ]

(kvalo: cherry picked from commit 1340cc631bd00431e2f174525c971f119df9efa1 in
wireless-drivers-next to wireless-drivers as this a frequently reported
regression)

Bad latency is found on QCA988x, the issue was introduced by
commit 4504f0e5b571 ("ath10k: sdio: workaround firmware UART
pin configuration bug"). If uart_pin_workaround is false, this
change will set uart pin even if uart_print is false.

Tested HW: QCA9880
Tested FW: 10.2.4-1.0-00037

Fixes: 4504f0e5b571 ("ath10k: sdio: workaround firmware UART pin configuration bug")
Signed-off-by: Miaoqing Pan <miaoqing@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath10k/core.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index dc45d16e8d214..383d4fa555a88 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2118,12 +2118,15 @@ static int ath10k_init_uart(struct ath10k *ar)
 		return ret;
 	}
 
-	if (!uart_print && ar->hw_params.uart_pin_workaround) {
-		ret = ath10k_bmi_write32(ar, hi_dbg_uart_txpin,
-					 ar->hw_params.uart_pin);
-		if (ret) {
-			ath10k_warn(ar, "failed to set UART TX pin: %d", ret);
-			return ret;
+	if (!uart_print) {
+		if (ar->hw_params.uart_pin_workaround) {
+			ret = ath10k_bmi_write32(ar, hi_dbg_uart_txpin,
+						 ar->hw_params.uart_pin);
+			if (ret) {
+				ath10k_warn(ar, "failed to set UART TX pin: %d",
+					    ret);
+				return ret;
+			}
 		}
 
 		return 0;
-- 
2.20.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
