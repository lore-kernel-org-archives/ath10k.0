Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gN7N5-00024I-PQ
 for ath10k@lists.infradead.org; Thu, 15 Nov 2018 02:27:09 +0000
Received: by mail-pf1-x441.google.com with SMTP id u3-v6so6209721pfm.4
 for <ath10k@lists.infradead.org>; Wed, 14 Nov 2018 18:26:56 -0800 (PST)
Date: Wed, 14 Nov 2018 18:26:53 -0800
From: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH v4 2/3] dts: arm64/sdm845: Add WCN3990 WLAN module device
 node
Message-ID: <20181115022652.GA205124@google.com>
References: <1541423318-19312-1-git-send-email-govinds@codeaurora.org>
 <1541423318-19312-3-git-send-email-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1541423318-19312-3-git-send-email-govinds@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, sboyd@kernel.org, linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org, dianders@chromium.org, ath10k@lists.infradead.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, andy.gross@linaro.org, linux-soc@vger.kernel.org

Hi Govind,

On Mon, Nov 05, 2018 at 06:38:37PM +0530, Govind Singh wrote:
> Add device node for the ath10k SNOC platform driver probe
> and add resources required for WCN3990 on SDM845 soc.
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> Reviewed-by: Brian Norris <briannorris@chromium.org>
> Tested-by: Brian Norris <briannorris@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-mtp.dts |  8 ++++++++
>  arch/arm64/boot/dts/qcom/sdm845.dtsi    | 26 ++++++++++++++++++++++++++
>  2 files changed, 34 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> index eedfaf8..c062c5c 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> @@ -440,3 +440,11 @@
>  		bias-pull-up;
>  	};
>  };
> +
> +&wifi {
> +	status = "okay";
> +	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
> +	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
> +	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
> +	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
> +};

This node should be above the PINCTRL section.

Brian

> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index b72bdb0..324be5b 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -87,6 +87,11 @@
>  			reg = <0 0x86200000 0 0x2d00000>;
>  			no-map;
>  		};
> +
> +		wlan_msa_mem: memory@96700000 {
> +			reg = <0 0x96700000 0 0x100000>;
> +			no-map;
> +		};
>  	};
>  
>  	cpus {
> @@ -1403,5 +1408,26 @@
>  				status = "disabled";
>  			};
>  		};
> +
> +		wifi: wifi@18800000 {
> +			compatible = "qcom,wcn3990-wifi";
> +			status = "disabled";
> +			reg = <0x18800000 0x800000>;
> +			reg-names = "membase";
> +			memory-region = <&wlan_msa_mem>;
> +			interrupts =
> +				<GIC_SPI 414 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_SPI 415 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>;
> +		};
>  	};
>  };
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
