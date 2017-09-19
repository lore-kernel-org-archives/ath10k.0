Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1du8zR-0001wo-Dd
 for ath10k@lists.infradead.org; Tue, 19 Sep 2017 03:14:32 +0000
From: <yintang@qti.qualcomm.com>
Subject: [TDLS PATCH V3 2/5] ath10k: Enable TDLS peer buffer STA feature
Date: Tue, 19 Sep 2017 11:15:10 +0800
Message-ID: <1505790913-28377-3-git-send-email-yintang@qti.qualcomm.com>
In-Reply-To: <1505790913-28377-1-git-send-email-yintang@qti.qualcomm.com>
References: <TDLS for ath10k patchset v3>
 <1505790913-28377-1-git-send-email-yintang@qti.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org

From: Yingying Tang <yintang@qti.qualcomm.com>

Enable TDLS peer buffer STA feature.
QCA6174 firmware(version: WLAN.RM.4.4) support TDLS peer buffer STA,
it reports this capability through wmi service map in wmi service ready
event. Set related parameter in TDLS WMI command to enable this feature.

Signed-off-by: Yingying Tang <yintang@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c     |    3 +++
 drivers/net/wireless/ath/ath10k/wmi-tlv.c |    3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 5683f1a..399f9ba 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -8204,6 +8204,9 @@ int ath10k_mac_register(struct ath10k *ar)
 		ieee80211_hw_set(ar->hw, TDLS_WIDER_BW);
 	}
 
+	if (test_bit(WMI_SERVICE_TDLS_UAPSD_BUFFER_STA, ar->wmi.svc_map))
+		ar->hw->wiphy->flags |= WIPHY_FLAG_SUPPORT_TDLS_BUFFER_STA;
+
 	ar->hw->wiphy->flags |= WIPHY_FLAG_HAS_REMAIN_ON_CHANNEL;
 	ar->hw->wiphy->flags |= WIPHY_FLAG_HAS_CHANNEL_SWITCH;
 	ar->hw->wiphy->max_remain_on_channel_duration = 5000;
diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index 7616c1c..f60b46e 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -2747,6 +2747,9 @@ static void *ath10k_wmi_tlv_put_wmm(void *ptr,
 	 */
 	u32 options = 0;
 
+	if (test_bit(WMI_SERVICE_TDLS_UAPSD_BUFFER_STA, ar->wmi.svc_map))
+		options |=  WMI_TLV_TDLS_BUFFER_STA_EN;
+
 	len = sizeof(*tlv) + sizeof(*cmd);
 	skb = ath10k_wmi_alloc_skb(ar, len);
 	if (!skb)
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
