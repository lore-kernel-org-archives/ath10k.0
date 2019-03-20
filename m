Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6T9f-0004ru-FF
 for ath10k@lists.infradead.org; Wed, 20 Mar 2019 04:48:44 +0000
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH v2 1/2] dt: bindings: add dt entry for XO calibration support
Date: Wed, 20 Mar 2019 10:15:10 +0530
Message-Id: <20190320044511.12172-2-govinds@codeaurora.org>
In-Reply-To: <20190320044511.12172-1-govinds@codeaurora.org>
References: <20190320044511.12172-1-govinds@codeaurora.org>
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
Cc: Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org

Add dt binding to get xo calibration data support for wifi rf clock.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
index ae661e65354e..ab8042866e83 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
@@ -81,6 +81,7 @@ Optional properties:
 	Definition: Name of external front end module used. Some valid FEM names
 		    for example: "microsemi-lx5586", "sky85703-11"
 		    and "sky85803" etc.
+- xo-cal-data: xo cal offset to be configured in xo trim register.
 
 Example (to supply PCI based wifi block details):
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
