Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g3HRf-0003pa-7z
 for ath10k@lists.infradead.org; Fri, 21 Sep 2018 09:09:57 +0000
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH 4/4] dts: arm64/sdm845: Enable iommu for WCN3990 wifi module
 device node
Date: Fri, 21 Sep 2018 14:39:07 +0530
Message-Id: <20180921090907.25937-5-govinds@codeaurora.org>
In-Reply-To: <20180921090907.25937-1-govinds@codeaurora.org>
References: <20180921090907.25937-1-govinds@codeaurora.org>
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

WCN3990 wifi module can optionally make use of the IOMMU.
Add phandle to the iommu and stream id of wifi iommu block.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index b0b107641e74..5f5848cb1699 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -1224,6 +1224,7 @@
 				<0 423 0 /* CE9 */ >,
 				<0 424 0 /* CE10 */ >,
 				<0 425 0 /* CE11 */ >;
+			iommus = <&apps_smmu 0x0040 0x1>;
 		};
 	};
 };
-- 
2.17.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
