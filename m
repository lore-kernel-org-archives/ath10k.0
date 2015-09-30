Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZhJ8M-0007UZ-UE
 for ath10k@lists.infradead.org; Wed, 30 Sep 2015 15:17:31 +0000
Message-ID: <1443626224.1859.9.camel@sipsolutions.net>
Subject: Re: Can we ignore frames with invalid BSSID in IBSS mode?
From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 30 Sep 2015 17:17:04 +0200
In-Reply-To: <560BFABC.8090504@candelatech.com>
References: <5605D228.7050609@candelatech.com>
 (sfid-20150926_010105_789618_F93D668E)
 <1443595615.1859.2.camel@sipsolutions.net>
 <560BFABC.8090504@candelatech.com>
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
To: Ben Greear <greearb@candelatech.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

On Wed, 2015-09-30 at 08:07 -0700, Ben Greear wrote:
> 
> On 09/29/2015 11:46 PM, Johannes Berg wrote:
> > On Fri, 2015-09-25 at 16:00 -0700, Ben Greear wrote:
> > > It seems that ath10k ar988X hardware has a bug where the BSSID
> > > for IBSS AMSDU frames is all zeros.  The 'main' 636 ath10k firmware
> > > does not seem to use AMSDUs for IBSS, and when I enable it in my CT
> > > firmware, then I see the breakage.  So, I suspect it is not
> > > just a simple software/firmware bug.
> > > 
> > > If I simply ignore the bssid_match check in ieee80211_accept_frame,
> > > then it seems everything runs fine.
> > > 
> > > So, I'm curious if anyone knows what sorts of bad things could happen
> > > if the bssid_match check is ignored?  Maybe bcast/mcast frames could
> > > be accepted when they shouldn't be in certain cases?
> > > 
> > 
> > You could end up accepting multicast frames from a different,
> > overlapping, BSS? Seems like a bad idea.
> 
> It's definitely not a great idea.
> 
> In my testing, I always see the first frame of the AMPDU have
> a proper IBSS BSSID.  Any idea if it would be OK (and even possible)
> for the driver or stack to detect this and save the BSSID aside
> for the subsequent frames?

That seems reasonable.

> Its not clear to me whether the rest of the AMPDU frames could
> somehow be interleaved with frames from a different BSSID?
> 

They can't be, at least not without some very strange hacks on the
transmitter.

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
