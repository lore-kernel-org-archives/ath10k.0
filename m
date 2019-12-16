Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail25.static.mailgun.info ([104.130.122.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igolS-0000Jh-VE
 for ath10k@lists.infradead.org; Mon, 16 Dec 2019 11:42:16 +0000
From: Tamizh Chelvam <tamizhr@codeaurora.org>
Subject: [PATCH 1/2] dt-bindings: ath10k: Add new dt entries to identify coex
 support
Date: Mon, 16 Dec 2019 17:10:14 +0530
Message-Id: <1576496415-23064-1-git-send-email-tamizhr@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, Tamizh Chelvam <tamizhr@codeaurora.org>

This adds new dt entries qcom,coexist-support and qcom,coexist-gpio-pin
which will be used by ath10k driver to identify coex support
of a hardware and notify wifi firmware the gpio pin number.
This pin number information is needed for the hardware QCA4019.

Signed-off-by: Tamizh Chelvam <tamizhr@codeaurora.org>
---
 Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
index 0171283..a41e936 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
@@ -87,6 +87,10 @@ Optional properties:
 	Definition: Quirk specifying that the firmware expects the 8bit version
 		    of the host capability QMI request
 - qcom,xo-cal-data: xo cal offset to be configured in xo trim register.
+- qcom,coexist-support : should contain eithr "0" or "1" to indicate coex
+			 support by the hardware.
+- qcom,coexist-gpio-pin : gpio pin number  information to support coex
+			  which will be used by wifi firmware.
 
 Example (to supply PCI based wifi block details):
 
@@ -156,6 +160,8 @@ wifi0: wifi@a000000 {
 	qcom,msi_addr = <0x0b006040>;
 	qcom,msi_base = <0x40>;
 	qcom,ath10k-pre-calibration-data = [ 01 02 03 ... ];
+	qcom,coexist-support = <1>;
+	qcom,coexist-gpio-pin = <0x33>;
 };
 
 Example (to supply wcn3990 SoC wifi block details):
-- 
1.9.1

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
