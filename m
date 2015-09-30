Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout.kundenserver.de ([212.227.17.13])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZhCWi-00025g-6w
 for ath10k@lists.infradead.org; Wed, 30 Sep 2015 08:14:12 +0000
Subject: Re: Can we ignore frames with invalid BSSID in IBSS mode?
References: <5605D228.7050609@candelatech.com>
From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Message-ID: <560B99AA.5060401@green-communications.fr>
Date: Wed, 30 Sep 2015 10:13:30 +0200
MIME-Version: 1.0
In-Reply-To: <5605D228.7050609@candelatech.com>
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

On 26/09/2015 01:00, Ben Greear wrote:
> It seems that ath10k ar988X hardware has a bug where the BSSID
> for IBSS AMSDU frames is all zeros.  The 'main' 636 ath10k firmware
> does not seem to use AMSDUs for IBSS, and when I enable it in my CT
> firmware, then I see the breakage.  So, I suspect it is not
> just a simple software/firmware bug.
> 
> If I simply ignore the bssid_match check in ieee80211_accept_frame,
> then it seems everything runs fine.
> 
> So, I'm curious if anyone knows what sorts of bad things could happen
> if the bssid_match check is ignored?  Maybe bcast/mcast frames could
> be accepted when they shouldn't be in certain cases?

Given that all it takes for an IBSS station to be added as a neighbor
is to see a frame from an unknown station with the same BSSID
(ieee80211_ibss_rx_no_sta(), just 10 lines below), your ath10k chip
will consider all stations for neighboring IBSS to be part of this BSS.

If RSN is used, or any other protocol/program that watches the list of
neighbors, then your station will try to communicate with them.  Good
(those who don't ignore bssid checks) neighbors will normally drop the
frames. But if you deploy several machines ignoring the bssid check,
then they cannot run two concurrent IBSS networks.

Also, if there is a limit on how much stations the ath10k hardware can
handle, then that limit have a higher chance of being reached.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
