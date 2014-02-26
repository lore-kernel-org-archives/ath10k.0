Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WIkcX-00065y-0R
 for ath10k@lists.infradead.org; Wed, 26 Feb 2014 19:58:21 +0000
Message-ID: <530E4746.8020906@candelatech.com>
Date: Wed, 26 Feb 2014 11:57:58 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Build failure in latest ath10k tree.
References: <530E3762.4030000@candelatech.com>
 <87d2i9k5sp.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87d2i9k5sp.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: ath10k <ath10k@lists.infradead.org>

On 02/26/2014 11:55 AM, Kalle Valo wrote:
> Ben Greear <greearb@candelatech.com> writes:
> 
>> Looks non-related to ath10k itself...maybe bad merge or
>> upstream error?
>>
>> I'll dig into it in a bit if no one beats me to it.
> 
> [...]
> 
>>   CC      arch/x86/kernel/cpu/capflags.o
>>   CC      arch/x86/kernel/cpu/common.o
>> fixdep: error opening config file: /mnt/sda/home/greearb/git/linux.ath/include/linux/spinlokk_types.h: No such file or directory
> 
> Is it really "spinlokk" (not spinlock) or is that just a copy&paste
> error?
> 
> FWIW I haven't noticed any build errors myself.

It really is spelled spinlokk, I coppied that right out of
the console....

I can't find any file that has that string in it, so not sure
where it is coming from.

I'll keep poking around.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
