Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0LF5-0002TM-Lj
 for ath10k@lists.infradead.org; Wed, 21 Aug 2019 07:41:17 +0000
Message-ID: <d37c085c66fd4703f324c5576000a16fe469d3b1.camel@sipsolutions.net>
Subject: Re: [PATCHv6 2/9] nl80211: Add new netlink attribute for TID
 speicific retry count
From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 21 Aug 2019 09:41:10 +0200
In-Reply-To: <66f9219ed5bd03f96f23947c2bb6f990@codeaurora.org>
References: <1560835632-17405-1-git-send-email-tamizhr@codeaurora.org>
 <1560835632-17405-3-git-send-email-tamizhr@codeaurora.org>
 <6351a05f5c205db47740116b4bec5a6476317792.camel@sipsolutions.net>
 <66f9219ed5bd03f96f23947c2bb6f990@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Sat, 2019-08-10 at 17:36 +0530, Tamizh chelvam wrote:
> 
> > > +	[NL80211_TID_ATTR_CONFIG_RETRY] = { .type = NLA_FLAG },
> > > +	[NL80211_TID_ATTR_CONFIG_RETRY_SHORT] = NLA_POLICY_MIN(NLA_U8, 0),
> > > +	[NL80211_TID_ATTR_CONFIG_RETRY_LONG] = NLA_POLICY_MIN(NLA_U8, 0),
> > 
> > min of 0 doesn't make sense, maybe you meant 1? otherwise just don't 
> > set
> > anything here.
> > 
> The min value changed to 0 from 1 as per the previous discussions, since 
> this is a retry count and not a tx count.
> Or Shall I remove this min value to avoid the confusion ?

Yeah, I think then you should just remove the min value. Perhaps a max
value is needed, but I don't know.

> > > +			tid_conf->retry_short = -1;
> > > +
> > 
> > I guess you should document that -1 means no changes? Not sure how the
> > IEEE80211_TID_CONF_RETRY comes in, you're always setting it, so that's
> > useless - better remove that and document that -1 means no changes?
> > 
> The value -1 is to notify the driver to use default value by removing 
> peer specific retry count.

Oh. So I think that's slightly different, please document that.

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
