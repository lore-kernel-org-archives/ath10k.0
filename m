Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJzZi-0005HS-7U
 for ath10k@lists.infradead.org; Tue, 06 Nov 2018 11:31:15 +0000
Message-ID: <12abed50303117c884151fd918cc283ed6d1549f.camel@sipsolutions.net>
Subject: Re: [PATCH 1/4] New netlink command for TID specific configuration
From: Johannes Berg <johannes@sipsolutions.net>
Date: Tue, 06 Nov 2018 12:31:01 +0100
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


> +static const struct nla_policy
> +nl80211_attr_tid_policy[NL80211_ATTR_TID_MAX + 1] = {
> +	[NL80211_ATTR_TID] = { .type = NLA_U8 },
> +	[NL80211_ATTR_TID_RETRY_CONFIG] = { .type = NLA_FLAG },
> +	[NL80211_ATTR_TID_RETRY_SHORT] = { .type = NLA_U8 },
> +	[NL80211_ATTR_TID_RETRY_LONG] = { .type = NLA_U8 },
> +};
> +
> +static int nl80211_set_tid_config(struct sk_buff *skb,
> +				  struct genl_info *info)
> +{
> +	struct cfg80211_registered_device *rdev = info->user_ptr[0];
> +	struct nlattr *attrs[NL80211_ATTR_TID_MAX + 1];
> +	struct nlattr *tid;
> +	struct net_device *dev = info->user_ptr[1];
> +	const char *peer = NULL;
> +	u8 tid_no;
> +	int ret = -EINVAL, retry_short = -1, retry_long = -1;
> +
> +	tid = info->attrs[NL80211_ATTR_TID_CONFIG];
> +	if (!tid)
> +		return -EINVAL;
> +
> +	ret = nla_parse_nested(attrs, NL80211_ATTR_TID_MAX, tid,
> +			       nl80211_attr_tid_policy, info->extack);
> +	if (ret)
> +		return ret;
> +
> +	if (!attrs[NL80211_ATTR_TID])
> +		return -EINVAL;

Why not allow configuring multiple at the same time, and make TID_CONFIG
an array of

 tid => [config attrs, i.e. retry cfg/short/long]

If not, then you should probably use NLA_POLICY_RANGE() for it.

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
