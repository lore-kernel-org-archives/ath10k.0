Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-it0-x235.google.com ([2607:f8b0:4001:c0b::235])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dIHqm-0006fv-Pg
 for ath10k@lists.infradead.org; Tue, 06 Jun 2017 17:01:06 +0000
Received: by mail-it0-x235.google.com with SMTP id m47so98046665iti.1
 for <ath10k@lists.infradead.org>; Tue, 06 Jun 2017 10:00:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5936DB80.9020309@candelatech.com>
References: <CAGJdtRBNcf_bp9GuJRw+Ob=BpSkmJMBGUU_YxM9Mj1c_rpkLNg@mail.gmail.com>
 <5936D607.3010807@candelatech.com>
 <CAGJdtRCtVWouur-L8+BWQb2FnmPHC0-dmOXjMaLVC9_cBEZiDg@mail.gmail.com>
 <5936DB80.9020309@candelatech.com>
From: yu-chieh kung <jay0607@gmail.com>
Date: Wed, 7 Jun 2017 01:00:37 +0800
Message-ID: <CAGJdtRCAc_s6j5UKp2aFcS3jTGV1-rwGDPuwbucQwoFyzWw4SQ@mail.gmail.com>
Subject: Re: Dakota support IBSS mode
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

Hi Ben

it's not a NIC card. So there is no pci information.
I think it connects over AHB
i found the patch like
https://patchwork.kernel.org/patch/8022221/
And the officially firmware is
https://github.com/kvalo/ath10k-firmware/tree/master/QCA4019/hw1.0

Thanks,


2017-06-07 0:42 GMT+08:00 Ben Greear <greearb@candelatech.com>:
> On 06/06/2017 09:42 AM, yu-chieh kung wrote:
>>
>> Hi Ben
>>
>> it's IPQ4018/4019. SOC with dual band RF inside
>> https://www.qualcomm.com/products/ipq4018
>>
>> Does CT firmware support it?
>
>
> I don't know, that page has zero useful wifi chipset info that I can find
> ..please send me 'dmesg' output of a boot (or especially 'lspci' if you have
> that)
> and I should be able to tell you.
>
> Thanks,
> Ben
>
>
>>
>> Thanks
>>
>> 2017-06-07 0:19 GMT+08:00 Ben Greear <greearb@candelatech.com>:
>>>
>>> What is the wifi chipset number for "Dakota"?
>>>
>>> Thanks,
>>> Ben
>>>
>>>
>>> On 06/06/2017 01:35 AM, yu-chieh kung wrote:
>>>>
>>>>
>>>> Hi All,
>>>>
>>>> Does anyone know if any ath10k firmware that can support IBSS mode on
>>>> Dakota platform?
>>>>
>>>> Thanks,
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
