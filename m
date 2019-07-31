Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hskzq-0005qA-4U
 for ath10k@lists.infradead.org; Wed, 31 Jul 2019 09:34:11 +0000
Message-ID: <7aa18e9e89743f3b4a188c8e677aad203a3ef2db.camel@sipsolutions.net>
Subject: Re: [PATCHv6 6/9] mac80211: Add api to support configuring TID
 specific configuration
From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 31 Jul 2019 11:34:07 +0200
In-Reply-To: <1560835632-17405-7-git-send-email-tamizhr@codeaurora.org>
References: <1560835632-17405-1-git-send-email-tamizhr@codeaurora.org>
 <1560835632-17405-7-git-send-email-tamizhr@codeaurora.org>
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
To: Tamizh chelvam <tamizhr@codeaurora.org>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

On Tue, 2019-06-18 at 10:57 +0530, Tamizh chelvam wrote:
> 
> @@ -1626,6 +1635,14 @@ struct ieee80211_vif {
>  
>  	bool txqs_stopped[IEEE80211_NUM_ACS];
>  
> +	int noack[IEEE80211_TID_MAX];
> +	int retry_short[IEEE80211_TID_MAX];
> +	int retry_long[IEEE80211_TID_MAX];
> +	int ampdu[IEEE80211_TID_MAX];
> +	u8 rate_ctrl[IEEE80211_TID_MAX];
> +	u32 rate_code[IEEE80211_TID_MAX];
> +	u8 rtscts[IEEE80211_TID_MAX];

This is quite a bit of data (176 bytes), can we make it up to the driver
to store it if supported, instead?

> @@ -2004,6 +2027,13 @@ struct ieee80211_sta {
>  
>  	struct ieee80211_txq *txq[IEEE80211_NUM_TIDS + 1];
>  
> +	int noack[IEEE80211_TID_MAX];
> +	int retry_short[IEEE80211_TID_MAX];
> +	int retry_long[IEEE80211_TID_MAX];
> +	int ampdu[IEEE80211_TID_MAX];
> +	u8 rate_ctrl[IEEE80211_TID_MAX];
> +	u8 rtscts[IEEE80211_TID_MAX];

same here.

> +static int ieee80211_set_tid_config(struct wiphy *wiphy,
> +				    struct net_device *dev,
> +				    struct ieee80211_tid_config *tid_conf)
> +{
> +	struct ieee80211_sub_if_data *sdata = IEEE80211_DEV_TO_SUB_IF(dev);
> +	struct sta_info *sta;
> +	int ret;
> +
> +	if (!sdata->local->ops->set_tid_config)
> +		return -EOPNOTSUPP;
> +
> +	if (!tid_conf->peer)
> +		return drv_set_tid_config(sdata->local, sdata, NULL, tid_conf);
> +
> +	mutex_lock(&sdata->local->sta_mtx);
> +
> +	sta = sta_info_get_bss(sdata, tid_conf->peer);
> +	if (!sta) {
> +		mutex_unlock(&sdata->local->sta_mtx);
> +		return -ENOENT;
> +	}
> +
> +	ret = drv_set_tid_config(sdata->local, sdata, &sta->sta, tid_conf);
> +	mutex_unlock(&sdata->local->sta_mtx);
> +	return ret;
> +}

and you're not actually using the data anyway?

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
