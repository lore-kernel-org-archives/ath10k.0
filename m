Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c7L7i-0008IC-1t
 for ath10k@lists.infradead.org; Thu, 17 Nov 2016 11:44:59 +0000
From: <c_traja@qti.qualcomm.com>
Subject: [PATCHv2 3/4] dt: bindings: add new dt entry for BTCOEX feature in
 qcom, ath10k.txt
Date: Thu, 17 Nov 2016 17:14:23 +0530
Message-ID: <1479383064-25718-4-git-send-email-c_traja@qti.qualcomm.com>
In-Reply-To: <1479383064-25718-1-git-send-email-c_traja@qti.qualcomm.com>
References: <1479383064-25718-1-git-send-email-c_traja@qti.qualcomm.com>
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
Cc: robh@kernel.org, tamizhchelvam@codeaurora.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org

From: Tamizh chelvam <tamizhchelvam@codeaurora.org>

There two things done in this patch.

1) 'btcoex_support' flag for BTCOEX feature support by the hardware.
2) 'wlan_btcoex_gpio' is used to fill wlan priority pin number for
   BTCOEX priority feature support.

Signed-off-by: Tamizh chelvam <tamizhchelvam@codeaurora.org>
---
 .../bindings/net/wireless/qcom,ath10k.txt          |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
index 74d7f0a..08150e2d 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
@@ -46,6 +46,10 @@ Optional properties:
 				 hw versions.
 - qcom,ath10k-pre-calibration-data : pre calibration data as an array,
 				     the length can vary between hw versions.
+- btcoex_support  : should contain eithr "0" or "1" to indicate btcoex
+		    support by the hardware.
+- btcoex_gpio_pin :  btcoex gpio pin number for the device which
+		     supports BTCOEX.
 
 Example (to supply the calibration data alone):
 
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
