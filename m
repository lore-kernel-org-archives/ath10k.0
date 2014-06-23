Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wz6lE-0000tR-2l
 for ath10k@lists.infradead.org; Mon, 23 Jun 2014 16:06:32 +0000
Message-ID: <53A85040.1020404@candelatech.com>
Date: Mon, 23 Jun 2014 09:05:20 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: General firmware stability issue.
References: <53A332E7.2060400@candelatech.com>
 <CA+BoTQnfgbhyUDjp-FKO4pnwZ3N7nGGT+jcg9XYbSxcq4tQxzg@mail.gmail.com>
In-Reply-To: <CA+BoTQnfgbhyUDjp-FKO4pnwZ3N7nGGT+jcg9XYbSxcq4tQxzg@mail.gmail.com>
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



On 06/22/2014 11:49 PM, Michal Kazior wrote:
> On 19 June 2014 20:58, Ben Greear <greearb@candelatech.com> wrote:
>> When using our firmware and kernel mods, we often see our AP system
>> crash the firmware after several days of various testing.
>>
>> Often after this, it takes a full reboot to bring the system back.
>
> Can you elaborate on this? Why does it need a full reboot?

I'll send kernel messages next time it happens, but basically it just
fails cold restart over and over again.

>
>> For those with ability to debug firmware source,
>> at least some of the time, it is a heap list corruption/assert
>> that crashes us, but I have not nailed down exactly where/why yet.
>
> Some of the time.. but what happens other time? Any crash dump?

Some times I get crashes where the firmware says it cannot even read
the crash dump registers.  Usually this is after an initial dump
(say, heap crash), and shortly after, the cold restart failure problem
happens.

>> Based on some email I received, I believe this problem may
>> happen on standard firmware as well.
>>
>> I am curious to know if anyone else sees this type of problem,
>> and with what regularity.
>
> I'm aware of one problem with beaconing now. Since there's no "beacon
> tx completed" indication ath10k is forced to blindly unmap/free beacon
> sk_buff when next swba event is handled. In some rare cases when
> target wmi pipes get stuck/lag it's possible to get an IOMMU fault
> (provided your platform supports it and it's enabled) that crashes the
> target so badly it's impossible to even use the CE diag window to read
> out the crash dump. Warm reset is ineffective after that and only cold
> reset is able to bring it up again (but also hangs the host sometimes
> due to hw bug).

That is very interesting.  It sounds like that could be the problem
I hit.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
