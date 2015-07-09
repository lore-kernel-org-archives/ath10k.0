Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x22f.google.com ([2a00:1450:4010:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZD9hb-0004H9-2w
 for ath10k@lists.infradead.org; Thu, 09 Jul 2015 11:09:16 +0000
Received: by lagx9 with SMTP id x9so243845315lag.1
 for <ath10k@lists.infradead.org>; Thu, 09 Jul 2015 04:08:51 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 4/6] ath10k: update vdev ps state on start
Date: Thu,  9 Jul 2015 13:08:37 +0200
Message-Id: <1436440119-30231-5-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1436440119-30231-1-git-send-email-michal.kazior@tieto.com>
References: <1436440119-30231-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

Psmode can be forcefully enabled when vdev isn't
started. It isn't guaranteed that mac80211 will
re-issue psmode setting after vdev is started
unless actual bss_conf.ps value has changed.

Even if this doesn't fix any problems now it may
prevent future breakage.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index a060b7708f4a..e25e6a8f44a5 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -6222,6 +6222,13 @@ ath10k_mac_op_assign_vif_chanctx(struct ieee80211_hw *hw,
 
 	arvif->is_started = true;
 
+	ret = ath10k_mac_vif_setup_ps(arvif);
+	if (ret) {
+		ath10k_warn(ar, "failed to update vdev %i ps: %d\n",
+			    arvif->vdev_id, ret);
+		goto err_stop;
+	}
+
 	if (vif->type == NL80211_IFTYPE_MONITOR) {
 		ret = ath10k_wmi_vdev_up(ar, arvif->vdev_id, 0, vif->addr);
 		if (ret) {
@@ -6239,6 +6246,7 @@ ath10k_mac_op_assign_vif_chanctx(struct ieee80211_hw *hw,
 err_stop:
 	ath10k_vdev_stop(arvif);
 	arvif->is_started = false;
+	ath10k_mac_vif_setup_ps(arvif);
 
 err:
 	mutex_unlock(&ar->conf_mutex);
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
