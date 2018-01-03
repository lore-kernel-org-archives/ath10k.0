Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eWXH8-0005ox-Qg
 for ath10k@lists.infradead.org; Wed, 03 Jan 2018 00:51:24 +0000
From: greearb@candelatech.com
Subject: [PATCH] ath10k:  Support use of channel 173
Date: Tue,  2 Jan 2018 16:51:01 -0800
Message-Id: <1514940661-13590-1-git-send-email-greearb@candelatech.com>
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

The India regulatory domain allows CH 173, so add that to the
available channel list.  I verified basic connectivity between
a 9880 and 9984 NIC.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---
 drivers/net/wireless/ath/ath10k/core.h | 3 ++-
 drivers/net/wireless/ath/ath10k/mac.c  | 3 +++
 drivers/net/wireless/ath/ath10k/wmi.c  | 2 +-
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index bcee3ec..cdcdff1 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -46,7 +46,8 @@
 #define WMI_READY_TIMEOUT (5 * HZ)
 #define ATH10K_FLUSH_TIMEOUT_HZ (5 * HZ)
 #define ATH10K_CONNECTION_LOSS_HZ (3 * HZ)
-#define ATH10K_NUM_CHANS 40
+#define ATH10K_NUM_CHANS 41
+#define ATH10K_MAX_5G_CHAN 173
 
 /* Antenna noise floor */
 #define ATH10K_DEFAULT_NOISE_FLOOR -95
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index c715ba1..3c03edf 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -8540,6 +8540,9 @@ static const struct ieee80211_channel ath10k_5ghz_channels[] = {
 	CHAN5G(161, 5805, 0),
 	CHAN5G(165, 5825, 0),
 	CHAN5G(169, 5845, 0),
+	CHAN5G(173, 5865, 0),
+	/* If you add more, you may need to change ATH10K_MAX_5G_CHAN */
+	/* And you will definitely need to change ATH10K_NUM_CHANS in core.h */
 };
 
 struct ath10k *ath10k_mac_create(size_t priv_size)
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index f29ce83..905af93 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -2398,7 +2398,7 @@ int ath10k_wmi_event_mgmt_rx(struct ath10k *ar, struct sk_buff *skb)
 	 */
 	if (channel >= 1 && channel <= 14) {
 		status->band = NL80211_BAND_2GHZ;
-	} else if (channel >= 36 && channel <= 169) {
+	} else if (channel >= 36 && channel <= ATH10K_MAX_5G_CHAN) {
 		status->band = NL80211_BAND_5GHZ;
 	} else {
 		/* Shouldn't happen unless list of advertised channels to
-- 
2.4.11


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
