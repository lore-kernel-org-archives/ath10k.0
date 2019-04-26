Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJxIU-0002ON-OZ
 for ath10k@lists.infradead.org; Fri, 26 Apr 2019 09:37:35 +0000
Message-ID: <d9135c6be42425424e4c3fd606c7e5aaf9dac1e9.camel@sipsolutions.net>
Subject: Re: [PATCHv5 5/9] nl80211: Add netlink attribute to configure TID
 specific tx rate
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 26 Apr 2019 11:37:32 +0200
In-Reply-To: <1553592550-15282-6-git-send-email-tamizhr@codeaurora.org>
References: <1553592550-15282-1-git-send-email-tamizhr@codeaurora.org>
 <1553592550-15282-6-git-send-email-tamizhr@codeaurora.org>
Mime-Version: 1.0
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


> @@ -13354,6 +13367,42 @@ static int parse_tid_conf(struct cfg80211_registered_device *rdev,
>  			nla_get_u8(attrs[NL80211_ATTR_TID_CONFIG_RTSCTS_CTRL]);
>  	}
>  
> +	if (attrs[NL80211_ATTR_TID_CONFIG_TX_RATES_TYPE]) {
> +		int idx;
> +		enum nl80211_attrs attr;
> +
> +		if (!wiphy_ext_feature_isset(&rdev->wiphy,
> +				NL80211_EXT_FEATURE_PER_TID_TX_BITRATE_MASK))
> +			return -EOPNOTSUPP;
> +
> +		if (peer &&
> +		    !wiphy_ext_feature_isset(&rdev->wiphy,
> +				NL80211_EXT_FEATURE_PER_STA_TX_BITRATE_MASK))
> +			return -EOPNOTSUPP;
> +
> +		idx = NL80211_ATTR_TID_CONFIG_TX_RATES_TYPE;
> +		tid_conf->txrate_type = nla_get_u8(attrs[idx]);
> +
> +		tid_conf->tid_conf_mask |= IEEE80211_TID_CONF_TX_BITRATE;
> +		if (tid_conf->txrate_type != NL80211_TX_RATE_AUTOMATIC) {
> +			tid_conf->mask =
> +				kzalloc(sizeof(struct cfg80211_bitrate_mask),
> +					GFP_KERNEL);

You leak this

> +			if (!tid_conf->mask)
> +				return -ENOMEM;
> +
> +			attr = NL80211_ATTR_TID_CONFIG_TX_RATES;
> +			ret = nl80211_parse_tx_bitrate_mask(attrs, rdev, attr,
> +							    tid_conf->mask);
> +			if (ret) {
> +				kfree(tid_conf->mask);
> +				return ret;
> +			}
> +		} else {
> +			tid_conf->mask = NULL;
> +		}
> +	}
> +
>  	return 0;
>  }
>  
> @@ -13407,7 +13456,7 @@ static int nl80211_set_tid_config(struct sk_buff *skb,
>  		}
>  
>  		ret = parse_tid_conf(rdev, attrs, &tid_conf->tid_conf[conf_idx],
> -				     tid_conf->peer);
> +				     info, tid_conf->peer);
>  		if (ret)
>  			goto bad_tid_conf;

Practically everywhere, but particularly in the bad case in the next
loop iteration etc?

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
