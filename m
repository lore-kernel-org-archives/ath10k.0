Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.kernel.org ([198.145.29.136])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aJu0L-0006Su-9C
 for ath10k@lists.infradead.org; Fri, 15 Jan 2016 02:20:45 +0000
Date: Thu, 14 Jan 2016 20:20:21 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3] dt: bindings: add bindings for ipq4019 wifi block
Message-ID: <20160115022021.GA27099@rob-hp-laptop>
References: <1452664604-8014-1-git-send-email-rmani@qti.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1452664604-8014-1-git-send-email-rmani@qti.qualcomm.com>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, agross@codeaurora.org

On Wed, Jan 13, 2016 at 11:26:44AM +0530, Raja Mani wrote:
> Add device tree binding documentation details for wifi block present
> in Qualcomm IPQ4019 SoC into "qcom,ath10k.txt".
> 
> Right now, ath10k wireless driver has support for PCI based wlan devices.
> There is a plan to extend ath10k driver to support wifi devices which are
> connected over AHB as well (enumeration will happen via device tree node).
> For AHB based devices (ie, ipq4019), all wifi properties are supplied via
> device tree (including irq, reg addr, cal data,etc).
> 
> Signed-off-by: Raja Mani <rmani@qti.qualcomm.com>
> ---
> v3 changes:
>   - Removed core-id - [Rob]
>   - Documented which compatible string corresponds to pci devices
>     and which corresponds to ahb devices. - [Rob]
> 
> v2 changes:
>  - Improved "core-id" description - [Rob]
>  - Removed "status" documentation - [Rob]
>  - Added description which properties are applicable
>    for ahb and which are applicable for pci devices - [Rob]
>  - Improved commit msg to explain the context.
>  - Renamed "qca,msi_addr" to "qcom,msi_addr" and
>    "qca,msi_base" to "qcom,msi_base" to follow uniformity.
> 
>  .../bindings/net/wireless/qcom,ath10k.txt          | 89 ++++++++++++++++++++--
>  1 file changed, 84 insertions(+), 5 deletions(-)

A few typos, otherwise:

Acked-by: Rob Herring <robh@kernel.org>

> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> index edefc26..bf8c0f8c 100644
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> @@ -1,17 +1,46 @@
>  * Qualcomm Atheros ath10k wireless devices
>  
> -For ath10k devices the calibration data can be provided through Device
> -Tree. The node is a child node of the PCI controller.
> -
>  Required properties:
> --compatible : Should be "qcom,ath10k"
> +- compatible: Should be one of the following:
> +	* "qcom,ath10k"
> +	* "qcom,ipq4019-wifi"
> +
> +PCI based devices uses compatible string "qcom,ath10k" and takes only
> +calibration data via "qcom,ath10k-calibration-data". Reset of the properties

s/Reset/Rest/

> +are not applicable for PCI based devices.
> +
> +AHB based devices (ie, ipq4019) uses compatible string "qcom,ipq4019-wifi"

s/ie,/i.e./

> +and also uses most of the properties defined in this doc.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
