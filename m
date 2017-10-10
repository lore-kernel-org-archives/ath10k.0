Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1e20JG-0005uO-9k
 for ath10k@lists.infradead.org; Tue, 10 Oct 2017 19:35:24 +0000
Subject: Re: What should setting rate on 'AP' interface mean?
References: <e99d4daa-fdc2-ce26-8ffb-bd3cf131e87c@candelatech.com>
 <CAJ-Vmok9rNij_hErSfArrf9A6U8wCaZZWhOEPphCODKnj5Xjog@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <32d357fe-5904-4e8d-2a1e-84a16f498e06@candelatech.com>
Date: Tue, 10 Oct 2017 12:34:59 -0700
MIME-Version: 1.0
In-Reply-To: <CAJ-Vmok9rNij_hErSfArrf9A6U8wCaZZWhOEPphCODKnj5Xjog@mail.gmail.com>
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
To: Adrian Chadd <adrian@freebsd.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

On 10/10/2017 12:09 PM, Adrian Chadd wrote:
> Hi,
>
> IIRC, I think it's the drivers job to determine per-peer fixed rate.

 From poking at the 10.1 firmware source, seems that setting fixed RC on the vdev
should over-ride all of the stations, but it did not appear to be working
as expected...

While trying to debug that, I hit a kernel lockup on rmmod ...it is hard
to make progress some days!

Thanks,
Ben

>
>
>
> -adrian
>
>
> On 10 October 2017 at 11:34, Ben Greear <greearb@candelatech.com> wrote:
>> I was trying to use 'iw' to set rates on an AP interface, hoping it would
>> set tx-rates on all of the stations (peers) to the same thing.
>>
>> It appears that the ath10k driver will set ratesets on all stations if
>> we specify more than one rate, but if we specify a single rate, it does
>> not iterate through all stations, and just sets the 'vdev' fixed rate.
>>
>> So, should the driver somehow attempt to set single rate on all the stations
>> when
>> using a single rate?
>>
>> Or, do we need an API to force rates for individual stations (peers) and
>> leave
>> the driver in the current configuration?
>>
>> Or is it the firmware's responsibility to set the rate for all peers when
>> we set the vdev fixed rate on an AP vdev?
>>
>> Thanks,
>> Ben
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
