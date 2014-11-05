Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x229.google.com ([2a00:1450:400c:c05::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xm5nJ-0005uB-N0
 for ath10k@lists.infradead.org; Wed, 05 Nov 2014 18:59:02 +0000
Received: by mail-wi0-f169.google.com with SMTP id n3so12285498wiv.4
 for <ath10k@lists.infradead.org>; Wed, 05 Nov 2014 10:58:38 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <545A60E0.8070308@candelatech.com>
References: <5458261C.2020700@candelatech.com>
 <CAHqTa-21YOPiV_UxxWh23mB7AqLhj0n+h6eA5cTUH8eh32heRw@mail.gmail.com>
 <545A60E0.8070308@candelatech.com>
From: Avery Pennarun <apenwarr@gmail.com>
Date: Wed, 5 Nov 2014 10:58:18 -0800
Message-ID: <CAHqTa-2OKoKSqQXmfAq5esu5SWXJRvL8Vy+GMRsq4XertnTaFA@mail.gmail.com>
Subject: Re: Slow connect times?
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k <ath10k@lists.infradead.org>

On Wed, Nov 5, 2014 at 9:39 AM, Ben Greear <greearb@candelatech.com> wrote:
> On 11/03/2014 05:35 PM, Avery Pennarun wrote:
>> On Mon, Nov 3, 2014 at 8:04 PM, Ben Greear <greearb@candelatech.com> wrote:
>>> If I am reading my results right, it takes over 2 seconds to associate an
>>> ath10k station with WPA2 PSK on my systems.
>>>
>>> I was thinking this should be quite a bit faster than this...
>>>
>>> Has anyone done any similar measurements?
>>
>> I haven't noticed any delay like this.  WPA2 PSK negotiation is on the
>> order of ~200ms or less. Then DHCP screws around for a few seconds,
>> often.
>>
>> A packet trace would probably be useful for narrowing it down :)
>
> First part of my problem is that I had some extra debugging turned on and
> that was being sent to serial console, which is slow.
>
> But, even with that off I am still seeing ~200ms at best.
>
> Ath9k system on crappy old Atom processors usually completes in
> less than 20ms for comparison.
>
> Off to go spelunking in the ath10k code :P

That's very interesting for me.  200ms was kind of a worst case in my
traces, and I'm mostly seeing 20-40ms.  I think the key exchange is
all hostapd, so I'm surprised it would take so long.  Do you have a
trace?

Note that I *have* seen weird problems with delayed probe packets to
some clients, which could cause things like this.  But that's
apparently only because I applied Michal's patch to get rid of queue
blocking :)

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
