Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh07.mail.saunalahti.fi ([62.142.5.117])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDt2v-0000MZ-O2
 for ath10k@lists.infradead.org; Thu, 13 Feb 2014 09:57:30 +0000
Subject: [PATCH 3/3] ath10k: release conf_mutex if vdev_start() fails
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Thu, 13 Feb 2014 11:57:05 +0200
Message-ID: <20140213095704.13999.57028.stgit@potku.adurom.net>
In-Reply-To: <20140213095652.13999.63855.stgit@potku.adurom.net>
References: <20140213095652.13999.63855.stgit@potku.adurom.net>
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

I modified Michal's commit c930f744bdb0 ("ath10k: implement channel switching") to return
when vdev_start() fails, but forgot to release conf_mutex.

Found by coccinelle:

>> drivers/net/wireless/ath/ath10k/mac.c:2745:5-11: preceding lock on line 2663

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index a57dc20..5d3c758 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -2770,7 +2770,7 @@ static void ath10k_bss_info_changed(struct ieee80211_hw *hw,
 				if (ret) {
 					ath10k_warn("failed to start vdev: %d\n",
 						    ret);
-					return;
+					goto exit;
 				}
 
 				arvif->is_started = true;
@@ -2851,6 +2851,7 @@ static void ath10k_bss_info_changed(struct ieee80211_hw *hw,
 			ath10k_bss_assoc(hw, vif, info);
 	}
 
+exit:
 	mutex_unlock(&ar->conf_mutex);
 }
 


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
