Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb05.tieto.com ([131.207.168.36])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V4SCB-0007fM-GA
 for ath10k@lists.infradead.org; Wed, 31 Jul 2013 08:55:48 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 4/5] ath10k: zero arvif memory on add_interface()
Date: Wed, 31 Jul 2013 10:55:14 +0200
Message-ID: <1375260915-22500-5-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1375260915-22500-1-git-send-email-michal.kazior@tieto.com>
References: <1375260915-22500-1-git-send-email-michal.kazior@tieto.com>
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

The private memory area in vif provided by
mac80211 isn't guaranteed to be zeroed.

This patch should fix issues when switching
between STA and AP interface types.

The tim_bitmap could become polluted by STA bssid
field (since it's a union), wep_keys array
could also become polluted with invalid pointers
and probably much more.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 6a130c5..1aa5a39 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -1925,6 +1925,8 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 
 	mutex_lock(&ar->conf_mutex);
 
+	memset(arvif, 0, sizeof(*arvif));
+
 	arvif->ar = ar;
 	arvif->vif = vif;
 
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
