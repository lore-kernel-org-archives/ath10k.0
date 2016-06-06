Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b9yoG-0002VM-6b
 for ath10k@lists.infradead.org; Mon, 06 Jun 2016 17:59:33 +0000
Received: by mail-vk0-x22c.google.com with SMTP id d127so210137552vkh.2
 for <ath10k@lists.infradead.org>; Mon, 06 Jun 2016 10:59:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5755B2D9.7080207@candelatech.com>
References: <CAOiRWuVxbGDoVtxahwRxyH9NaBB9LmaEBZ5bzgSPEf=Eu1g=ug@mail.gmail.com>
 <5755B0FF.9010900@candelatech.com>
 <CAOiRWuUFvZU1b4Pn8nDVs5O5sNK-g0PPbckriP=RmBnB5f-5Gw@mail.gmail.com>
 <5755B2D9.7080207@candelatech.com>
Date: Mon, 6 Jun 2016 13:59:09 -0400
Message-ID: <CAOiRWuUjugeDtRTQUWBzoCq58L8XfW7aYQTHa=Mnf4smx6AR2g@mail.gmail.com>
Subject: Re: Any tips on where per-packet antenna selection could be pushed?
From: Zach Sherin <zach@netblazr.com>
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
Cc: ath10k@lists.infradead.org

I was aiming to run this off a serial interface on the general board,
not on the ath10k NIC. I have a consumer QCA9880 PCI board in an
Archer C7 router. It would be awesome if I could steal a GPIO or
something from the atheros chip to output, but I was assuming I
couldn't. The main reason I was looking at the ath10k driver was to
get as close to when the packets are transmitted as possible, to leave
as little room for error in the switching as possible.

However, it's  possible that I'm hoping for too much there. I'd be
interested to hear your thoughts on it. If I can't pull it off, I'll
move to an approach outside ath10k.

Thanks,
Zach
On Mon, Jun 6, 2016 at 1:28 PM, Ben Greear <greearb@candelatech.com> wrote:
> On 06/06/2016 10:24 AM, Zach Sherin wrote:
>>
>> I'm not sure I know exactly what you mean by per-peer. Do you mean
>> that the antenna switches only when we're delivering to a new
>> next-hop? I would absolutely be fine with that, by per-packet I do
>> actually mean selection based on destination/next hop so aggregating
>> deliveries for a single peer would be even better.
>>
>> Also, I forgot to mention that this is intended for static mesh
>> networks, so I'm not worried about moment-to-moment changes in peer
>> location.
>
>
> Maybe some of the official QCA devs will have some ideas on how to do
> this with stock firmware.
>
> I am guessing you would have to have some API in the firmware that
> could twiddle your antenna right before attempting to transmit a
> frame?
>
> Do you have physical output pins on your ath10k NIC to even do this?
>
> Thanks,
> Ben
>
>
>
>>
>> Thanks,
>> Zach
>>
>> On Mon, Jun 6, 2016 at 1:21 PM, Ben Greear <greearb@candelatech.com>
>> wrote:
>>>
>>> On 06/06/2016 10:12 AM, Zach Sherin wrote:
>>>>
>>>>
>>>> Hi all,
>>>>
>>>> I'm working on a device with antenna selection, similar to the ideas
>>>> behind Ruckus or Google's Onhub router. I've been looking into a
>>>> solution for per-packet antenna selection (based on destination/next
>>>> hop). I was hoping this list might be able to suggest where I should
>>>> investigate adding that switching code. My switches are currently USB
>>>> RF switches, but I'm going to be using some serial protocol for the
>>>> final version (we don't have much to switch, and it should be a single
>>>> byte per packet).
>>>>
>>>> The last suggestion I received was to emulate Netsed [1] by routing
>>>> all packets through a specific socket, running antenna selection, and
>>>> then pushing them to their final destinations.
>>>>
>>>> I assumed that the best place to do antenna selection would be within
>>>> ath10k itself (my devices all run on ath10k) so that I could introduce
>>>> the minimum possible latency with antenna selection. Should I be
>>>> looking at a different part of the networking stack?
>>>>
>>>> Does anyone have any suggestions, or perhaps an open-source project
>>>> out there already trying to do antenna selection?
>>>
>>>
>>>
>>> Would per-peer antenna selection work?  That is probably more easily
>>> hacked into the firmware (I don't think stock firmware supports this
>>> feature, but I could be wrong.)
>>>
>>> Thanks,
>>> Ben
>>>
>>>>
>>>> Thanks,
>>>> Zach
>>>>
>>>>
>>>> [1] http://silicone.homelinux.org/projects/netsed/
>>>>
>>>> _______________________________________________
>>>> ath10k mailing list
>>>> ath10k@lists.infradead.org
>>>> http://lists.infradead.org/mailman/listinfo/ath10k
>>>>
>>>
>>>
>>> --
>>> Ben Greear <greearb@candelatech.com>
>>> Candela Technologies Inc  http://www.candelatech.com
>>>
>>
>
>
> --
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
