Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0LFw-0002Zp-0S
 for ath10k@lists.infradead.org; Wed, 21 Aug 2019 07:42:09 +0000
Message-ID: <82bff92e6fa9ccc968566d30195cd3cd29e17a1d.camel@sipsolutions.net>
Subject: Re: [PATCHv6 1/9] nl80211: New netlink command for TID specific
 configuration
From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 21 Aug 2019 09:42:05 +0200
In-Reply-To: <be096df17632b1a71441a23a373682bf@codeaurora.org>
References: <1560835632-17405-1-git-send-email-tamizhr@codeaurora.org>
 <1560835632-17405-2-git-send-email-tamizhr@codeaurora.org>
 <ea1f9969b52fed2da8b0e88ed8b06527bfc272aa.camel@sipsolutions.net>
 <be096df17632b1a71441a23a373682bf@codeaurora.org>
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

On Sat, 2019-08-10 at 18:10 +0530, Tamizh chelvam wrote:
> On 2019-07-31 14:55, Johannes Berg wrote:
> > On Tue, 2019-06-18 at 10:57 +0530, Tamizh chelvam wrote:
> > >  /**
> > > + * enum nl80211_tid_config - TID config state
> > > + * @NL80211_TID_CONFIG_DEFAULT: Default config for the TID
> > > + * @NL80211_TID_CONFIG_ENABLE: Enable config for the TID
> > > + * NL80211_TID_CONFIG_DISABLE: Disable config for the TID
> > > + */
> > > +enum nl80211_tid_config {
> > > +	NL80211_TID_CONFIG_DEFAULT,
> > > +	NL80211_TID_CONFIG_ENABLE,
> > > +	NL80211_TID_CONFIG_DISABLE,
> > > +};
> > 
> > Hmm. Looking at this in more detail in patch 3, I don't understand.
> > 
> > How is DEFAULT different from "attribute not present", i.e. "no
> > changes"?
> > 
> This DEFAULT is used to notify the driver to use default configuration 
> value of driver/vif.
> This will be used when the attribute is not present.

Hm, but then why is it valid in the nl80211 attribute? That seems
confusing. Maybe there should rather be a validity bit somewhere in the
internal API, so the nl82011 API doesn't need to be concerned with this?

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
