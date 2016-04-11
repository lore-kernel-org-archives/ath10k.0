Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from userp1040.oracle.com ([156.151.31.81])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1apWX2-00066e-3n
 for ath10k@lists.infradead.org; Mon, 11 Apr 2016 07:45:13 +0000
Date: Mon, 11 Apr 2016 10:44:38 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] ath10k: add some sanity checks
Message-ID: <20160411074438.GA15227@mwanda>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>, Michal Kazior <michal.kazior@tieto.com>
Cc: kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Smatch complains that since "ev->peer_id" comes from skb->data that
means we can't trust it and have to do a bounds check on it to prevent
an array overflow.

Fixes: 6942726f7f7b ('ath10k: add fast peer_map lookup')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/ath/ath10k/txrx.c b/drivers/net/wireless/ath/ath10k/txrx.c
index 9369411..fd6ba69 100644
--- a/drivers/net/wireless/ath/ath10k/txrx.c
+++ b/drivers/net/wireless/ath/ath10k/txrx.c
@@ -190,6 +190,9 @@ void ath10k_peer_map_event(struct ath10k_htt *htt,
 	struct ath10k *ar = htt->ar;
 	struct ath10k_peer *peer;
 
+	if (ev->peer_id >= ATH10K_MAX_NUM_PEER_IDS)
+		return;
+
 	spin_lock_bh(&ar->data_lock);
 	peer = ath10k_peer_find(ar, ev->vdev_id, ev->addr);
 	if (!peer) {
@@ -218,6 +221,9 @@ void ath10k_peer_unmap_event(struct ath10k_htt *htt,
 	struct ath10k *ar = htt->ar;
 	struct ath10k_peer *peer;
 
+	if (ev->peer_id >= ATH10K_MAX_NUM_PEER_IDS)
+		return;
+
 	spin_lock_bh(&ar->data_lock);
 	peer = ath10k_peer_find_by_id(ar, ev->peer_id);
 	if (!peer) {

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
