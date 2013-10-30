Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ea0-x236.google.com ([2a00:1450:4013:c01::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VbUDT-0000DL-Bf
 for ath10k@lists.infradead.org; Wed, 30 Oct 2013 11:45:43 +0000
Received: by mail-ea0-f182.google.com with SMTP id o10so588336eaj.27
 for <ath10k@lists.infradead.org>; Wed, 30 Oct 2013 04:45:19 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH/RFT 10/12] ath10k: guard against CE corruption from firmware
Date: Wed, 30 Oct 2013 12:42:24 +0100
Message-Id: <1383133346-8135-11-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1383133346-8135-1-git-send-email-michal.kazior@tieto.com>
References: <1383133346-8135-1-git-send-email-michal.kazior@tieto.com>
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

In case firmware crashes it may report CE
completions for entries that were never
submitted/filled with meaningful data. This in
turn led to NULL dereferences.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htc.c | 5 +++++
 drivers/net/wireless/ath/ath10k/pci.c | 7 +++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
index 3118d75..c59f5b4 100644
--- a/drivers/net/wireless/ath/ath10k/htc.c
+++ b/drivers/net/wireless/ath/ath10k/htc.c
@@ -191,6 +191,11 @@ static int ath10k_htc_tx_completion_handler(struct ath10k *ar,
 	struct ath10k_htc *htc = &ar->htc;
 	struct ath10k_htc_ep *ep = &htc->endpoint[eid];
 
+	if (!skb) {
+		ath10k_warn("invalid sk_buff completion - NULL pointer. firmware crashed?");
+		return 0;
+	}
+
 	ath10k_htc_notify_tx_completion(ep, skb);
 	/* the skb now belongs to the completion handler */
 
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 63ad250..43cdc35 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1270,6 +1270,13 @@ static void ath10k_pci_tx_pipe_cleanup(struct ath10k_pci_pipe *pipe_info)
 		 * Indicate the completion to higer layer to free
 		 * the buffer
 		 */
+
+		if (!netbuf) {
+			ath10k_warn("invalid sk_buff on CE %d - NULL pointer. firmware crashed?",
+				    ce_hdl->id);
+			continue;
+		}
+
 		ATH10K_SKB_CB(netbuf)->is_aborted = true;
 		ar_pci->msg_callbacks_current.tx_completion(ar,
 							    netbuf,
-- 
1.8.4.rc3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
