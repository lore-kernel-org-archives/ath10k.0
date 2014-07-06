Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X3dIe-0007Sg-Bn
 for ath10k@lists.infradead.org; Sun, 06 Jul 2014 03:39:36 +0000
Message-ID: <53B8C4DF.5000308@candelatech.com>
Date: Sat, 05 Jul 2014 20:39:11 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Question on beacon-miss handling.
References: <53B808BF.8070000@candelatech.com>
 <CAJ-Vmo=8pO0eVpL5L28AVALn+rpYPxhOw5kYkaGieBt-RzN3iQ@mail.gmail.com>
In-Reply-To: <CAJ-Vmo=8pO0eVpL5L28AVALn+rpYPxhOw5kYkaGieBt-RzN3iQ@mail.gmail.com>
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
Cc: ath10k <ath10k@lists.infradead.org>

On 07/05/2014 07:14 PM, Adrian Chadd wrote:
> Where is it in the firmware again?

wlan_swbmiss_offload.c

> The beacon miss stuff is a little .. odd. Mostly because there's only
> one (and maybe two) timers for it and they're a pain in the ass to
> configure correctly. Having it scale (correctly) to more than two
> vdevs may be a little challenging.

I've seen other funny stuff where an AP will crash hard(-ish?) and the associated stations
take a long time to figure out their AP is dead.  Could be related to this
maybe..or maybe was something else.  I have not investigated closely.

I'd be happy to have all the beacon miss stuff move to the driver..seems
a waste of limited resources in the firmware.

Thanks,
Ben

>
>
>
> -a
>
>
> On 5 July 2014 07:16, Ben Greear <greearb@candelatech.com> wrote:
>> While poking around in the firmware, I notice that ath10k
>> driver only requests a few vdevs to be supported by
>> the beacon-miss firmware logic, though the driver
>> supposedly supports more vdevs than that...
>>
>> Any idea how this is supposed to work with more vdevs
>> than bmiss_offload_max_vdev?
>>
>> Maybe it is best to just disable beacon-miss logic in
>> firmware entirely and let the driver/host handle it?
>>
>> Thanks,
>> Ben
>>
>> --
>> Ben Greear <greearb@candelatech.com>
>> Candela Technologies Inc  http://www.candelatech.com
>>
>>
>> _______________________________________________
>> ath10k mailing list
>> ath10k@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/ath10k
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
>


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
