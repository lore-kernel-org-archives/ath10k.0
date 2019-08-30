Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3XQe-0008DD-D8
 for ath10k@lists.infradead.org; Fri, 30 Aug 2019 03:18:26 +0000
Received: by mail-qk1-x743.google.com with SMTP id i78so3497434qke.11
 for <ath10k@lists.infradead.org>; Thu, 29 Aug 2019 20:18:23 -0700 (PDT)
MIME-Version: 1.0
References: <1566998177-2658-1-git-send-email-wgong@codeaurora.org>
 <1566998177-2658-8-git-send-email-wgong@codeaurora.org>
In-Reply-To: <1566998177-2658-8-git-send-email-wgong@codeaurora.org>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Fri, 30 Aug 2019 11:18:12 +0800
Message-ID: <CANMq1KDcUEy6ruzyLT2H_TCf_fNS7FY9s3aCxEW4nkg55avmSQ@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] ath10k: enable alt data of TX path for sdio
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

On Fri, Aug 30, 2019 at 1:39 AM Wen Gong <wgong@codeaurora.org> wrote:
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
> v2:no change
> v3:change some code style
>  drivers/net/wireless/ath/ath10k/core.c | 19 +++++++++++++++++--
>  drivers/net/wireless/ath/ath10k/htc.c  | 11 +++++++++--
>  drivers/net/wireless/ath/ath10k/htc.h  | 11 +++++++++--
>  3 files changed, 35 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> index 9841533..9fd07c7 100644
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
> @@ -698,9 +708,14 @@ static void ath10k_init_sdio(struct ath10k *ar, enum ath10k_firmware_mode mode)
>                 param &= ~HI_ACS_FLAGS_SDIO_REDUCE_TX_COMPL_SET;
>
>         /* Alternate credit size of 1544 as used by SDIO firmware is
> -        * not big enough for mac80211 / native wifi frames. disable it
> +        * not big enough for mac80211 / native wifi frames. disable it.
> +        * If alternate credit size of 1556 as used by SDIO firmware is
> +        * big enough for mac80211 / native wifi frames. enable it
>          */
> -       param &= ~HI_ACS_FLAGS_ALT_DATA_CREDIT_SIZE;
> +       if (alt_data && mode == ATH10K_FIRMWARE_MODE_NORMAL)
> +               param |= HI_ACS_FLAGS_ALT_DATA_CREDIT_SIZE;
> +       else
> +               param &= ~HI_ACS_FLAGS_ALT_DATA_CREDIT_SIZE;
>
>         if (mode == ATH10K_FIRMWARE_MODE_UTF)
>                 param &= ~HI_ACS_FLAGS_SDIO_SWAP_MAILBOX_SET;
> diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
> index 5269168..04298e1 100644
> --- a/drivers/net/wireless/ath/ath10k/htc.c
> +++ b/drivers/net/wireless/ath/ath10k/htc.c
> @@ -940,12 +940,15 @@ int ath10k_htc_wait_target(struct ath10k_htc *htc)
>          */
>         if (htc->control_resp_len >=
>             sizeof(msg->hdr) + sizeof(msg->ready_ext)) {
> +               htc->alt_data_credit_size =
> +                       __le16_to_cpu(msg->ready_ext.reserved) & 0x0fff;

Please define 0x0fff as a macro. (I believe most other masks are
macros in this driver).

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
> @@ -1097,6 +1100,10 @@ int ath10k_htc_connect_service(struct ath10k_htc *htc,
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
> index 7b8e0d0..f3a6ebb 100644
> --- a/drivers/net/wireless/ath/ath10k/htc.h
> +++ b/drivers/net/wireless/ath/ath10k/htc.h
> @@ -141,8 +141,14 @@ struct ath10k_htc_ready_extended {
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
> @@ -379,6 +385,7 @@ struct ath10k_htc {
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
