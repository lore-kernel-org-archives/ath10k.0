Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fDBDt-0004mP-IZ
 for ath10k@lists.infradead.org; Mon, 30 Apr 2018 16:00:23 +0000
Subject: Re: ath10k driver firmware crash when bring up qca 9984 wireless card
References: <1524732398.3848.kc@mail2000.com.tw>
 <f88bee98-2358-4f6f-19b6-4114c9dcb4f4@candelatech.com>
 <1524809543.9200.kc@mail2000.com.tw>
 <fcac72f1-34d5-3167-780a-ddf67debe964@candelatech.com>
 <1525057041.30100.kc@mail2000.com.tw>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <188053d9-bdd0-15af-e78f-725c37a7e952@candelatech.com>
Date: Mon, 30 Apr 2018 09:00:01 -0700
MIME-Version: 1.0
In-Reply-To: <1525057041.30100.kc@mail2000.com.tw>
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
To: KC <kc@mail2000.com.tw>
Cc: KC Chen <KC1120@gmail.com>, ath10k <ath10k@lists.infradead.org>

On 04/29/2018 07:57 PM, KC wrote:
>
> Hi Ben
>
> Thanks for your time.
>
> If I want to try ath10k-ct-driver, where I can get stable version?
>
> There has information about pci-e layout.
> The device has two PCI-e slots. one is the original pci-e slot of main board and the other one is the output of pci-e switch.
>
> case 1:one is the original pci-e slot of main board
> case 2:one is the output from pci-e switch.
>
> We can get QCA9884 pci-e information (VID and IID) form /sys/bus/pci/device in case 1 and case 2
>
> ath10k driver always work in case 1 and always get the firmware crash message in case 2.
>
> Does ath10k driver have any limits about pci-e layout?

The most likely way for it to work is to use one of our kernels,
the 4.13 being the most stable and well tested at this point.

The 4.16 should be OK too, but it is less tested.

https://github.com/greearb?tab=repositories

Or, you can try using our stand-alone driver, but it does not work on
all kernels...typically just 4.9, 4.13 and 4.16 or similar.

https://github.com/greearb/ath10k-ct

I don't know of any particular issues with pcie, but I guess there must be some
issue in your case.

Thanks,
Ben

>
> Thanks,
> KC
>
> -----Original message-----
> From:Ben Greear <greearb@candelatech.com>
> To:KC <kc@mail2000.com.tw>
> Cc:KC Chen <KC1120@gmail.com>,ath10k <ath10k@lists.infradead.org>
> Date:Sat, 28 Apr 2018 01:20:41
> Subject:Re: ath10k driver firmware crash when bring up qca 9984 wireless car d
>
> I think it might be something like a null-pointer exception, but those do not
> create a clean backtrace.  If you wanted to use my ath10k-ct driver, it can sometimes
> gather additional info for these types of crashes that lets me know more about it.
>
> But, if your problem is with backporting a driver anyway, maybe that is not
> so much help.
>
> If you could move forward to at least the 4.9 kernel, then likely you will have
> better luck with the 9984.
>
> Thanks,
> Ben
>
> On 04/26/2018 11:12 PM, KC wrote:
>> Hi Ben,
>>
>> Thank you for your time.
>>
>> I have been try ath10k-ct firmware and the attachments are the crash dump and pci info.
>>
>> If you require any further information, let me know.
>>
>> Thanks,
>> KC
>>
>> -----Original message-----
>> From:Ben Greear <greearb@candelatech.com>
>> To:KC <kc@mail2000.com.tw>,ath10k <ath10k@lists.infradead.org>
>> Cc:KC Chen <KC1120@gmail.com>
>> Date:Thu, 26 Apr 2018 23:03:09
>> Subject:Re: ath10k driver firmware crash when bring up qca 9984 wireless car d
>>
>> On 04/26/2018 01:46 AM, KC wrote:
>>> Hi
>>>
>>> I'm porting ath10k drivers for Linux 4.2.8.
>>>
>>> Try to bring up QCA9984 wireless PCI-e card.
>>>
>>> I have problem with running ath10k driver, firmware load then the kernel message will show the firmware crashed during boot.
>>>
>>> The attachment is the error log.
>>>
>>> I also tried firmware ver 10.4-3.2, 10.4-3.3 and 10.4-3.5.3 without success: same symptoms an same faults.
>>>
>>> I can provide more information (logs) to help to figure out: where the problem is?
>>
>> You can try my ath10k-ct firmware, send me crash dump if it crashes and I might can
>> decode it and tell you why.
>>
>> http://www.candelatech.com/ath10k-10.4.php
>>
>> Thanks,
>> Ben
>>
>
>


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
