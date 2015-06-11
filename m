Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x229.google.com ([2a00:1450:400c:c05::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2x9X-0001Jh-TG
 for ath10k@lists.infradead.org; Thu, 11 Jun 2015 07:43:56 +0000
Received: by wibut5 with SMTP id ut5so66861767wib.1
 for <ath10k@lists.infradead.org>; Thu, 11 Jun 2015 00:43:33 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: prevent debugfs mmio access crash kernel
Date: Thu, 11 Jun 2015 09:43:14 +0200
Message-Id: <1434008594-6726-1-git-send-email-michal.kazior@tieto.com>
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

It was possible to force an out of bounds MMIO
read/write via debugfs. E.g. on QCA988X this could
be triggered with:

 echo 0x2080e0 | tee /sys/kernel/debug/ieee80211/*/ath10k/reg_addr
 cat /sys/kernel/debug/ieee80211/*/ath10k/reg_value

 BUG: unable to handle kernel paging request at ffffc90001e080e0
 IP: [<ffffffff8135c860>] ioread32+0x40/0x50
 ...
 Call Trace:
  [<ffffffffa00d0c7f>] ? ath10k_pci_read32+0x4f/0x70 [ath10k_pci]
  [<ffffffffa0080f50>] ath10k_reg_value_read+0x90/0xf0 [ath10k_core]
  [<ffffffff8115c2c1>] ? handle_mm_fault+0xa91/0x1050
  [<ffffffff81189758>] __vfs_read+0x28/0xe0
  [<ffffffff812e4694>] ? security_file_permission+0x84/0xa0
  [<ffffffff81189ce3>] ? rw_verify_area+0x53/0x100
  [<ffffffff81189e1a>] vfs_read+0x8a/0x140
  [<ffffffff8118acb9>] SyS_read+0x49/0xb0
  [<ffffffff8104e39c>] ? trace_do_page_fault+0x3c/0xc0
  [<ffffffff8196596e>] system_call_fastpath+0x12/0x71

Reported-by: Ben Greear <greearb@candelatech.com>
Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 13 +++++++++++++
 drivers/net/wireless/ath/ath10k/pci.h |  1 +
 2 files changed, 14 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 9da36c764d3b..1843d31fbda7 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -479,6 +479,12 @@ void ath10k_pci_write32(struct ath10k *ar, u32 offset, u32 value)
 	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
 	int ret;
 
+	if (unlikely(offset + sizeof(value) > ar_pci->mem_len)) {
+		ath10k_warn(ar, "refusing to write mmio out of bounds at 0x%08x - 0x%08zx (max 0x%08zx)\n",
+			    offset, offset + sizeof(value), ar_pci->mem_len);
+		return;
+	}
+
 	ret = ath10k_pci_wake(ar);
 	if (ret) {
 		ath10k_warn(ar, "failed to wake target for write32 of 0x%08x at 0x%08x: %d\n",
@@ -496,6 +502,12 @@ u32 ath10k_pci_read32(struct ath10k *ar, u32 offset)
 	u32 val;
 	int ret;
 
+	if (unlikely(offset + sizeof(val) > ar_pci->mem_len)) {
+		ath10k_warn(ar, "refusing to read mmio out of bounds at 0x%08x - 0x%08zx (max 0x%08zx)\n",
+			    offset, offset + sizeof(val), ar_pci->mem_len);
+		return 0;
+	}
+
 	ret = ath10k_pci_wake(ar);
 	if (ret) {
 		ath10k_warn(ar, "failed to wake target for read32 at 0x%08x: %d\n",
@@ -2682,6 +2694,7 @@ static int ath10k_pci_claim(struct ath10k *ar)
 	pci_set_master(pdev);
 
 	/* Arrange for access to Target SoC registers. */
+	ar_pci->mem_len = pci_resource_len(pdev, BAR_NUM);
 	ar_pci->mem = pci_iomap(pdev, BAR_NUM, 0);
 	if (!ar_pci->mem) {
 		ath10k_err(ar, "failed to iomap BAR%d\n", BAR_NUM);
diff --git a/drivers/net/wireless/ath/ath10k/pci.h b/drivers/net/wireless/ath/ath10k/pci.h
index d7696ddc03c4..eea0a0170b00 100644
--- a/drivers/net/wireless/ath/ath10k/pci.h
+++ b/drivers/net/wireless/ath/ath10k/pci.h
@@ -162,6 +162,7 @@ struct ath10k_pci {
 	struct device *dev;
 	struct ath10k *ar;
 	void __iomem *mem;
+	size_t mem_len;
 
 	/*
 	 * Number of MSI interrupts granted, 0 --> using legacy PCI line
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
