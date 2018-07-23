Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fha3E-0006g1-Os
 for ath10k@lists.infradead.org; Mon, 23 Jul 2018 12:34:58 +0000
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH v4 3/6] dt: bindings: add bindings for msa memory region
Date: Mon, 23 Jul 2018 18:04:25 +0530
Message-Id: <20180723123428.12993-4-govinds@codeaurora.org>
In-Reply-To: <20180723123428.12993-1-govinds@codeaurora.org>
References: <20180723123428.12993-1-govinds@codeaurora.org>
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
To: niklas.cassel@linaro.org, bjorn.andersson@linaro.org, david.brown@linaro.org, andy.gross@linaro.org, robh@kernel.org, devicetree@vger.kernel.org, ath10k@lists.infradead.org
Cc: Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org

Add device tree binding documentation details of msa
memory region for ath10k qmi client for SDM845/APQ8098
SoC into "qcom,ath10k.txt".

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 .../devicetree/bindings/net/wireless/qcom,ath10k.txt        | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
index 7fd4e8ce4149..2196d1ab3c8c 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
@@ -56,6 +56,11 @@ Optional properties:
 				     the length can vary between hw versions.
 - <supply-name>-supply: handle to the regulator device tree node
 			   optional "supply-name" is "vdd-0.8-cx-mx".
+- memory-region:
+	Usage: optional
+	Value type: <phandle>
+	Definition: reference to the reserved-memory for the msa region
+		    used by the wifi firmware running in Q6.
 
 Example (to supply the calibration data alone):
 
@@ -149,4 +154,5 @@ wifi@18000000 {
 			   <0 140 0 /* CE10 */ >,
 			   <0 141 0 /* CE11 */ >;
 		vdd-0.8-cx-mx-supply = <&pm8998_l5>;
+		memory-region = <&wifi_msa_mem>;
 };
-- 
2.17.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
