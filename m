Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3XJl-0006iu-Ou
 for ath10k@lists.infradead.org; Fri, 30 Aug 2019 03:11:19 +0000
Received: by mail-qk1-x743.google.com with SMTP id m2so4905693qkd.10
 for <ath10k@lists.infradead.org>; Thu, 29 Aug 2019 20:11:17 -0700 (PDT)
MIME-Version: 1.0
References: <1566998177-2658-1-git-send-email-wgong@codeaurora.org>
 <1566998177-2658-4-git-send-email-wgong@codeaurora.org>
In-Reply-To: <1566998177-2658-4-git-send-email-wgong@codeaurora.org>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Fri, 30 Aug 2019 11:11:05 +0800
Message-ID: <CANMq1KDLXsar1AqU=mfce-2LGD7SRDmC5phkKtz92D3BG35Eog@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] ath10k: change max RX bundle size from 8 to 32 for
 sdio
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
To: Wen Gong <wgong@codeaurora.org>
Cc: "open list:NETWORKING DRIVERS (WIRELESS)" <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

On Fri, Aug 30, 2019 at 1:49 AM Wen Gong <wgong@codeaurora.org> wrote:
>
> The max bundle size support by firmware is 32, change it from 8 to 32
> will help performance. This results in significant performance
> improvement on RX path.
>
> Tested with QCA6174 SDIO with firmware
> WLAN.RMH.4.4.1-00007-QCARMSWP-1.
>
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> ---
> v2:change macro HTC_GET_BUNDLE_COUNT
> v3:change some code style
>  drivers/net/wireless/ath/ath10k/htc.h  | 8 +++++++-
>  drivers/net/wireless/ath/ath10k/sdio.c | 6 +++---
>  drivers/net/wireless/ath/ath10k/sdio.h | 4 ++--
>  3 files changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/htc.h b/drivers/net/wireless/ath/ath10k/htc.h
> index f55d3ca..ffda8bf 100644
> --- a/drivers/net/wireless/ath/ath10k/htc.h
> +++ b/drivers/net/wireless/ath/ath10k/htc.h
> @@ -39,7 +39,7 @@
>   * 4-byte aligned.
>   */
>
> -#define HTC_HOST_MAX_MSG_PER_RX_BUNDLE        8
> +#define HTC_HOST_MAX_MSG_PER_RX_BUNDLE        32
>
>  enum ath10k_htc_tx_flags {
>         ATH10K_HTC_FLAG_NEED_CREDIT_UPDATE = 0x01,
> @@ -52,6 +52,12 @@ enum ath10k_htc_rx_flags {
>         ATH10K_HTC_FLAG_BUNDLE_MASK     = 0xF0
>  };
>
> +#define BUNDLE_EXTRA_MASK GENMASK(3, 2)

Well, ATH10K_HTC_FLAG_BUNDLE_MASK is defined in a struct, set to a hex value.
This is a macro, set to a GENMASK() value.

I don't care how you do it, but please be consistent.

In this case, please add ATH10K_HTC_FLAG_BUNDLE_EXTRA_MASK GENMASK =
0x0A in the enum above (sorry, I say structure in my previous
comment).

> +
> +#define HTC_GET_BUNDLE_COUNT(flags) \
> +           (FIELD_GET(ATH10K_HTC_FLAG_BUNDLE_MASK, (flags)) +  \
> +           (FIELD_GET(BUNDLE_EXTRA_MASK, (flags)) << 4))
> +
>  struct ath10k_htc_hdr {
>         u8 eid; /* @enum ath10k_htc_ep_id */
>         u8 flags; /* @enum ath10k_htc_tx_flags, ath10k_htc_rx_flags */
> diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
> index 23c998d..bd808e5 100644
> --- a/drivers/net/wireless/ath/ath10k/sdio.c
> +++ b/drivers/net/wireless/ath/ath10k/sdio.c
> @@ -24,8 +24,8 @@
>  #include "trace.h"
>  #include "sdio.h"
>
> -#define ATH10K_SDIO_DMA_BUF_SIZE       (32 * 1024)
> -#define ATH10K_SDIO_VSG_BUF_SIZE       (32 * 1024)
> +#define ATH10K_SDIO_DMA_BUF_SIZE       (64 * 1024)
> +#define ATH10K_SDIO_VSG_BUF_SIZE       (64 * 1024)
>
>  /* inlined helper functions */
>
> @@ -495,7 +495,7 @@ static int ath10k_sdio_mbox_alloc_bundle(struct ath10k *ar,
>  {
>         int ret, i;
>
> -       *bndl_cnt = FIELD_GET(ATH10K_HTC_FLAG_BUNDLE_MASK, htc_hdr->flags);
> +       *bndl_cnt = HTC_GET_BUNDLE_COUNT(htc_hdr->flags);
>
>         if (*bndl_cnt > HTC_HOST_MAX_MSG_PER_RX_BUNDLE) {
>                 ath10k_warn(ar,
> diff --git a/drivers/net/wireless/ath/ath10k/sdio.h b/drivers/net/wireless/ath/ath10k/sdio.h
> index 4896eca..3ca76c7 100644
> --- a/drivers/net/wireless/ath/ath10k/sdio.h
> +++ b/drivers/net/wireless/ath/ath10k/sdio.h
> @@ -89,10 +89,10 @@
>   * to the maximum value (HTC_HOST_MAX_MSG_PER_RX_BUNDLE).
>   *
>   * in this case the driver must allocate
> - * (HTC_HOST_MAX_MSG_PER_RX_BUNDLE * HTC_HOST_MAX_MSG_PER_RX_BUNDLE) skb's.
> + * (HTC_HOST_MAX_MSG_PER_RX_BUNDLE * 2) skb's.
>   */
>  #define ATH10K_SDIO_MAX_RX_MSGS \
> -       (HTC_HOST_MAX_MSG_PER_RX_BUNDLE * HTC_HOST_MAX_MSG_PER_RX_BUNDLE)
> +       (HTC_HOST_MAX_MSG_PER_RX_BUNDLE * 2)
>
>  #define ATH10K_FIFO_TIMEOUT_AND_CHIP_CONTROL   0x00000868u
>  #define ATH10K_FIFO_TIMEOUT_AND_CHIP_CONTROL_DISABLE_SLEEP_OFF 0xFFFEFFFF
> --
> 1.9.1
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
