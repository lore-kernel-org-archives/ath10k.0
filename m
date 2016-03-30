Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85 #2 (Red Hat Linux))
 id 1alMqa-0003Qy-D1
 for ath10k@lists.infradead.org; Wed, 30 Mar 2016 20:36:12 +0000
Subject: Re: hacked 4.4.6+, 10.4.3 firmware, Running out of ring-index for
 pipe-id 3 (WMI).
References: <56F97F91.10007@candelatech.com>
 <CA+BoTQnzFiS2HpUweNzwhiUD3Gaa40pZq+z8GhHLn5STq1OgHQ@mail.gmail.com>
 <56FAA3D5.3070409@candelatech.com>
 <CAJ-Vmo=RzwymMtdWkrKTEnf+FU=Q3MU3QNqFneq74Qcn3BMfyg@mail.gmail.com>
 <56FAB79D.2020203@candelatech.com>
 <CAJ-VmokzeRX=ZPtP+JJqfL+tL60GR8aZpaBCCxVHZ=D8JRD3ww@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <56FC3213.7050103@candelatech.com>
Date: Wed, 30 Mar 2016 13:07:47 -0700
MIME-Version: 1.0
In-Reply-To: <CAJ-VmokzeRX=ZPtP+JJqfL+tL60GR8aZpaBCCxVHZ=D8JRD3ww@mail.gmail.com>
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
Cc: Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 03/29/2016 10:45 AM, Adrian Chadd wrote:
> On 29 March 2016 at 10:13, Ben Greear <greearb@candelatech.com> wrote:
>> On 03/29/2016 10:08 AM, Adrian Chadd wrote:
>>>
>>> Does it eventually catch up?
>>
>>
>> It seems to.
>>
>>> IE, put a wait completion in there?
>>
>>
>> Maybe so, but the current wait-completion waits on tx-credits,
>> so more like I'd need to put the whole wait-completion in a loop
>> and add a small sleep, maybe?
>>
>> Or, maybe try to force a read of the CE entries if the CE logic
>> ever detects the ring is full?
>
> Right. A little sleep (as long as its in a place where you can do it!)
> just to check would be good. I'd also print out the CE ring contents
> as well - see where the firmware has gotten to.

This seemed to help my system, but I also fixed some other bugs that made
the system work better over-all, so not sure this is a complete fix on its
own.  I'll send a patch in case someone wants to give it a try.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
