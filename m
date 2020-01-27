Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iw9uo-0005ip-PH
 for ath10k@lists.infradead.org; Mon, 27 Jan 2020 19:19:20 +0000
From: Tamizh Chelvam <tamizhr@codeaurora.org>
Subject: [PATCHv2 1/2] dt-bindings: ath10k: Add new dt entries to identify
 coex support
Date: Tue, 28 Jan 2020 00:48:55 +0530
Message-Id: <1580152736-18654-1-git-send-email-tamizhr@codeaurora.org>
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
 Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
index 616c877..71bf91f 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
@@ -91,6 +91,11 @@ Optional properties:
 - qcom,msa-fixed-perm: Boolean context flag to disable SCM call for statically
 		       mapped msa region.
 
+- qcom,coexist-support : should contain eithr "0" or "1" to indicate coex
+			 support by the hardware.
+- qcom,coexist-gpio-pin : gpio pin number  information to support coex
+			  which will be used by wifi firmware.
+
 Example (to supply PCI based wifi block details):
 
 In this example, the node is defined as child node of the PCI controller.
@@ -159,6 +164,8 @@ wifi0: wifi@a000000 {
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
