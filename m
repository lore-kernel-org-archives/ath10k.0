Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAD3O-0000cN-Cr
 for ath10k@lists.infradead.org; Wed, 10 Oct 2018 11:53:27 +0000
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH v3 0/3] Enable ath10k wcn3990 wifi driver support on sdm845
Date: Wed, 10 Oct 2018 17:22:53 +0530
Message-Id: <1539172376-19269-1-git-send-email-govinds@codeaurora.org>
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
To: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, robh+dt@kernel.org, andy.gross@linaro.org, linux-soc@vger.kernel.org
Cc: Govind Singh <govinds@codeaurora.org>

This series enables ath10k wifi driver support for WCN3990 target
on sdm845 SOC. This series also updates the missing dt binding documentation
and adds optional iommu property.

Changes since v2:
    dropped [v2,4/4] dts: arm64/sdm845: Enable iommu for WCN3990 wifi module
    device node patch from the series as dependent patch is not yet merged.
    Enabled status flag from sdm845-mtp.dts.

Changes since v1:
    Listed no of interrupts/clocks for each set of compatible.
    Added missing 'wifi' label to sdm845.dtsi.

Govind Singh (3):
  dt: bindings: add missing dt properties for WCN3990 wifi node
  dts: arm64/sdm845: Add WCN3990 WLAN module device node
  dt: bindings: add bindings for wifi iommu node

 .../bindings/net/wireless/qcom,ath10k.txt          | 33 +++++++++++++++++-----
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts            |  8 ++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi               | 26 +++++++++++++++++
 3 files changed, 60 insertions(+), 7 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
