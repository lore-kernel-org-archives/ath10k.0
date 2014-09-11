Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh01.mail.saunalahti.fi ([62.142.5.107])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XSB2C-0003it-Jy
 for ath10k@lists.infradead.org; Thu, 11 Sep 2014 20:32:05 +0000
Received: from potku.adurom.net (a91-155-131-35.elisa-laajakaista.fi
 [91.155.131.35])
 by emh01.mail.saunalahti.fi (Postfix) with ESMTP id 0B33490056
 for <ath10k@lists.infradead.org>; Thu, 11 Sep 2014 23:31:41 +0300 (EEST)
Subject: [RFC PATCH 1/3] ath10k: ignore diagnose pipes in
 ath10k_pci_ce_recv_data()/_send_done()
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Thu, 11 Sep 2014 23:31:41 +0300
Message-ID: <20140911203141.12514.23469.stgit@potku.adurom.net>
In-Reply-To: <20140911202926.12514.79908.stgit@potku.adurom.net>
References: <20140911202926.12514.79908.stgit@potku.adurom.net>
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

As ath10k_pci_diag_read_mem() uses polling to receive data from CE, the CE callbacks
have to ignore the pipe used for diagnose reads. Otherwise ath10k crashes due
to NULL dereference and polling reads timeout.

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/pci.c |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index baeb98e78b1f..154451ab3e3c 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -819,6 +819,9 @@ static void ath10k_pci_ce_send_done(struct ath10k_ce_pipe *ce_state)
 	unsigned int nbytes;
 	unsigned int transfer_id;
 
+	if (ce_state->id == 7)
+		return;
+
 	while (ath10k_ce_completed_send_next(ce_state, &transfer_context,
 					     &ce_data, &nbytes,
 					     &transfer_id) == 0) {
@@ -844,6 +847,9 @@ static void ath10k_pci_ce_recv_data(struct ath10k_ce_pipe *ce_state)
 	unsigned int transfer_id;
 	unsigned int flags;
 
+	if (ce_state->id == 7)
+		return;
+
 	while (ath10k_ce_completed_recv_next(ce_state, &transfer_context,
 					     &ce_data, &nbytes, &transfer_id,
 					     &flags) == 0) {


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
