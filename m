Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hiWOa-0002pS-76
 for ath10k@lists.infradead.org; Wed, 03 Jul 2019 03:57:26 +0000
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH 3/3] arm64: dts: qcom: qcs404: Modify wifi dt node for
 SDM845/QCS404 devices
Date: Wed,  3 Jul 2019 09:27:11 +0530
Message-Id: <20190703035711.25592-4-govinds@codeaurora.org>
In-Reply-To: <20190703035711.25592-1-govinds@codeaurora.org>
References: <20190703035711.25592-1-govinds@codeaurora.org>
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
Cc: linux-arm-msm@vger.kernel.org, Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org, devicetree@vger.kernel.org

Modify the compatible string of wifi node for SDM845/QCS404 devices.
Add wifi regulators in qcs404 dt node for proxy vote. Proxy votes are
required for handling driver recovery scenarios to prevent
un-clocked register access during driver recovery.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 3 +++
 arch/arm64/boot/dts/qcom/qcs404.dtsi     | 2 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi     | 2 +-
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index 50b3589c7f15..ff81b9c5b057 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -190,6 +190,9 @@
 
 &wifi {
 	status = "okay";
+	vdd-0.8-cx-mx-supply = <&vreg_l2_1p275>;
+	vdd-1.8-xo-supply = <&vreg_l5_1p8>;
+	vdd-1.3-rfa-supply = <&vreg_l1_1p3>;
 };
 
 /* PINCTRL - additions to nodes defined in qcs404.dtsi */
diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index e8fd26633d57..d9e2173cd3e9 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -480,7 +480,7 @@
 		};
 
 		wifi: wifi@a000000 {
-			compatible = "qcom,wcn3990-wifi";
+			compatible = "qcom,qcs40x-wcn39xx-wifi";
 			reg = <0xa000000 0x800000>;
 			reg-names = "membase";
 			memory-region = <&wlan_msa_mem>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 5308f1671824..fdb5fcd814f4 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2235,7 +2235,7 @@
 		};
 
 		wifi: wifi@18800000 {
-			compatible = "qcom,wcn3990-wifi";
+			compatible = "qcom,sdm845-wcn39xx-wifi";
 			status = "disabled";
 			reg = <0 0x18800000 0 0x800000>;
 			reg-names = "membase";
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
