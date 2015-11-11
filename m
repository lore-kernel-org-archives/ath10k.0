Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwU6L-0004mk-Pb
 for ath10k@lists.infradead.org; Wed, 11 Nov 2015 12:02:10 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH] ath10k: poll HTT send completion when CE 5 is unused
Date: Wed, 11 Nov 2015 17:31:26 +0530
Message-ID: <1447243286-22116-1-git-send-email-rmanohar@qti.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

commit a70587b3389a ("ath10k: configure copy engine 5 for HTT messages")
moved send completion polling under HTT Rx (CE 5) service routine. For
QCA6174 based devices copy engine 1 (CE 1) is used for HTT Rx instead
of CE 5. So send completion never be called. This is causing "failed to
transmit packet, dropping: -105" errors. Fix this by processing send
completion from CE 1 service routine instead of CE 5.

Tested-by: Ryan Hsu <ryanhsu@qca.qualcomm.com>
Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 5c91a67..698e669 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -112,6 +112,7 @@ static void ath10k_pci_htc_rx_cb(struct ath10k_ce_pipe *ce_state);
 static void ath10k_pci_htt_tx_cb(struct ath10k_ce_pipe *ce_state);
 static void ath10k_pci_htt_rx_cb(struct ath10k_ce_pipe *ce_state);
 static void ath10k_pci_pktlog_rx_cb(struct ath10k_ce_pipe *ce_state);
+static void ath10k_pci_htt_htc_rx_cb(struct ath10k_ce_pipe *ce_state);
 
 static const struct ce_attr host_ce_config_wlan[] = {
 	/* CE0: host->target HTC control and raw streams */
@@ -129,7 +130,7 @@ static const struct ce_attr host_ce_config_wlan[] = {
 		.src_nentries = 0,
 		.src_sz_max = 2048,
 		.dest_nentries = 512,
-		.recv_cb = ath10k_pci_htc_rx_cb,
+		.recv_cb = ath10k_pci_htt_htc_rx_cb,
 	},
 
 	/* CE2: target->host WMI */
@@ -1210,6 +1211,16 @@ static void ath10k_pci_htc_rx_cb(struct ath10k_ce_pipe *ce_state)
 	ath10k_pci_process_rx_cb(ce_state, ath10k_htc_rx_completion_handler);
 }
 
+static void ath10k_pci_htt_htc_rx_cb(struct ath10k_ce_pipe *ce_state)
+{
+	/* CE4 polling needs to be done whenever CE pipe which transports
+	 * HTT Rx (target->host) is processed.
+	 */
+	ath10k_ce_per_engine_service(ce_state->ar, 4);
+
+	ath10k_pci_process_rx_cb(ce_state, ath10k_htc_rx_completion_handler);
+}
+
 /* Called by lower (CE) layer when data is received from the Target.
  * Only 10.4 firmware uses separate CE to transfer pktlog data.
  */
-- 
2.6.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
