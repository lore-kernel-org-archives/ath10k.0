Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s72.web-hosting.com ([198.187.29.22])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xt9Pt-00014M-C7
 for ath10k@lists.infradead.org; Tue, 25 Nov 2014 06:16:01 +0000
From: Sujith Manoharan <sujith@msujith.org>
Subject: [PATCH v2 3/3] ath10k: Fix bug reported by lockdep
Date: Tue, 25 Nov 2014 11:47:00 +0530
Message-Id: <1416896220-29691-3-git-send-email-sujith@msujith.org>
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

ath10k_tx_wep_key_work() acquires conf_mutex, so
cancelling it when conf_mutex is already taken
in ath10k_remove_interface() is incorrect, so
move it outside the lock.

Snippet from the lockdep report:

kernel: ======================================================
kernel: [ INFO: possible circular locking dependency detected ]
kernel: 3.18.0-rc5-wl-debug #34 Tainted: G           O
kernel: -------------------------------------------------------
kernel: hostapd/451 is trying to acquire lock:
kernel:  ((&arvif->wep_key_work)){+.+...}, at: [<ffffffff810872d5>] flush_work+0x5/0x290
kernel: but task is already holding lock:
kernel:  (&ar->conf_mutex){+.+.+.}, at: [<ffffffffa0b99f00>] ath10k_remove_interface+0x40/0x290 [ath10k_core]
kernel: which lock already depends on the new lock.

Signed-off-by: Sujith Manoharan <c_manoha@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 01de6f3..cf1e579 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3043,10 +3043,10 @@ static void ath10k_remove_interface(struct ieee80211_hw *hw,
 	struct ath10k_vif *arvif = ath10k_vif_to_arvif(vif);
 	int ret;
 
-	mutex_lock(&ar->conf_mutex);
-
 	cancel_work_sync(&arvif->wep_key_work);
 
+	mutex_lock(&ar->conf_mutex);
+
 	spin_lock_bh(&ar->data_lock);
 	ath10k_mac_vif_beacon_cleanup(arvif);
 	spin_unlock_bh(&ar->data_lock);
-- 
2.1.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
