Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsku2-0003yJ-I0
 for ath10k@lists.infradead.org; Wed, 31 Jul 2019 09:28:11 +0000
Message-ID: <1077c62701b31cfcb4436e6b13be64ade6b1ae1b.camel@sipsolutions.net>
Subject: Re: [PATCHv6 3/9] nl80211: Add netlink attribute for AMPDU
 aggregation enable/disable
From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 31 Jul 2019 11:28:08 +0200
In-Reply-To: <1560835632-17405-4-git-send-email-tamizhr@codeaurora.org>
References: <1560835632-17405-1-git-send-email-tamizhr@codeaurora.org>
 <1560835632-17405-4-git-send-email-tamizhr@codeaurora.org>
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
> +		if (!wiphy_ext_feature_isset(&rdev->wiphy,
> +				NL80211_EXT_FEATURE_PER_TID_AMPDU_CTRL)) {
> +			NL_SET_ERR_MSG_ATTR(extack,
> +					    attrs[NL80211_TID_ATTR_CONFIG_AMPDU_CTRL],
> +					    "TID specific configuration not "
> +					    "supported");
> +			return -ENOTSUPP;
> +		}
> +
> +		if (peer && !wiphy_ext_feature_isset(&rdev->wiphy,
> +				NL80211_EXT_FEATURE_PER_STA_AMPDU_CTRL)) {
> +			NL_SET_ERR_MSG_ATTR(extack,
> +					    attrs[NL80211_TID_ATTR_CONFIG_AMPDU_CTRL],
> +					    "peer specfic TID configuration not "
> +					    "supported");
> +			return -ENOTSUPP;
> +		}

I think you should probably make this be a function to which you pass
the attribute pointer and feature flags.

err = nl80211_check_tid_config_supported(extack,
					 attrs[NL80211_TID_ATTR_CONFIG_AMPDU_CTRL],
					 NL80211_EXT_FEATURE_PER_TID_AMPDU_CTRL,
					 NL80211_EXT_FEATURE_PER_STA_AMPDU_CTRL);

since you have this code a lot?

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
