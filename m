Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x232.google.com ([2a00:1450:4013:c00::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WijqS-0006zy-R3
 for ath10k@lists.infradead.org; Fri, 09 May 2014 12:24:09 +0000
Received: by mail-ee0-f50.google.com with SMTP id e51so2679316eek.9
 for <ath10k@lists.infradead.org>; Fri, 09 May 2014 05:23:45 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 4/5] ath10k: protect wep tx key setup
Date: Fri,  9 May 2014 14:15:48 +0200
Message-Id: <1399637749-13489-5-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1399637749-13489-1-git-send-email-michal.kazior@tieto.com>
References: <1399637749-13489-1-git-send-email-michal.kazior@tieto.com>
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

All configuration sequences should be protected
with conf_mutex to avoid concurrent/conflicting
requests.

This should make sure that wep tx key setup is not
performed while hw is restarted (at least).

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 40ce1e9..78b427d 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -1888,8 +1888,10 @@ static void ath10k_tx_wep_key_work(struct work_struct *work)
 						wep_key_work);
 	int ret, keyidx = arvif->def_wep_key_newidx;
 
+	mutex_lock(&arvif->ar->conf_mutex);
+
 	if (arvif->def_wep_key_idx == keyidx)
-		return;
+		goto unlock;
 
 	ath10k_dbg(ATH10K_DBG_MAC, "mac vdev %d set keyidx %d\n",
 		   arvif->vdev_id, keyidx);
@@ -1902,10 +1904,12 @@ static void ath10k_tx_wep_key_work(struct work_struct *work)
 		ath10k_warn("failed to update wep key index for vdev %d: %d\n",
 			    arvif->vdev_id,
 			    ret);
-		return;
+		goto unlock;
 	}
 
 	arvif->def_wep_key_idx = keyidx;
+unlock:
+	mutex_unlock(&arvif->ar->conf_mutex);
 }
 
 static void ath10k_tx_h_update_wep_key(struct sk_buff *skb)
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
