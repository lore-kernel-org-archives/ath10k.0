Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJJGU-0004vn-EE
 for ath10k@lists.infradead.org; Fri, 18 Sep 2020 16:29:39 +0000
Received: by mail-wm1-x344.google.com with SMTP id d4so5896962wmd.5
 for <ath10k@lists.infradead.org>; Fri, 18 Sep 2020 09:29:38 -0700 (PDT)
From: Ansuel Smith <ansuelsmth@gmail.com>
Subject: [PATCH 2/2] dt: bindings: ath10k: Document qcom,
 ath10k-pre-calibration-data-mtd
Date: Fri, 18 Sep 2020 18:29:28 +0200
Message-Id: <20200918162928.14335-2-ansuelsmth@gmail.com>
In-Reply-To: <20200918162928.14335-1-ansuelsmth@gmail.com>
References: <20200918162928.14335-1-ansuelsmth@gmail.com>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Ansuel Smith <ansuelsmth@gmail.com>

Document use of qcom,ath10k-pre-calibration-data-mtd bindings used to
define from where the driver will load the pre-cal data in the defined
mtd partition.

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 .../devicetree/bindings/net/wireless/qcom,ath10k.txt | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
index b61c2d5a0..568364243 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
@@ -15,9 +15,9 @@ and also uses most of the properties defined in this doc (except
 "qcom,ath10k-calibration-data"). It uses "qcom,ath10k-pre-calibration-data"
 to carry pre calibration data.
 
-In general, entry "qcom,ath10k-pre-calibration-data" and
-"qcom,ath10k-calibration-data" conflict with each other and only one
-can be provided per device.
+In general, entry "qcom,ath10k-pre-calibration-data",
+"qcom,ath10k-calibration-data-mtd" and "qcom,ath10k-calibration-data" conflict with
+each other and only one can be provided per device.
 
 SNOC based devices (i.e. wcn3990) uses compatible string "qcom,wcn3990-wifi".
 
@@ -63,6 +63,12 @@ Optional properties:
 				 hw versions.
 - qcom,ath10k-pre-calibration-data : pre calibration data as an array,
 				     the length can vary between hw versions.
+- qcom,ath10k-pre-calibration-data-mtd :
+	Usage: optional
+	Value type: <phandle offset size>
+	Definition: pre calibration data read from mtd partition. Take 3 value, the
+		    mtd to read data from, the offset in the mtd partition and the
+		    size of data to read.
 - <supply-name>-supply: handle to the regulator device tree node
 			   optional "supply-name" are "vdd-0.8-cx-mx",
 			   "vdd-1.8-xo", "vdd-1.3-rfa", "vdd-3.3-ch0",
-- 
2.27.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
