Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g3HRS-0003nh-0n
 for ath10k@lists.infradead.org; Fri, 21 Sep 2018 09:09:39 +0000
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH 2/4] dts: arm64/sdm845: Add WCN3990 WLAN module device node
Date: Fri, 21 Sep 2018 14:39:05 +0530
Message-Id: <20180921090907.25937-3-govinds@codeaurora.org>
In-Reply-To: <20180921090907.25937-1-govinds@codeaurora.org>
References: <20180921090907.25937-1-govinds@codeaurora.org>
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
To: ath10k@lists.infradead.org, robh+dt@kernel.org, andy.gross@linaro.org, devicetree@vger.kernel.org
Cc: Govind Singh <govinds@codeaurora.org>, briannorris@chromium.org, linux-wireless@vger.kernel.org

Add device node for the ath10k SNOC platform driver probe
and add resources required for WCN3990 on SDM845 soc.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts |  7 +++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi    | 25 +++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index eedfaf8922e2..4de57f7df93c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -440,3 +440,10 @@
 		bias-pull-up;
 	};
 };
+
+&wifi {
+	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
+	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
+	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
+	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
+};
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index e080072cdfdb..b0b107641e74 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -86,6 +86,11 @@
 			reg = <0 0x86200000 0 0x2d00000>;
 			no-map;
 		};
+
+		wlan_msa_mem: reserved-memory@96700000 {
+			no-map;
+			reg = <0 0x96700000 0 0x100000>;
+		};
 	};
 
 	cpus {
@@ -1200,5 +1205,25 @@
 				status = "disabled";
 			};
 		};
+
+		qcom,wifi {
+			compatible = "qcom,wcn3990-wifi";
+			reg = <0x18800000 0x800000>;
+			reg-names = "membase";
+			memory-region = <&wlan_msa_mem>;
+			interrupts =
+				<0 413 0 /* CE0 */ >,
+				<0 414 0 /* CE1 */ >,
+				<0 415 0 /* CE2 */ >,
+				<0 416 0 /* CE3 */ >,
+				<0 417 0 /* CE4 */ >,
+				<0 418 0 /* CE5 */ >,
+				<0 420 0 /* CE6 */ >,
+				<0 421 0 /* CE7 */ >,
+				<0 422 0 /* CE8 */ >,
+				<0 423 0 /* CE9 */ >,
+				<0 424 0 /* CE10 */ >,
+				<0 425 0 /* CE11 */ >;
+		};
 	};
 };
-- 
2.17.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
