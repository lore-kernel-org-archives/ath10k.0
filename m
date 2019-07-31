Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsklP-00085D-TT
 for ath10k@lists.infradead.org; Wed, 31 Jul 2019 09:19:17 +0000
Message-ID: <428fec1c2dd6f6d9345323f272eef423a214bc39.camel@sipsolutions.net>
Subject: Re: [PATCHv6 1/9] nl80211: New netlink command for TID specific
 configuration
From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 31 Jul 2019 11:19:10 +0200
In-Reply-To: <1560835632-17405-2-git-send-email-tamizhr@codeaurora.org>
References: <1560835632-17405-1-git-send-email-tamizhr@codeaurora.org>
 <1560835632-17405-2-git-send-email-tamizhr@codeaurora.org>
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

Hi,

Was waiting for you to address Sergey's feedback, but now that I looked
anyway, I have some of my own. Sorry for the long delay though!

> + * @NL80211_ATTR_TID_CONFIG: TID specific configuration in a
> + *	nested attribute with %NL80211_TID_ATTR_* sub-attributes.

Please use NL80211_TID_CONFIG_ATTR_* throughout, also for

> +/* enum nl80211_tid_attr_config - TID specific configuration.

the enum name

> +enum nl80211_tid_attr_config {
> +	__NL80211_TID_ATTR_INVALID,
> +	NL80211_TID_ATTR_CONFIG_TID,
> +	NL80211_TID_ATTR_CONFIG_NOACK,
> +
> +	/* keep last */
> +	__NL80211_TID_ATTR_CONFIG_AFTER_LAST,
> +	NL80211_TID_ATTR_CONFIG_MAX = __NL80211_TID_ATTR_CONFIG_AFTER_LAST - 1

and all the things in it.

Also, as you can see above, the kernel-doc comment isn't formatted
right.


> +	nla_for_each_nested(tid, info->attrs[NL80211_ATTR_TID_CONFIG],
> +			    rem_conf) {
> +		ret = nla_parse_nested_deprecated(attrs, NL80211_TID_ATTR_CONFIG_MAX,
> +						  tid, NULL, NULL);

You shouldn't use _deprecated.

> +		ret = parse_tid_conf(rdev, attrs,
> +				     &tid_config->tid_conf[conf_idx],
> +				     tid_config->peer);

and yeah, this should compile.

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
