Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gL56K-0001gB-LM
 for ath10k@lists.infradead.org; Fri, 09 Nov 2018 11:37:26 +0000
Message-ID: <621e534d70a0a6e3f8a8d02e3ef501cb602c5e03.camel@sipsolutions.net>
Subject: Re: [PATCH 1/4] New netlink command for TID specific configuration
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 09 Nov 2018 12:37:08 +0100
In-Reply-To: <1540230918-27712-2-git-send-email-tamizhr@codeaurora.org>
References: <1540230918-27712-1-git-send-email-tamizhr@codeaurora.org>
 <1540230918-27712-2-git-send-email-tamizhr@codeaurora.org>
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
Cc: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>, linux-wireless@vger.kernel.org

On Mon, 2018-10-22 at 23:25 +0530, Tamizh chelvam wrote:
> 
> +/*
> + * @NL80211_ATTR_TID: a TID value (u8 attribute)

This comment should have the kernel-doc boilerplate

Also, the names should be NL80211_TID_ATTR_* to disambiguate the
namespace from the top-level NL80211_ATTR_*.

> +static const struct nla_policy
> +nl80211_attr_tid_policy[NL80211_ATTR_TID_MAX + 1] = {
> +	[NL80211_ATTR_TID] = { .type = NLA_U8 },
> +	[NL80211_ATTR_TID_RETRY_CONFIG] = { .type = NLA_FLAG },
> +	[NL80211_ATTR_TID_RETRY_SHORT] = { .type = NLA_U8 },
> +	[NL80211_ATTR_TID_RETRY_LONG] = { .type = NLA_U8 },
> +};

Like I said elsewhere, I'm not sure we really should support only
setting one at a time?

OTOH, it may not matter so much, and be convenient to actually get
"atomic" behaviour, otherwise you have to iterate & check and then
iterate & apply again. So perhaps it /is/ better this way.

Also, please use NLA_POLICY_NESTED(). This ensures the attributes are
*always* well-formed, even if they end up ignored.

> +	ret = nla_parse_nested(attrs, NL80211_ATTR_TID_MAX, tid,
> +			       nl80211_attr_tid_policy, info->extack);

And then you also no longer need to pass a policy/extack here.

> +	if (ret)
> +		return ret;
> +
> +	if (!attrs[NL80211_ATTR_TID])
> +		return -EINVAL;
> +
> +	if (attrs[NL80211_ATTR_TID_RETRY_SHORT]) {
> +		retry_short = nla_get_u8(attrs[NL80211_ATTR_TID_RETRY_SHORT]);
> +		if (!retry_short ||
> +		    retry_short > rdev->wiphy.max_data_retry_count)
> +			return -EINVAL;
> +	}

It would also be good to annotate the errors with appropriate extack
error message, i.e. use NL_SET_ERR_MSG_ATTR().

> +	if (nla_get_flag(attrs[NL80211_ATTR_TID_RETRY_CONFIG])) {
> +		if (!wiphy_ext_feature_isset(
> +				&rdev->wiphy,
> +				NL80211_EXT_FEATURE_PER_TID_RETRY_CONFIG))
> +			return -EOPNOTSUPP;
> +
> +		if (peer && !wiphy_ext_feature_isset(
> +				&rdev->wiphy,
> +				NL80211_EXT_FEATURE_PER_STA_RETRY_CONFIG))
> +			return -EOPNOTSUPP;

I guess you also need to clarify a bit what all this means. There are
various possibilities, and I don't think you (want to) cover them all:

 1. setting for a specific TID for all STAs
 2. setting for a specific TID for a single STA
 3. setting for all TIDs for all STAs
 4. setting for all TIDs for a single STA

The documentation reads like you're doing 1. & 4., but this code looks
more like you're doing 1. & 2., so I think that should be clarified.

> +		ret = rdev_set_data_retry_count(rdev, dev, peer, tid_no,
> +						retry_short, retry_long);

You should also rename this to set_tid_config() or so, I guess, since 1.
& 2. is what you're doing, and I'm asking to add more things into it.

In fact, in patch 2 you yourself add more into it, but I don't see a
good reason to split the methods, we can pass a struct that can easily
be extended in the future (e.g. noack).

I also think you should expose the current configuration in STA_INFO.

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
