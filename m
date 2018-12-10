Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWQNI-0006XZ-9d
 for ath10k@lists.infradead.org; Mon, 10 Dec 2018 18:33:49 +0000
From: Bhagavathi Perumal S <bperumal@codeaurora.org>
Subject: [PATCH v3 1/3] dt-bindings: net: ath10k: fix node name and device
 type in qcom ath10k example
Date: Tue, 11 Dec 2018 00:01:29 +0530
Message-Id: <1544466691-11821-2-git-send-email-bperumal@codeaurora.org>
In-Reply-To: <1544466691-11821-1-git-send-email-bperumal@codeaurora.org>
References: <1544466691-11821-1-git-send-email-bperumal@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, Bhagavathi Perumal S <bperumal@codeaurora.org>

In qcom,ath10k documentation, ath10k is used as node name in the example of
pci based device. Normally, node name shoud be class of device and not the model
name, so fix it to node name "wifi". And remove the property device_type pci
since only pci bridges should have this property.

Signed-off-by: Bhagavathi Perumal S <bperumal@codeaurora.org>
---
 Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
index 2196d1a..ef60f25 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
@@ -74,9 +74,8 @@ pci {
 		#address-cells = <3>;
 		device_type = "pci";
 
-		ath10k@0,0 {
+		wifi@0,0 {
 			reg = <0 0 0 0 0>;
-			device_type = "pci";
 			qcom,ath10k-calibration-data = [ 01 02 03 ... ];
 		};
 	};
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
