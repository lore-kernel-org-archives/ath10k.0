Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ve0-x22b.google.com ([2607:f8b0:400c:c01::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WM5XJ-0002sT-LD
 for ath10k@lists.infradead.org; Sat, 08 Mar 2014 00:54:46 +0000
Received: by mail-ve0-f171.google.com with SMTP id cz12so4943751veb.16
 for <ath10k@lists.infradead.org>; Fri, 07 Mar 2014 16:54:22 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <5319EB80.4010608@candelatech.com>
References: <CAHqTa-2NASvnpURqH=LbPMOi8GKHB23Xc3pxwULqnsXMrKHpow@mail.gmail.com>
 <5319EB80.4010608@candelatech.com>
From: Avery Pennarun <apenwarr@gmail.com>
Date: Fri, 7 Mar 2014 18:54:01 -0600
Message-ID: <CAHqTa-2Be3Whehq4tG1vSxBikLGuTeFMQmbYT5K3D1ui4hRumw@mail.gmail.com>
Subject: Re: Firmware crash when sending large numbers of forwarded packets
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

On Fri, Mar 7, 2014 at 10:53 AM, Ben Greear <greearb@candelatech.com> wrote:
> That is interesting, sending from LAN will often burst higher
> and cause more packet loss (and perhaps higher periodic packet
> loads) but sending locally will typically allow the local stack to back
> off more gracefully.

That theory sounds right.  Do you think there's a way to simulate the
burstiness while avoiding the extra machine?  That would make testing
easier.  Some way to write a lot of packets to a socket and then
release it all at once?  I'm guessing UDP would work better for this
than TCP.

>> [  360.717699] ath10k: firmware crashed!
>> [  360.721434] ath10k: hardware name qca988x hw2.0 version 0x4100016c
>> [  360.727669] ath10k: firmware version: 10.1.467.2-1
>> [  360.733695] ath10k: target register Dump Location: 0x0040AC14
>> [  360.740655] ath10k: target Register Dump
>> [  360.744652] ath10k: [00]: 0x4100016C 0x000015B3 0x009AA69E 0x00955B31
>
> This appears to be an assert in firmware, not just random crash.
>
> Someone with .467 firmware source and a bit of skill with the tool-chain
> should be able to figure out where it is asserting.
>
> I do not know anyone with both of those things, however :P

Maybe I should try harder to get access to the firmware source :)

Michal wrote:
> Avery wrote:
>> - If I swap the direction of transmit (to the AP instead of from the
>> AP) the crash never occurs.
>
> What is the STA endpoint? Is it an ath10k too? Does it run on similar
> ARM board too?

It's a Macbook in this case.  Other people here have simulated it with
other kinds of endpoints, including a Veriwave test device.

>> I assume other people are not experiencing this or they would have
>> mentioned it by now.  What can I do to help debug this?
>
> Can you try reproducing this with traces? Considering this might get
> too big to attach to an email I think it's okay to exclude
> ath10k:ath10k_log_dbg_dump from traces.

Can you give me a clue how to get started with traces?  What do I
enable, and what parts do you want to see?

>> [  362.119075] ath10k_pci 0000:00:00.0: dma_pool_destroy ath10k htt tx
>> pool, ffd8c000 busy
>> [  362.127193] ath10k_pci 0000:00:00.0: dma_pool_destroy ath10k htt tx
>> pool, ffd8d000 busy
>
> These dma pool warnings are very suspicious. I'm guessing tx wasn't
> really stopped and perhaps it leaked due to missing locking/checks.

Agreed.  But I figured that since this part only happens after the
firmware has already crashed, maybe it's of secondary importance.

Have fun,

Avery

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
