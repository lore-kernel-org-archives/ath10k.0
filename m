Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dtfQy-0008Jk-18
 for ath10k@lists.infradead.org; Sun, 17 Sep 2017 19:41:00 +0000
Received: by mail-lf0-x241.google.com with SMTP id c8so3538451lfe.2
 for <ath10k@lists.infradead.org>; Sun, 17 Sep 2017 12:40:35 -0700 (PDT)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [RFC v3 11/11] ath10k: remove htt pending TX count for high latency
Date: Sun, 17 Sep 2017 21:40:13 +0200
Message-Id: <20170917194013.8658-12-erik.stromdahl@gmail.com>
In-Reply-To: <20170917194013.8658-1-erik.stromdahl@gmail.com>
References: <20170917194013.8658-1-erik.stromdahl@gmail.com>
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
To: kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Cc: Erik Stromdahl <erik.stromdahl@gmail.com>

High latency chipsest does not seem to send any
HTT_T2H_MSG_TYPE_TX_COMPL_IND for outgoing frames.

This means that htt->num_pending_tx will never be
decremented and we will eventually hit the maximum
limit. All outgoing packets will then be discarded.

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
---
 drivers/net/wireless/ath/ath10k/htt_tx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index 82d01139ff92..c74fc137ac67 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -153,6 +153,9 @@ void ath10k_htt_tx_txq_update(struct ieee80211_hw *hw,
 
 void ath10k_htt_tx_dec_pending(struct ath10k_htt *htt)
 {
+	if (htt->ar->is_high_latency)
+		return;
+
 	lockdep_assert_held(&htt->tx_lock);
 
 	htt->num_pending_tx--;
@@ -162,6 +165,9 @@ void ath10k_htt_tx_dec_pending(struct ath10k_htt *htt)
 
 int ath10k_htt_tx_inc_pending(struct ath10k_htt *htt)
 {
+	if (htt->ar->is_high_latency)
+		return 0;
+
 	lockdep_assert_held(&htt->tx_lock);
 
 	if (htt->num_pending_tx >= htt->max_num_pending_tx)
-- 
2.14.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
