Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ac8gK-000232-9d
 for ath10k@lists.infradead.org; Sat, 05 Mar 2016 09:39:28 +0000
Date: Sat, 5 Mar 2016 15:08:52 +0530
From: Mohammed Shafi Shajakhan <mohammed@codeaurora.org>
Subject: Re: [PATCH] cfg80211/nl80211: Add support for
 NL80211_STA_INFO_RX_DURATION
Message-ID: <20160305093852.GA8153@atheros-ThinkPad-T61>
References: <1456927710-32073-1-git-send-email-mohammed@qca.qualcomm.com>
 <1457019983.2044.29.camel@sipsolutions.net>
 <20160303160048.GA5243@atheros-ThinkPad-T61>
 <1457021271.2044.34.camel@sipsolutions.net>
 <20160303162036.GB5243@atheros-ThinkPad-T61>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20160303162036.GB5243@atheros-ThinkPad-T61>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, kvalo@codeaurora.org, ath10k@lists.infradead.org, Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Hi Johannes,

https://groups.google.com/a/chromium.org/forum/#!msg/chromium-os-reviews/lD=
zKxgl6fIE/H5GQfMcuBwAJ

for more information regarding the request for implementation. I will send =
a v2
re-phrasing that it is implementation specific.

regards,
shafi


On Thu, Mar 03, 2016 at 09:50:36PM +0530, Mohammed Shafi Shajakhan wrote:
> Hi johannes,
> =

> On Thu, Mar 03, 2016 at 05:07:51PM +0100, Johannes Berg wrote:
> > On Thu, 2016-03-03 at 21:30 +0530, Mohammed Shafi Shajakhan wrote:
> > =

> > > [shafi] This is part of the Per Station statistics requirement,
> > =

> > Heh. Whose requirements? :)
> =

> [shafi] We have this as part of ath10k debugfs based on the end user (or)=
 a
> customer requirement and i think its make more sense to have this common =
across all
> wifi drivers rather thank simply dumping it in ath10k debugfs. I think its
> similar to 'ieee80211_frame_duration'(?) in mac80211 but for drivers like=
 ath10k
> where this is calculated in firmware for rx and implementation specific.
> =

> > =

> > > the information from 'iw dev wlan#N station dump' which has
> > > rx_duration
> > > field will be used by application assesing the statistics
> > > /performance of various clients connected to our AP. We will plot
> > > a graph based on this information (assesing the rx time spent by
> > > AP for various clients).
> > > =

> > > > =

> > > > Are you really sure you mean "unicast"? What if the station is the
> > > > AP? Why wouldn't multicast frames it transmitted be accounted for?
> > > =

> > > [shafi] This is based on the implementation by the driver/firmware.
> > > We are focused on the AP side so unicast frames, if you are ok with
> > > this change, i can change the documentation to be specific (generic
> > > for all the drivers) =A0something like implementation specific (please
> > > advise)
> > =

> > Ok, but for AP side I don't see the difference between "unicast" and
> > "all frames", since all frames from that station should be unicast?
> > Apart, perhaps, from some management frames the station might send
> > outside the BSS, but that's not likely to matter much?
> =

> [shafi] exactly, I can change the documentation as you wish and
> this is implementation specific, and we have implemented like this in ath=
10k
> targeting AP mode.
> =

> > =

> > IOW, why not specify all frames, and let this make some sense for other
> > interface modes?
> >
> [shafi] Agreed.
> =

> regards,
> shafi
> --
> To unsubscribe from this list: send the line "unsubscribe linux-wireless"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
