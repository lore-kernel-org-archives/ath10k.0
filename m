Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1coK4X-0000J0-Cl
 for ath10k@lists.infradead.org; Thu, 16 Mar 2017 01:19:23 +0000
From: Ryan Hsu <ryanhsu@qca.qualcomm.com>
Subject: Re: [PATCH v6 06/10] ath10k: add sdio extra initializations
Date: Thu, 16 Mar 2017 01:18:58 +0000
Message-ID: <9eb52257-2753-d9d0-2590-dd05c7aedea6@qca.qualcomm.com>
References: <148959263520.31432.8488419244476213373.stgit@potku.adurom.net>
 <148959276143.31432.4108050733445067980.stgit@potku.adurom.net>
In-Reply-To: <148959276143.31432.4108050733445067980.stgit@potku.adurom.net>
Content-Language: en-US
Content-ID: <CCEC07C4480BAD42AC620B45A38FC11B@qualcomm.com>
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 03/15/2017 08:46 AM, Kalle Valo wrote:

> From: Erik Stromdahl <erik.stromdahl@gmail.com>
>
> Extra initializations needed by all sdio boards.
> Derived from qcacld.
>
> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath10k/core.c |   22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> index f450ebbb28d5..6b6ea8a571fa 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -377,7 +377,22 @@ static void ath10k_send_suspend_complete(struct ath10k *ar)
>  	complete(&ar->target_suspend);
>  }
>  
> -static int ath10k_init_configure_target(struct ath10k *ar)
> +static void ath10k_sdio_extra_initialization(struct ath10k *ar)
> +{
> +	u32 param = 0;
> +
> +	ath10k_bmi_write32(ar, hi_mbox_io_block_sz, 256);
> +	ath10k_bmi_write32(ar, hi_mbox_isr_yield_limit, 99);
> +	ath10k_bmi_read32(ar, hi_acs_flags, &param);
> +
> +	param |= (HI_ACS_FLAGS_SDIO_SWAP_MAILBOX_SET |
> +		  HI_ACS_FLAGS_SDIO_REDUCE_TX_COMPL_SET |
> +		  HI_ACS_FLAGS_ALT_DATA_CREDIT_SIZE);
> +
> +	ath10k_bmi_write32(ar, hi_acs_flags, param);
> +}
> +
> +static int ath10k_init_sdio(struct ath10k *ar)

Shouldn't we just keep the ath10k_init_configure_target() and move the sdio specific to ath10k_sdio_extra_initialization()?
instead of renaming this to ath10k_init_sdio()? not sure if this is just a local hack that didn't revert?

>  {
>  	u32 param_host;
>  	int ret;
> @@ -1900,7 +1915,7 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode,
>  
>  	ath10k_bmi_start(ar);
>  
> -	if (ath10k_init_configure_target(ar)) {
> +	if (ath10k_init_sdio(ar)) {
>  		status = -EINVAL;
>  		goto err;
>  	}
> @@ -1933,6 +1948,9 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode,
>  	if (status)
>  		goto err;
>  
> +	if (ar->hif.bus == ATH10K_BUS_SDIO)
> +		ath10k_sdio_extra_initialization(ar);
> +
>  	ar->htc.htc_ops.target_send_suspend_complete =
>  		ath10k_send_suspend_complete;
>  

Ryan

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
