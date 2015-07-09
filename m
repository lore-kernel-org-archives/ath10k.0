Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x231.google.com ([2a00:1450:4010:c04::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZD9hb-0004G7-2k
 for ath10k@lists.infradead.org; Thu, 09 Jul 2015 11:09:16 +0000
Received: by lbnk3 with SMTP id k3so72934530lbn.1
 for <ath10k@lists.infradead.org>; Thu, 09 Jul 2015 04:08:49 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 2/6] ath10k: limit multi-vif ps more aggresivelly
Date: Thu,  9 Jul 2015 13:08:35 +0200
Message-Id: <1436440119-30231-3-git-send-email-michal.kazior@tieto.com>
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

Further testing proved that multi-channel AP+STA
on QCA6174 with RM.2.0-00088 should have powersave
force-disabled to avoid beacon misses/skipping on
either side which in turn could disrupt
communication.

Since AP never has arvif->ps don't even bother
checking it. Other combinations may be broken as
well so disallow powersave with multivif outright
unless firmware advertises otherwise.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 63c59593494e..115889cb0ff6 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -1668,7 +1668,7 @@ static int ath10k_mac_vif_recalc_ps_poll_count(struct ath10k_vif *arvif)
 	return 0;
 }
 
-static int ath10k_mac_ps_vif_count(struct ath10k *ar)
+static int ath10k_mac_num_vifs_started(struct ath10k *ar)
 {
 	struct ath10k_vif *arvif;
 	int num = 0;
@@ -1676,7 +1676,7 @@ static int ath10k_mac_ps_vif_count(struct ath10k *ar)
 	lockdep_assert_held(&ar->conf_mutex);
 
 	list_for_each_entry(arvif, &ar->arvifs, list)
-		if (arvif->ps)
+		if (arvif->is_started)
 			num++;
 
 	return num;
@@ -1700,7 +1700,7 @@ static int ath10k_mac_vif_setup_ps(struct ath10k_vif *arvif)
 
 	enable_ps = arvif->ps;
 
-	if (enable_ps && ath10k_mac_ps_vif_count(ar) > 1 &&
+	if (enable_ps && ath10k_mac_num_vifs_started(ar) > 1 &&
 	    !test_bit(ATH10K_FW_FEATURE_MULTI_VIF_PS_SUPPORT,
 		      ar->fw_features)) {
 		ath10k_warn(ar, "refusing to enable ps on vdev %i: not supported by fw\n",
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
