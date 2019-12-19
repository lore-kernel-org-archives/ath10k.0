Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihveG-00026E-IX
 for ath10k@lists.infradead.org; Thu, 19 Dec 2019 13:15:25 +0000
Received: by mail-ed1-x544.google.com with SMTP id f8so4844603edv.2
 for <ath10k@lists.infradead.org>; Thu, 19 Dec 2019 05:15:22 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 0/2] ath10k: pci: Two PCI related fixups
Date: Thu, 19 Dec 2019 13:15:37 +0000
Message-Id: <20191219131539.1003793-1-bryan.odonoghue@linaro.org>
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
To: kvalo@codeaurora.org, akolli@codeaurora.org, ath10k@lists.infradead.org
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-wireless@vger.kernel.org

This set addresses two issues one a contrived but real corner-case crash
scenario and the other a simple typo.

Debugging on a QCS405 which has an ath10k attached to PCIe its been found
that a loop similar to the below [1] will cause.

1. A significant slow-down in the time it takes an individual ioread32()
   to complete.
2. A secure watchdog bite.

This is as a result of the restart routine and the dump register routine
running in parallel and a period of time during restart where dumping
registers is unstable.

The second patch is a simple fix to an apparent copy/paste error describing
the behavior of a similar dump function.

[1] Reset method
while $1
do
echo hw-restart > /sys/kernel/debug/ieee80211/phy0/ath10k/simulate_fw_crash
echo hard >  /sys/kernel/debug/ieee80211/phy0/ath10k/simulate_fw_crash
done;

Bryan O'Donoghue (2):
  ath10k: pci: Only dump ATH10K_MEM_REGION_TYPE_IOREG when safe
  ath10k: pci: Fix comment on ath10k_pci_dump_memory_sram

 drivers/net/wireless/ath/ath10k/pci.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

-- 
2.24.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
