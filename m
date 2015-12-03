Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4Y4f-0006ZC-9D
 for ath10k@lists.infradead.org; Thu, 03 Dec 2015 17:53:45 +0000
From: Peter Oh <poh@qca.qualcomm.com>
Subject: [PATCH] ath10k: allow Mesh Point to install peer security key
Date: Thu, 3 Dec 2015 09:50:55 -0800
Message-ID: <1449165055-27782-1-git-send-email-poh@qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org

Mesh Point requires peer security key install when running
in secured mode since it's a type of peer links, otherwise peer
link will be removed due to key install failure.

MFP feature set is required to run Mesh in secured mode and
QCA988X firmware, 10.2.4.70.14-2 and above, is the only one
supporting secured Mesh at this moment.

Signed-off-by: Peter Oh <poh@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index bcb364d..b4bdeb0 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -250,7 +250,8 @@ static int ath10k_install_peer_wep_keys(struct ath10k_vif *arvif,
 	lockdep_assert_held(&ar->conf_mutex);
 
 	if (WARN_ON(arvif->vif->type != NL80211_IFTYPE_AP &&
-		    arvif->vif->type != NL80211_IFTYPE_ADHOC))
+		    arvif->vif->type != NL80211_IFTYPE_ADHOC &&
+		    arvif->vif->type != NL80211_IFTYPE_MESH_POINT))
 		return -EINVAL;
 
 	spin_lock_bh(&ar->data_lock);
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
