Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-bk0-x234.google.com ([2a00:1450:4008:c01::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W3mJo-0004Jx-G8
 for ath10k@lists.infradead.org; Thu, 16 Jan 2014 12:45:11 +0000
Received: by mail-bk0-f52.google.com with SMTP id e11so183091bkh.39
 for <ath10k@lists.infradead.org>; Thu, 16 Jan 2014 04:44:46 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20140116123336.24551.2629.stgit@potku.adurom.net>
References: <20140116123336.24551.2629.stgit@potku.adurom.net>
Date: Thu, 16 Jan 2014 20:44:43 +0800
Message-ID: <CAEFj987MkPQgyTU=K64mXuzCnm7T3SsUOSXiHkAovTVz0_kqwg@mail.gmail.com>
Subject: Re: [PATCH] ath10k: enable firmware STA quick kickout
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

Hi, Kalle Valo

Just would like to know whether the STA is deleted by FW when the FW
is sending the WMI_PEER_STA_KICKOUT_EVENTID to the host?

Please advice. Thanks

Regard,
Chun-Yeow

On Thu, Jan 16, 2014 at 8:33 PM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Firmware has a feature to track if the associated STA is not acking the frames.
> When that happens, the firmware sends WMI_PEER_STA_KICKOUT_EVENTID event to the
> host. Enable that to faster detect when a STA has left BSS without sending a
> deauth frame.
>
> Also set huge keepalive timeouts to avoid using the keepalive functionality in
> the firmware.
>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath10k/core.h |   12 +++++++
>  drivers/net/wireless/ath/ath10k/mac.c  |   55 ++++++++++++++++++++++++++++----
>  drivers/net/wireless/ath/ath10k/wmi.c  |   22 ++++++++++++-
>  drivers/net/wireless/ath/ath10k/wmi.h  |    4 ++
>  4 files changed, 85 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
> index ade1781..e6308f4 100644
> --- a/drivers/net/wireless/ath/ath10k/core.h
> +++ b/drivers/net/wireless/ath/ath10k/core.h
> @@ -46,6 +46,18 @@
>
>  #define ATH10K_MAX_NUM_MGMT_PENDING 128
>
> +/* number of failed packets */
> +#define ATH10K_KICKOUT_THRESHOLD 50
> +
> +/*
> + * Use insanely high numbers to make sure that the firmware implementation
> + * won't start, we have the same functionality already in hostapd. Unit
> + * is seconds.
> + */
> +#define ATH10K_KEEPALIVE_MIN_IDLE 3747
> +#define ATH10K_KEEPALIVE_MAX_IDLE 3895
> +#define ATH10K_KEEPALIVE_MAX_UNRESPONSIVE 3900
> +
>  struct ath10k;
>
>  struct ath10k_skb_cb {
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
> index 7aa6c4d..f5f7c6a 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -339,6 +339,47 @@ static int ath10k_peer_create(struct ath10k *ar, u32 vdev_id, const u8 *addr)
>         return 0;
>  }
>
> +static int ath10k_mac_set_kickout(struct ath10k_vif *arvif)
> +{
> +       struct ath10k *ar = arvif->ar;
> +       u32 param;
> +       int ret;
> +
> +       param = ar->wmi.pdev_param->sta_kickout_th;
> +       ret = ath10k_wmi_pdev_set_param(ar, param,
> +                                       ATH10K_KICKOUT_THRESHOLD);
> +       if (ret) {
> +               ath10k_warn("Failed to enable sta kickout: %d\n", ret);
> +               return ret;
> +       }
> +
> +       param = ar->wmi.vdev_param->ap_keepalive_min_idle_inactive_time_secs;
> +       ret = ath10k_wmi_vdev_set_param(ar, arvif->vdev_id, param,
> +                                       ATH10K_KEEPALIVE_MIN_IDLE);
> +       if (ret) {
> +               ath10k_warn("Failed to enable sta kickout: %d\n", ret);
> +               return ret;
> +       }
> +
> +       param = ar->wmi.vdev_param->ap_keepalive_max_idle_inactive_time_secs;
> +       ret = ath10k_wmi_vdev_set_param(ar, arvif->vdev_id, param,
> +                                       ATH10K_KEEPALIVE_MAX_IDLE);
> +       if (ret) {
> +               ath10k_warn("Failed to enable sta kickout: %d\n", ret);
> +               return ret;
> +       }
> +
> +       param = ar->wmi.vdev_param->ap_keepalive_max_unresponsive_time_secs;
> +       ret = ath10k_wmi_vdev_set_param(ar, arvif->vdev_id, param,
> +                                       ATH10K_KEEPALIVE_MAX_UNRESPONSIVE);
> +       if (ret) {
> +               ath10k_warn("Failed to enable sta kickout: %d\n", ret);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
>  static int  ath10k_mac_set_rts(struct ath10k_vif *arvif, u32 value)
>  {
>         struct ath10k *ar = arvif->ar;
> @@ -2214,7 +2255,7 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
>         struct ath10k_vif *arvif = ath10k_vif_to_arvif(vif);
>         enum wmi_sta_powersave_param param;
>         int ret = 0;
> -       u32 value, param_id;
> +       u32 value;
>         int bit;
>         u32 vdev_param;
>
> @@ -2307,12 +2348,12 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
>                         goto err_vdev_delete;
>                 }
>
> -               param_id = ar->wmi.pdev_param->sta_kickout_th;
> -
> -               /* Disable STA KICKOUT functionality in FW */
> -               ret = ath10k_wmi_pdev_set_param(ar, param_id, 0);
> -               if (ret)
> -                       ath10k_warn("Failed to disable STA KICKOUT\n");
> +               ret = ath10k_mac_set_kickout(arvif);
> +               if (ret) {
> +                       ath10k_warn("Failed to set kickout parameters: %d\n",
> +                                   ret);
> +                       goto err_peer_delete;
> +               }
>         }
>
>         if (arvif->vdev_type == WMI_VDEV_TYPE_STA) {
> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
> index 712a606..0bc8543 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -1116,7 +1116,27 @@ static void ath10k_wmi_event_vdev_stopped(struct ath10k *ar,
>  static void ath10k_wmi_event_peer_sta_kickout(struct ath10k *ar,
>                                               struct sk_buff *skb)
>  {
> -       ath10k_dbg(ATH10K_DBG_WMI, "WMI_PEER_STA_KICKOUT_EVENTID\n");
> +       struct wmi_peer_sta_kickout_event *ev;
> +       struct ieee80211_sta *sta;
> +
> +       ev = (struct wmi_peer_sta_kickout_event *)skb->data;
> +
> +       ath10k_dbg(ATH10K_DBG_WMI, "wmi event peer sta kickout %pM\n",
> +                  ev->peer_macaddr.addr);
> +
> +       rcu_read_lock();
> +
> +       sta = ieee80211_find_sta_by_ifaddr(ar->hw, ev->peer_macaddr.addr, NULL);
> +       if (!sta) {
> +               ath10k_warn("Spurious quick kickout for STA %pM\n",
> +                           ev->peer_macaddr.addr);
> +               goto exit;
> +       }
> +
> +       ieee80211_report_low_ack(sta, 10);
> +
> +exit:
> +       rcu_read_unlock();
>  }
>
>  /*
> diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
> index 4b5e7d3..9dc90c5 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.h
> +++ b/drivers/net/wireless/ath/ath10k/wmi.h
> @@ -4039,6 +4039,10 @@ struct wmi_chan_info_event {
>         __le32 cycle_count;
>  } __packed;
>
> +struct wmi_peer_sta_kickout_event {
> +       struct wmi_mac_addr peer_macaddr;
> +} __packed;
> +
>  #define WMI_CHAN_INFO_FLAG_COMPLETE BIT(0)
>
>  /* FIXME: empirically extrapolated */
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
