Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2qHG-0003yX-HV
 for ath10k@lists.infradead.org; Wed, 28 Aug 2019 05:13:51 +0000
Received: by mail-qt1-x843.google.com with SMTP id y26so1647694qto.4
 for <ath10k@lists.infradead.org>; Tue, 27 Aug 2019 22:13:47 -0700 (PDT)
MIME-Version: 1.0
References: <1566903707-27536-1-git-send-email-wgong@codeaurora.org>
 <1566903707-27536-3-git-send-email-wgong@codeaurora.org>
In-Reply-To: <1566903707-27536-3-git-send-email-wgong@codeaurora.org>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Wed, 28 Aug 2019 13:13:35 +0800
Message-ID: <CANMq1KAntBMo40jdv3T5k00EfjPzO1XvVdjL3oo2V9Eot1H4jg@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] ath10k: change max RX bundle size from 8 to 32 for
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

On Tue, Aug 27, 2019 at 7:02 PM Wen Gong <wgong@codeaurora.org> wrote:
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

For next time, please add changelist between v1 and v2 here.

>  drivers/net/wireless/ath/ath10k/htc.h  | 6 +++++-
>  drivers/net/wireless/ath/ath10k/sdio.c | 6 +++---
>  drivers/net/wireless/ath/ath10k/sdio.h | 4 ++--
>  3 files changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/htc.h b/drivers/net/wireless/ath/ath10k/htc.h
> index f55d3ca..8a07da0 100644
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
> @@ -52,6 +52,10 @@ enum ath10k_htc_rx_flags {
>         ATH10K_HTC_FLAG_BUNDLE_MASK     = 0xF0
>  };
>
> +#define HTC_GET_BUNDLE_COUNT(flags) \
> +           (FIELD_GET(ATH10K_HTC_FLAG_BUNDLE_MASK, (flags)) +  \
> +           (FIELD_GET(GENMASK(3, 2), (flags)) << 4))

That's not what I meant, I was expecting one more flag in the structure above
 ATH10K_HTC_FLAG_BUNDLE_EXTRA_MASK GENMASK = 0x0A

Then:
           (FIELD_GET(ATH10K_HTC_FLAG_BUNDLE_EXTRA_MASK, (flags)) << 4))

(I don't mind if you keep this macro anyway)

> +
>  struct ath10k_htc_hdr {
>         u8 eid; /* @enum ath10k_htc_ep_id */
>         u8 flags; /* @enum ath10k_htc_tx_flags, ath10k_htc_rx_flags */
> diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
> index eacb4d5..e5c365e 100644
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
