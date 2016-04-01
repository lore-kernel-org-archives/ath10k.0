Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85 #2 (Red Hat Linux))
 id 1alrYi-0002mq-Fn
 for ath10k@lists.infradead.org; Fri, 01 Apr 2016 05:23:48 +0000
Message-ID: <56FE05B7.80104@candelatech.com>
Date: Thu, 31 Mar 2016 22:23:03 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: hacked 4.4.6+, 10.4.3 firmware, Running out of ring-index for
 pipe-id 3 (WMI).
References: <56F97F91.10007@candelatech.com>	<CA+BoTQnzFiS2HpUweNzwhiUD3Gaa40pZq+z8GhHLn5STq1OgHQ@mail.gmail.com>	<56FAA3D5.3070409@candelatech.com>	<CA+BoTQkmc2z8kWu=dcHJ2WMwi631ePqcQyjj59_95kv1aLdC1g@mail.gmail.com>	<56FD53E8.3020200@candelatech.com>
 <CA+BoTQmFhqpyH--ik7YP8rbimVJnw+aC_go3xrPmYhrLTA5KHg@mail.gmail.com>
In-Reply-To: <CA+BoTQmFhqpyH--ik7YP8rbimVJnw+aC_go3xrPmYhrLTA5KHg@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: ath10k <ath10k@lists.infradead.org>



On 03/31/2016 10:18 PM, Michal Kazior wrote:
> On 31 March 2016 at 18:44, Ben Greear <greearb@candelatech.com> wrote:
>> On 03/30/2016 11:51 PM, Michal Kazior wrote:

>>
>> So, I am using MSI-X, I guess?
>>
>> # dmesg|grep -i msi
>> [65284.853372] ath10k_pci 0000:05:00.0: pci irq msi-x interrupts 13 irq_mode
>> 0 reset_mode 0
>
> Yep. This at least makes it possible for this weird problem to come
> into existance. However I still find it a little hard to believe for
> tasklets to be scheduled this badly. Maybe the device doesn't assert
> interrupts properly as Adrian suggested? Or maybe they are not mapped
> properly? I think you're actually the first one to exercise MSI-range
> support on qca99x0.

I applied Rajkumar's patch to disable msi-x today, so maybe that will be
the end of those problems.

I think upstream might want a warn-on for that wmi issue, even if you don't
add the work-around code though...just to see if someone else hits it.

If you drop the wrong WMI message, often your best hope is that firmware crashes
right away, so we should really be quite loud about not sending a WMI message.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
