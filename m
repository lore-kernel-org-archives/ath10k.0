Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fdH1g-0006hp-4E
 for ath10k@lists.infradead.org; Wed, 11 Jul 2018 15:29:34 +0000
Received: by mail-oi0-f66.google.com with SMTP id l10-v6so3278863oii.0
 for <ath10k@lists.infradead.org>; Wed, 11 Jul 2018 08:27:21 -0700 (PDT)
Date: Wed, 11 Jul 2018 09:27:18 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 3/6] dt: bindings: add bindings for msa memory region
Message-ID: <20180711152718.GA18470@rob-hp-laptop>
References: <20180706090043.28363-1-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180706090043.28363-1-govinds@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, niklas.cassel@linaro.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, bjorn.andersson@linaro.org, david.brown@linaro.org, andy.gross@linaro.org

On Fri, Jul 06, 2018 at 02:30:43PM +0530, Govind Singh wrote:
> Add device tree binding documentation details of msa
> memory region for ath10k qmi client for SDM845/APQ8098
> SoC into "qcom,ath10k.txt".
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> ---
>  .../bindings/net/wireless/qcom,ath10k.txt           | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> index 7fd4e8ce4149..87489054aea5 100644
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> @@ -57,6 +57,16 @@ Optional properties:
>  - <supply-name>-supply: handle to the regulator device tree node
>  			   optional "supply-name" is "vdd-0.8-cx-mx".
>  
> += SUBNODES:
> +wcn3990-wifi node may contain one subnode, named "msa" representing
> +the fixed msa memory regions used by the wifi firmware running in Q6.
> +This sub-node must contain:

Why do you need a sub-node? Just add memory-region property.

> +
> +- memory-region:
> +	Usage: required
> +	Value type: <phandle>
> +	Definition: reference to the reserved-memory for the region
> +
>  Example (to supply the calibration data alone):
>  
>  In this example, the node is defined as child node of the PCI controller.
> @@ -149,4 +159,7 @@ wifi@18000000 {
>  			   <0 140 0 /* CE10 */ >,
>  			   <0 141 0 /* CE11 */ >;
>  		vdd-0.8-cx-mx-supply = <&pm8998_l5>;
> +		msa {
> +			memory-region = <&wifi_msa_mem>;
> +		};
>  };
> -- 
> 2.17.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
