Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx1.redhat.com ([209.132.183.28])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W8rxe-0006vR-Ng
 for ath10k@lists.infradead.org; Thu, 30 Jan 2014 13:47:19 +0000
Date: Thu, 30 Jan 2014 14:48:54 +0100
From: Alexander Gordeev <agordeev@redhat.com>
Subject: [PATCH 2/3] ath10k: Disable MSI in case IRQ configuration is unknown
Message-ID: <20140130134853.GB31909@dhcp-26-207.brq.redhat.com>
References: <cover.1389904166.git.agordeev@redhat.com>
 <ad5cc6d6bdf4c8f5ce4681ec27674d07fbda089e.1389904167.git.agordeev@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ad5cc6d6bdf4c8f5ce4681ec27674d07fbda089e.1389904167.git.agordeev@redhat.com>
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
To: linux-kernel@vger.kernel.org
Cc: linux-pci@vger.kernel.org, Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

In case IRQ configuration is unknown possibly enabled MSIs
are left enabled in ath10k_pci_deinit_irq(). This update
fixes the described misbehaviour.

Signed-off-by: Alexander Gordeev <agordeev@redhat.com>
---
 drivers/net/wireless/ath/ath10k/pci.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 6525e1f..563ce77 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -2480,6 +2480,8 @@ static int ath10k_pci_deinit_irq(struct ath10k *ar)
 	case MSI_NUM_REQUEST:
 		pci_disable_msi(ar_pci->pdev);
 		return 0;
+	default:
+		pci_disable_msi(ar_pci->pdev);
 	}
 
 	ath10k_warn("unknown irq configuration upon deinit\n");
-- 
1.7.7.6

-- 
Regards,
Alexander Gordeev
agordeev@redhat.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
