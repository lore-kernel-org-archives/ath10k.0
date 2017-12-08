Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eNG2v-0002a0-R8
 for ath10k@lists.infradead.org; Fri, 08 Dec 2017 10:38:23 +0000
Received: by mail-qt0-x241.google.com with SMTP id g10so24819382qtj.12
 for <ath10k@lists.infradead.org>; Fri, 08 Dec 2017 02:38:01 -0800 (PST)
From: Sven Eckelmann <sven.eckelmann@openmesh.com>
Subject: [PATCH v2 1/2] dt: bindings: add new dt entry for ath10k calibration
 variant
Date: Fri,  8 Dec 2017 11:37:41 +0100
Message-Id: <20171208103742.3181-2-sven.eckelmann@openmesh.com>
In-Reply-To: <20171208103742.3181-1-sven.eckelmann@openmesh.com>
References: <20171208103742.3181-1-sven.eckelmann@openmesh.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, robh+dt@kernel.org, Sven Eckelmann <sven.eckelmann@openmesh.com>, ext.waldemar.rymarkiewicz@tieto.com, kvalo@codeaurora.org

The bus + bmi-chip-id + bmi-board-id is not enough to identify the correct
board data file on QCA4019 based devices. Multiple different boards share
the same values. Only the original reference designs can currently be
identified and loaded from the board-2.bin. But these will not result in
the correct calibration data when combined with the pre-calibration data
from the device.

An additional "variant" information has to be provided (via SMBIOS or DT)
to select the correct board data for a design which was modified by an ODM.

Signed-off-by: Sven Eckelmann <sven.eckelmann@openmesh.com>
---
 Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
index 74d7f0af209c..3d2a031217da 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
@@ -41,6 +41,9 @@ Optional properties:
 - qcom,msi_addr: MSI interrupt address.
 - qcom,msi_base: Base value to add before writing MSI data into
 		MSI address register.
+- qcom,ath10k-calibration-variant: string to search for in the board-2.bin
+				   variant list with the same bus and device
+				   specific ids
 - qcom,ath10k-calibration-data : calibration data + board specific data
 				 as an array, the length can vary between
 				 hw versions.
-- 
2.11.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
