Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1anQGb-0007wR-4v
 for ath10k@lists.infradead.org; Tue, 05 Apr 2016 12:39:33 +0000
Date: Tue, 5 Apr 2016 18:08:56 +0530
From: Mohammed Shafi Shajakhan <mohammed@codeaurora.org>
Subject: Re: [PATCH v3] cfg80211/nl80211: Add support for
 NL80211_STA_INFO_RX_DURATION
Message-ID: <20160405123856.GA23252@atheros-ThinkPad-T61>
References: <1457529357-19077-1-git-send-email-mohammed@qca.qualcomm.com>
 <1459850650.18188.42.camel@sipsolutions.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1459850650.18188.42.camel@sipsolutions.net>
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
To: Johannes Berg <johannes@sipsolutions.net>, g@codeaurora.org
Cc: linux-wireless@vger.kernel.org, kvalo@codeaurora.org, ath10k@lists.infradead.org, Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Hi Johannes,

On Tue, Apr 05, 2016 at 12:04:10PM +0200, Johannes Berg wrote:
> Hi,
> 
> The implementation seems fine now, but I think the commit log needs some work.

[shafi] thanks for reviewing.

> 
> > Add support for new netlink attribute 'NL80211_STA_INFO_RX_DURATION'
> 
> I think it'd be worthwhile to describe the attribute a bit more,
> including why you're adding it.

[shafi] will update in v4

> 
> > This flag
> 
> There's no flag.

[shafi] i will replace it with the name 'NL80211_STA_INFO_RX_DURATION'

> 
> >  will be set when drivers can fill rx_duration (aggregate
> > PPDU duration(usecs) for all the frames from a peer) 
> 
> You have the description here, but putting it with the attribute would
> be better.

[shafi] ok

> 
> > via 'drv_sta_statistics' callback
> 
> drv_sta_statistics is a mac80211 detail, that's not relevant at
> cfg80211 level; mentioning that is just confusing. This can well used
> by non-mac80211 drivers.

[shafi] agreed, will remove it.

> 
> > Also make sta_info flags 'filled' as 64 bit to accommodate for new
> > per station stats. 
> 
> That sentence doesn't parse well.
> 
> > Extend 'PUT_SINFO' for supporting rx_duration
> > field and any new per sta information in future
> 
> That sentence I think should just be removed.

[shafi] ok.

-shafi

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
