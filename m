Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iU562-0005xh-S9
 for ath10k@lists.infradead.org; Mon, 11 Nov 2019 08:30:52 +0000
Received: by mail-wr1-x442.google.com with SMTP id e6so13643401wrw.1
 for <ath10k@lists.infradead.org>; Mon, 11 Nov 2019 00:30:48 -0800 (PST)
From: Eduardo Abinader <eduardoabinader@gmail.com>
Subject: [PATCH] ath10k:mac: disassoc dbg msg after return check
Date: Mon, 11 Nov 2019 09:30:40 +0100
Message-Id: <20191111083040.16824-1-eduardoabinader@gmail.com>
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
To: linux-wireless@vger.kernel.org
Cc: Eduardo Abinader <eduardoabinader@gmail.com>, ath10k@lists.infradead.org, kvalo@codeaurora.org

Signed-off-by: Eduardo Abinader <eduardoabinader@gmail.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 5e3450cfb07b..038d5c27bed7 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -6786,13 +6786,13 @@ static int ath10k_sta_state(struct ieee80211_hw *hw,
 		/*
 		 * Disassociation.
 		 */
-		ath10k_dbg(ar, ATH10K_DBG_MAC, "mac sta %pM disassociated\n",
-			   sta->addr);
-
 		ret = ath10k_station_disassoc(ar, vif, sta);
 		if (ret)
 			ath10k_warn(ar, "failed to disassociate station: %pM vdev %i: %i\n",
 				    sta->addr, arvif->vdev_id, ret);
+		else
+			ath10k_dbg(ar, ATH10K_DBG_MAC, "mac sta %pM disassociated\n",
+			   sta->addr);
 	}
 exit:
 	mutex_unlock(&ar->conf_mutex);
-- 
2.20.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
