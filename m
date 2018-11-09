Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-by2nam01on0612.outbound.protection.outlook.com
 ([2a01:111:f400:fe42::612]
 helo=NAM01-BY2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gL33j-0003vH-3I
 for ath10k@lists.infradead.org; Fri, 09 Nov 2018 09:26:36 +0000
From: Sergey Matyukevich <sergey.matyukevich.os@quantenna.com>
Subject: Re: [PATCH 4/4] ath10k: Add support to configure TID specific
 configuration
Date: Fri, 9 Nov 2018 09:26:03 +0000
Message-ID: <20181109092557.ciw457se3ssajl3v@bars>
References: <1540230918-27712-1-git-send-email-tamizhr@codeaurora.org>
 <1540230918-27712-5-git-send-email-tamizhr@codeaurora.org>
In-Reply-To: <1540230918-27712-5-git-send-email-tamizhr@codeaurora.org>
Content-Language: en-US
Content-ID: <4F01E0BEA6845B4595E108C3CA6B2309@namprd05.prod.outlook.com>
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
To: Tamizh chelvam <tamizhr@codeaurora.org>
Cc: "johannes@sipsolutions.net" <johannes@sipsolutions.net>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>


Hello Tamizh,

> Signed-off-by: Tamizh chelvam <tamizhr@codeaurora.org>
> ---
>  drivers/net/wireless/ath/ath10k/core.h |  23 ++++
>  drivers/net/wireless/ath/ath10k/mac.c  | 240 +++++++++++++++++++++++++++++----
>  drivers/net/wireless/ath/ath10k/wmi.c  |   6 +-
>  drivers/net/wireless/ath/ath10k/wmi.h  |   1 +
>  4 files changed, 245 insertions(+), 25 deletions(-)

...

> +static int ath10k_mac_op_set_tid_conf(struct ieee80211_hw *hw,
> +                                     struct ieee80211_vif *vif,
> +                                     struct ieee80211_sta *sta,
> +                                     struct ieee80211_tid_conf *tid_conf,
> +                                     u8 changed)
> +{
> +       int ret;
> +       struct ath10k *ar = hw->priv;
> +       struct ath10k_vif *arvif = (void *)vif->drv_priv;
> +       struct ath10k_mac_iter_tid_config data = {};
> +       struct wmi_per_peer_per_tid_cfg_arg arg = {};
> +       struct ath10k_sta *arsta;
> +
> +       if (!(changed & TID_RETRY_CONF_CHANGED) &&
> +           !(changed & TID_AGGR_CONF_CHANGED))
> +               return 0;
> +
> +       mutex_lock(&ar->conf_mutex);
> +       arg.vdev_id = arvif->vdev_id;
> +       arg.tid = tid_conf->tid;
> +
> +       if (sta) {
> +               arsta = (struct ath10k_sta *)sta->drv_priv;
> +               ether_addr_copy(arg.peer_macaddr.addr, sta->addr);
> +
> +               if (changed & TID_RETRY_CONF_CHANGED) {
> +                       if (tid_conf->retry_long ==
> +                           arsta->retry_count[arg.tid]) {
> +                               ret = 0;
> +                               goto exit;
> +                       }
> +
> +                       if (tid_conf->retry_long == -1) {
> +                               if (arvif->retry_count[arg.tid])
> +                                       arg.retry_count =
> +                                               arvif->retry_count[arg.tid];
> +                               else
> +                                       arg.retry_count =
> +                                               ATH10K_MAX_RETRY_COUNT;
> +                       } else {
> +                               arg.retry_count = tid_conf->retry_long;
> +                       }
> +               }
> +               if (changed & TID_AGGR_CONF_CHANGED) {
> +                       if (tid_conf->aggr)
> +                               arg.aggr_control =
> +                                       WMI_TID_CONFIG_AGGR_CONTROL_ENABLE;
> +                       else
> +                               arg.aggr_control =
> +                                       WMI_TID_CONFIG_AGGR_CONTROL_DISABLE;
> +               }
> +
> +               ret = ath10k_wmi_set_per_peer_per_tid_cfg(ar, &arg);
> +               if (!ret) {
> +                       /* Store the configured parameters in success case */
> +                       if (changed & TID_RETRY_CONF_CHANGED)
> +                               arsta->retry_count[arg.tid] =
> +                                                       tid_conf->retry_long;
> +                       if (changed & TID_AGGR_CONF_CHANGED)
> +                               arsta->aggr_ctrl[arg.tid] = arg.aggr_control;
> +               }
> +
> +               goto exit;
> +       }
> +
> +       ret = 0;
> +
> +       if (changed & TID_RETRY_CONF_CHANGED)
> +               arvif->retry_count[tid_conf->tid] = tid_conf->retry_long;

Shouldn't it use default ATH10K_MAX_RETRY_COUNT value when
incoming retry_long value is -1 ?

Regards,
Sergey

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
