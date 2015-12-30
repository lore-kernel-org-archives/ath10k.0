Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.kernel.org ([198.145.29.136])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aEJj3-0006vV-2q
 for ath10k@lists.infradead.org; Wed, 30 Dec 2015 16:35:49 +0000
Date: Wed, 30 Dec 2015 10:35:24 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt: bindings: add bindings for ipq4019 wifi block
Message-ID: <20151230163524.GA26810@rob-hp-laptop>
References: <1450848915-9772-1-git-send-email-rmani@qti.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1450848915-9772-1-git-send-email-rmani@qti.qualcomm.com>
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
To: Raja Mani <rmani@qti.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, mmcclint@qca.qualcomm.com, agross@codeaurora.org

On Wed, Dec 23, 2015 at 11:05:15AM +0530, Raja Mani wrote:
> Add device tree binding documentation details for wifi block present
> in Qualcomm IPQ4019 SoC into qcom,ath10k.txt.
> 
> Signed-off-by: Raja Mani <rmani@qti.qualcomm.com>
> ---
>  .../bindings/net/wireless/qcom,ath10k.txt          | 87 ++++++++++++++++++++--
>  1 file changed, 82 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> index edefc26..ffd0742 100644
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> @@ -1,17 +1,42 @@
>  * Qualcomm Atheros ath10k wireless devices
>  
> -For ath10k devices the calibration data can be provided through Device
> -Tree. The node is a child node of the PCI controller.

So it is now not a PCI device?

> -
>  Required properties:
> --compatible : Should be "qcom,ath10k"
> +- compatible: Should be one of the following:
> +	* "qcom,ath10k"
> +	* "qcom,ipq4019-wifi"

One is a standalone PCI device and one is embedded block in an SOC? 
These should be more separated as all these new properties would only 
apply in the latter case.

>  
>  Optional properties:
> +- reg: Address and length of the register set for the device.
> +- core-id: Core number associated to the device.

This needs a better explanation.

> +- resets: Must contain an entry for each entry in reset-names.
> +          See ../reset/reseti.txt for details.
> +- reset-names: Must include the list of following reset names,
> +	       "wifi_cpu_init"
> +	       "wifi_radio_srif"
> +	       "wifi_radio_warm"
> +	       "wifi_radio_cold"
> +	       "wifi_core_warm"
> +	       "wifi_core_cold"
> +- clocks: List of clock specifiers, must contain an entry for each required
> +          entry in clock-names.
> +- clock-names: Should contain the clock names "wifi_wcss_cmd", "wifi_wcss_ref",
> +               "wifi_wcss_rtc".
> +- interrupts: List of interrupt lines. Must contain an entry
> +	      for each entry in the interrupt-names property.
> +- interrupt-names: Must include the entries for MSI interrupt
> +		   names ("msi0" to "msi15") and legacy interrupt
> +		   name ("legacy"),
> +- qca,msi_addr: MSI interrupt address.
> +- qca,msi_base: Base value to add before writing MSI data into
> +		MSI address register.

Why don't the standard MSI properties work?

>  - qcom,ath10k-calibration-data : calibration data as an array, the
>  				 length can vary between hw versions
> +- status: Either "disabled" or "ok".
> +

No need to document status here.

Rob

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
