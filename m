Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVKbi-0003zd-Jk
 for ath10k@lists.infradead.org; Thu, 14 Nov 2019 19:16:43 +0000
Received: by mail-oi1-f193.google.com with SMTP id s71so6294571oih.11
 for <ath10k@lists.infradead.org>; Thu, 14 Nov 2019 11:16:42 -0800 (PST)
Date: Thu, 14 Nov 2019 13:16:40 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt: bindings: add dt entry flag to skip SCM call
 for msa region
Message-ID: <20191114191640.GA8426@bogus>
References: <20191111042508.12628-1-govinds@codeaurora.org>
 <20191111042508.12628-2-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191111042508.12628-2-govinds@codeaurora.org>
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

On Mon, Nov 11, 2019 at 09:55:07AM +0530, Govind Singh wrote:
> Add boolean context flag to disable SCM call for statically
> mapped msa region.

Can't this be implied by the compatible string?

> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> ---
>  .../devicetree/bindings/net/wireless/qcom,ath10k.txt          | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> index 017128394a3e..7ba22918bab7 100644
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> @@ -88,6 +88,9 @@ Optional properties:
>  		    of the host capability QMI request
>  - qcom,xo-cal-data: xo cal offset to be configured in xo trim register.
>  
> +- qcom,msa_fixed_perm: Boolean context flag to disable SCM call for statically
> +		       mapped msa region.
> +

s/_/-/

>  Example (to supply PCI based wifi block details):
>  
>  In this example, the node is defined as child node of the PCI controller.
> @@ -185,4 +188,5 @@ wifi@18000000 {
>  		vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
>  		memory-region = <&wifi_msa_mem>;
>  		iommus = <&apps_smmu 0x0040 0x1>;
> +		qcom,msa_fixed_perm;
>  };
> -- 
> 2.22.0
> 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
