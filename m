Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-co1nam05on062a.outbound.protection.outlook.com
 ([2a01:111:f400:fe50::62a]
 helo=NAM05-CO1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gL3HJ-0001dj-O8
 for ath10k@lists.infradead.org; Fri, 09 Nov 2018 09:40:39 +0000
From: Sergey Matyukevich <sergey.matyukevich.os@quantenna.com>
Subject: Re: [PATCH 1/4] New netlink command for TID specific configuration
Date: Fri, 9 Nov 2018 09:40:24 +0000
Message-ID: <20181109094017.j4vkhaprz4zmszch@bars>
References: <1540230918-27712-1-git-send-email-tamizhr@codeaurora.org>
 <1540230918-27712-2-git-send-email-tamizhr@codeaurora.org>
 <20181107140552.zfuusbapgqjumoln@bars>
 <0b75171a7777bd25e203240a3a119cb5@codeaurora.org>
In-Reply-To: <0b75171a7777bd25e203240a3a119cb5@codeaurora.org>
Content-Language: en-US
Content-ID: <D9016FE9226B684F93C920BFB685E5FD@namprd05.prod.outlook.com>
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
Cc: "johannes@sipsolutions.net" <johannes@sipsolutions.net>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hello Tamizh,

...

> > > +static int nl80211_set_tid_config(struct sk_buff *skb,
> > > +                                 struct genl_info *info)
> > > +{
> > > +       struct cfg80211_registered_device *rdev = info->user_ptr[0];
> > > +       struct nlattr *attrs[NL80211_ATTR_TID_MAX + 1];
> > > +       struct nlattr *tid;
> > > +       struct net_device *dev = info->user_ptr[1];
> > > +       const char *peer = NULL;
> > > +       u8 tid_no;
> > > +       int ret = -EINVAL, retry_short = -1, retry_long = -1;
> > > +
> > > +       tid = info->attrs[NL80211_ATTR_TID_CONFIG];
> > > +       if (!tid)
> > > +               return -EINVAL;
> > > +
> > > +       ret = nla_parse_nested(attrs, NL80211_ATTR_TID_MAX, tid,
> > > +                              nl80211_attr_tid_policy, info->extack);
> > > +       if (ret)
> > > +               return ret;
> > > +
> > > +       if (!attrs[NL80211_ATTR_TID])
> > > +               return -EINVAL;
> > > +
> > > +       if (attrs[NL80211_ATTR_TID_RETRY_SHORT]) {
> > > +               retry_short =
> > > nla_get_u8(attrs[NL80211_ATTR_TID_RETRY_SHORT]);
> > > +               if (!retry_short ||
> > > +                   retry_short > rdev->wiphy.max_data_retry_count)
> > > +                       return -EINVAL;
> > > +       }
> > > +
> > > +       if (attrs[NL80211_ATTR_TID_RETRY_LONG]) {
> > > +               retry_long =
> > > nla_get_u8(attrs[NL80211_ATTR_TID_RETRY_LONG]);
> > > +               if (!retry_long ||
> > > +                   retry_long > rdev->wiphy.max_data_retry_count)
> > > +                       return -EINVAL;
> > > +       }
> > > +
> > > +       tid_no = nla_get_u8(attrs[NL80211_ATTR_TID]);
> > > +       if (tid_no >= IEEE80211_FIRST_TSPEC_TSID)
> > > +               return -EINVAL;
> > > +
> > > +       if (info->attrs[NL80211_ATTR_MAC])
> > > +               peer = nla_data(info->attrs[NL80211_ATTR_MAC]);
> > > +
> > > +       if (nla_get_flag(attrs[NL80211_ATTR_TID_RETRY_CONFIG])) {
> > 
> > Do we really need this additional flag to indicate retry data ?
> > Maybe we can simply check retry attrs or even retry data, e.g.:
> 
> Yes, because this implementation gives provision to set default retry
> count for TID traffic type for a station.
> Since we use single NL command for all TID configurations, this flag
> will be useful to notify the driver about
> retry TID configuration change.

Ok. So if driver receives retry value (-1), it should reset to some
default value known to driver or firmware. IMHO it worth making it
more explicit: in its current form this convention will not be obvious
for driver authors. Though I don't have a good idea how to do it.
Maybe merge both aggregation and retry cfg80211 callbacks into one
and use structure for params and bitmask for operations...

> > 
> > if (attrs[NL80211_ATTR_TID_RETRY_LONG] ||
> >     attrs[NL80211_ATTR_TID_RETRY_SHORT]) {
> >     ...
> > 
> > if ((retry_short > 0) || (retry_long > 0)) {
> >     ...

Regards,
Sergey

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
