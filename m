Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xtxkm-00011i-8p
 for ath10k@lists.infradead.org; Thu, 27 Nov 2014 12:00:56 +0000
Subject: [PATCH v3 1/2] dt: bindings: add ath10k wireless device
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Thu, 27 Nov 2014 14:00:23 +0200
Message-ID: <20141127120023.28539.68895.stgit@potku.adurom.net>
In-Reply-To: <20141127115922.28539.9482.stgit@potku.adurom.net>
References: <20141127115922.28539.9482.stgit@potku.adurom.net>
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
Cc: devicetree-discuss@lists.ozlabs.org, linux-wireless@vger.kernel.org, toshik@chromium.org

Document how calibration data can be provided to ath10k via Device Tree.

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 .../bindings/net/wireless/qcom,ath10k.txt          |   30 ++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
new file mode 100644
index 000000000000..edefc26c6204
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
@@ -0,0 +1,30 @@
+* Qualcomm Atheros ath10k wireless devices
+
+For ath10k devices the calibration data can be provided through Device
+Tree. The node is a child node of the PCI controller.
+
+Required properties:
+-compatible : Should be "qcom,ath10k"
+
+Optional properties:
+- qcom,ath10k-calibration-data : calibration data as an array, the
+				 length can vary between hw versions
+
+
+Example:
+
+pci {
+	pcie@0 {
+		reg = <0 0 0 0 0>;
+		#interrupt-cells = <1>;
+		#size-cells = <2>;
+		#address-cells = <3>;
+		device_type = "pci";
+
+		ath10k@0,0 {
+			reg = <0 0 0 0 0>;
+			device_type = "pci";
+			qcom,ath10k-calibration-data = [ 01 02 03 ... ];
+		};
+	};
+};


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
