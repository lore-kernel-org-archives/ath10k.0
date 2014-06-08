Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WtYcl-0000ki-5a
 for ath10k@lists.infradead.org; Sun, 08 Jun 2014 08:38:43 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Firmware debugging patches?
References: <53891ACD.7070902@candelatech.com>
 <87wqczz3h9.fsf@kamboji.qca.qualcomm.com>
 <538CA904.4000508@candelatech.com>
 <87ioojz1b1.fsf@kamboji.qca.qualcomm.com>
 <538CB782.1000509@candelatech.com> <538CC68C.10808@gmail.com>
 <538CC949.5020901@candelatech.com>
 <CANUX_P2vbKD3zkwE=DvJJWpo=gEMORCBy=XFoC2YSFpmg9sr_A@mail.gmail.com>
 <538CD507.1050803@candelatech.com>
 <87bnu7pqe2.fsf@kamboji.qca.qualcomm.com>
 <53909372.1040707@candelatech.com>
 <87fvjimsxj.fsf@kamboji.qca.qualcomm.com>
 <5391E620.4090706@candelatech.com>
 <87vbscj2ho.fsf@kamboji.qca.qualcomm.com>
 <53932F52.2030203@candelatech.com>
Date: Sun, 8 Jun 2014 11:35:28 +0300
In-Reply-To: <53932F52.2030203@candelatech.com> (Ben Greear's message of "Sat, 
 7 Jun 2014 08:27:14 -0700")
Message-ID: <8738ffiysv.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, Emmanuel Grumbach <egrumbach@gmail.com>

Ben Greear <greearb@candelatech.com> writes:

>>> Perhaps the time-stamp is good enough?  I don't see a need for
>>> a uuid, but perhaps I am missing something?
>>
>> UUID is supposed to be unique. If we use walltime there's no guarantee
>> that the clock is correct and if we use local_clock() (my preference) it
>> will be reset after every boot.
>>
>> I just think using something like UUID is more robust. Especially if one
>> implements an automatic crash dump collector from thousands of deployed
>> APs, having an UUID makes it a lot easier to manage.
>
> I can add since-boot timestamp as well.  Time-since-boot is less likely
> to be unique than wall-time, and for systems that do have proper wall-time
> clock configured, I think that provides some useful info.  (Would be interesting
> if all APs in a stadium crashed near the same time, for instance.)
>
> I was thinking we should not add a MAC to the dump, for privacy concerns,
> but whatever user-space tools gather the dump could add MAC if user perfers.

The MAC addresses can be extracted from the target memory anyway so I
don't see harm from including that in the dump. Is it even possible to
address all privacy issues when dealing with firmware dumps?

> With time-of-day, time-since-boot, and MAC, each dump should be unique.

But I would like to easily match from kernel log that the crash dump
matches with log. uuid would provide that in a simple way (check that
the uuid in the log matches with the uuid in the dump). What's so bad
from using uuid?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
