Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-cys01nam02on0619.outbound.protection.outlook.com
 ([2a01:111:f400:fe45::619]
 helo=NAM02-CY1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gL3Nj-0005Wh-58
 for ath10k@lists.infradead.org; Fri, 09 Nov 2018 09:47:21 +0000
From: Sergey Matyukevich <sergey.matyukevich.os@quantenna.com>
Subject: Re: [PATCH 1/4] New netlink command for TID specific configuration
Date: Fri, 9 Nov 2018 09:47:01 +0000
Message-ID: <20181109094654.7w2etehlz55lv662@bars>
References: <1540230918-27712-1-git-send-email-tamizhr@codeaurora.org>
 <1540230918-27712-2-git-send-email-tamizhr@codeaurora.org>
 <20181106101601.526ovvmabfqrr7sl@bars>
 <7a8662ce7744bee6d9e695c67d7e9643@codeaurora.org>
In-Reply-To: <7a8662ce7744bee6d9e695c67d7e9643@codeaurora.org>
Content-Language: en-US
Content-ID: <15BA425A48C91040BC7FBC226DFC7A0A@namprd05.prod.outlook.com>
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
To: Tamizh chelvam <tamizhr@codeaurora.org>
Cc: Igor Mitsyanko <igor.mitsyanko.os@quantenna.com>, "johannes@sipsolutions.net" <johannes@sipsolutions.net>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hello Tamizh,

> > > Co-Developed-by: Tamizh Chelvam <tamizhr@codeaurora.org>
> > > Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
> > > Signed-off-by: Tamizh chelvam <tamizhr@codeaurora.org>
> > > ---
> > >  include/net/cfg80211.h       |   14 +++++++
> > >  include/uapi/linux/nl80211.h |   69 +++++++++++++++++++++++++++++++++
> > >  net/wireless/nl80211.c       |   86
> > > ++++++++++++++++++++++++++++++++++++++++++
> > >  net/wireless/rdev-ops.h      |   15 ++++++++
> > >  net/wireless/trace.h         |   27 +++++++++++++
> > >  5 files changed, 211 insertions(+)

...

> > >  /**
> > > @@ -4035,6 +4044,9 @@ struct wiphy_iftype_ext_capab {
> > >   * @txq_limit: configuration of internal TX queue frame limit
> > >   * @txq_memory_limit: configuration internal TX queue memory limit
> > >   * @txq_quantum: configuration of internal TX queue scheduler quantum
> > > + *
> > > + * @max_data_retry_count: Maximum limit can be configured as retry
> > > count
> > > + *     for a TID.
> > >   */
> > >  struct wiphy {
> > >         /* assign these fields before you register the wiphy */
> > > @@ -4171,6 +4183,8 @@ struct wiphy {
> > >         u32 txq_memory_limit;
> > >         u32 txq_quantum;
> > > 
> > > +       u8 max_data_retry_count;
> > > +
> > >         char priv[0] __aligned(NETDEV_ALIGN);
> > >  };
> > 
> > Could you please clarify why do you define max_data_retry_count instead
> > of
> > making use of existing wiphy params: retry_short (dot11ShortRetryLimit)
> > and retry_long (dot11LongRetryLimit) ?
> 
> max_data_retry_count added to validate the max limit for the retry count
> supported by the driver.
> existing wiphy parames: retry_short and retry_long can be modified
> through user command.
> So, I've added this param for validation purpose. Correct me If I'm
> wrong.

Well, but then it probably makes sense to use max_data_retry_count value
to validate retry_short and retry_long values in nl80211_set_wiphy.

Regards,
Sergey

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
