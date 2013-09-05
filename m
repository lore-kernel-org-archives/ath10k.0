Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx1.redhat.com ([209.132.183.28])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VHQc1-0006Zo-Aa
 for ath10k@lists.infradead.org; Thu, 05 Sep 2013 03:52:06 +0000
Date: Wed, 4 Sep 2013 23:51:28 -0400
From: Dave Jones <davej@redhat.com>
Subject: [PATCH] Add missing braces to ath10k_pci_tx_pipe_cleanup
Message-ID: <20130905035128.GA15824@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
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
To: netdev@vger.kernel.org
Cc: kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, linville@tuxdriver.com, ath10k@lists.infradead.org

The indentation here implies this was meant to be a multi-statement if, but it lacks the braces.

Signed-off-by: Dave Jones <davej@fedoraproject.org>

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 33af467..31b69d3 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1200,7 +1200,7 @@ static void ath10k_pci_tx_pipe_cleanup(struct hif_ce_pipe_info *pipe_info)
 
 	while (ath10k_ce_cancel_send_next(ce_hdl, (void **)&netbuf,
 					  &ce_data, &nbytes, &id) == 0) {
-		if (netbuf != CE_SENDLIST_ITEM_CTXT)
+		if (netbuf != CE_SENDLIST_ITEM_CTXT) {
 			/*
 			 * Indicate the completion to higer layer to free
 			 * the buffer
@@ -1209,6 +1209,7 @@ static void ath10k_pci_tx_pipe_cleanup(struct hif_ce_pipe_info *pipe_info)
 			ar_pci->msg_callbacks_current.tx_completion(ar,
 								    netbuf,
 								    id);
+		}
 	}
 }
 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
