Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from static.88-198-24-112.clients.your-server.de ([88.198.24.112]
 helo=nbd.name)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xgz3o-00046b-79
 for ath10k@lists.infradead.org; Wed, 22 Oct 2014 16:46:57 +0000
From: Felix Fietkau <nbd@openwrt.org>
Subject: [PATCH] ath10k: add SURVEY_INFO_IN_USE for current channel on survey
Date: Wed, 22 Oct 2014 18:46:02 +0200
Message-Id: <1413996362-44397-1-git-send-email-nbd@openwrt.org>
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
To: linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org

Signed-off-by: Felix Fietkau <nbd@openwrt.org>
---
 drivers/net/wireless/ath/ath10k/mac.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 4670930..bc440dc 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3975,6 +3975,9 @@ static int ath10k_get_survey(struct ieee80211_hw *hw, int idx,
 
 	survey->channel = &sband->channels[idx];
 
+	if (ar->rx_channel == survey->channel)
+		survey->filled |= SURVEY_INFO_IN_USE;
+
 exit:
 	mutex_unlock(&ar->conf_mutex);
 	return ret;
-- 
2.0.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
