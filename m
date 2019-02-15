Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gufHH-0004rD-Vm
 for ath10k@lists.infradead.org; Fri, 15 Feb 2019 15:19:49 +0000
From: Surabhi Vishnoi <svishnoi@codeaurora.org>
Subject: [PATCH] ath10k: Fix length of wmi tlv command for protected mgmt
 frames
Date: Fri, 15 Feb 2019 20:49:37 +0530
Message-Id: <1550243977-8612-1-git-send-email-svishnoi@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, Surabhi Vishnoi <svishnoi@codeaurora.org>

The length of wmi tlv command for management tx send is calculated
incorrectly in case of protected management frames as there is addition
of IEEE80211_CCMP_MIC_LEN twice. This leads to improper behaviour of
firmware as the wmi tlv mgmt tx send command for protected mgmt frames
is formed wrongly.

Fix the length calculation of wmi tlv command for mgmt tx send in case
of protected management frames by adding the IEEE80211_CCMP_MIC_LEN only
once.

Tested HW: WCN3990
Tested FW: WLAN.HL.3.1-00784-QCAHLSWMTPLZ-1

Fixes: 1807da49733e "ath10k: wmi: add management tx by reference support over wmi"
Signed-off-by: Surabhi Vishnoi <svishnoi@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index 5d05bff..a1c28c1 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -2764,10 +2764,8 @@ static void *ath10k_wmi_tlv_put_wmm(void *ptr,
 	if ((ieee80211_is_action(hdr->frame_control) ||
 	     ieee80211_is_deauth(hdr->frame_control) ||
 	     ieee80211_is_disassoc(hdr->frame_control)) &&
-	     ieee80211_has_protected(hdr->frame_control)) {
-		len += IEEE80211_CCMP_MIC_LEN;
+	     ieee80211_has_protected(hdr->frame_control))
 		buf_len += IEEE80211_CCMP_MIC_LEN;
-	}
 
 	buf_len = min_t(u32, buf_len, WMI_TLV_MGMT_TX_FRAME_MAX_LEN);
 	buf_len = round_up(buf_len, 4);
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
