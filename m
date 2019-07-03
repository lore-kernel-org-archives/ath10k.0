Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hiWOU-0002nT-7T
 for ath10k@lists.infradead.org; Wed, 03 Jul 2019 03:57:19 +0000
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH 0/3] Move voltage regulator config to driver private data
Date: Wed,  3 Jul 2019 09:27:08 +0530
Message-Id: <20190703035711.25592-1-govinds@codeaurora.org>
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
Cc: linux-arm-msm@vger.kernel.org, Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org, devicetree@vger.kernel.org

WCN3990 voltage regulator config is varying b/w different MSM platforms ex: SDM845/
QCS404. In order to have scalable config, move regulator config to driver
private data.

Tested HW: WCN3990(SDM845/QCS404)
Tested FW: WLAN.HL.3.1-01040-QCAHLSWMTPLZ-1

Govind Singh (3):
  dt: bindings: update compatible dt properties for WCN3990 wifi node
  ath10k: Move regulator config to driver private data
  arm64: dts: qcom: qcs404: Modify wifi dt node for SDM845/QCS404
    devices

 .../bindings/net/wireless/qcom,ath10k.txt     |  2 +
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi      |  3 ++
 arch/arm64/boot/dts/qcom/qcs404.dtsi          |  2 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  2 +-
 drivers/net/wireless/ath/ath10k/snoc.c        | 38 +++++++++++++++----
 drivers/net/wireless/ath/ath10k/snoc.h        | 23 ++++++-----
 6 files changed, 51 insertions(+), 19 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
