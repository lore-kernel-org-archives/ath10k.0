Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ea0-x233.google.com ([2a00:1450:4013:c01::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VbUDP-0000Co-BO
 for ath10k@lists.infradead.org; Wed, 30 Oct 2013 11:45:37 +0000
Received: by mail-ea0-f179.google.com with SMTP id b10so577245eae.24
 for <ath10k@lists.infradead.org>; Wed, 30 Oct 2013 04:45:13 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH/RFT 05/12] ath10k: make sure to mask all CE irqs
Date: Wed, 30 Oct 2013 12:42:19 +0100
Message-Id: <1383133346-8135-6-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1383133346-8135-1-git-send-email-michal.kazior@tieto.com>
References: <1383133346-8135-1-git-send-email-michal.kazior@tieto.com>
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
Cc: greearb@candelatech.com, linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

CE error interrupts were not disabled. This could
lead to invalid memory accesses / memory
corruption.

Also make sure CE watermark interrupts are also
disabled.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/ce.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
index 2b99bd4..7a49cde 100644
--- a/drivers/net/wireless/ath/ath10k/ce.c
+++ b/drivers/net/wireless/ath/ath10k/ce.c
@@ -243,6 +243,16 @@ static inline void ath10k_ce_error_intr_enable(struct ath10k *ar,
 			   misc_ie_addr | CE_ERROR_MASK);
 }
 
+static inline void ath10k_ce_error_intr_disable(struct ath10k *ar,
+						u32 ce_ctrl_addr)
+{
+	u32 misc_ie_addr = ath10k_pci_read32(ar,
+					     ce_ctrl_addr + MISC_IE_ADDRESS);
+
+	ath10k_pci_write32(ar, ce_ctrl_addr + MISC_IE_ADDRESS,
+			   misc_ie_addr & ~CE_ERROR_MASK);
+}
+
 static inline void ath10k_ce_engine_int_status_clear(struct ath10k *ar,
 						     u32 ce_ctrl_addr,
 						     unsigned int mask)
@@ -794,6 +804,8 @@ void ath10k_ce_disable_interrupts(struct ath10k *ar)
 		u32 ctrl_addr = ath10k_ce_base_address(ce_id);
 
 		ath10k_ce_copy_complete_intr_disable(ar, ctrl_addr);
+		ath10k_ce_error_intr_disable(ar, ctrl_addr);
+		ath10k_ce_watermark_intr_disable(ar, ctrl_addr);
 	}
 	ath10k_pci_sleep(ar);
 }
-- 
1.8.4.rc3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
