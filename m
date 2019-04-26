Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJxDd-0000Zn-ED
 for ath10k@lists.infradead.org; Fri, 26 Apr 2019 09:32:34 +0000
Message-ID: <dc5568ea0d115f1b6f74a460322f7b1465dd34cb.camel@sipsolutions.net>
Subject: Re: [PATCHv5 2/9] nl80211: Add new netlink attribute for TID
 speicific retry count
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 26 Apr 2019 11:32:31 +0200
In-Reply-To: <1553592550-15282-3-git-send-email-tamizhr@codeaurora.org>
References: <1553592550-15282-1-git-send-email-tamizhr@codeaurora.org>
 <1553592550-15282-3-git-send-email-tamizhr@codeaurora.org>
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

On Tue, 2019-03-26 at 14:59 +0530, Tamizh chelvam wrote:
> 
> @@ -13288,6 +13291,37 @@ static int parse_tid_conf(struct cfg80211_registered_device *rdev,
>  			nla_get_u8(attrs[NL80211_ATTR_TID_CONFIG_NOACK]);
>  	}
>  
> +	if (nla_get_flag(attrs[NL80211_ATTR_TID_CONFIG_RETRY])) {
> +		if (!wiphy_ext_feature_isset(&rdev->wiphy,
> +				NL80211_EXT_FEATURE_PER_TID_RETRY_CONFIG))
> +			return -ENOTSUPP;
> +
> +		if (peer && !wiphy_ext_feature_isset(&rdev->wiphy,
> +				NL80211_EXT_FEATURE_PER_STA_RETRY_CONFIG))
> +			return -ENOTSUPP;
> +
> +		tid_conf->tid_conf_mask |= IEEE80211_TID_CONF_RETRY;
> +		if (attrs[NL80211_ATTR_TID_CONFIG_RETRY_SHORT]) {
> +			tid_conf->retry_short =
> +			nla_get_u8(attrs[NL80211_ATTR_TID_CONFIG_RETRY_SHORT]);
> +			if (tid_conf->retry_short >
> +					rdev->wiphy.max_data_retry_count)
> +				return -EINVAL;
> 
Forgot to comment on that before (perhaps also in the first patch), but
having extended error messages for this would be very useful.

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
