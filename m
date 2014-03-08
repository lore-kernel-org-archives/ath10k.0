Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WM5lC-000362-Sy
 for ath10k@lists.infradead.org; Sat, 08 Mar 2014 01:09:07 +0000
Message-ID: <531A6D9B.4060605@candelatech.com>
Date: Fri, 07 Mar 2014 17:08:43 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Firmware crash when sending large numbers of forwarded packets
References: <CAHqTa-2NASvnpURqH=LbPMOi8GKHB23Xc3pxwULqnsXMrKHpow@mail.gmail.com>
 <5319EB80.4010608@candelatech.com>
 <CAHqTa-2Be3Whehq4tG1vSxBikLGuTeFMQmbYT5K3D1ui4hRumw@mail.gmail.com>
In-Reply-To: <CAHqTa-2Be3Whehq4tG1vSxBikLGuTeFMQmbYT5K3D1ui4hRumw@mail.gmail.com>
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
To: Avery Pennarun <apenwarr@gmail.com>
Cc: ath10k <ath10k@lists.infradead.org>

On 03/07/2014 04:54 PM, Avery Pennarun wrote:
> On Fri, Mar 7, 2014 at 10:53 AM, Ben Greear <greearb@candelatech.com> wrote:
>> That is interesting, sending from LAN will often burst higher
>> and cause more packet loss (and perhaps higher periodic packet
>> loads) but sending locally will typically allow the local stack to back
>> off more gracefully.
> 
> That theory sounds right.  Do you think there's a way to simulate the
> burstiness while avoiding the extra machine?  That would make testing
> easier.  Some way to write a lot of packets to a socket and then
> release it all at once?  I'm guessing UDP would work better for this
> than TCP.

UDP has some local backpressure as well, but maybe it would be more
likely to hit it than TCP I guess.

It could also be something else related to forwarding that is not just
rate specific (maybe frames come in with LRO and something special
about transmitting those, or something of that nature?).

Are you using bridging or routing on your AP?  Bridging might
be fundamentally different than routing as far as this bug
is concerned.  Sending from local AP would likely emulate
routing type behaviour.

>> This appears to be an assert in firmware, not just random crash.
>>
>> Someone with .467 firmware source and a bit of skill with the tool-chain
>> should be able to figure out where it is asserting.
>>
>> I do not know anyone with both of those things, however :P
> 
> Maybe I should try harder to get access to the firmware source :)

Good luck..if you do get it and the toolchain, I can point
you towards how to decode (ie, get stack trace) that crash, or at least I can send
QCA email they could forward you (to satisfy any NDA isues).


Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
