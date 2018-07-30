Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fkDLl-0006tp-LV
 for ath10k@lists.infradead.org; Mon, 30 Jul 2018 18:56:58 +0000
Subject: [PATCH] ath10k: fix parenthesis alignment
From: Kalle Valo <kvalo@codeaurora.org>
Date: Mon, 30 Jul 2018 21:56:43 +0300
Message-ID: <153297700266.4874.12439168003972242663.stgit@potku.adurom.net>
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

These were recently introduced and found by checkpatch:

drivers/net/wireless/ath/ath10k/mac.c:6118: Alignment should match open parenthesis
drivers/net/wireless/ath/ath10k/mac.c:6121: Alignment should match open parenthesis
drivers/net/wireless/ath/ath10k/mac.c:6124: Alignment should match open parenthesis

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/mac.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index f068e2b9eacc..b6830fa16e99 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -6107,13 +6107,13 @@ static void ath10k_sta_rc_update_wk(struct work_struct *wk)
 
 		mode = chan_to_phymode(&def);
 		ath10k_dbg(ar, ATH10K_DBG_MAC, "mac update sta %pM peer bw %d phymode %d\n",
-				sta->addr, bw, mode);
+			   sta->addr, bw, mode);
 
 		err = ath10k_wmi_peer_set_param(ar, arvif->vdev_id, sta->addr,
-				WMI_PEER_PHYMODE, mode);
+						WMI_PEER_PHYMODE, mode);
 		if (err) {
 			ath10k_warn(ar, "failed to update STA %pM peer phymode %d: %d\n",
-					sta->addr, mode, err);
+				    sta->addr, mode, err);
 			goto exit;
 		}
 


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
