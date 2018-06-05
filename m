Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fQLDk-00020F-IE
 for ath10k@lists.infradead.org; Tue, 05 Jun 2018 23:18:34 +0000
Received: by mail-pg0-x244.google.com with SMTP id p21-v6so1981248pgd.11
 for <ath10k@lists.infradead.org>; Tue, 05 Jun 2018 16:18:19 -0700 (PDT)
Date: Tue, 5 Jun 2018 16:18:16 -0700
From: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH v2 3/6] dt: bindings: add bindings for msa memory region
Message-ID: <20180605231814.GB194157@rodete-desktop-imager.corp.google.com>
References: <20180605123616.528-1-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180605123616.528-1-govinds@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, bjorn.andersson@linaro.org, david.brown@linaro.org, Rob Herring <robh+dt@kernel.org>, andy.gross@linaro.org

+ Rob

On Tue, Jun 05, 2018 at 06:06:16PM +0530, Govind Singh wrote:
> Add device tree binding documentation details of msa
> memory region for ath10k qmi client for SDM845/APQ8098
> SoC into "qcom,ath10k.txt".
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> ---
>  .../devicetree/bindings/net/wireless/qcom,ath10k.txt          | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> index 7fd4e8ce4149..0efc47f4ba34 100644
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> @@ -56,6 +56,8 @@ Optional properties:
>  				     the length can vary between hw versions.
>  - <supply-name>-supply: handle to the regulator device tree node
>  			   optional "supply-name" is "vdd-0.8-cx-mx".
> +- msa-fixed-region: phandle, specifier to children of reserved MSA memory.

As in reserved-memory/reserved-memory.txt? Might refer to that doc here.
Or is this some other kind of reserved memory?

If the former, it's normally called just "memory-region", although
that does seem somewhat non-descriptive...

> +- msa-size: MSA memory size for fw internal use.

Do you really need both of these? It seems like your code uses one or
the other, not both. In which case, this is not a very good description,
because it sounds like they would go together.

Also, if you're not using standard/generic properties (e.g., the
aforementioned "memory-region" binding), you typically should use a
vendor prefix, like "qcom,msa-size".

Brian

>  
>  Example (to supply the calibration data alone):
>  
> @@ -133,6 +135,8 @@ wifi@18000000 {
>  		compatible = "qcom,wcn3990-wifi";
>  		reg = <0x18800000 0x800000>;
>  		reg-names = "membase";
> +		msa-fixed-region = <&wlan_msa_mem>;
> +		msa-size = <0x100000>;
>  		clocks = <&clock_gcc clk_aggre2_noc_clk>;
>  		clock-names = "smmu_aggre2_noc_clk"
>  		interrupts =
> -- 
> 2.17.0
> 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
