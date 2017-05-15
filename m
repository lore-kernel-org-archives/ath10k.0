Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dANVE-0002jP-AK
 for ath10k@lists.infradead.org; Mon, 15 May 2017 21:26:05 +0000
From: greearb@candelatech.com
Subject: [PATCH 3/3] ath10k:  Log when longer bmi cmds happen.
Date: Mon, 15 May 2017 14:25:40 -0700
Message-Id: <1494883540-18558-3-git-send-email-greearb@candelatech.com>
In-Reply-To: <1494883540-18558-1-git-send-email-greearb@candelatech.com>
References: <1494883540-18558-1-git-send-email-greearb@candelatech.com>
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
Cc: Ben Greear <greearb@candelatech.com>

From: Ben Greear <greearb@candelatech.com>

This lets one have a clue that maybe timeouts are happening
when we just aren't waiting long enough.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 52b9ebb..0311b07 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -101,7 +101,8 @@ static int ath10k_pci_init_irq(struct ath10k *ar);
 static int ath10k_pci_deinit_irq(struct ath10k *ar);
 static int ath10k_pci_request_irq(struct ath10k *ar);
 static void ath10k_pci_free_irq(struct ath10k *ar);
-static int ath10k_pci_bmi_wait(struct ath10k_ce_pipe *tx_pipe,
+static int ath10k_pci_bmi_wait(struct ath10k *ar,
+			       struct ath10k_ce_pipe *tx_pipe,
 			       struct ath10k_ce_pipe *rx_pipe,
 			       struct bmi_xfer *xfer);
 static int ath10k_pci_qca99x0_chip_reset(struct ath10k *ar);
@@ -2156,7 +2157,7 @@ int ath10k_pci_hif_exchange_bmi_msg(struct ath10k *ar,
 	if (ret)
 		goto err_resp;
 
-	ret = ath10k_pci_bmi_wait(ce_tx, ce_rx, &xfer);
+	ret = ath10k_pci_bmi_wait(ar, ce_tx, ce_rx, &xfer);
 	if (ret) {
 		u32 unused_buffer;
 		unsigned int unused_nbytes;
@@ -2225,23 +2226,35 @@ static void ath10k_pci_bmi_recv_data(struct ath10k_ce_pipe *ce_state)
 	xfer->rx_done = true;
 }
 
-static int ath10k_pci_bmi_wait(struct ath10k_ce_pipe *tx_pipe,
+static int ath10k_pci_bmi_wait(struct ath10k *ar,
+			       struct ath10k_ce_pipe *tx_pipe,
 			       struct ath10k_ce_pipe *rx_pipe,
 			       struct bmi_xfer *xfer)
 {
 	unsigned long timeout = jiffies + BMI_COMMUNICATION_TIMEOUT_HZ;
+	unsigned long started = jiffies;
+	unsigned long dur;
+	int rv = -ETIMEDOUT;
 
 	while (time_before_eq(jiffies, timeout)) {
 		ath10k_pci_bmi_send_done(tx_pipe);
 		ath10k_pci_bmi_recv_data(rx_pipe);
 
-		if (xfer->tx_done && (xfer->rx_done == xfer->wait_for_resp))
-			return 0;
+		if (xfer->tx_done && (xfer->rx_done == xfer->wait_for_resp)) {
+			rv = 0;
+			goto out;
+		}
 
 		schedule();
 	}
 
-	return -ETIMEDOUT;
+out:
+	dur = jiffies - started;
+	if (dur > HZ)
+		ath10k_dbg(ar, ATH10K_DBG_BMI,
+			   "bmi cmd took: %lu jiffies (HZ: %d), rv: %d\n",
+			   dur, HZ, rv);
+	return rv;
 }
 
 /*
-- 
2.4.11


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
