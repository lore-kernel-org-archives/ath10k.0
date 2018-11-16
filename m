Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNeC6-0000S3-PM
 for ath10k@lists.infradead.org; Fri, 16 Nov 2018 13:29:59 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v4 0/3] Enable ath10k wcn3990 wifi driver support on sdm845
References: <1541423318-19312-1-git-send-email-govinds@codeaurora.org>
Date: Fri, 16 Nov 2018 15:29:39 +0200
In-Reply-To: <1541423318-19312-1-git-send-email-govinds@codeaurora.org>
 (Govind Singh's message of "Mon, 5 Nov 2018 18:38:35 +0530")
Message-ID: <87d0r55ews.fsf@codeaurora.org>
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
To: Govind Singh <govinds@codeaurora.org>
Cc: devicetree@vger.kernel.org, sboyd@kernel.org, linux-arm-msm@vger.kernel.org, briannorris@chromium.org, linux-wireless@vger.kernel.org, dianders@chromium.org, ath10k@lists.infradead.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, andy.gross@linaro.org, linux-soc@vger.kernel.org

Govind Singh <govinds@codeaurora.org> writes:

> This series enables ath10k wifi driver support for WCN3990 target
> on sdm845 SOC. This series also updates the missing dt binding documentation
> and adds optional iommu property.
>
> Changes since v3:
>     Moved interrupt/reg/reg-name to required property.
>     Removed unused clocks.
>     Corrected interrupt no's.
>
> Changes since v2:
>     dropped [v2,4/4] dts: arm64/sdm845: Enable iommu for WCN3990 wifi module
>     device node patch from the series as dependent patch is not yet merged.
>     Enabled status flag from sdm845-mtp.dts.
>
> Changes since v1:
>     Listed no of interrupts/clocks for each set of compatible.
>     Added missing 'wifi' label to sdm845.dtsi.
>
> Govind Singh (3):
>   dt: bindings: add missing dt properties for WCN3990 wifi node
>   dts: arm64/sdm845: Add WCN3990 WLAN module device node
>   dt: bindings: add bindings for wifi iommu node
>
>  .../bindings/net/wireless/qcom,ath10k.txt          | 62 ++++++++++++++--------
>  arch/arm64/boot/dts/qcom/sdm845-mtp.dts            |  8 +++
>  arch/arm64/boot/dts/qcom/sdm845.dtsi               | 26 +++++++++
>  3 files changed, 74 insertions(+), 22 deletions(-)

Via which tree are these patches going? That's not clear for me.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
