Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb06.tieto.com ([131.207.168.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRJ5j-0002V6-Ai
 for ath10k@lists.infradead.org; Wed, 02 Oct 2013 09:51:36 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: fix scheduling while atomic bug on config
Date: Wed, 2 Oct 2013 11:51:07 +0200
Message-ID: <1380707467-30387-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

Recent WMI/HTC changes introduces this bug because
now WMI commands can sleep.

Use appropriate interface iteration function.

Reported-By: Kalle Valo <kvalo@qca.qualcomm.com>
Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c |   15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 8684e03..b65df84 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -1935,9 +1935,8 @@ static void ath10k_config_ps(struct ath10k *ar)
 	memset(&ar_iter, 0, sizeof(struct ath10k_generic_iter));
 	ar_iter.ar = ar;
 
-	ieee80211_iterate_active_interfaces_atomic(
-		ar->hw, IEEE80211_IFACE_ITER_NORMAL,
-		ath10k_ps_iter, &ar_iter);
+	ieee80211_iterate_active_interfaces(ar->hw, IEEE80211_IFACE_ITER_NORMAL,
+					    ath10k_ps_iter, &ar_iter);
 
 	if (ar_iter.ret)
 		ath10k_warn("failed to set ps config (%d)\n", ar_iter.ret);
@@ -2840,9 +2839,8 @@ static int ath10k_set_rts_threshold(struct ieee80211_hw *hw, u32 value)
 	ar_iter.ar = ar;
 
 	mutex_lock(&ar->conf_mutex);
-	ieee80211_iterate_active_interfaces_atomic(
-		hw, IEEE80211_IFACE_ITER_NORMAL,
-		ath10k_set_rts_iter, &ar_iter);
+	ieee80211_iterate_active_interfaces(hw, IEEE80211_IFACE_ITER_NORMAL,
+					    ath10k_set_rts_iter, &ar_iter);
 	mutex_unlock(&ar->conf_mutex);
 
 	return ar_iter.ret;
@@ -2881,9 +2879,8 @@ static int ath10k_set_frag_threshold(struct ieee80211_hw *hw, u32 value)
 	ar_iter.ar = ar;
 
 	mutex_lock(&ar->conf_mutex);
-	ieee80211_iterate_active_interfaces_atomic(
-		hw, IEEE80211_IFACE_ITER_NORMAL,
-		ath10k_set_frag_iter, &ar_iter);
+	ieee80211_iterate_active_interfaces(hw, IEEE80211_IFACE_ITER_NORMAL,
+					    ath10k_set_frag_iter, &ar_iter);
 	mutex_unlock(&ar->conf_mutex);
 
 	return ar_iter.ret;
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
