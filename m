Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XWCbC-0007Fb-Vz
 for ath10k@lists.infradead.org; Mon, 22 Sep 2014 23:00:51 +0000
From: greearb@candelatech.com
Subject: [PATCH] ath10k:  use configured nss instead of max nss.
Date: Mon, 22 Sep 2014 16:00:20 -0700
Message-Id: <1411426820-4047-1-git-send-email-greearb@candelatech.com>
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
Cc: Ben Greear <greearb@candelatech.com>, ath10k@lists.infradead.org

From: Ben Greear <greearb@candelatech.com>

When re-associating a station, the nss was set back to
maximum value even if user had configured small number
of tx chains.  So, pay attention to user's config in
this case as well.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 855c71c..c5d31cc 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4086,6 +4086,10 @@ ath10k_default_bitrate_mask(struct ath10k *ar,
 	u32 legacy = 0x00ff;
 	u8 ht = 0xff, i;
 	u16 vht = 0x3ff;
+	u16 nrf = ar->num_rf_chains;
+
+	if (ar->cfg_tx_chainmask)
+		nrf = get_nss_from_chainmask(ar->cfg_tx_chainmask);
 
 	switch (band) {
 	case IEEE80211_BAND_2GHZ:
@@ -4101,11 +4105,11 @@ ath10k_default_bitrate_mask(struct ath10k *ar,
 	if (mask->control[band].legacy != legacy)
 		return false;
 
-	for (i = 0; i < ar->num_rf_chains; i++)
+	for (i = 0; i < nrf; i++)
 		if (mask->control[band].ht_mcs[i] != ht)
 			return false;
 
-	for (i = 0; i < ar->num_rf_chains; i++)
+	for (i = 0; i < nrf; i++)
 		if (mask->control[band].vht_mcs[i] != vht)
 			return false;
 
@@ -4356,6 +4360,9 @@ static int ath10k_set_bitrate_mask(struct ieee80211_hw *hw,
 	u8 fixed_nss = ar->num_rf_chains;
 	u8 force_sgi;
 
+	if (ar->cfg_tx_chainmask)
+		fixed_nss = get_nss_from_chainmask(ar->cfg_tx_chainmask);
+
 	force_sgi = mask->control[band].gi;
 	if (force_sgi == NL80211_TXRATE_FORCE_LGI)
 		return -EINVAL;
-- 
1.7.11.7


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
