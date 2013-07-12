Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x235.google.com ([2a00:1450:4013:c00::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UxaZT-0006G3-Ul
 for ath10k@lists.infradead.org; Fri, 12 Jul 2013 10:27:28 +0000
Received: by mail-ee0-f53.google.com with SMTP id c41so6152267eek.26
 for <ath10k@lists.infradead.org>; Fri, 12 Jul 2013 03:27:03 -0700 (PDT)
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Subject: [PATCH] ath10k: pass also QOS Null frames through mgmt tx path
Date: Fri, 12 Jul 2013 12:25:46 +0200
Message-Id: <1373624746-3244-1-git-send-email-janusz.dziedzic@tieto.com>
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
Cc: Janusz Dziedzic <janusz.dziedzic@tieto.com>, linux-wireless@vger.kernel.org

Fw will report wrong tx status for QOS Null frames
sent through data tx path.

This patch fixes station(s) keep alive detection
triggered from wpa_supplicant/hostapd when work
as AP/GO and WMM enabled.

Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c |   14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index da5c333..81b1a4b 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -1398,11 +1398,15 @@ static void ath10k_tx_htt(struct ath10k *ar, struct sk_buff *skb)
 
 	if (ieee80211_is_mgmt(hdr->frame_control))
 		ret = ath10k_htt_mgmt_tx(ar->htt, skb);
-	else if (ieee80211_is_nullfunc(hdr->frame_control))
-		/* FW does not report tx status properly for NullFunc frames
-		 * unless they are sent through mgmt tx path. mac80211 sends
-		 * those frames when it detects link/beacon loss and depends on
-		 * the tx status to be correct. */
+	else if (ieee80211_is_nullfunc(hdr->frame_control) ||
+		 ieee80211_is_qos_nullfunc(hdr->frame_control))
+		/* FW does not report tx status properly for NullFunc and
+		 * QOS NullFunc frames unless they are sent through mgmt
+		 * tx path. mac80211 sends those frames when it detects
+		 * link/beacon loss and depends on the tx status to be
+		 * correct. mac80211 also send those frames when probe_client
+		 * in case of AP/GO mode.
+		 */
 		ret = ath10k_htt_mgmt_tx(ar->htt, skb);
 	else
 		ret = ath10k_htt_tx(ar->htt, skb);
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
