Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x231.google.com ([2a00:1450:4010:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMBrL-0004WM-CK
 for ath10k@lists.infradead.org; Mon, 03 Aug 2015 09:16:43 +0000
Received: by labsr2 with SMTP id sr2so7013961lab.2
 for <ath10k@lists.infradead.org>; Mon, 03 Aug 2015 02:16:13 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 2/2] ath10k: reject 11b tx fragmentation configuration
Date: Mon,  3 Aug 2015 11:16:43 +0200
Message-Id: <1438593403-316-2-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1438593403-316-1-git-send-email-michal.kazior@tieto.com>
References: <1438593403-316-1-git-send-email-michal.kazior@tieto.com>
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

Even though there's a WMI enum for fragmentation
threshold no known firmware actually implements
it. Moreover it is not possible to rely frame
fragmentation to mac80211 because firmware clears
the "more fragments" bit in frame control making
it impossible for remote devices to reassemble
frames.

Hence implement a dummy callback just to say
fragmentation isn't supported. This effectively
prevents mac80211 from doing frame fragmentation
in software.

This fixes Tx becoming broken after setting
fragmentation threshold.

Fixes: 1010ba4c5d1c ("ath10k: unregister and remove frag_threshold callback")
Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---

Notes:
    This somewhat depends on:
      http://thread.gmane.org/gmane.linux.kernel.wireless.general/140549
    
    Without the above user will not know that the callback failed.

 drivers/net/wireless/ath/ath10k/mac.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 879af9c3bd4a..e0bbb6c543c7 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -5563,6 +5563,21 @@ static int ath10k_set_rts_threshold(struct ieee80211_hw *hw, u32 value)
 	return ret;
 }
 
+static int ath10k_mac_op_set_frag_threshold(struct ieee80211_hw *hw, u32 value)
+{
+	/* Even though there's a WMI enum for fragmentation threshold no known
+	 * firmware actually implements it. Moreover it is not possible to rely
+	 * frame fragmentation to mac80211 because firmware clears the "more
+	 * fragments" bit in frame control making it impossible for remote
+	 * devices to reassemble frames.
+	 *
+	 * Hence implement a dummy callback just to say fragmentation isn't
+	 * supported. This effectively prevents mac80211 from doing frame
+	 * fragmentation in software.
+	 */
+	return -EOPNOTSUPP;
+}
+
 static void ath10k_flush(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 			 u32 queues, bool drop)
 {
@@ -6405,6 +6420,7 @@ static const struct ieee80211_ops ath10k_ops = {
 	.remain_on_channel		= ath10k_remain_on_channel,
 	.cancel_remain_on_channel	= ath10k_cancel_remain_on_channel,
 	.set_rts_threshold		= ath10k_set_rts_threshold,
+	.set_frag_threshold		= ath10k_mac_op_set_frag_threshold,
 	.flush				= ath10k_flush,
 	.tx_last_beacon			= ath10k_tx_last_beacon,
 	.set_antenna			= ath10k_set_antenna,
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
