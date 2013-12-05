Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-f43.google.com ([74.125.83.43])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VoRwZ-0001O1-TV
 for ath10k@lists.infradead.org; Thu, 05 Dec 2013 05:57:49 +0000
Received: by mail-ee0-f43.google.com with SMTP id c13so2936050eek.30
 for <ath10k@lists.infradead.org>; Wed, 04 Dec 2013 21:57:20 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: fix WEP Shared authentication
Date: Thu,  5 Dec 2013 06:53:41 +0100
Message-Id: <1386222821-3062-1-git-send-email-michal.kazior@tieto.com>
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

Frames received from FW were treated incorrectly.
This led to stations being unable to associate to
WEP Shared ath10k AP. This was indicated by a
bizarre hostapd message:

  Unsupported authentication algorithm (36088)

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index c654137..ce6475a 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -937,7 +937,11 @@ static int ath10k_wmi_event_mgmt_rx(struct ath10k *ar, struct sk_buff *skb)
 	hdr = (struct ieee80211_hdr *)skb->data;
 	fc = le16_to_cpu(hdr->frame_control);
 
-	if (fc & IEEE80211_FCTL_PROTECTED) {
+	/* FW delivers WEP Shared Auth frame with Protected Bit set and
+	 * encrypted payload. However in case of PMF it delivers decrypted
+	 * frames with Protected Bit set. */
+	if (ieee80211_has_protected(hdr->frame_control) &&
+	    !ieee80211_is_auth(hdr->frame_control)) {
 		status->flag |= RX_FLAG_DECRYPTED | RX_FLAG_IV_STRIPPED |
 				RX_FLAG_MMIC_STRIPPED;
 		hdr->frame_control = __cpu_to_le16(fc &
-- 
1.8.4.rc3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
