Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gpRTG-0002y1-5K
 for ath10k@lists.infradead.org; Fri, 01 Feb 2019 05:34:35 +0000
From: Surabhi Vishnoi <svishnoi@codeaurora.org>
Subject: [PATCH] ath10k: Add a condtion to fill the LDPC capability correctly
Date: Fri,  1 Feb 2019 11:04:22 +0530
Message-Id: <1548999262-25353-1-git-send-email-svishnoi@codeaurora.org>
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

The firmware advertises the LDPC support information for HT in
HT capability info in the wmi service ready event. To provide
granularity, firmware now advertises WMI_HT_CAP_RX_LDPC and
WMI_HT_CAP_TX_LDPC separately. To support LDPC, host should
also check for WMI_HT_CAP_RX_LDPC and WMI_HT_CAP_TX_LDPC in HT
capabilities.

Add a condition to existing logic in host to know whether firmware
supports LDPC or not.

Tested HW: WCN3990
Tested SW: WLAN.HL.2.0

Signed-off-by: Surabhi Vishnoi <svishnoi@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/mac.c | 3 ++-
 drivers/net/wireless/ath/ath10k/wmi.h | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index e49b367..1645b1e 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4549,7 +4549,8 @@ static struct ieee80211_sta_ht_cap ath10k_get_ht_cap(struct ath10k *ar)
 		ht_cap.cap |= stbc;
 	}
 
-	if (ar->ht_cap_info & WMI_HT_CAP_LDPC)
+	if (ar->ht_cap_info & WMI_HT_CAP_LDPC || (ar->ht_cap_info &
+	    WMI_HT_CAP_RX_LDPC && (ar->ht_cap_info & WMI_HT_CAP_TX_LDPC)))
 		ht_cap.cap |= IEEE80211_HT_CAP_LDPC_CODING;
 
 	if (ar->ht_cap_info & WMI_HT_CAP_L_SIG_TXOP_PROT)
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 427ca79..0aca84e 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -2076,6 +2076,8 @@ enum wmi_channel_change_cause {
 #define WMI_HT_CAP_MPDU_DENSITY           0x0700   /* MPDU Density */
 #define WMI_HT_CAP_MPDU_DENSITY_MASK_SHIFT 8
 #define WMI_HT_CAP_HT40_SGI               0x0800
+#define WMI_HT_CAP_RX_LDPC                0x1000   /* LDPC RX support */
+#define WMI_HT_CAP_TX_LDPC                0x2000   /* LDPC TX support */
 
 #define WMI_HT_CAP_DEFAULT_ALL (WMI_HT_CAP_ENABLED       | \
 				WMI_HT_CAP_HT20_SGI      | \
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
