Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e036O-0001vy-LY
 for ath10k@lists.infradead.org; Thu, 05 Oct 2017 10:10:02 +0000
Received: by mail-wm0-x235.google.com with SMTP id 196so1146426wma.1
 for <ath10k@lists.infradead.org>; Thu, 05 Oct 2017 03:09:39 -0700 (PDT)
Date: Thu, 5 Oct 2017 12:09:32 +0200
From: Gary Bisson <gary.bisson@boundarydevices.com>
Subject: Re: [08/11] ath10k_sdio: common read write
Message-ID: <20171005100932.vamkzfulq3dg4iav@t450s.lan>
References: <1506793068-27445-9-git-send-email-alagusankar@silex-india.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1506793068-27445-9-git-send-email-alagusankar@silex-india.com>
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
To: silexcommon@gmail.com
Cc: Alagu Sankar <alagusankar@silex-india.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Hi Alagu,

On Sat, Sep 30, 2017 at 11:07:45PM +0530, silexcommon@gmail.com wrote:
> From: Alagu Sankar <alagusankar@silex-india.com>
> 
> convert different read write functions in sdio hif to bring it under a
> single read-write path. This helps in having a common dma bounce buffer
> implementation. Also helps in address modification that is required
> specific to change in certain mbox addresses of sdio_write.
> 
> Signed-off-by: Alagu Sankar <alagusankar@silex-india.com>
> ---
>  drivers/net/wireless/ath/ath10k/sdio.c | 131 ++++++++++++++++-----------------
>  1 file changed, 64 insertions(+), 67 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
> index 77d4fa4..bb6fa67 100644
> --- a/drivers/net/wireless/ath/ath10k/sdio.c
> +++ b/drivers/net/wireless/ath/ath10k/sdio.c
> @@ -36,6 +36,11 @@
>  
>  #define ATH10K_SDIO_DMA_BUF_SIZE	(32 * 1024)
>  
> +static int ath10k_sdio_read(struct ath10k *ar, u32 addr, void *buf,
> +			    u32 len, bool incr);
> +static int ath10k_sdio_write(struct ath10k *ar, u32 addr, const void *buf,
> +			     u32 len, bool incr);
> +

As mentioned by Kalle, u32 needs to be size_t.

>  /* inlined helper functions */
>  
>  /* Macro to check if DMA buffer is WORD-aligned and DMA-able.
> @@ -152,6 +157,7 @@ static int ath10k_sdio_config(struct ath10k *ar)
>  	struct sdio_func *func = ar_sdio->func;
>  	unsigned char byte, asyncintdelay = 2;
>  	int ret;
> +	u32 addr;
>  
>  	ath10k_dbg(ar, ATH10K_DBG_BOOT, "sdio configuration\n");
>  
> @@ -180,9 +186,8 @@ static int ath10k_sdio_config(struct ath10k *ar)
>  		 CCCR_SDIO_DRIVER_STRENGTH_ENABLE_C |
>  		 CCCR_SDIO_DRIVER_STRENGTH_ENABLE_D);
>  
> -	ret = ath10k_sdio_func0_cmd52_wr_byte(func->card,
> -					      CCCR_SDIO_DRIVER_STRENGTH_ENABLE_ADDR,
> -					      byte);
> +	addr = CCCR_SDIO_DRIVER_STRENGTH_ENABLE_ADDR,
> +	ret = ath10k_sdio_func0_cmd52_wr_byte(func->card, addr, byte);

Not sure this part is needed.

>  	if (ret) {
>  		ath10k_warn(ar, "failed to enable driver strength: %d\n", ret);
>  		goto out;
> @@ -233,13 +238,16 @@ static int ath10k_sdio_config(struct ath10k *ar)
>  
>  static int ath10k_sdio_write32(struct ath10k *ar, u32 addr, u32 val)
>  {
> -	struct ath10k_sdio *ar_sdio = ath10k_sdio_priv(ar);
> -	struct sdio_func *func = ar_sdio->func;
> +	__le32 *buf;
>  	int ret;
>  
> -	sdio_claim_host(func);
> +	buf = kzalloc(sizeof(*buf), GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
>  
> -	sdio_writel(func, val, addr, &ret);
> +	*buf = cpu_to_le32(val);
> +
> +	ret = ath10k_sdio_write(ar, addr, &val, sizeof(val), true);

Shouldn't we use buf instead of val? buf seems pretty useless otherwise.

Regards,
Gary

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
