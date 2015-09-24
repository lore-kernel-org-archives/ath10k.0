Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zf7S7-0005ts-Gi
 for ath10k@lists.infradead.org; Thu, 24 Sep 2015 14:24:52 +0000
From: <c_mkenna@qti.qualcomm.com>
Subject: [PATCH] ath10k: Increase pci wakeup timeout to 30 ms
Date: Thu, 24 Sep 2015 19:54:00 +0530
Message-ID: <1443104640-13965-1-git-send-email-c_mkenna@qti.qualcomm.com>
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
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Maharaja Kennadyrajan <c_mkenna@qti.qualcomm.com>

From: Maharaja Kennadyrajan <c_mkenna@qti.qualcomm.com>

It is noticed that pci wakeup time is exceeding current timeout (10ms)
randomly which is tested on QCA988x. So, the wake up time is increased
to 30 ms and added debug prints to log total timeout.

Signed-off-by: Maharaja Kennadyrajan <c_mkenna@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 6 +++++-
 drivers/net/wireless/ath/ath10k/pci.h | 3 ++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 1046ab6..2df1692 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -452,8 +452,12 @@ static int ath10k_pci_wake_wait(struct ath10k *ar)
 	int curr_delay = 5;
 
 	while (tot_delay < PCIE_WAKE_TIMEOUT) {
-		if (ath10k_pci_is_awake(ar))
+		if (ath10k_pci_is_awake(ar)) {
+			if (tot_delay > PCIE_WAKE_LATE_US)
+				ath10k_warn(ar, "device wakeup took %d ms which is unusally long, otherwise it works normally.\n",
+					    tot_delay / 1000);
 			return 0;
+		}
 
 		udelay(curr_delay);
 		tot_delay += curr_delay;
diff --git a/drivers/net/wireless/ath/ath10k/pci.h b/drivers/net/wireless/ath/ath10k/pci.h
index 8d364fb..54af2d7 100644
--- a/drivers/net/wireless/ath/ath10k/pci.h
+++ b/drivers/net/wireless/ath/ath10k/pci.h
@@ -230,7 +230,8 @@ static inline struct ath10k_pci *ath10k_pci_priv(struct ath10k *ar)
 
 #define ATH10K_PCI_RX_POST_RETRY_MS 50
 #define ATH_PCI_RESET_WAIT_MAX 10 /* ms */
-#define PCIE_WAKE_TIMEOUT 10000	/* 10ms */
+#define PCIE_WAKE_TIMEOUT 30000	/* 30ms */
+#define PCIE_WAKE_LATE_US 10000	/* 10ms */
 
 #define BAR_NUM 0
 
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
