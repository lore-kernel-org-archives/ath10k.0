Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dIIxZ-0006tP-7A
 for ath10k@lists.infradead.org; Tue, 06 Jun 2017 18:12:07 +0000
Subject: Re: Dakota support IBSS mode
References: <CAGJdtRBNcf_bp9GuJRw+Ob=BpSkmJMBGUU_YxM9Mj1c_rpkLNg@mail.gmail.com>
 <5936D607.3010807@candelatech.com>
 <CAGJdtRCtVWouur-L8+BWQb2FnmPHC0-dmOXjMaLVC9_cBEZiDg@mail.gmail.com>
 <5936DB80.9020309@candelatech.com>
 <CAGJdtRCAc_s6j5UKp2aFcS3jTGV1-rwGDPuwbucQwoFyzWw4SQ@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <ae721f75-9332-d792-1ec8-58073f26916d@candelatech.com>
Date: Tue, 6 Jun 2017 11:11:43 -0700
MIME-Version: 1.0
In-Reply-To: <CAGJdtRCAc_s6j5UKp2aFcS3jTGV1-rwGDPuwbucQwoFyzWw4SQ@mail.gmail.com>
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
To: yu-chieh kung <jay0607@gmail.com>
Cc: ath10k@lists.infradead.org

On 06/06/2017 10:00 AM, yu-chieh kung wrote:
> Hi Ben
>
> it's not a NIC card. So there is no pci information.
> I think it connects over AHB
> i found the patch like
> https://patchwork.kernel.org/patch/8022221/
> And the officially firmware is
> https://github.com/kvalo/ath10k-firmware/tree/master/QCA4019/hw1.0

Ahh, ok.

Seems my 10.4 CT firmware could be built for it, but I haven't tried to
compile that target.  Would likely be a bit of work to get things working.

Once I could get it compiling, IBSS would likely just work.

Thanks,
Ben

>
> Thanks,
>
>
> 2017-06-07 0:42 GMT+08:00 Ben Greear <greearb@candelatech.com>:
>> On 06/06/2017 09:42 AM, yu-chieh kung wrote:
>>>
>>> Hi Ben
>>>
>>> it's IPQ4018/4019. SOC with dual band RF inside
>>> https://www.qualcomm.com/products/ipq4018
>>>
>>> Does CT firmware support it?
>>
>>
>> I don't know, that page has zero useful wifi chipset info that I can find
>> ..please send me 'dmesg' output of a boot (or especially 'lspci' if you have
>> that)
>> and I should be able to tell you.
>>
>> Thanks,
>> Ben
>>
>>
>>>
>>> Thanks
>>>
>>> 2017-06-07 0:19 GMT+08:00 Ben Greear <greearb@candelatech.com>:
>>>>
>>>> What is the wifi chipset number for "Dakota"?
>>>>
>>>> Thanks,
>>>> Ben
>>>>
>>>>
>>>> On 06/06/2017 01:35 AM, yu-chieh kung wrote:
>>>>>
>>>>>
>>>>> Hi All,
>>>>>
>>>>> Does anyone know if any ath10k firmware that can support IBSS mode on
>>>>> Dakota platform?
>>>>>
>>>>> Thanks,
>>>>>
>>>>> _______________________________________________
>>>>> ath10k mailing list
>>>>> ath10k@lists.infradead.org
>>>>> http://lists.infradead.org/mailman/listinfo/ath10k
>>>>>
>>>>
>>>>
>>>> --
>>>> Ben Greear <greearb@candelatech.com>
>>>> Candela Technologies Inc  http://www.candelatech.com
>>>>
>>>
>>
>>
>> --
>> Ben Greear <greearb@candelatech.com>
>> Candela Technologies Inc  http://www.candelatech.com
>>
>


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
