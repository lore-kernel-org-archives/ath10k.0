Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9ELT-0003e9-UD
 for ath10k@lists.infradead.org; Wed, 27 Mar 2019 19:36:22 +0000
Received: by mail-oi1-f193.google.com with SMTP id 3so13862732oir.7
 for <ath10k@lists.infradead.org>; Wed, 27 Mar 2019 12:36:19 -0700 (PDT)
Date: Wed, 27 Mar 2019 14:36:17 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt: bindings: add dt entry for XO calibration support
Message-ID: <20190327193617.GA18283@bogus>
References: <20190302050635.17694-1-govinds@codeaurora.org>
 <20190302050635.17694-2-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190302050635.17694-2-govinds@codeaurora.org>
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

On Sat, Mar 02, 2019 at 10:36:34AM +0530, Govind Singh wrote:
> Add dt binding to get xo calibration data support for wifi rf clock.
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> index ae661e65354e..ab8042866e83 100644
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> @@ -81,6 +81,7 @@ Optional properties:
>  	Definition: Name of external front end module used. Some valid FEM names
>  		    for example: "microsemi-lx5586", "sky85703-11"
>  		    and "sky85803" etc.
> +- xo-cal-data: xo cal offset to be configured in xo trim register.

Should have a vendor prefix.

Rob

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
