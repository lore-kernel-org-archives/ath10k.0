Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ot0-f195.google.com ([74.125.82.195])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f76dk-0008Ld-SR
 for ath10k@lists.infradead.org; Fri, 13 Apr 2018 21:53:54 +0000
Received: by mail-ot0-f195.google.com with SMTP id m22-v6so11432206otf.8
 for <ath10k@lists.infradead.org>; Fri, 13 Apr 2018 14:53:42 -0700 (PDT)
Date: Fri, 13 Apr 2018 16:53:40 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 13/13] dt: bindings: add bindings for wcn3990 wifi block
Message-ID: <20180413215340.vhvlhlaapt5uuo7d@rob-hp-laptop>
References: <1523378986-11551-1-git-send-email-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1523378986-11551-1-git-send-email-govinds@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Tue, Apr 10, 2018 at 10:19:46PM +0530, Govind Singh wrote:
> Add device tree binding documentation details for wcn3990
> wifi block present in Qualcomm SDM845/APQ8098 SoC into
> "qcom,ath10k.txt".
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> ---
>  .../bindings/net/wireless/qcom,ath10k.txt          | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)

One nit, otherwise:

Reviewed-by: Rob Herring <robh@kernel.org>

> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> index 3d2a031..34e4f98 100644
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> @@ -4,6 +4,7 @@ Required properties:
>  - compatible: Should be one of the following:
>  	* "qcom,ath10k"
>  	* "qcom,ipq4019-wifi"
> +	* "qcom,wcn3990-wifi"
>  
>  PCI based devices uses compatible string "qcom,ath10k" and takes calibration
>  data along with board specific data via "qcom,ath10k-calibration-data".
> @@ -18,8 +19,12 @@ In general, entry "qcom,ath10k-pre-calibration-data" and
>  "qcom,ath10k-calibration-data" conflict with each other and only one
>  can be provided per device.
>  
> +SNOC based devices (i.e. wcn3990) uses compatible string "qcom,wcn3990-wifi".
> +
>  Optional properties:
>  - reg: Address and length of the register set for the device.
> +- reg-names: Must include the list of following reg names,
> +	     "membase"
>  - resets: Must contain an entry for each entry in reset-names.
>            See ../reset/reseti.txt for details.
>  - reset-names: Must include the list of following reset names,
> @@ -49,6 +54,8 @@ Optional properties:
>  				 hw versions.
>  - qcom,ath10k-pre-calibration-data : pre calibration data as an array,
>  				     the length can vary between hw versions.
> +- <supply-name>-supply: handle to the regulator device tree node
> +			   optional "supply-name" is "vdd-0.8-cx-mx".
>  
>  Example (to supply the calibration data alone):
>  
> @@ -119,3 +126,27 @@ wifi0: wifi@a000000 {
>  	qcom,msi_base = <0x40>;
>  	qcom,ath10k-pre-calibration-data = [ 01 02 03 ... ];
>  };
> +
> +Example (to supply wcn3990 SoC wifi block details):
> +
> +qcom,wifi@18000000 {

wifi@...

> +		compatible = "qcom,wcn3990-wifi";
> +		reg = <0x18800000 0x800000>;
> +		reg-names = "membase";
> +		clocks = <&clock_gcc clk_aggre2_noc_clk>;
> +		clock-names = "smmu_aggre2_noc_clk"
> +		interrupts =
> +			   <0 130 0 /* CE0 */ >,
> +			   <0 131 0 /* CE1 */ >,
> +			   <0 132 0 /* CE2 */ >,
> +			   <0 133 0 /* CE3 */ >,
> +			   <0 134 0 /* CE4 */ >,
> +			   <0 135 0 /* CE5 */ >,
> +			   <0 136 0 /* CE6 */ >,
> +			   <0 137 0 /* CE7 */ >,
> +			   <0 138 0 /* CE8 */ >,
> +			   <0 139 0 /* CE9 */ >,
> +			   <0 140 0 /* CE10 */ >,
> +			   <0 141 0 /* CE11 */ >;
> +		vdd-0.8-cx-mx-supply = <&pm8998_l5>;
> +};
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
