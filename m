Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s72.web-hosting.com ([198.187.29.22])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XsjVl-00057k-NE
 for ath10k@lists.infradead.org; Mon, 24 Nov 2014 02:36:22 +0000
From: Sujith Manoharan <sujith@msujith.org>
Subject: [PATCH 2/3] ath10k: Fix locking for WEP keys
Date: Mon, 24 Nov 2014 08:07:36 +0530
Message-Id: <1416796657-24657-3-git-send-email-sujith@msujith.org>
In-Reply-To: <1416796657-24657-1-git-send-email-sujith@msujith.org>
References: <1416796657-24657-1-git-send-email-sujith@msujith.org>
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
 drivers/net/wireless/ath/ath10k/mac.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 23116c2..2200c64 100644
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
