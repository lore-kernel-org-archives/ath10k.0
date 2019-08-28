Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2qf5-0003cv-Ad
 for ath10k@lists.infradead.org; Wed, 28 Aug 2019 05:38:28 +0000
Received: by mail-qk1-x741.google.com with SMTP id 201so1364892qkm.9
 for <ath10k@lists.infradead.org>; Tue, 27 Aug 2019 22:38:26 -0700 (PDT)
MIME-Version: 1.0
References: <1566903707-27536-1-git-send-email-wgong@codeaurora.org>
 <1566903707-27536-7-git-send-email-wgong@codeaurora.org>
In-Reply-To: <1566903707-27536-7-git-send-email-wgong@codeaurora.org>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Wed, 28 Aug 2019 13:38:14 +0800
Message-ID: <CANMq1KDJSwyzz2y-yadJPnGijm=G6y0zg1tMZDyacH8a990BOg@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] ath10k: enable alt data of TX path for sdio
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
> The default credit size is 1792 bytes, but the IP mtu is 1500 bytes,
> then it has about 290 bytes's waste for each data packet on sdio
> transfer path for TX bundle, it will reduce the transmission utilization
> ratio for data packet.
>
> This patch enable the small credit size in firmware, firmware will use
> the new credit size 1556 bytes, it will increase the transmission
> utilization ratio for data packet on TX patch. It results in significant
> performance improvement on TX path.
>
> This patch only effect sdio chip, it will not effect PCI, SNOC etc.
>
> Tested with QCA6174 SDIO with firmware
> WLAN.RMH.4.4.1-00017-QCARMSWP-1.
>
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> ---
>  drivers/net/wireless/ath/ath10k/core.c | 16 ++++++++++++++++
>  drivers/net/wireless/ath/ath10k/htc.c  | 11 +++++++++--
>  drivers/net/wireless/ath/ath10k/htc.h  | 11 +++++++++--
>  3 files changed, 34 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> index 351f4ed..7593d19 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -31,6 +31,7 @@
>  static unsigned int ath10k_cryptmode_param;
>  static bool uart_print;
>  static bool disable_tx_comp = true;
> +static bool alt_data = true;
>  static bool skip_otp;
>  static bool rawmode;
>  static bool fw_diag_log;
> @@ -45,6 +46,15 @@
>
>  /* If upper layer need the TX complete status, it can enable tx complete */
>  module_param(disable_tx_comp, bool, 0644);
> +
> +/* alt_data is only used for sdio chip, for previous version of firmware, its
> + * alt data size is 1544 which is not enough for native wifi, so it need to
> + * alt_data for the firmware.
> + * If the firmware has changed alt data size to 1556, then it can enable
> + * alt_data for the firmware.
> + * alt_data will not effect PCI, SNOC etc.
> + */
> +module_param(alt_data, bool, 0644);
>  module_param(skip_otp, bool, 0644);
>  module_param(rawmode, bool, 0644);
>  module_param(fw_diag_log, bool, 0644);
> @@ -701,6 +711,12 @@ static void ath10k_init_sdio(struct ath10k *ar, enum ath10k_firmware_mode mode)
>          */
>         param &= ~HI_ACS_FLAGS_ALT_DATA_CREDIT_SIZE;
>
> +       /* If alternate credit size of 1556 as used by SDIO firmware is
> +        * big enough for mac80211 / native wifi frames. enable it
> +        */
> +       if (alt_data && mode == ATH10K_FIRMWARE_MODE_NORMAL)
> +               param |= HI_ACS_FLAGS_ALT_DATA_CREDIT_SIZE;

else
     param &= ~HI_ACS_FLAGS_ALT_DATA_CREDIT_SIZE;

(and remove the mask above)

> +
>         if (mode == ATH10K_FIRMWARE_MODE_UTF)
>                 param &= ~HI_ACS_FLAGS_SDIO_SWAP_MAILBOX_SET;
>         else
> diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
> index e0eb5f0..5cacab6 100644
> --- a/drivers/net/wireless/ath/ath10k/htc.c
> +++ b/drivers/net/wireless/ath/ath10k/htc.c
> @@ -938,12 +938,15 @@ int ath10k_htc_wait_target(struct ath10k_htc *htc)
>          */
>         if (htc->control_resp_len >=
>             sizeof(msg->hdr) + sizeof(msg->ready_ext)) {
> +               htc->alt_data_credit_size =
> +                       __le16_to_cpu(msg->ready_ext.reserved) & 0x0fff;

Please define 0x0fff as a macro.

>                 htc->max_msgs_per_htc_bundle =
>                         min_t(u8, msg->ready_ext.max_msgs_per_htc_bundle,
>                               HTC_HOST_MAX_MSG_PER_RX_BUNDLE);
>                 ath10k_dbg(ar, ATH10K_DBG_HTC,
> -                          "Extended ready message. RX bundle size: %d\n",
> -                          htc->max_msgs_per_htc_bundle);
> +                          "Extended ready message. RX bundle size: %d, alt size:%d\n",
> +                          htc->max_msgs_per_htc_bundle,
> +                          htc->alt_data_credit_size);
>         }
>
>         INIT_WORK(&ar->bundle_tx_work, ath10k_htc_bundle_tx_work);
> @@ -1095,6 +1098,10 @@ int ath10k_htc_connect_service(struct ath10k_htc *htc,
>         ep->tx_credits = tx_alloc;
>         ep->tx_credit_size = htc->target_credit_size;
>
> +       if (conn_req->service_id == ATH10K_HTC_SVC_ID_HTT_DATA_MSG &&
> +           htc->alt_data_credit_size != 0)
> +               ep->tx_credit_size = htc->alt_data_credit_size;
> +
>         /* copy all the callbacks */
>         ep->ep_ops = conn_req->ep_ops;
>
> diff --git a/drivers/net/wireless/ath/ath10k/htc.h b/drivers/net/wireless/ath/ath10k/htc.h
> index d805ea5..f0a9e60af 100644
> --- a/drivers/net/wireless/ath/ath10k/htc.h
> +++ b/drivers/net/wireless/ath/ath10k/htc.h
> @@ -139,8 +139,14 @@ struct ath10k_htc_ready_extended {
>         struct ath10k_htc_ready base;
>         u8 htc_version; /* @enum ath10k_htc_version */
>         u8 max_msgs_per_htc_bundle;
> -       u8 pad0;
> -       u8 pad1;
> +       union {
> +               __le16 reserved;
> +               struct {
> +                       u8 pad0;
> +                       u8 pad1;
> +               } __packed;
> +       } __packed;
> +
>  } __packed;
>
>  struct ath10k_htc_conn_svc {
> @@ -377,6 +383,7 @@ struct ath10k_htc {
>         int total_transmit_credits;
>         int target_credit_size;
>         u8 max_msgs_per_htc_bundle;
> +       int alt_data_credit_size;
>  };
>
>  int ath10k_htc_init(struct ath10k *ar);
> --
> 1.9.1
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
