Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gC8To-0006rj-93
 for ath10k@lists.infradead.org; Mon, 15 Oct 2018 19:24:41 +0000
Received: by mail-oi1-f194.google.com with SMTP id e17-v6so16028116oib.4
 for <ath10k@lists.infradead.org>; Mon, 15 Oct 2018 12:24:28 -0700 (PDT)
Date: Mon, 15 Oct 2018 14:24:25 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt: bindings: add new dt entry to indentify external
 FEM
Message-ID: <20181015192425.GA19699@bogus>
References: <1538653364-1239-1-git-send-email-bperumal@codeaurora.org>
 <1538653364-1239-2-git-send-email-bperumal@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1538653364-1239-2-git-send-email-bperumal@codeaurora.org>
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
To: Bhagavathi Perumal S <bperumal@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Thu, Oct 04, 2018 at 05:12:43PM +0530, Bhagavathi Perumal S wrote:
> This adds new dt entry ext-fem-name, it is used by ath10k driver
> to select correct timing parameters and configure it in target wifi hardware.
> The Front End Module(FEM) normally includes tx power amplifier(PA) and
> rx low noise amplifier(LNA). The default timing parameters like tx end to
> PA off timing values were fine tuned for internal FEM used in reference
> design. And these timing values can not be same if ODM modifies hardware
> design with different external FEM. This DT entry helps to choose correct
> timing values in driver if different external FEM hardware used.

'dt-bindings: net: ath10k: ...' for the subject please.

> 
> Signed-off-by: Bhagavathi Perumal S <bperumal@codeaurora.org>
> ---
>  .../bindings/net/wireless/qcom,ath10k.txt          | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> index 7fd4e8c..fbaf309 100644
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> @@ -56,6 +56,7 @@ Optional properties:
>  				     the length can vary between hw versions.
>  - <supply-name>-supply: handle to the regulator device tree node
>  			   optional "supply-name" is "vdd-0.8-cx-mx".
> +- ext-fem-name: name of external front end module used.

What are valid names? What if the OS doesn't recognize the name? Perhaps 
this should be a compatible string for the particular module instead? 
Then it could cover any differences, not just the FEM.

>  
>  Example (to supply the calibration data alone):
>  
> @@ -150,3 +151,24 @@ wifi@18000000 {
>  			   <0 141 0 /* CE11 */ >;
>  		vdd-0.8-cx-mx-supply = <&pm8998_l5>;
>  };
> +
> +Example (to supply the external front end module name):
> +
> +In this example, the front end module is defined as a property of the ath10k
> +device node.

Really need a whole new example for 1 property?

> +
> +pci {
> +	pcie@0 {
> +		reg = <0 0 0 0 0>;
> +		#interrupt-cells = <1>;
> +		#size-cells = <2>;
> +		#address-cells = <3>;
> +		device_type = "pci";
> +
> +		ath10k@0,0 {

wifi@0,0

> +			reg = <0 0 0 0 0>;
> +			device_type = "pci";
> +			ext-fem-name = "microsemi-lx5586";
> +		};
> +	};
> +};
> -- 
> 1.9.1
> 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
