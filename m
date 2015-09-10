Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Za33M-0007da-8K
 for ath10k@lists.infradead.org; Thu, 10 Sep 2015 14:42:20 +0000
Message-ID: <55F196B9.3060906@candelatech.com>
Date: Thu, 10 Sep 2015 07:42:01 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: New CT firmware beta-15 available.
References: <55CCDBF9.2050205@candelatech.com>	<CAJn6HhvrmvXFTyxAuxXpbVmQZK6qSRKXJPJkwBY3NfjgPHWECw@mail.gmail.com>	<55F0B995.40407@candelatech.com>
 <CAJn6HhuEdaufq_oHz8f2+ETcGEXqBj77iOrt=C4Za+7QtD_i3Q@mail.gmail.com>
In-Reply-To: <CAJn6HhuEdaufq_oHz8f2+ETcGEXqBj77iOrt=C4Za+7QtD_i3Q@mail.gmail.com>
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
To: Igor Pavlov <igor.arabesc.pavlov@gmail.com>, ath10k <ath10k@lists.infradead.org>

On 09/09/2015 07:14 PM, Igor Pavlov wrote:
> 2015-09-10 1:58 GMT+03:00 Ben Greear <greearb@candelatech.com>:
>> Does it act any better if you use the official 'firmware-2.bin'
>> for firmware?
>
> No, it's unstable.
> I haven't found stable firmware version yet.
>
> I tried firmware-4.bin (md5: eca8fd35aec383278223efdf35a00f33,
> 0067c0c5dff032fd45137815cdd15134) with the fresh Arch Linux, it's
> unstable too:
> # uname -a
> Linux 4.1.2-2-ARCH #1 SMP PREEMPT Wed Jul 15 08:30:32 UTC 2015 x86_64 GNU/Linux

Can you try CT firmware on this kernel?

>
>> What kernel/backport is your OpenWRT based on?
>
> It's standard OpenWRT image from there:
> https://downloads.openwrt.org/chaos_calmer/15.05-rc3/x86/64/
>
> # uname -a
> Linux 3.18.17 #1 SMP Fri Jul 3 20:58:35 CEST 2015 x86_64 GNU/Linux

This kernel is a bit old...probably a 4.0 or higher kernel is needed.

Thanks,
Ben

>
> --
> Igor
>


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
