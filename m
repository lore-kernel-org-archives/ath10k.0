Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x22b.google.com ([2a00:1450:4013:c00::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkTFQ-0003IJ-OB
 for ath10k@lists.infradead.org; Wed, 14 May 2014 07:05:06 +0000
Received: by mail-ee0-f43.google.com with SMTP id d17so1003698eek.2
 for <ath10k@lists.infradead.org>; Wed, 14 May 2014 00:04:41 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 1/2] ath10k: improve warm reset reliability
Date: Wed, 14 May 2014 08:57:37 +0200
Message-Id: <1400050658-2763-2-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1400050658-2763-1-git-send-email-michal.kazior@tieto.com>
References: <1400050658-2763-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

Warm reset is now able to recover after device
crashes which required a cold reset before.

This should greatly reduce chances of getting data
bus errors or host system freezes due to buggy
cold reset on some chips.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 66b1f30..c9b14b4 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1802,6 +1802,28 @@ static void ath10k_pci_fw_interrupt_handler(struct ath10k *ar)
 	ath10k_pci_sleep(ar);
 }
 
+/* this function effectively clears target memory controller assert line */
+static void ath10k_pci_warm_reset_si0(struct ath10k *ar)
+{
+	u32 val;
+
+	val = ath10k_pci_read32(ar, RTC_SOC_BASE_ADDRESS +
+				SOC_RESET_CONTROL_ADDRESS);
+	ath10k_pci_write32(ar, RTC_SOC_BASE_ADDRESS + SOC_RESET_CONTROL_ADDRESS,
+			   val | SOC_RESET_CONTROL_SI0_RST_MASK);
+	val = ath10k_pci_read32(ar, RTC_SOC_BASE_ADDRESS +
+				SOC_RESET_CONTROL_ADDRESS);
+	msleep(10);
+
+	val = ath10k_pci_read32(ar, RTC_SOC_BASE_ADDRESS +
+				SOC_RESET_CONTROL_ADDRESS);
+	ath10k_pci_write32(ar, RTC_SOC_BASE_ADDRESS + SOC_RESET_CONTROL_ADDRESS,
+			   val & ~SOC_RESET_CONTROL_SI0_RST_MASK);
+	val = ath10k_pci_read32(ar, RTC_SOC_BASE_ADDRESS +
+				SOC_RESET_CONTROL_ADDRESS);
+	msleep(10);
+}
+
 static int ath10k_pci_warm_reset(struct ath10k *ar)
 {
 	int ret = 0;
@@ -1860,6 +1882,8 @@ static int ath10k_pci_warm_reset(struct ath10k *ar)
 				SOC_RESET_CONTROL_ADDRESS);
 	msleep(10);
 
+	ath10k_pci_warm_reset_si0(ar);
+
 	/* debug */
 	val = ath10k_pci_read32(ar, SOC_CORE_BASE_ADDRESS +
 				PCIE_INTR_CAUSE_ADDRESS);
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
