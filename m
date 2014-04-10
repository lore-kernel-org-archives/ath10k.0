Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-f51.google.com ([74.125.83.51])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WYJ41-0006cT-5t
 for ath10k@lists.infradead.org; Thu, 10 Apr 2014 17:47:02 +0000
Received: by mail-ee0-f51.google.com with SMTP id c13so3297865eek.38
 for <ath10k@lists.infradead.org>; Thu, 10 Apr 2014 10:46:28 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: double check bmi xfer pointers
Date: Thu, 10 Apr 2014 12:05:55 +0200
Message-Id: <1397124355-6321-1-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <53461A8A.4030209@candelatech.com>
References: <53461A8A.4030209@candelatech.com>
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

If for some reason copy engine ring buffer became
corrupt ath10k could crash the machine due to
invalid pointer dereference. It's very unlikely
but devices can never be fully trusted so verify
if the bmi xfer pointer read back from copy engine
matches the original pointer. The bug looked as
follows:

 BUG: unable to handle kernel paging request at ffffffff815d6133
...
 Call Trace:
 [<ffffffff810fdaf4>] ? mark_held_locks+0x71/0x99
 [<ffffffff810c6b6d>] ? __local_bh_enable_ip+0xaa/0xd9
 [<ffffffff810fd7eb>] lock_acquire+0x82/0x9d
 [<ffffffff810f5999>] ? complete+0x19/0x45
 [<ffffffff810c6b72>] ? __local_bh_enable_ip+0xaf/0xd9
 [<ffffffff815d5f9b>] _raw_spin_lock_irqsave+0x47/0x5a
 [<ffffffff810f5999>] ? complete+0x19/0x45
 [<ffffffff810f5999>] complete+0x19/0x45
 [<ffffffffa056d977>] ath10k_pci_hif_exchange_bmi_msg+0x267/0x3f4 [ath10k_pci]
 [<ffffffffa0471b42>] ath10k_hif_exchange_bmi_msg+0xe/0x10 [ath10k_core]
 [<ffffffffa0471f01>] ath10k_bmi_write_memory+0xc4/0x12d [ath10k_core]
 [<ffffffffa046877f>] ath10k_core_start+0x207/0x828 [ath10k_core]
 [<ffffffffa0469723>] ath10k_core_register+0x5ca/0x77f [ath10k_core]
...

Reported-By: Ben Greear <greearb@candelatech.com>
Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index bf1083d..85e84c9 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1390,35 +1390,49 @@ err_dma:
 	return ret;
 }
 
-static void ath10k_pci_bmi_send_done(struct ath10k_ce_pipe *ce_state)
+static void ath10k_pci_bmi_send_done(struct ath10k_ce_pipe *ce_state,
+				     struct bmi_xfer *xfer)
 {
-	struct bmi_xfer *xfer;
+	void *ptr;
 	u32 ce_data;
 	unsigned int nbytes;
 	unsigned int transfer_id;
 
-	if (ath10k_ce_completed_send_next(ce_state, (void **)&xfer, &ce_data,
+	if (ath10k_ce_completed_send_next(ce_state, (void **)&ptr, &ce_data,
 					  &nbytes, &transfer_id))
 		return;
 
+	if (xfer != ptr) {
+		ath10k_warn("failed to verify bmi xfer tx pointer (got %p expected %p)\n",
+			    ptr, xfer);
+		return;
+	}
+
 	if (xfer->wait_for_resp)
 		return;
 
 	complete(&xfer->done);
 }
 
-static void ath10k_pci_bmi_recv_data(struct ath10k_ce_pipe *ce_state)
+static void ath10k_pci_bmi_recv_data(struct ath10k_ce_pipe *ce_state,
+				     struct bmi_xfer *xfer)
 {
-	struct bmi_xfer *xfer;
+	void *ptr;
 	u32 ce_data;
 	unsigned int nbytes;
 	unsigned int transfer_id;
 	unsigned int flags;
 
-	if (ath10k_ce_completed_recv_next(ce_state, (void **)&xfer, &ce_data,
+	if (ath10k_ce_completed_recv_next(ce_state, (void **)&ptr, &ce_data,
 					  &nbytes, &transfer_id, &flags))
 		return;
 
+	if (xfer != ptr) {
+		ath10k_warn("failed to verify bmi xfer rx pointer (got %p expected %p)\n",
+			    ptr, xfer);
+		return;
+	}
+
 	if (!xfer->wait_for_resp) {
 		ath10k_warn("unexpected: BMI data received; ignoring\n");
 		return;
@@ -1435,8 +1449,8 @@ static int ath10k_pci_bmi_wait(struct ath10k_ce_pipe *tx_pipe,
 	unsigned long timeout = jiffies + BMI_COMMUNICATION_TIMEOUT_HZ;
 
 	while (time_before_eq(jiffies, timeout)) {
-		ath10k_pci_bmi_send_done(tx_pipe);
-		ath10k_pci_bmi_recv_data(rx_pipe);
+		ath10k_pci_bmi_send_done(tx_pipe, xfer);
+		ath10k_pci_bmi_recv_data(rx_pipe, xfer);
 
 		if (completion_done(&xfer->done))
 			return 0;
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
