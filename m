Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([144.76.43.152] helo=sipsolutions.net)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V4nVX-0000MM-RS
 for ath10k@lists.infradead.org; Thu, 01 Aug 2013 07:41:12 +0000
Message-ID: <1375342845.8608.8.camel@jlt4.sipsolutions.net>
Subject: Re: [RFC 1/3] nl/cfg80211: add chan_time for scan request
From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 01 Aug 2013 09:40:45 +0200
In-Reply-To: <1375087158-22077-2-git-send-email-michal.kazior@tieto.com>
References: <1375087158-22077-1-git-send-email-michal.kazior@tieto.com>
 <1375087158-22077-2-git-send-email-michal.kazior@tieto.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Mon, 2013-07-29 at 10:39 +0200, Michal Kazior wrote:

> + * @NL80211_ATTR_SCAN_CHAN_TIME: Specifies how many msec should a driver spend
> + *	on each channel during scanning. This is optional and the default is
> + *	leave the decision up to the driver. This setting may, but preferrably

typo: preferably :)

> + *	shouldn't, be ignored by driver.

This seems a bit iffy - you don't differentiate between active/passive
scans?

Also maybe there should be a bit saying "I support scan timing" or even
the min/max times?

This also interferes a bit with some other scan optimisations that could
be done at a low firmware level, so I think we should be careful and
actually say that this is really more intended for measurement use cases
and not for normal scans?

Or maybe we should have a separate measurement command with similar
semantics? This all doesn't seem very clear to me yet :)

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
