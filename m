Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d9EP9-0001jg-Ok
 for ath10k@lists.infradead.org; Fri, 12 May 2017 17:31:05 +0000
Received: by mail-pg0-x242.google.com with SMTP id h64so3666574pge.3
 for <ath10k@lists.infradead.org>; Fri, 12 May 2017 10:30:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <d4b33a7a-1504-585a-312a-c3ba00d5bab9@gmail.com>
References: <CAHNpzpeRE6ha4JA9i4oyJ2BjgJg53FvDpAb1yZccncrmTeiBdQ@mail.gmail.com>
 <8737g45xc7.fsf@kamboji.qca.qualcomm.com>
 <c3814c7d-eed3-dad2-c568-6ce456ee7166@gmail.com>
 <CABy9W5kF8KcTUgk9UOguu1A-N==tMbjVW1gWGeq8pgAN6YREUg@mail.gmail.com>
 <d4b33a7a-1504-585a-312a-c3ba00d5bab9@gmail.com>
From: Ann Lo <annlo.tech@gmail.com>
Date: Fri, 12 May 2017 10:30:41 -0700
Message-ID: <CABy9W5n1YqrsrXhT+Zb57_=OAEUELgx0Hk3Gp+Yx_BcEzwu++Q@mail.gmail.com>
Subject: Re: Driver support for QCA6174 chip using SDIO interface
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: Akesh M Chacko <akesh.chacko@vvdntech.in>, "Valo,
 Kalle" <kvalo@qca.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Thanks Erik for your reply. Your information is very useful to us.

Ann

On Fri, May 12, 2017 at 7:51 AM, Erik Stromdahl
<erik.stromdahl@gmail.com> wrote:
>
>
> On 2017-05-12 02:20, Ann Lo wrote:
>>
>> Hi Erik,
>>
>> We are hoping to use your new SDIO patches for QCA9377 on kernel
>> version 4.1.36. There appears to be version 7 patches according to the
>> following email:
>> http://lists.infradead.org/pipermail/ath10k/2017-April/009633.html
>>
>> Would you advise on the followings?
>>
>> 1) What is the status of ath10k SDIO for QCA9377? The above email has
>> the comment "With this patch we have the low level HTC protocol
>> working and it's possible to boot the firmware, but it's still not
>> possible to connect or anything like." Do you have an estimate of the
>> time for full functionality, that wpa_supplicant and hostapd will run
>> successfully? How much further work is needed?
>>
> Well, first of all, the patches on the ath10k master only contain the
> HIF layer (which is not that useful by itself). You will need a bunch
> of generic HL (High Latency) patches as well. These patches are common
> for both USB and SDIO and has not yet been integrated into the ath
> mainline.
> These patches are available on my ath repo on github:
>
> https://github.com/erstrom/linux-ath
>
> They should be treated as very experimental though!
> There are a few known issues with the QCA9377 SDIO chip.
> I have as of today not been able to associate with an AP (which
> kind of limits the usefulness of the device, at least when operating
> in STA mode :).
> QCA9377 USB (Linksys WUSB6100M) works much better, but is unfortunately
> not fully stable either since I am only capable of transmit/receive
> ~3Mbytes before it goes deaf (but at least I can associate and authenticate
> to an AP with WPA2 PSK security).
>
> So what remains to be done then?
> Well, it seems as if the sdio chipset won't work that well with the
> generic parts of ath10k. The setup of a device is HIF layer independent
> (mostly implemented in mac.c) and has been tested thoroughly with the
> PCIe devices. When looking at qcacld (another driver that is not part
> of the Linux kernel), the setup is very different (different internal
> parameters are configured and commands are executed in a different order).
>
> From my point of view I think the following things needs to be done:
>
> 1. Make mac.c work with high latency devices (SDIO and USB). I suspect
>    that the setup of SDIO and USB is similar.
> 2. Add support for newer version of the WMI protocol. qcacld uses a
>    different ABI version for the WMI messages.
>
> Since I am doing this work as a spare time activity only, I can't make
> any commitments or estimates of when everything is fully implemented.
>
>> 2) Our BSP uses kernel version 4.1.36. Can we apply your patches to
>> this version? Or, do we need to backport a newer version for QCA9377?
>>
> I would be very surprised if the patches applies on a 4.1.36 kernel.
> ath10k is a very active project and much has happened since 4.1.36.
> Besides, you would need a few other patches as well that has already
> been integrated.
> Perhaps the best way forward is the ath10k backports project?
>
>
>> We are trying to prepare the software so that we can test when our
>> hardware is ready.
>>
>> Thanks,
>> Ann
>>
>>
>>
>> On Sun, Jan 29, 2017 at 1:16 PM, Erik Stromdahl
>> <erik.stromdahl@gmail.com> wrote:
>>>
>>> If you are interested in trying the latest version of the sdio code
>>> you can clone the below repo:
>>>
>>> https://github.com/erstrom/linux-ath.git
>>>
>>> I have just pushed some updates for QCA9377 SDIO (that might work with
>>> QCA6174 chipsets as well).
>>>
>>> I will do some more testing of this code during the weeks to come.
>>>
>>> If you could try it out and give me feedback it would be great!
>>>
>>> On 2017-01-27 16:36, Valo, Kalle wrote:
>>>>
>>>>
>>>> Akesh M Chacko <akesh.chacko@vvdntech.in> writes:
>>>>
>>>>> We are using QCA6174 chip on our embedded platform using SDIO
>>>>> interface. could you please help us to get the SDIO support for
>>>>> QCA6174 driver.
>>>>
>>>>
>>>>
>>>> Erik Stromdahl is working on adding SDIO support to ath10k:
>>>>
>>>> https://patchwork.kernel.org/patch/9516477/
>>>>
>>>> But it's still WIP.
>>>>
>>>
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
