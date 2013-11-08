Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x235.google.com ([2a00:1450:4013:c00::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Veg81-0004JF-3L
 for ath10k@lists.infradead.org; Fri, 08 Nov 2013 07:05:15 +0000
Received: by mail-ee0-f53.google.com with SMTP id e51so782179eek.40
 for <ath10k@lists.infradead.org>; Thu, 07 Nov 2013 23:04:49 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCHv2 07/13] ath10k: remove meaningless check
Date: Fri,  8 Nov 2013 08:01:29 +0100
Message-Id: <1383894095-27998-8-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1383894095-27998-1-git-send-email-michal.kazior@tieto.com>
References: <1383133346-8135-1-git-send-email-michal.kazior@tieto.com>
 <1383894095-27998-1-git-send-email-michal.kazior@tieto.com>
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

The check doesn't make much sense. If the address
were to be 0x0000 the check would fail. In this
case a 0 address isn't wrong.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 4aa7992..62df0dd 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -2307,9 +2307,6 @@ static void ath10k_pci_device_reset(struct ath10k *ar)
 	int i;
 	u32 val;
 
-	if (!SOC_GLOBAL_RESET_ADDRESS)
-		return;
-
 	ath10k_pci_reg_write32(ar, PCIE_SOC_WAKE_ADDRESS,
 			       PCIE_SOC_WAKE_V_MASK);
 	for (i = 0; i < ATH_PCI_RESET_WAIT_MAX; i++) {
-- 
1.8.4.rc3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
