Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x22e.google.com ([2a00:1450:400c:c00::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YDC9X-0001zD-IY
 for ath10k@lists.infradead.org; Mon, 19 Jan 2015 13:14:02 +0000
Received: by mail-wg0-f46.google.com with SMTP id x13so31669568wgg.5
 for <ath10k@lists.infradead.org>; Mon, 19 Jan 2015 05:13:34 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: fix nullfunc workaround
Date: Mon, 19 Jan 2015 14:12:57 +0100
Message-Id: <1421673177-2245-1-git-send-email-michal.kazior@tieto.com>
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

The workaround couldn't work correctly because the
802.11 header wasn't properly stripped of QoS Data
bit so it wasn't recognized in the later parts of
tx path as NullFunc frame and ended up in HTT Tx
instead of HTT Mgmt Tx.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 9524bc5..82c567d 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -2145,6 +2145,7 @@ static void ath10k_tx_h_nwifi(struct ieee80211_hw *hw, struct sk_buff *skb)
 	 * used only for CQM purposes (e.g. hostapd station keepalive ping) so
 	 * it is safe to downgrade to NullFunc.
 	 */
+	hdr = (void *)skb->data;
 	if (ieee80211_is_qos_nullfunc(hdr->frame_control)) {
 		hdr->frame_control &= ~__cpu_to_le16(IEEE80211_STYPE_QOS_DATA);
 		cb->htt.tid = HTT_DATA_TX_EXT_TID_NON_QOS_MCAST_BCAST;
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
