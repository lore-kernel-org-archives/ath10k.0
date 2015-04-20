Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x22b.google.com ([2a00:1450:4010:c04::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yk7zD-0003IY-LV
 for ath10k@lists.infradead.org; Mon, 20 Apr 2015 09:27:28 +0000
Received: by lbcga7 with SMTP id ga7so125906595lbc.1
 for <ath10k@lists.infradead.org>; Mon, 20 Apr 2015 02:27:03 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: fix qca61x4 hw2.1 support
Date: Mon, 20 Apr 2015 09:20:41 +0000
Message-Id: <1429521641-21993-1-git-send-email-michal.kazior@tieto.com>
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

During initialization firmware does some sort of
memory switch between DRAM and IRAM. If
configuration value for bank switching isn't
correct device crashes during init.

The new value prevents firmware 11.0.0.302 (and
possibly others) for qca61x4 hw2.1 from crashing
during init.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 262a84f67f62..b1e522ccb525 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1539,12 +1539,11 @@ static int ath10k_pci_get_num_banks(struct ath10k *ar)
 		switch (MS(ar->chip_id, SOC_CHIP_ID_REV)) {
 		case QCA6174_HW_1_0_CHIP_ID_REV:
 		case QCA6174_HW_1_1_CHIP_ID_REV:
+		case QCA6174_HW_2_1_CHIP_ID_REV:
+		case QCA6174_HW_2_2_CHIP_ID_REV:
 			return 3;
 		case QCA6174_HW_1_3_CHIP_ID_REV:
 			return 2;
-		case QCA6174_HW_2_1_CHIP_ID_REV:
-		case QCA6174_HW_2_2_CHIP_ID_REV:
-			return 6;
 		case QCA6174_HW_3_0_CHIP_ID_REV:
 		case QCA6174_HW_3_1_CHIP_ID_REV:
 		case QCA6174_HW_3_2_CHIP_ID_REV:
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
