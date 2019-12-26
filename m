Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-il1-f196.google.com ([209.85.166.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ikYET-0001qO-IS
 for ath10k@lists.infradead.org; Thu, 26 Dec 2019 18:51:38 +0000
Received: by mail-il1-f196.google.com with SMTP id g12so20803597ild.2
 for <ath10k@lists.infradead.org>; Thu, 26 Dec 2019 10:51:35 -0800 (PST)
Date: Thu, 26 Dec 2019 11:51:32 -0700
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: ath10k: Add new dt entries to identify
 coex support
Message-ID: <20191226185132.GA31120@bogus>
References: <1576496415-23064-1-git-send-email-tamizhr@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1576496415-23064-1-git-send-email-tamizhr@codeaurora.org>
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
To: Tamizh Chelvam <tamizhr@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Mon, Dec 16, 2019 at 05:10:14PM +0530, Tamizh Chelvam wrote:
> This adds new dt entries qcom,coexist-support and qcom,coexist-gpio-pin
> which will be used by ath10k driver to identify coex support
> of a hardware and notify wifi firmware the gpio pin number.
> This pin number information is needed for the hardware QCA4019.
> 
> Signed-off-by: Tamizh Chelvam <tamizhr@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> index 0171283..a41e936 100644
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> @@ -87,6 +87,10 @@ Optional properties:
>  	Definition: Quirk specifying that the firmware expects the 8bit version
>  		    of the host capability QMI request
>  - qcom,xo-cal-data: xo cal offset to be configured in xo trim register.
> +- qcom,coexist-support : should contain eithr "0" or "1" to indicate coex
> +			 support by the hardware.
> +- qcom,coexist-gpio-pin : gpio pin number  information to support coex
> +			  which will be used by wifi firmware.

What combinations of these 2 properties are valid?

Is qcom,coexist-gpio-pin required for coexist support? If so then it 
alone should be enough to enable/disable coexist.

>  
>  Example (to supply PCI based wifi block details):
>  
> @@ -156,6 +160,8 @@ wifi0: wifi@a000000 {
>  	qcom,msi_addr = <0x0b006040>;
>  	qcom,msi_base = <0x40>;
>  	qcom,ath10k-pre-calibration-data = [ 01 02 03 ... ];
> +	qcom,coexist-support = <1>;
> +	qcom,coexist-gpio-pin = <0x33>;
>  };
>  
>  Example (to supply wcn3990 SoC wifi block details):
> -- 
> 1.9.1

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
