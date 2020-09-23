Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLBqM-0001zh-PO
 for ath10k@lists.infradead.org; Wed, 23 Sep 2020 20:58:27 +0000
Received: by mail-io1-f67.google.com with SMTP id z13so978996iom.8
 for <ath10k@lists.infradead.org>; Wed, 23 Sep 2020 13:58:26 -0700 (PDT)
Date: Wed, 23 Sep 2020 14:58:24 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/2] dt: bindings: ath10k: Document
 qcom,ath10k-pre-calibration-data-mtd
Message-ID: <20200923205824.GA1290651@bogus>
References: <20200918181104.98-1-ansuelsmth@gmail.com>
 <20200918181104.98-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200918181104.98-2-ansuelsmth@gmail.com>
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
To: Ansuel Smith <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>

On Fri, Sep 18, 2020 at 08:11:03PM +0200, Ansuel Smith wrote:
> Document use of qcom,ath10k-pre-calibration-data-mtd bindings used to
> define from where the driver will load the pre-cal data in the defined
> mtd partition.
> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>  .../devicetree/bindings/net/wireless/qcom,ath10k.txt | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> index b61c2d5a0..568364243 100644
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> @@ -15,9 +15,9 @@ and also uses most of the properties defined in this doc (except
>  "qcom,ath10k-calibration-data"). It uses "qcom,ath10k-pre-calibration-data"
>  to carry pre calibration data.
>  
> -In general, entry "qcom,ath10k-pre-calibration-data" and
> -"qcom,ath10k-calibration-data" conflict with each other and only one
> -can be provided per device.
> +In general, entry "qcom,ath10k-pre-calibration-data",
> +"qcom,ath10k-calibration-data-mtd" and "qcom,ath10k-calibration-data" conflict with
> +each other and only one can be provided per device.
>  
>  SNOC based devices (i.e. wcn3990) uses compatible string "qcom,wcn3990-wifi".
>  
> @@ -63,6 +63,12 @@ Optional properties:
>  				 hw versions.
>  - qcom,ath10k-pre-calibration-data : pre calibration data as an array,
>  				     the length can vary between hw versions.
> +- qcom,ath10k-pre-calibration-data-mtd :

mtd is a Linuxism.

> +	Usage: optional
> +	Value type: <phandle offset size>
> +	Definition: pre calibration data read from mtd partition. Take 3 value, the
> +		    mtd to read data from, the offset in the mtd partition and the

The phandle is the mtd or partition?

Maybe you should be using nvmem binding here.

> +		    size of data to read.
>  - <supply-name>-supply: handle to the regulator device tree node
>  			   optional "supply-name" are "vdd-0.8-cx-mx",
>  			   "vdd-1.8-xo", "vdd-1.3-rfa", "vdd-3.3-ch0",
> -- 
> 2.27.0
> 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
