Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g6wLo-0003vd-6W
 for ath10k@lists.infradead.org; Mon, 01 Oct 2018 11:26:57 +0000
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH v2 0/4] Enable ath10k wcn3990 wifi driver support on sdm845
Date: Mon,  1 Oct 2018 16:56:32 +0530
Message-Id: <20181001112636.31715-1-govinds@codeaurora.org>
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
To: robh+dt@kernel.org, devicetree@vger.kernel.org, andy.gross@linaro.org, briannorris@chromium.org
Cc: Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

This series enables ath10k wifi driver support for WCN3990 target
on sdm845 SOC. This series also updates the missing dt binding documentation
and adds optional iommu property.

sdm845 dtsi changes in this series are based on top of
https://patchwork.kernel.org/cover/10573121/ change.

Changes since v1:
	Listed no of interrupts/clocks for each set of compatible.
	Added missing 'wifi' label to sdm845.dtsi.

Govind Singh (4):
  dt: bindings: add missing dt properties for WCN3990 wifi node
  dts: arm64/sdm845: Add WCN3990 WLAN module device node
  dt: bindings: add bindings for wifi iommu node
  dts: arm64/sdm845: Enable iommu for WCN3990 wifi module device node

 .../bindings/net/wireless/qcom,ath10k.txt     | 34 +++++++++++++++----
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts       |  7 ++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi          | 27 +++++++++++++++
 3 files changed, 61 insertions(+), 7 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
