Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsky0-0005iC-AN
 for ath10k@lists.infradead.org; Wed, 31 Jul 2019 09:32:17 +0000
Message-ID: <3bb50da3442446a76f7ef59c4d53a7c349b87524.camel@sipsolutions.net>
Subject: Re: [PATCHv6 5/9] nl80211: Add netlink attribute to configure TID
 specific tx rate
From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 31 Jul 2019 11:32:14 +0200
In-Reply-To: <1560835632-17405-6-git-send-email-tamizhr@codeaurora.org>
References: <1560835632-17405-1-git-send-email-tamizhr@codeaurora.org>
 <1560835632-17405-6-git-send-email-tamizhr@codeaurora.org>
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


>  /**
> + * enum nl80211_tx_rate_setting - TX rate configuration type
> + * @NL80211_TX_RATE_AUTOMATIC: automatically determine TX rate
> + * @NL80211_TX_RATE_LIMITED: limit the TX rate by the TX rate parameter
> + * @NL80211_TX_RATE_FIXED: fix TX rate to the TX rate parameter
> + */
> +enum nl80211_tx_rate_setting {
> +	NL80211_TX_RATE_AUTOMATIC,
> +	NL80211_TX_RATE_LIMITED,
> +	NL80211_TX_RATE_FIXED,
> +};

I'm not really quite sure how LIMITED it supposed to work?

I mean, I could imagine all kinds of limits ...

 * limit to anything <= the given rate in kbps
 * limit to anything with long GI
 * limit to NSS <= given NSS
 * limit to MCS <= given MCS

etc.

I guess you could find a <= comparison for each dimension of the various
parameters, and then if you don't want that particular one limited you
give the maximum? Still not really clear to me how that should work.

Also, would it be allowed to pass an invalid rate? Like something like
"100Mbps legacy rate" when that's certainly not valid? You have no
validation on this, so for LIMITED that might still seem useful (per my
first bullet point above) but for anything else ... not so much?

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
