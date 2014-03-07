Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WLx5z-00055v-Ky
 for ath10k@lists.infradead.org; Fri, 07 Mar 2014 15:54:00 +0000
Message-ID: <5319EB80.4010608@candelatech.com>
Date: Fri, 07 Mar 2014 07:53:36 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Firmware crash when sending large numbers of forwarded packets
References: <CAHqTa-2NASvnpURqH=LbPMOi8GKHB23Xc3pxwULqnsXMrKHpow@mail.gmail.com>
In-Reply-To: <CAHqTa-2NASvnpURqH=LbPMOi8GKHB23Xc3pxwULqnsXMrKHpow@mail.gmail.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Avery Pennarun <apenwarr@gmail.com>, ath10k <ath10k@lists.infradead.org>

On 03/07/2014 02:38 AM, Avery Pennarun wrote:
> Hi,
>
> I'm having a problem where if I transmit too fast out the ath10k
> interface in AP mode, I get a near-immediate firmware crash.
>
> Notes:
> - I can generate this by running 'iperf -s' on a wifi station and
> 'iperf -c' on a separate machine on the wired LAN connected to the
> ath10k AP.  (This transmits data in the downstream direction, ie. to
> the wifi interface)
> - If I use 'iperf -u' (UDP) it tries to restart the firmware, but the
> transmit queue stays dead.  If I use iperf in the default TCP mode, it
> restarts the firmware and generally recovers okay.
> - If I run 'iperf -c' directly on the AP device instead of a separate
> machine on the LAN, the crash never occurs.

That is interesting, sending from LAN will often burst higher
and cause more packet loss (and perhaps higher periodic packet
loads) but sending locally will typically allow the local stack to back
off more gracefully.

> - If I swap the direction of transmit (to the AP instead of from the
> AP) the crash never occurs.
> - CPU usage on the AP is always less than 1 CPU core (ARM CPU), so
> it's probably not falling behind on processing.
> - Using 40 or 80 MHz channel width for the test; also happens with 20
> MHz but less frequently.
> - Problem mostly doesn't occur until I exceed about 160 Mbit/sec.
>
> Versions:
> - kernel is based on current kvalo/for-linville branch (should I try
> something else?) but seems to be the same in linux-next-20140114 so I
> don't think this behaviour has changed lately.
> - firmware version 10.1.467.2-1, but also tested with 10.1.467.1-1
> with no difference.
>
> I assume other people are not experiencing this or they would have
> mentioned it by now.  What can I do to help debug this?
>
> Logs:
>
> [  360.717699] ath10k: firmware crashed!
> [  360.721434] ath10k: hardware name qca988x hw2.0 version 0x4100016c
> [  360.727669] ath10k: firmware version: 10.1.467.2-1
> [  360.733695] ath10k: target register Dump Location: 0x0040AC14
> [  360.740655] ath10k: target Register Dump
> [  360.744652] ath10k: [00]: 0x4100016C 0x000015B3 0x009AA69E 0x00955B31

This appears to be an assert in firmware, not just random crash.

Someone with .467 firmware source and a bit of skill with the tool-chain
should be able to figure out where it is asserting.

I do not know anyone with both of those things, however :P

Thanks,
Ben




-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
