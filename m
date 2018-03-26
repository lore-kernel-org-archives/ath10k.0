Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f0Kql-0003YP-6d
 for ath10k@lists.infradead.org; Mon, 26 Mar 2018 05:39:20 +0000
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH 02/12] dt: bindings: add bindings for ath10k qmi client
Date: Mon, 26 Mar 2018 11:09:08 +0530
Message-Id: <1522042748-25677-1-git-send-email-govinds@codeaurora.org>
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
To: ath10k@lists.infradead.org, bjorn.andersson@linaro.org
Cc: Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org

Add device tree binding documentation details for ath10k
qmi client for SDM845/APQ8098 SoC into "qcom,ath10k.txt".

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
index 34e4f98..8076ae3 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
@@ -5,6 +5,7 @@ Required properties:
 	* "qcom,ath10k"
 	* "qcom,ipq4019-wifi"
 	* "qcom,wcn3990-wifi"
+	* "qcom,ath10k-qmi"
 
 PCI based devices uses compatible string "qcom,ath10k" and takes calibration
 data along with board specific data via "qcom,ath10k-calibration-data".
@@ -21,6 +22,8 @@ can be provided per device.
 
 SNOC based devices (i.e. wcn3990) uses compatible string "qcom,wcn3990-wifi".
 
+- qcom,wlan-msa-memory: MSA memory size
+
 Optional properties:
 - reg: Address and length of the register set for the device.
 - reg-names: Must include the list of following reg names,
@@ -150,3 +153,8 @@ qcom,wifi@18000000 {
 			   <0 141 0 /* CE11 */ >;
 		vdd-0.8-cx-mx-supply = <&pm8998_l5>;
 };
+
+qcom,ath10k-qmi {
+	compatible = "qcom,ath10k-qmi";
+	qcom,wlan-msa-memory = <0x100000>;
+};
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
