Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fwlBR-0007it-O0
 for ath10k@lists.infradead.org; Mon, 03 Sep 2018 09:30:11 +0000
Message-ID: <1535966988.3437.24.camel@sipsolutions.net>
Subject: Re: [PATCH v2 1/3] cfg80211: support FTM responder
 configuration/statistics
From: Johannes Berg <johannes@sipsolutions.net>
Date: Mon, 03 Sep 2018 11:29:48 +0200
In-Reply-To: <1535745418-31336-2-git-send-email-pradeepc@codeaurora.org>
References: <1535745418-31336-1-git-send-email-pradeepc@codeaurora.org>
 <1535745418-31336-2-git-send-email-pradeepc@codeaurora.org>
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
To: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, David Spinadel <david.spinadel@intel.com>


> +struct cfg80211_ftm_responder_params {
> +	u8 *lci;
> +	u8 *civic;

These should be const

> +	[NL80211_ATTR_FTM_RESPONDER] = { .type = NLA_FLAG},

missing a space, but didn't we also say it should be NLA_U8 or so
(allowing the values 0/1) in order to allow later updating this to be
changed on the fly to enable/disable while the AP is already operating,
through the "change beacon" command?

> @@ -4378,7 +4406,7 @@ static int nl80211_set_beacon(struct sk_buff *skb, struct genl_info *info)
>  	if (!wdev->beacon_interval)
>  		return -EINVAL;
>  
> -	err = nl80211_parse_beacon(info->attrs, &params);
> +	err = nl80211_parse_beacon(rdev, info->attrs, &params);

In fact you sort of parse it here, but it would get disabled when the
attribute isn't always included by userspace, which is a bit annoying.

So better make the API to the driver be s8 also, indicating -1 for no
change, and use u8 (0/1) for the userspace API to enable here having "no
changes"?

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
