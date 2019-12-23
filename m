Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ijGb1-0003t4-QI
 for ath10k@lists.infradead.org; Mon, 23 Dec 2019 05:49:37 +0000
Received: by mail-pf1-x444.google.com with SMTP id x185so8630036pfc.5
 for <ath10k@lists.infradead.org>; Sun, 22 Dec 2019 21:49:31 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 2/2] arm64: dts: qcom: sm8150: Specify qdss clock for wifi
Date: Sun, 22 Dec 2019 21:48:55 -0800
Message-Id: <20191223054855.3020665-3-bjorn.andersson@linaro.org>
In-Reply-To: <20191223054855.3020665-1-bjorn.andersson@linaro.org>
References: <20191223054855.3020665-1-bjorn.andersson@linaro.org>
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
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>

The WiFi firmware on SM8150 requires the QDSS clock to be ticking, so
specify this clock for the wifi node.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 373fa098ebb2..0f0c9db3d484 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -929,8 +929,8 @@ wifi: wifi@18800000 {
 			reg = <0 0x18800000 0 0x800000>;
 			reg-names = "membase";
 			memory-region = <&wlan_mem>;
-			clock-names = "cxo_ref_clk_pin";
-			clocks = <&rpmhcc RPMH_RF_CLK2>;
+			clock-names = "cxo_ref_clk_pin", "qdss";
+			clocks = <&rpmhcc RPMH_RF_CLK2>, <&aoss_qmp>;
 			interrupts = <GIC_SPI 414 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 415 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.24.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
