Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ns2.inescn.pt ([192.35.246.20] helo=trubo.inescn.pt)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YWM2c-0005Fn-Ij
 for ath10k@lists.infradead.org; Fri, 13 Mar 2015 09:38:04 +0000
Message-ID: <20150313103721.13586092dzqt9w41@horde.inescporto.pt>
Date: Fri, 13 Mar 2015 10:37:21 +0100
From: =?iso-8859-1?b?TeFyaW8=?= Lopes <mjlopes@inescporto.pt>
Subject: Re: Specific tx rates with ath10k
References: <5501DAF7.1000800@candelatech.com>
In-Reply-To: <5501DAF7.1000800@candelatech.com>
MIME-Version: 1.0
Content-Disposition: inline
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="Yes"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Ben Greear <greearb@candelatech.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

Hi.

You can change to fixed bitrate for all types of traffic for 802.11g/a  
modes, even on ath10k:
for 2.4 GHz @ 54 Mbit/s - iw dev wiface set bitrates legacy-2.4 54
for 5 GHz @ 54 Mbit/s - iw dev wiface set bitrates legacy-5 54

Setting fixed speed for HT and VHT modes currently only takes effect  
on unicast traffic, I would like that this could be applied to other  
types of traffic in a future ath9k/ath10k driver.


Quoting Ben Greear <greearb@candelatech.com>:

> Ath10k firmware gives ability to set specific fixed rate-control rates
> for beacons/mgt, multicast, broadcast, and regular traffic.
>
> The ath10k driver only sets regular traffic currently.
>
> I had previously hacked my firmware to just set all rate types when
> ath10k driver requested to set the rate.
>
> But, that is not what my customer needs.
>
> So, I am now planning to add some debugfs entries to allow users to set
> beacon/mgt, multicast and broadcast rates individually (I don't have  
> time or interest
> right now to try patching things top to bottom to try to get this feature
> into mac80211 stack or 'iw').
>
> My question is, for when user just runs a command like this:
>
> ./local/sbin/iw dev vap1 set bitrates legacy-2.4 6 ht-mcs-2.4
>
> What is the desired behaviour?
>
> Set all rates (beacons/mgt, bcast, multicast, regular) to the same
> fixed speed, or just a certain subset of these traffic types?
>
> I can make my firmware do whatever combination is required, and then
> users can over-ride the values by using debugfs.....
>
> As a note, ath10k firmware will NOT send beacons at HT speeds, so
> if you fix an HT rate, then firmware will ignore that for the beacons/mgt
> ratecontrol type.
>
> Thanks,
> Ben
>
> --
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>



----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
