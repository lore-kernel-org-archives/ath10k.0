Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s72.web-hosting.com ([198.187.29.22])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xt9Ps-0000lQ-K4
 for ath10k@lists.infradead.org; Tue, 25 Nov 2014 06:16:04 +0000
From: Sujith Manoharan <sujith@msujith.org>
Subject: [PATCH v2 2/3] ath10k: Fix locking for WEP keys
Date: Tue, 25 Nov 2014 11:46:59 +0530
Message-Id: <1416896220-29691-2-git-send-email-sujith@msujith.org>
In-Reply-To: <1416896220-29691-1-git-send-email-sujith@msujith.org>
References: <1416896220-29691-1-git-send-email-sujith@msujith.org>
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
Cc: linux-wireless@vger.kernel.org

From: Sujith Manoharan <c_manoha@qca.qualcomm.com>

peer->keys needs to be protected by data_lock
since it is also accessed from the WMI path.

Both install() and clear() routines for peer
keys modify the key contents, so use the data_lock
to avoid races.

Signed-off-by: Sujith Manoharan <c_manoha@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.h | 2 ++
 drivers/net/wireless/ath/ath10k/mac.c  | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 8f86bd3..73da1bb 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -218,6 +218,8 @@ struct ath10k_peer {
 	int vdev_id;
 	u8 addr[ETH_ALEN];
 	DECLARE_BITMAP(peer_ids, ATH10K_MAX_NUM_PEER_IDS);
+
+	/* protected by ar->data_lock */
 	struct ieee80211_key_conf *keys[WMI_MAX_KEY_INDEX + 1];
 };
 
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index fb95d4d..01de6f3 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -136,7 +136,9 @@ static int ath10k_install_peer_wep_keys(struct ath10k_vif *arvif,
 		if (ret)
 			return ret;
 
+		spin_lock_bh(&ar->data_lock);
 		peer->keys[i] = arvif->wep_keys[i];
+		spin_unlock_bh(&ar->data_lock);
 	}
 
 	return 0;
@@ -173,7 +175,9 @@ static int ath10k_clear_peer_keys(struct ath10k_vif *arvif,
 			ath10k_warn(ar, "failed to remove peer wep key %d: %d\n",
 				    i, ret);
 
+		spin_lock_bh(&ar->data_lock);
 		peer->keys[i] = NULL;
+		spin_unlock_bh(&ar->data_lock);
 	}
 
 	return first_errno;
-- 
2.1.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
