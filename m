Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail25.static.mailgun.info ([104.130.122.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1inNFb-0000Bm-Lk
 for ath10k@lists.infradead.org; Fri, 03 Jan 2020 13:44:29 +0000
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH v3 1/2] dt: bindings: add dt entry flag to skip SCM call for
 msa region
Date: Fri,  3 Jan 2020 19:14:13 +0530
Message-Id: <20200103134414.15457-2-govinds@codeaurora.org>
In-Reply-To: <20200103134414.15457-1-govinds@codeaurora.org>
References: <20200103134414.15457-1-govinds@codeaurora.org>
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
To: robh@kernel.org, devicetree@vger.kernel.org, ath10k@lists.infradead.org
Cc: Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org

Add boolean context flag to disable SCM call for statically
mapped msa region.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 .../devicetree/bindings/net/wireless/qcom,ath10k.txt          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
index 017128394a3e..633366dc33da 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
@@ -88,6 +88,9 @@ Optional properties:
 		    of the host capability QMI request
 - qcom,xo-cal-data: xo cal offset to be configured in xo trim register.
 
+- qcom,msa-fixed-perm: Boolean context flag to disable SCM call for statically
+		       mapped msa region.
+
 Example (to supply PCI based wifi block details):
 
 In this example, the node is defined as child node of the PCI controller.
@@ -185,4 +188,5 @@ wifi@18000000 {
 		vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
 		memory-region = <&wifi_msa_mem>;
 		iommus = <&apps_smmu 0x0040 0x1>;
+		qcom,msa-fixed-perm;
 };
-- 
2.22.0

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
