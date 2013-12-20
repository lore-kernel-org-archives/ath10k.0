Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VtxD8-0006Az-Kr
 for ath10k@lists.infradead.org; Fri, 20 Dec 2013 10:21:39 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: implement sta_rc_update()
References: <87li09ga42.fsf@kamboji.qca.qualcomm.com>
 <1387361479-21289-1-git-send-email-michal.kazior@tieto.com>
Date: Fri, 20 Dec 2013 12:21:11 +0200
In-Reply-To: <1387361479-21289-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Wed, 18 Dec 2013 11:11:19 +0100")
Message-ID: <8761qj3js8.fsf@kamboji.qca.qualcomm.com>
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

> This should fix possible connectivity issues upon
> changes of channel width, number of streams or
> SMPS on connected stations.
>
> An example trigger would be an action frame with
> operation mode change notification.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

[...]

> +static void ath10k_sta_rc_update(struct ieee80211_hw *hw,
> +				 struct ieee80211_vif *vif,
> +				 struct ieee80211_sta *sta,
> +				 u32 changed)
> +{
> +	struct ath10k *ar = hw->priv;
> +	struct ath10k_vif *arvif = ath10k_vif_to_arvif(vif);
> +	u32 chwidth, smps;
> +	int ret;
> +

[...]

> +		ret = ath10k_wmi_peer_set_param(ar, arvif->vdev_id, sta->addr,
> +						WMI_PEER_CHAN_WIDTH, chwidth);

Johannes pointed out (danke!) that sta_rc_update() must be atomic, but
all these WMI calls can sleep.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
