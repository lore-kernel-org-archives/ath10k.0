Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c6KEa-0000SK-Dk
 for ath10k@lists.infradead.org; Mon, 14 Nov 2016 16:35:54 +0000
Received: by mail-lf0-x243.google.com with SMTP id o141so7513822lff.1
 for <ath10k@lists.infradead.org>; Mon, 14 Nov 2016 08:35:34 -0800 (PST)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [RFC 09/12] ath10k: Mailbox address definitions
Date: Mon, 14 Nov 2016 17:33:39 +0100
Message-Id: <1479141222-8493-10-git-send-email-erik.stromdahl@gmail.com>
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

Address definitions for SDIO/mbox based chipsets.

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
---
 drivers/net/wireless/ath/ath10k/hw.h |   53 ++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 883547f..46142e9 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -814,6 +814,59 @@ struct ath10k_hw_ops {
 #define QCA9887_EEPROM_ADDR_LO_MASK		0x00ff0000
 #define QCA9887_EEPROM_ADDR_LO_LSB		16
 
+#define MBOX_RESET_CONTROL_ADDRESS		0x00000000
+#define MBOX_HOST_INT_STATUS_ADDRESS		0x00000800
+#define MBOX_HOST_INT_STATUS_ERROR_LSB		7
+#define MBOX_HOST_INT_STATUS_ERROR_MASK		0x00000080
+#define MBOX_HOST_INT_STATUS_CPU_LSB		6
+#define MBOX_HOST_INT_STATUS_CPU_MASK		0x00000040
+#define MBOX_HOST_INT_STATUS_COUNTER_LSB	4
+#define MBOX_HOST_INT_STATUS_COUNTER_MASK	0x00000010
+#define MBOX_CPU_INT_STATUS_ADDRESS		0x00000801
+#define MBOX_ERROR_INT_STATUS_ADDRESS		0x00000802
+#define MBOX_ERROR_INT_STATUS_WAKEUP_LSB	2
+#define MBOX_ERROR_INT_STATUS_WAKEUP_MASK	0x00000004
+#define MBOX_ERROR_INT_STATUS_RX_UNDERFLOW_LSB	1
+#define MBOX_ERROR_INT_STATUS_RX_UNDERFLOW_MASK	0x00000002
+#define MBOX_ERROR_INT_STATUS_TX_OVERFLOW_LSB	0
+#define MBOX_ERROR_INT_STATUS_TX_OVERFLOW_MASK	0x00000001
+#define MBOX_COUNTER_INT_STATUS_ADDRESS		0x00000803
+#define MBOX_COUNTER_INT_STATUS_COUNTER_LSB	0
+#define MBOX_COUNTER_INT_STATUS_COUNTER_MASK	0x000000ff
+#define MBOX_RX_LOOKAHEAD_VALID_ADDRESS		0x00000805
+#define MBOX_INT_STATUS_ENABLE_ADDRESS		0x00000828
+#define MBOX_INT_STATUS_ENABLE_ERROR_LSB	7
+#define MBOX_INT_STATUS_ENABLE_ERROR_MASK	0x00000080
+#define MBOX_INT_STATUS_ENABLE_CPU_LSB		6
+#define MBOX_INT_STATUS_ENABLE_CPU_MASK		0x00000040
+#define MBOX_INT_STATUS_ENABLE_INT_LSB		5
+#define MBOX_INT_STATUS_ENABLE_INT_MASK		0x00000020
+#define MBOX_INT_STATUS_ENABLE_COUNTER_LSB	4
+#define MBOX_INT_STATUS_ENABLE_COUNTER_MASK	0x00000010
+#define MBOX_INT_STATUS_ENABLE_MBOX_DATA_LSB	0
+#define MBOX_INT_STATUS_ENABLE_MBOX_DATA_MASK	0x0000000f
+#define MBOX_CPU_INT_STATUS_ENABLE_ADDRESS	0x00000819
+#define MBOX_CPU_INT_STATUS_ENABLE_BIT_LSB	0
+#define MBOX_CPU_INT_STATUS_ENABLE_BIT_MASK	0x000000ff
+#define MBOX_ERROR_STATUS_ENABLE_ADDRESS	0x0000081a
+#define MBOX_ERROR_STATUS_ENABLE_RX_UNDERFLOW_LSB  1
+#define MBOX_ERROR_STATUS_ENABLE_RX_UNDERFLOW_MASK 0x00000002
+#define MBOX_ERROR_STATUS_ENABLE_TX_OVERFLOW_LSB   0
+#define MBOX_ERROR_STATUS_ENABLE_TX_OVERFLOW_MASK  0x00000001
+#define MBOX_COUNTER_INT_STATUS_ENABLE_ADDRESS	0x0000081b
+#define MBOX_COUNTER_INT_STATUS_ENABLE_BIT_LSB	0
+#define MBOX_COUNTER_INT_STATUS_ENABLE_BIT_MASK	0x000000ff
+#define MBOX_COUNT_ADDRESS			0x00000820
+#define MBOX_COUNT_DEC_ADDRESS			0x00000840
+#define MBOX_WINDOW_DATA_ADDRESS		0x00000874
+#define MBOX_WINDOW_WRITE_ADDR_ADDRESS		0x00000878
+#define MBOX_WINDOW_READ_ADDR_ADDRESS		0x0000087c
+#define MBOX_CPU_DBG_SEL_ADDRESS		0x00000883
+#define MBOX_CPU_DBG_ADDRESS			0x00000884
+#define MBOX_RTC_BASE_ADDRESS			0x00000000
+#define MBOX_GPIO_BASE_ADDRESS			0x00005000
+#define MBOX_MBOX_BASE_ADDRESS			0x00008000
+
 #define RTC_STATE_V_GET(x) (((x) & RTC_STATE_V_MASK) >> RTC_STATE_V_LSB)
 
 /* Register definitions for first generation ath10k cards. These cards include
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
