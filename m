Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cocdf-0001qb-Rd
 for ath10k@lists.infradead.org; Thu, 16 Mar 2017 21:08:55 +0000
From: Ryan Hsu <ryanhsu@qca.qualcomm.com>
Subject: Re: [PATCH v6 09/10] ath10k: different fw file names for usb and sdio
Date: Thu, 16 Mar 2017 21:08:20 +0000
Message-ID: <e25f7672-0114-7928-7f4a-cf64638dc900@qca.qualcomm.com>
References: <148959263520.31432.8488419244476213373.stgit@potku.adurom.net>
 <148959280431.31432.16087997710973721077.stgit@potku.adurom.net>
In-Reply-To: <148959280431.31432.16087997710973721077.stgit@potku.adurom.net>
Content-Language: en-US
Content-ID: <A417F799E8D3F249924C32FBE0A70CBE@qualcomm.com>
MIME-Version: 1.0
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
To: Kalle Valo <kvalo@qca.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

On 03/15/2017 08:46 AM, Kalle Valo wrote:

> From: Erik Stromdahl <erik.stromdahl@gmail.com>
>
> Since both SDIO and USB based chipsets will use different

nitpick, since the patch is separating the USB and SDIO support now, maybe you want to remove the "USB" from the patch title?

> firmware from the PCIe and AHB chipsets, the fw file name
> must be different depending on bus type.
>
> The new firmware names are:
>
> For PCIe and AHB:
> firmware-<api_version>.bin (same as before)
>
> For SDIO:
> firmware-sdio-<api_version>.bin
>
> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath10k/core.c |   13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> index d7fb11107df4..d2648d09a772 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -1398,7 +1398,18 @@ int ath10k_core_fetch_firmware_api_n(struct ath10k *ar, const char *name,
>  static void ath10k_core_get_fw_name(struct ath10k *ar, char *fw_name,
>  				    size_t fw_name_len, int fw_api)
>  {
> -	scnprintf(fw_name, fw_name_len, "%s-%d.bin", ATH10K_FW_FILE_BASE, fw_api);
> +	switch (ar->hif.bus) {
> +	case ATH10K_BUS_SDIO:
> +		scnprintf(fw_name, fw_name_len, "%s-%s-%d.bin",
> +			  ATH10K_FW_FILE_BASE, ath10k_bus_str(ar->hif.bus),
> +			  fw_api);
> +		break;
> +	case ATH10K_BUS_PCI:
> +	case ATH10K_BUS_AHB:
> +		scnprintf(fw_name, fw_name_len, "%s-%d.bin",
> +			  ATH10K_FW_FILE_BASE, fw_api);
> +		break;
> +	}
>  }
>  
>  static int ath10k_core_fetch_firmware_files(struct ath10k *ar)
>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
