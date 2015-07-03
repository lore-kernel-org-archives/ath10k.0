Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x234.google.com ([2a00:1450:4010:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZB16o-0006OL-LD
 for ath10k@lists.infradead.org; Fri, 03 Jul 2015 13:34:27 +0000
Received: by lagc2 with SMTP id c2so85559410lag.3
 for <ath10k@lists.infradead.org>; Fri, 03 Jul 2015 06:33:59 -0700 (PDT)
From: Bartosz Markowski <bartosz.markowski@tieto.com>
Subject: [PATCH] ath10k: fix QCA61X4 boot up
Date: Fri,  3 Jul 2015 15:33:49 +0200
Message-Id: <1435930429-3970-1-git-send-email-bartosz.markowski@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Bartosz Markowski <bartosz.markowski@tieto.com>

commit "a521ee983d312db7 ath10k: Add new reg_address/mask to hw register
table" commit has broken the QCA61x4 support, by providing wrong
fw_indicator_address, which shall be 0x0003a028 instead of 0x00009028.

User experience was a failing boot up sequence (crashing device during
initialization)

[  181.663874] ath10k_pci 0000:02:00.0: enabling device (0000 -> 0002)
[  181.664787] ath10k_pci 0000:02:00.0: pci irq msi-x interrupts 8 irq_mode 0 reset_mode 0
[  181.688886] ath10k_pci 0000:02:00.0: device has crashed during init
[  181.688897] ath10k_pci 0000:02:00.0: failed to wait for target after cold reset: -70
[  181.688902] ath10k_pci 0000:02:00.0: failed to reset chip: -70
[  181.689774] ath10k_pci: probe of 0000:02:00.0 failed with error -70

Fix it by updating the address with correct value.

Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>
---
 drivers/net/wireless/ath/ath10k/hw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/hw.c b/drivers/net/wireless/ath/ath10k/hw.c
index 1414e1f3c7ac..fef7ccf6e185 100644
--- a/drivers/net/wireless/ath/ath10k/hw.c
+++ b/drivers/net/wireless/ath/ath10k/hw.c
@@ -63,7 +63,7 @@ const struct ath10k_hw_regs qca6174_regs = {
 	.soc_reset_control_ce_rst_mask		= 0x00000001,
 	.soc_chip_id_address			= 0x000000f0,
 	.scratch_3_address			= 0x00000028,
-	.fw_indicator_address			= 0x00009028,
+	.fw_indicator_address			= 0x0003a028,
 	.pcie_local_base_address		= 0x00080000,
 	.ce_wrap_intr_sum_host_msi_lsb		= 0x00000008,
 	.ce_wrap_intr_sum_host_msi_mask		= 0x0000ff00,
-- 
2.1.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
