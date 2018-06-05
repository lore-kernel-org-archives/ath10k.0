Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fQBCY-0008SK-1L
 for ath10k@lists.infradead.org; Tue, 05 Jun 2018 12:36:39 +0000
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH v2 3/6] dt: bindings: add bindings for msa memory region
Date: Tue,  5 Jun 2018 18:06:16 +0530
Message-Id: <20180605123616.528-1-govinds@codeaurora.org>
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
To: devicetree@vger.kernel.org, andy.gross@linaro.org, bjorn.andersson@linaro.org, david.brown@linaro.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Cc: Govind Singh <govinds@codeaurora.org>

Add device tree binding documentation details of msa
memory region for ath10k qmi client for SDM845/APQ8098
SoC into "qcom,ath10k.txt".

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 .../devicetree/bindings/net/wireless/qcom,ath10k.txt          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
index 7fd4e8ce4149..0efc47f4ba34 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
@@ -56,6 +56,8 @@ Optional properties:
 				     the length can vary between hw versions.
 - <supply-name>-supply: handle to the regulator device tree node
 			   optional "supply-name" is "vdd-0.8-cx-mx".
+- msa-fixed-region: phandle, specifier to children of reserved MSA memory.
+- msa-size: MSA memory size for fw internal use.
 
 Example (to supply the calibration data alone):
 
@@ -133,6 +135,8 @@ wifi@18000000 {
 		compatible = "qcom,wcn3990-wifi";
 		reg = <0x18800000 0x800000>;
 		reg-names = "membase";
+		msa-fixed-region = <&wlan_msa_mem>;
+		msa-size = <0x100000>;
 		clocks = <&clock_gcc clk_aggre2_noc_clk>;
 		clock-names = "smmu_aggre2_noc_clk"
 		interrupts =
-- 
2.17.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
