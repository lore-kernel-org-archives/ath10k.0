Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W48zy-000885-A1
 for ath10k@lists.infradead.org; Fri, 17 Jan 2014 12:58:11 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: add support for AP CSA
References: <1389345563-3445-1-git-send-email-michal.kazior@tieto.com>
Date: Fri, 17 Jan 2014 14:57:42 +0200
In-Reply-To: <1389345563-3445-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 10 Jan 2014 10:19:23 +0100")
Message-ID: <87lhyercjd.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> This patch implements Channel Switch Announcement
> for AP mode. This allows for a smooth channel
> switch for connected stations that support CSA
> when radar is detected.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

[...]

> --- a/drivers/net/wireless/ath/ath10k/core.h
> +++ b/drivers/net/wireless/ath/ath10k/core.h
> @@ -414,6 +414,7 @@ struct ath10k {
>  	unsigned int filter_flags;
>  	unsigned long dev_flags;
>  	u32 dfs_block_radar_events;
> +	struct ath10k_vif *csa_arvif;

Please document how this is serialised.

> +static void ath10k_mac_update_ap_channel(struct ath10k_vif *arvif)
> +{

Please change this function to return the error code.

> +	const u8 *bssid = arvif->vif->bss_conf.bssid;
> +	int ret;
> +
> +	ath10k_dbg(ATH10K_DBG_MAC, "mac AP channel update %dMHz\n",
> +		   arvif->ar->hw->conf.chandef.chan->center_freq);
> +
> +	ret = ath10k_vdev_stop(arvif);
> +	if (ret) {
> +		ath10k_warn("could not stop vdev %d (%d)\n",
> +			    arvif->vdev_id, ret);
> +		return;
> +	}
> +
> +	ret = ath10k_vdev_start(arvif);
> +	if (ret) {
> +		ath10k_warn("could not start vdev %d (%d)\n",
> +			    arvif->vdev_id, ret);
> +		return;
> +	}
> +
> +	ret = ath10k_wmi_vdev_up(arvif->ar, arvif->vdev_id, 0, bssid);
> +	if (ret) {
> +		ath10k_warn("could not bring vdev up %d (%d)\n",
> +			    arvif->vdev_id, ret);
> +		return;
> +	}

For warning and error messages please use style:

"could not bring vdev up %d: %d\n"

> @@ -2156,6 +2185,9 @@ static int ath10k_config(struct ieee80211_hw *hw, u32 changed)
>  		spin_unlock_bh(&ar->data_lock);
>  
>  		ath10k_config_radar_detection(ar);
> +
> +		if (ar->csa_arvif && ar->csa_arvif->vif->csa_active)
> +			ath10k_mac_update_ap_channel(ar->csa_arvif);

Check the error message here, print a warning and return if there's an
error. But should we return 0 or the error code, that I do not know.

> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -558,6 +558,22 @@ err_pull:
>  	return ret;
>  }
>  
> +static void ath10k_update_csa(struct ath10k_vif *arvif)
> +{
> +	lockdep_assert_held(&arvif->ar->data_lock);
> +
> +	if (arvif->ar->csa_arvif != arvif)
> +		return;
> +
> +	if (!arvif->vif->csa_active)
> +		return;
> +
> +	if (!ieee80211_csa_is_complete(arvif->vif))
> +		return;
> +
> +	ieee80211_csa_finish(arvif->vif);
> +}

For consistency I would prefer that all functions return an error code,
but I guess that would not make any sense here. Does it?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
