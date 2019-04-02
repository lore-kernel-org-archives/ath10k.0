Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBJ6A-0002Rx-B1
 for ath10k@lists.infradead.org; Tue, 02 Apr 2019 13:05:11 +0000
Message-ID: <2c0321130116163bc92f9738b2c31126557d819f.camel@sipsolutions.net>
Subject: Re: [PATCH v4 1/3] cfg80211: Add support to set tx power for a
 station associated
From: Johannes Berg <johannes@sipsolutions.net>
Date: Tue, 02 Apr 2019 15:04:59 +0200
In-Reply-To: <20190402125908.GD32168@localhost>
 (sfid-20190402_145911_852222_9FB31AF6)
References: <1553856501-21492-1-git-send-email-bpothuno@codeaurora.org>
 <20190401204611.GA8910@localhost>
 <cd497042d164c322bc06c4cfbf26435a@codeaurora.org>
 <20190402125908.GD32168@localhost> (sfid-20190402_145911_852222_9FB31AF6)
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
To: Bob Copeland <me@bobcopeland.com>, Balaji Pothunoori <bpothuno@codeaurora.org>
Cc: Ashok Raj Nagarajan <arnagara@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Tue, 2019-04-02 at 08:59 -0400, Bob Copeland wrote:
> On Tue, Apr 02, 2019 at 12:00:29PM +0530, Balaji Pothunoori wrote:
> > > Should this really dBm?  It's a bit asymmetric for WIPHY_TX_POWER_LEVEL
> > > to
> > > use mBm and this to use dBm, and I might want to adjust in half-dB steps
> > > if
> > > supported by hardware.  Also allocating an s16 is a bit much for dBm.
> > 
> > if user will send mBm value then driver has to convert to dBm because
> > firmware will expect the value in dBm.
> > Please refer johannes comments on following patch " [EXT] Re: [PATCH] iw:
> > Add support for controlling tx power for per station"
> > for the reason why we opted dBm.
> 
> The quote was:
> 
> > I would prefer if this was *dBm*, rather than mBm, and be allowed to
> > take float values, i.e. this would become "limit 20".
> 
> I read that as "iw should convert fractional dBm to mBm" not "kernel should
> only support dBm".

Yeah, I was scratching my head here now wondering why I'd have said
that... But yes, I intended that we should present the nicer UI (float
dBm or so) and then send mBm :)

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
