Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp87.iad3a.emailsrvr.com ([173.203.187.87])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gPURC-00024j-67
 for ath10k@lists.infradead.org; Wed, 21 Nov 2018 15:29:11 +0000
Date: Wed, 21 Nov 2018 10:28:55 -0500 (EST)
Subject: RE: Re: [Make-wifi-fast] [PATCH v3 3/6] mac80211: Add
 airtimeaccounting and scheduling to TXQs
From: "David P. Reed" <dpreed@deepplum.com>
MIME-Version: 1.0
Message-ID: <1542814135.446217011@apps.rackspace.com>
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
To: David Lang <david@lang.hm>
Cc: Rajkumar Manoharan <rmanohar@codeaurora.org>, Make-Wifi-fast <make-wifi-fast@lists.bufferbloat.net>, linux-wireless <linux-wireless@vger.kernel.org>, Dave Taht <dave.taht@gmail.com>, ath10k <ath10k@lists.infradead.org>, Ben Greear <greearb@candelatech.com>, Felix Fietkau <nbd@nbd.name>

Really? Tires are Bluetooth? I don't think mine are, but now I want to figure out how that works. 1600Chips/sec is 600 microseconds per chip. They spin at up to, say, radial rates that are a 100 revs/sec and thus take maybe 10 msec. to travel 30 cm. How much warble in a chip frequency is there?

Ok, maybe they only need to work when the car is stopped.

I would design a tire pressure system that sends, maybe, 10 bits per second, at most. Or calibrate the sensor to produce 1 bit, and use the car metal frame to carry the signal to the computer as a single bit. A very slowly varying sensor can be sensed without needing a battery, by using some passive, tuned circuit.

Bluetooth is way overkill, but cheap. I doubt it works well in the application, though.

-----Original
From: "David Lang" <david@lang.hm>
Sent: Mon, Nov 19, 2018 at 9:12 pm
To: "Dave Taht" <dave.taht@gmail.com>
Cc: "Dave Taht" <dave.taht@gmail.com>, "Rajkumar Manoharan" <rmanohar@codeaurora.org>, "Make-Wifi-fast" <make-wifi-fast@lists.bufferbloat.net>, "linux-wireless" <linux-wireless@vger.kernel.org>, "ath10k" <ath10k@lists.infradead.org>, "Ben Greear" <greearb@candelatech.com>, "Felix Fietkau" <nbd@nbd.name>
Subject: Re: [Make-wifi-fast] [PATCH v3 3/6] mac80211: Add airtimeaccounting and scheduling to TXQs

On Mon, 19 Nov 2018, Dave Taht wrote:

>> I'm not sure if this was a fluke or not, but at Starbucks recently I sat outside,
>> right next to their window, and could not scan their AP at all.  Previously, I sat
>> inside, 3 feet away through the glass, and got great signal.  I wonder what that was
>> all about!  Maybe special tinting that blocks RF?  Or just dumb luck of some sort.
>
> Ya know, I could definitely see a market for a material like that! I'd
> like it for my car, so bluetooth wouldn't escape.

That would break your tire pressure sensors (each car is rolling around 
broadcasting 4 unique bluetooth IDs, not hard to track)

David Lang
_______________________________________________
Make-wifi-fast mailing list
Make-wifi-fast@lists.bufferbloat.net
https://lists.bufferbloat.net/listinfo/make-wifi-fast


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
