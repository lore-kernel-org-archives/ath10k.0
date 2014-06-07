Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WtIWx-0007Gs-1A
 for ath10k@lists.infradead.org; Sat, 07 Jun 2014 15:27:39 +0000
Message-ID: <53932F52.2030203@candelatech.com>
Date: Sat, 07 Jun 2014 08:27:14 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Firmware debugging patches?
References: <53891ACD.7070902@candelatech.com>	<87wqczz3h9.fsf@kamboji.qca.qualcomm.com>	<538CA904.4000508@candelatech.com>	<87ioojz1b1.fsf@kamboji.qca.qualcomm.com>	<538CB782.1000509@candelatech.com>
 <538CC68C.10808@gmail.com>	<538CC949.5020901@candelatech.com>	<CANUX_P2vbKD3zkwE=DvJJWpo=gEMORCBy=XFoC2YSFpmg9sr_A@mail.gmail.com>	<538CD507.1050803@candelatech.com>	<87bnu7pqe2.fsf@kamboji.qca.qualcomm.com>	<53909372.1040707@candelatech.com>	<87fvjimsxj.fsf@kamboji.qca.qualcomm.com>	<5391E620.4090706@candelatech.com>
 <87vbscj2ho.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87vbscj2ho.fsf@kamboji.qca.qualcomm.com>
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
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, Emmanuel Grumbach <egrumbach@gmail.com>



On 06/07/2014 06:03 AM, Kalle Valo wrote:
> Ben Greear <greearb@candelatech.com> writes:
>
>> On 06/05/2014 11:51 PM, Kalle Valo wrote:
>>> Ben Greear <greearb@candelatech.com> writes:
>>>
>>>>> Why do you want to put the crash dump in kernel log, can you describe
>>>>> your "use case" here? For me it would be enough to have a UUID for each
>>>>> crash dump and then have the driver print that to kernel log:
>>>>>
>>>>> ath10k: firmware crashed (uuid 1234567890-4321)
>>>>>
>>>>> And then you just need to find the correct dump from the file system and
>>>>> start debugging. Would that be enough for you?
>>>>
>>>> Not all systems will have fancy user-space able to deal with this.
>>>>
>>>> At the very least, please leave in the current firmware crash
>>>> dump text.
>>>
>>> I'm not removing anything. That was just an example how we can identify
>>> crashes.
>>
>> Perhaps the time-stamp is good enough?  I don't see a need for
>> a uuid, but perhaps I am missing something?
>
> UUID is supposed to be unique. If we use walltime there's no guarantee
> that the clock is correct and if we use local_clock() (my preference) it
> will be reset after every boot.
>
> I just think using something like UUID is more robust. Especially if one
> implements an automatic crash dump collector from thousands of deployed
> APs, having an UUID makes it a lot easier to manage.

I can add since-boot timestamp as well.  Time-since-boot is less likely
to be unique than wall-time, and for systems that do have proper wall-time
clock configured, I think that provides some useful info.  (Would be interesting
if all APs in a stadium crashed near the same time, for instance.)

I was thinking we should not add a MAC to the dump, for privacy concerns,
but whatever user-space tools gather the dump could add MAC if user perfers.

With time-of-day, time-since-boot, and MAC, each dump should be unique.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
