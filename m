Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWUvf-0000gm-8x
 for ath10k@lists.infradead.org; Mon, 10 Dec 2018 23:25:36 +0000
Received: by mail-ot1-f66.google.com with SMTP id a11so12215449otr.10
 for <ath10k@lists.infradead.org>; Mon, 10 Dec 2018 15:25:25 -0800 (PST)
Date: Mon, 10 Dec 2018 17:25:23 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: net: ath10k: fix node name and
 device type in qcom ath10k example
Message-ID: <20181210232523.GA14192@bogus>
References: <1544466691-11821-1-git-send-email-bperumal@codeaurora.org>
 <1544466691-11821-2-git-send-email-bperumal@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1544466691-11821-2-git-send-email-bperumal@codeaurora.org>
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

On Tue, Dec 11, 2018 at 12:01:29AM +0530, Bhagavathi Perumal S wrote:
> In qcom,ath10k documentation, ath10k is used as node name in the example of
> pci based device. Normally, node name shoud be class of device and not the model

s/shoud/should/

> name, so fix it to node name "wifi". And remove the property device_type pci
> since only pci bridges should have this property.
> 
> Signed-off-by: Bhagavathi Perumal S <bperumal@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> index 2196d1a..ef60f25 100644
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> @@ -74,9 +74,8 @@ pci {
>  		#address-cells = <3>;
>  		device_type = "pci";
>  
> -		ath10k@0,0 {
> +		wifi@0,0 {
>  			reg = <0 0 0 0 0>;
> -			device_type = "pci";
>  			qcom,ath10k-calibration-data = [ 01 02 03 ... ];
>  		};
>  	};
> -- 
> 1.9.1
> 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
