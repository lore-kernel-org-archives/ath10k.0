Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g9grC-0003gH-Le
 for ath10k@lists.infradead.org; Tue, 09 Oct 2018 01:30:44 +0000
Received: by mail-pf1-x444.google.com with SMTP id c25-v6so8864282pfe.6
 for <ath10k@lists.infradead.org>; Mon, 08 Oct 2018 18:30:31 -0700 (PDT)
Date: Mon, 8 Oct 2018 18:30:27 -0700
From: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH v2 4/4] dts: arm64/sdm845: Enable iommu for WCN3990 wifi
 module device node
Message-ID: <20181009013026.GA83814@ban.mtv.corp.google.com>
References: <20181001112636.31715-1-govinds@codeaurora.org>
 <20181001112636.31715-5-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181001112636.31715-5-govinds@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org, Doug Anderson <dianders@chromium.org>, ath10k@lists.infradead.org, robh+dt@kernel.org, andy.gross@linaro.org, linux-soc@vger.kernel.org

+ linux-msm, linux-soc

On Mon, Oct 01, 2018 at 04:56:36PM +0530, Govind Singh wrote:
> WCN3990 wifi module can optionally make use of the IOMMU.
> Add phandle to the iommu and stream id of wifi iommu block.
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 36c716cf3a0c..f02da46542cc 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -1225,6 +1225,7 @@
>  				<0 423 0 /* CE9 */ >,
>  				<0 424 0 /* CE10 */ >,
>  				<0 425 0 /* CE11 */ >;
> +			iommus = <&apps_smmu 0x0040 0x1>;

I don't see an apps_smmu label in any of the sdm845 files yet. I don't
think this piece has landed in any -next tree yet. So your patch won't
work.

I think maybe you should just defer sending this particular patch
upstream until the dependency is worked out.

Brian

>  		};
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
