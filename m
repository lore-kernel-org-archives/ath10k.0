Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gn0ea-0003FI-Km
 for ath10k@lists.infradead.org; Fri, 25 Jan 2019 12:32:14 +0000
Message-ID: <5b2d0128ff33cdeb268a3954c4aab3ab7b1145c6.camel@sipsolutions.net>
Subject: Re: [PATCH 1/3] cfg80211: Add support to set tx power for a station
 associated
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 25 Jan 2019 13:32:08 +0100
In-Reply-To: <1547724167-11420-1-git-send-email-bpothuno@codeaurora.org>
References: <1547724167-11420-1-git-send-email-bpothuno@codeaurora.org>
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
To: Balaji Pothunoori <bpothuno@codeaurora.org>, ath10k@lists.infradead.org
Cc: Ashok Raj Nagarajan <arnagara@codeaurora.org>, linux-wireless@vger.kernel.org

On Thu, 2019-01-17 at 16:52 +0530, Balaji Pothunoori wrote:
> 
> +	s16 txpwr;
> +	enum nl80211_tx_power_setting type;

you should probably call this txpwr_type, or do something like

struct {
	s16 power;
	enum ... type;
} txpwr;


> +	[NL80211_ATTR_STA_TX_POWER_SETTING] = { .type = NLA_U8 },

That should use NLA_POLICY_RANGE()

> +	[NL80211_ATTR_STA_TX_POWER] = { .type = NLA_S16 },
 

> +		params->type = nla_get_u32(info->attrs[idx]);
> +
> +		if (params->type == NL80211_TX_POWER_LIMITED) {
> +			idx = NL80211_ATTR_STA_TX_POWER;
> +			params->txpwr = nla_get_u32(info->attrs[idx]);

You cannot use nla_get_u32 with U8/S16 attributes, use the correct
corresponding helper.

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
