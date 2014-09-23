Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XWSXw-0006tQ-Dh
 for ath10k@lists.infradead.org; Tue, 23 Sep 2014 16:02:32 +0000
Message-ID: <54219982.8020204@candelatech.com>
Date: Tue, 23 Sep 2014 09:02:10 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Rate ctrl problem with 2x2 station.
References: <5420BCDA.5010701@candelatech.com>
 <CA+BoTQ=21YJ=WC+T51J_15m1qtDKhWSVP0cYw-P6R-tEmLoLNQ@mail.gmail.com>
In-Reply-To: <CA+BoTQ=21YJ=WC+T51J_15m1qtDKhWSVP0cYw-P6R-tEmLoLNQ@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: ath10k <ath10k@lists.infradead.org>

On 09/23/2014 01:43 AM, Michal Kazior wrote:
> On 23 September 2014 02:20, Ben Greear <greearb@candelatech.com> wrote:
>> While testing the previously posted patches that fix up the
>> transmit rate for 3x3 NICs configured for 2x2 chainmask, I
>> noticed that an ath10k configured as 3x3 AP will use only
>> 1x1 rates when transmitting to a 2x2 station.
>>
>> From debugging so far, it appears the root cause is that
>> the method ath10k_peer_assoc_h_ht in mac.c is passed an
>> sta with rx_nss set to 3, when in fact the station *should*
>> be showing up as 2x2.
>>
>> Possibly station system is still messed up some how...
> 
> Am I understanding correctly that the 2x2 station is just a 3x3 ath10k
> device with "tx/rx_chainmask" being set to 0x3? If so then rx_nss
> being 3 is okay because setting chainmasks does not affect advertised
> capabilities and association sequences remain unaffected.

I was thinking the peer's rx-nss would be what the peer (ie, station)
can receive from the AP?  If so, then it should be 2 in this case
since that is what the station is (or should be) advertising.

> The problem might be  the hw rate control is unable to deal with the
> strange chainmask setup. Did you try 10.2? I've been told it contains
> some rate control improvements.

It could easily be the hw rate control, but I will try to work around
it in the driver, as it is very likely 10.1 has same issue as my
firmware.  Certainly my 10.1 based firmware craps out if nss does
not match reality (see previously posted patches).  Looks like same
general problem on the AP side.

I have not tried 10.2, the latest snapshot I can get is from last
December, so it does not appear anyone is actively working on it,
and if it took 8 months to get into the ath10k driver, it must not be
obviously better??

I will take a look at the difference between 10.2 and 10.1 and
try to merge them into my tree when I get a chance.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
