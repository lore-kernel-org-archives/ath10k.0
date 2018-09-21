Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g3HRS-0003nD-6Y
 for ath10k@lists.infradead.org; Fri, 21 Sep 2018 09:09:42 +0000
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH 0/4] Enable ath10k wcn3990 wifi driver support on sdm845
Date: Fri, 21 Sep 2018 14:39:03 +0530
Message-Id: <20180921090907.25937-1-govinds@codeaurora.org>
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
To: ath10k@lists.infradead.org, robh+dt@kernel.org, andy.gross@linaro.org, devicetree@vger.kernel.org
Cc: Govind Singh <govinds@codeaurora.org>, briannorris@chromium.org, linux-wireless@vger.kernel.org

This series enables ath10k wifi driver support for WCN3990 target
on sdm845 SOC. This series also updates the missing dt binding documentation
and adds optional iommu property.

sdm845 dtsi changes in this series are based on top of
https://patchwork.kernel.org/cover/10573121/ change.

Govind Singh (4):
  dt: bindings: add missing dt properties for WCN3990 wifi node
  dts: arm64/sdm845: Add WCN3990 WLAN module device node
  dt: bindings: add bindings for wifi iommu node
  dts: arm64/sdm845: Enable iommu for WCN3990 wifi module device node

 .../bindings/net/wireless/qcom,ath10k.txt     | 27 ++++++++++++++-----
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts       |  7 +++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi          | 26 ++++++++++++++++++
 3 files changed, 53 insertions(+), 7 deletions(-)

-- 
2.17.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
