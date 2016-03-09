Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1adXxF-0005ZE-Bb
 for ath10k@lists.infradead.org; Wed, 09 Mar 2016 06:50:45 +0000
Date: Wed, 9 Mar 2016 12:20:15 +0530
From: Mohammed Shafi Shajakhan <mohammed@codeaurora.org>
Subject: Re: [PATCH v1] cfg80211/nl80211: Add support for
 NL80211_STA_INFO_RX_DURATION
Message-ID: <20160309065015.GB6068@atheros-ThinkPad-T61>
References: <1457348614-10584-1-git-send-email-mohammed@qca.qualcomm.com>
 <1457455943.24270.8.camel@sipsolutions.net>
 <20160309063914.GA6068@atheros-ThinkPad-T61>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20160309063914.GA6068@atheros-ThinkPad-T61>
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

On Wed, Mar 09, 2016 at 12:09:15PM +0530, Mohammed Shafi Shajakhan wrote:
> Hi Johannes,
> =

> On Tue, Mar 08, 2016 at 05:52:23PM +0100, Johannes Berg wrote:
> > On Mon, 2016-03-07 at 16:33 +0530, Mohammed Shafi Shajakhan wrote:
> > > From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
> > > =

> > > Add support for new netlink attribute 'NL80211_STA_INFO_RX_DURATION'
> > > This flag will be set when drivers can fill rx_duration (vendor
> > > specific total air time(usecs) for data/management frames from the
> > > connected client) via 'drv_sta_statistics' callback
> > > =

> > > Also make sta_info flags 'filled' as 64 bit to accommodate for new
> > > per station stats. Extend 'PUT_SINFO' for supporting rx_duration
> > > field and any new per sta information in future
> > > =

> > > Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
> > > ---
> > > [v1]=A0
> > > 1. Fixed typo for accommodate
> > > 2. changed the doc for rx_duration as 'vendor specific
> > > implementation'
> > =

> > No, I want it defined for all cases, not left undefined.
> =

> [shafi] Let me know if the below documentation is fine with you please
> =

> "@rx_duration: approximate total air time(usecs) for all data/management
>     frames from the connected client "

[shafi] correction (made it all frames (not only data/management frames)

 "@rx_duration: approximate total air time(usecs) for all frames
		from the connected client "

> =

> thanks for reviewing this and Jouni for his initial suggestions.
> =

> regards,
> shafi
> =

> --
> To unsubscribe from this list: send the line "unsubscribe linux-wireless"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
