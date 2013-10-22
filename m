Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VYjui-0006OM-KM
 for ath10k@lists.infradead.org; Tue, 22 Oct 2013 21:54:57 +0000
From: greearb@candelatech.com
Subject: [PATCH] ath10k:  Initialize list-head on vif creation.
Date: Tue, 22 Oct 2013 14:54:14 -0700
Message-Id: <1382478854-5233-1-git-send-email-greearb@candelatech.com>
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
Cc: kvalo@qca.qualcomm.com, Ben Greear <greearb@candelatech.com>

From: Ben Greear <greearb@candelatech.com>

If the creation fails, this keeps us from crashing later when
trying to do a list_del(arvif->list).

Signed-off-by: Ben Greear <greearb@candelatech.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index da23c3f..908e90d 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -2064,6 +2064,7 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 	arvif->vif = vif;
 
 	INIT_WORK(&arvif->wep_key_work, ath10k_tx_wep_key_work);
+	INIT_LIST_HEAD(&arvif->list);
 
 	if ((vif->type == NL80211_IFTYPE_MONITOR) && ar->monitor_present) {
 		ath10k_warn("Only one monitor interface allowed\n");
-- 
1.7.11.7


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
