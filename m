Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-it0-x22f.google.com ([2607:f8b0:4001:c0b::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bABcw-0000kr-2w
 for ath10k@lists.infradead.org; Tue, 07 Jun 2016 07:40:43 +0000
Received: by mail-it0-x22f.google.com with SMTP id h62so11697903itb.1
 for <ath10k@lists.infradead.org>; Tue, 07 Jun 2016 00:40:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CALhHN=pkwmRJKq1_RQ+3dryu8XcgbhwR-9T288ugoSJAHKM5AA@mail.gmail.com>
References: <CAOiRWuVxbGDoVtxahwRxyH9NaBB9LmaEBZ5bzgSPEf=Eu1g=ug@mail.gmail.com>
 <5755B0FF.9010900@candelatech.com>
 <CAOiRWuUFvZU1b4Pn8nDVs5O5sNK-g0PPbckriP=RmBnB5f-5Gw@mail.gmail.com>
 <5755B2D9.7080207@candelatech.com>
 <CAOiRWuUjugeDtRTQUWBzoCq58L8XfW7aYQTHa=Mnf4smx6AR2g@mail.gmail.com>
 <5755BABA.1030006@candelatech.com>
 <CAJ-VmomKzRAkJNQr2Sg=j57uPfptPiRs1Q026dPeuQv0jMx-Og@mail.gmail.com>
 <CAOiRWuUL9RC61pdieiEh3ZtWFGLomHzPxqbbVE3Oe_3043Zv2g@mail.gmail.com>
 <5755C7AF.6020203@candelatech.com>
 <CAOiRWuX4mwQEmY0pNvAvufHrfte_94JzyMw41i1SDMNHj=KtCQ@mail.gmail.com>
 <CALhHN=pkwmRJKq1_RQ+3dryu8XcgbhwR-9T288ugoSJAHKM5AA@mail.gmail.com>
From: Adrian Chadd <adrian.chadd@gmail.com>
Date: Tue, 7 Jun 2016 00:40:18 -0700
Message-ID: <CAJ-VmontFzXCqOhyEENTeWFnyeb0r=1d9jdX8SVRc9WeuX5vag@mail.gmail.com>
Subject: Re: Any tips on where per-packet antenna selection could be pushed?
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
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: Zach Sherin <zach@netblazr.com>, Ben Greear <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 6 June 2016 at 23:24, Janusz Dziedzic <janusz.dziedzic@tieto.com> wrote:
> On 6 June 2016 at 21:22, Zach Sherin <zach@netblazr.com> wrote:
>> That's what I thought. Thanks for confirming, and thanks again for
>> your time and help!
>>
> BTW, check google: ath10k smart antenna
> Seems 10.2 support this.


ooo cool. wonder how much of the useful bits it implements!



-adrian

>
> BR
> Janusz
>
>> Have a good one,
>> Zach
>>
>> On Mon, Jun 6, 2016 at 2:57 PM, Ben Greear <greearb@candelatech.com> wrote:
>>> On 06/06/2016 11:48 AM, Zach Sherin wrote:
>>>>
>>>> Interesting. Could I ask if there's somewhere I should start digging?
>>>> If it's not obvious I'm a driver/kernel newbie, but I'm happy to
>>>> learn. Should I start by going through ath10k's documentation/code
>>>> until I find the relevant bits?
>>>
>>>
>>> Unfortunately, without firmware source, you have probably no chance
>>> to do this.  And, you also probably have about no chance of getting
>>> firmware source.
>>>
>>> Thanks,
>>> Ben
>>>
>>>
>>>>
>>>> Thanks,
>>>> Zach
>>>>
>>>>
>>>> On Mon, Jun 6, 2016 at 2:42 PM, Adrian Chadd <adrian.chadd@gmail.com>
>>>> wrote:
>>>>>
>>>>> I bet the ruckus mode shift stuff is in the ath10k hardware and is
>>>>> configurable per TX descriptor.
>>>>>
>>>>> a
>>>>>
>>>>> On Jun 6, 2016 11:03 AM, "Ben Greear" <greearb@candelatech.com> wrote:
>>>>>>
>>>>>>
>>>>>> On 06/06/2016 10:59 AM, Zach Sherin wrote:
>>>>>>>
>>>>>>>
>>>>>>> I was aiming to run this off a serial interface on the general board,
>>>>>>> not on the ath10k NIC. I have a consumer QCA9880 PCI board in an
>>>>>>> Archer C7 router. It would be awesome if I could steal a GPIO or
>>>>>>> something from the atheros chip to output, but I was assuming I
>>>>>>> couldn't. The main reason I was looking at the ath10k driver was to
>>>>>>> get as close to when the packets are transmitted as possible, to leave
>>>>>>> as little room for error in the switching as possible.
>>>>>>>
>>>>>>> However, it's  possible that I'm hoping for too much there. I'd be
>>>>>>> interested to hear your thoughts on it. If I can't pull it off, I'll
>>>>>>> move to an approach outside ath10k.
>>>>>>
>>>>>>
>>>>>>
>>>>>> The driver just sends pkts to the firmware, it is the firmware that
>>>>>> knows when a pkt is to be transmitted, so I think you would have to have
>>>>>> some
>>>>>> hooks low in the firmware tx logic to do what you want.  And you would
>>>>>> need some
>>>>>> hardware output from the NIC.
>>>>>>
>>>>>> I am guessing it would require quite a bit of changes to the firmware,
>>>>>> possibly very tricky/hacky ones, and hardware output on your NIC.
>>>>>>
>>>>>> Thanks,
>>>>>> Ben
>>>>>>
>>>>>> --
>>>>>> Ben Greear <greearb@candelatech.com>
>>>>>> Candela Technologies Inc  http://www.candelatech.com
>>>>>>
>>>>>>
>>>>>> _______________________________________________
>>>>>> ath10k mailing list
>>>>>> ath10k@lists.infradead.org
>>>>>> http://lists.infradead.org/mailman/listinfo/ath10k
>>>>
>>>>
>>>
>>>
>>> --
>>> Ben Greear <greearb@candelatech.com>
>>> Candela Technologies Inc  http://www.candelatech.com
>>>
>>
>> _______________________________________________
>> ath10k mailing list
>> ath10k@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
