Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xp7Ow-0007Wj-Dp
 for ath10k@lists.infradead.org; Fri, 14 Nov 2014 03:18:22 +0000
From: Peter Oh <poh@qca.qualcomm.com>
Subject: [PATCH] ath10k: fix mismatched wmi api call
Date: Thu, 13 Nov 2014 19:17:51 -0800
Message-ID: <1415935071-21422-1-git-send-email-poh@qca.qualcomm.com>
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

Fix to use v10.2 wmi call for firmware v10.2.
It turned out that peer association function was using
v10.1 wmi call for v10.2 firmware during code review.

Signed-off-by: Peter Oh <poh@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index ae746ce..f5d1081 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -4187,9 +4187,9 @@ int ath10k_wmi_peer_assoc(struct ath10k *ar,
 
 	if (test_bit(ATH10K_FW_FEATURE_WMI_10X, ar->fw_features)) {
 		if (test_bit(ATH10K_FW_FEATURE_WMI_10_2, ar->fw_features))
-			ath10k_wmi_peer_assoc_fill_10_1(ar, skb->data, arg);
-		else
 			ath10k_wmi_peer_assoc_fill_10_2(ar, skb->data, arg);
+		else
+			ath10k_wmi_peer_assoc_fill_10_1(ar, skb->data, arg);
 	} else {
 		ath10k_wmi_peer_assoc_fill_main(ar, skb->data, arg);
 	}
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
