Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gn0gj-0003fe-4u
 for ath10k@lists.infradead.org; Fri, 25 Jan 2019 12:34:26 +0000
Message-ID: <ecef4536f2b9f08195e0da2d00f67f33ee66bdbd.camel@sipsolutions.net>
Subject: Re: [PATCH 2/3] mac80211: store tx power value from user to station
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 25 Jan 2019 13:34:21 +0100
In-Reply-To: <1547724247-11481-1-git-send-email-bpothuno@codeaurora.org>
References: <1547724247-11481-1-git-send-email-bpothuno@codeaurora.org>
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

On Thu, 2019-01-17 at 16:54 +0530, Balaji Pothunoori wrote:
> 
> + * @txpwr: indicates the tx power, in mBm, to be used when sending data frames
> + *	to the STA.
> + * @type: In particular if TPC %type is NL80211_TX_POWER_LIMITED then txpwr will
> + *	be less than or equal to specified from userspace, whereas if TPC %type
> + *	is NL80211_TX_POWER_AUTOMATIC then it indicates default txpwr.
> + *	NL80211_TX_POWER_FIXED is not a valid configuration option for
> + *	per peer TPC.

Same comment here wrt. txpower_type or so.

> +TRACE_EVENT(drv_sta_set_txpwr,
> +	TP_PROTO(struct ieee80211_local *local,
> +		 struct ieee80211_sub_if_data *sdata,
> +		 struct ieee80211_sta *sta),
> +
> +	TP_ARGS(local, sdata, sta),
> +
> +	TP_STRUCT__entry(
> +		LOCAL_ENTRY
> +		VIF_ENTRY
> +		STA_ENTRY
> +		__field(s16, txpwr)
> +	),
> +
> +	TP_fast_assign(
> +		LOCAL_ASSIGN;
> +		VIF_ASSIGN;
> +		STA_ASSIGN;
> +		__entry->txpwr = sta->txpwr;
> +	),

Include the type as well?

OTOH, is this whole business with the type even needed everywhere?

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
