Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qt0-x22b.google.com ([2607:f8b0:400d:c0d::22b])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dAcIF-0003l4-TB
 for ath10k@lists.infradead.org; Tue, 16 May 2017 13:13:40 +0000
Received: by mail-qt0-x22b.google.com with SMTP id t26so119486329qtg.0
 for <ath10k@lists.infradead.org>; Tue, 16 May 2017 06:13:18 -0700 (PDT)
Subject: Re: Driver support for QCA6174 chip using SDIO interface
References: <CAHNpzpeRE6ha4JA9i4oyJ2BjgJg53FvDpAb1yZccncrmTeiBdQ@mail.gmail.com>
 <8737g45xc7.fsf@kamboji.qca.qualcomm.com>
 <c3814c7d-eed3-dad2-c568-6ce456ee7166@gmail.com>
 <CABy9W5kF8KcTUgk9UOguu1A-N==tMbjVW1gWGeq8pgAN6YREUg@mail.gmail.com>
 <d4b33a7a-1504-585a-312a-c3ba00d5bab9@gmail.com>
 <878tlxuvcz.fsf@qca.qualcomm.com>
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Message-ID: <933866d5-5ddc-b0d7-98c2-3c7a31ea8276@gmail.com>
Date: Tue, 16 May 2017 15:13:15 +0200
MIME-Version: 1.0
In-Reply-To: <878tlxuvcz.fsf@qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Akesh M Chacko <akesh.chacko@vvdntech.in>, Ann Lo <annlo.tech@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>



On 2017-05-16 09:14, Kalle Valo wrote:
> Erik Stromdahl <erik.stromdahl@gmail.com> writes:
>
>> On 2017-05-12 02:20, Ann Lo wrote:
>>> Hi Erik,
>>>
>>> We are hoping to use your new SDIO patches for QCA9377 on kernel
>>> version 4.1.36. There appears to be version 7 patches according to the
>>> following email:
>>> http://lists.infradead.org/pipermail/ath10k/2017-April/009633.html
>>>
>>> Would you advise on the followings?
>>>
>>> 1) What is the status of ath10k SDIO for QCA9377? The above email has
>>> the comment "With this patch we have the low level HTC protocol
>>> working and it's possible to boot the firmware, but it's still not
>>> possible to connect or anything like." Do you have an estimate of the
>>> time for full functionality, that wpa_supplicant and hostapd will run
>>> successfully? How much further work is needed?
>>
>> Well, first of all, the patches on the ath10k master only contain the
>> HIF layer (which is not that useful by itself). You will need a bunch
>> of generic HL (High Latency) patches as well. These patches are common
>> for both USB and SDIO and has not yet been integrated into the ath
>> mainline.
>> These patches are available on my ath repo on github:
>>
>> https://github.com/erstrom/linux-ath
>>
>> They should be treated as very experimental though!
>> There are a few known issues with the QCA9377 SDIO chip.
>> I have as of today not been able to associate with an AP (which
>> kind of limits the usefulness of the device, at least when operating
>> in STA mode :).
>> QCA9377 USB (Linksys WUSB6100M) works much better, but is unfortunately
>> not fully stable either since I am only capable of transmit/receive
>> ~3Mbytes before it goes deaf (but at least I can associate and authenticate
>> to an AP with WPA2 PSK security).
>>
>> So what remains to be done then?
>> Well, it seems as if the sdio chipset won't work that well with the
>> generic parts of ath10k. The setup of a device is HIF layer independent
>> (mostly implemented in mac.c) and has been tested thoroughly with the
>> PCIe devices. When looking at qcacld (another driver that is not part
>> of the Linux kernel), the setup is very different (different internal
>> parameters are configured and commands are executed in a different order).
>>
>> From my point of view I think the following things needs to be done:
>>
>> 1. Make mac.c work with high latency devices (SDIO and USB). I suspect
>>    that the setup of SDIO and USB is similar.
>> 2. Add support for newer version of the WMI protocol. qcacld uses a
>>    different ABI version for the WMI messages.
>>
>> Since I am doing this work as a spare time activity only, I can't make
>> any commitments or estimates of when everything is fully implemented.
>
> I think we should try to get rest of your patches into mainline as well,
> even if they are experimental still. Hopefully we get more people
> helping that way, Adrian already expressed his interest which is very
> cool and others have been also asking especially SDIO support. And with
> good luck there are just small fixes needed to SDIO and USB properly
> working.
>
I am actually preparing another RFC round for USB. I think I will split
my remaining patches in two patchsets: USB and High Latency.

The USB patches will have a few USB specific patches and the HL patches
will have the high latency stuff that is common between SDIO and USB.

What do you think?

> Let's just clearly document that SDIO and USB support is work in
> progress, both during driver initialisation and Kconfig documentation.
> Maybe we should even depend on BROKEN, dunno?
>
I will write a similar disclaimer for USB as you did for SDIO.
Something like this:

"This module adds experimental support for USB bus. Currently
work in progress and will not fully work"

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
