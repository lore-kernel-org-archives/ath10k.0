Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1anNqg-0001oJ-IR
 for ath10k@lists.infradead.org; Tue, 05 Apr 2016 10:04:39 +0000
Message-ID: <1459850650.18188.42.camel@sipsolutions.net>
Subject: Re: [PATCH v3] cfg80211/nl80211: Add support for
 NL80211_STA_INFO_RX_DURATION
From: Johannes Berg <johannes@sipsolutions.net>
Date: Tue, 05 Apr 2016 12:04:10 +0200
In-Reply-To: <1457529357-19077-1-git-send-email-mohammed@qca.qualcomm.com>
References: <1457529357-19077-1-git-send-email-mohammed@qca.qualcomm.com>
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
To: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>, linux-wireless@vger.kernel.org
Cc: mohammed@codeaurora.org, kvalo@codeaurora.org, ath10k@lists.infradead.org

Hi,

The implementation seems fine now, but I think the commit log needs some work.

> Add support for new netlink attribute 'NL80211_STA_INFO_RX_DURATION'

I think it'd be worthwhile to describe the attribute a bit more,
including why you're adding it.

> This flag

There's no flag.

>  will be set when drivers can fill rx_duration (aggregate
> PPDU duration(usecs) for all the frames from a peer) 

You have the description here, but putting it with the attribute would
be better.

> via 'drv_sta_statistics' callback

drv_sta_statistics is a mac80211 detail, that's not relevant at
cfg80211 level; mentioning that is just confusing. This can well used
by non-mac80211 drivers.

> Also make sta_info flags 'filled' as 64 bit to accommodate for new
> per station stats. 

That sentence doesn't parse well.

> Extend 'PUT_SINFO' for supporting rx_duration
> field and any new per sta information in future

That sentence I think should just be removed.

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
