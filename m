Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-il1-f193.google.com ([209.85.166.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJOcw-000646-9s
 for ath10k@lists.infradead.org; Tue, 31 Mar 2020 21:40:55 +0000
Received: by mail-il1-f193.google.com with SMTP id k29so20969517ilg.0
 for <ath10k@lists.infradead.org>; Tue, 31 Mar 2020 14:40:54 -0700 (PDT)
Date: Tue, 31 Mar 2020 15:40:51 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: ath10k: Add wifi-firmware subnode
 for wifi node
Message-ID: <20200331214051.GA2053@bogus>
References: <1585134100-5944-1-git-send-email-pillair@codeaurora.org>
 <1585134100-5944-2-git-send-email-pillair@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1585134100-5944-2-git-send-email-pillair@codeaurora.org>
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
To: Rakesh Pillai <pillair@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

On Wed, Mar 25, 2020 at 04:31:38PM +0530, Rakesh Pillai wrote:
> Add a wifi-firmware subnode for the wifi node.
> This wifi-firmware subnode is needed for the
> targets which do not support TrustZone.
> 
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> ---
>  .../devicetree/bindings/net/wireless/qcom,ath10k.txt       | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> index 71bf91f..65ee68e 100644
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> @@ -96,6 +96,17 @@ Optional properties:
>  - qcom,coexist-gpio-pin : gpio pin number  information to support coex
>  			  which will be used by wifi firmware.
>  
> +* Subnodes
> +The ath10k wifi node can contain one optional firmware subnode.
> +Firmware subnode is needed when the platform does not have TustZone.
> +The firmware subnode must have:
> +
> +- iommus:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: A list of phandle and IOMMU specifier pairs.
> +
> +
>  Example (to supply PCI based wifi block details):
>  
>  In this example, the node is defined as child node of the PCI controller.
> @@ -196,4 +207,7 @@ wifi@18000000 {
>  		memory-region = <&wifi_msa_mem>;
>  		iommus = <&apps_smmu 0x0040 0x1>;
>  		qcom,msa-fixed-perm;
> +		wifi-firmware {
> +			iommus = <&apps_iommu 0xc22 0x1>;

Why can't you just add a 2nd entry to the existing 'iommus' property? 

A driver doing of_dma_configure() is generally not the right thing to 
do.

Rob

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
