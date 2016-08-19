Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1baaUX-00051v-VE
 for ath10k@lists.infradead.org; Fri, 19 Aug 2016 03:29:10 +0000
Message-ID: <57B67CD8.5040009@candelatech.com>
Date: Thu, 18 Aug 2016 20:28:24 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] ath10k: Grab rcu_read_lock before the txqs spinlock.
References: <1471569995-10028-1-git-send-email-greearb@candelatech.com>,
 <1471569995-10028-2-git-send-email-greearb@candelatech.com>
 <1471575674214.65791@qti.qualcomm.com>
In-Reply-To: <1471575674214.65791@qti.qualcomm.com>
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
To: "Manoharan, Rajkumar" <rmanohar@qti.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>



On 08/18/2016 08:01 PM, Manoharan, Rajkumar wrote:
>> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
>> index 916119c..d96c06e 100644
>> --- a/drivers/net/wireless/ath/ath10k/mac.c
>> +++ b/drivers/net/wireless/ath/ath10k/mac.c
>> @@ -4307,8 +4307,8 @@ void ath10k_mac_tx_push_pending(struct ath10k *ar)
>>          int max;
>>          int loop_max = 2000;
>>
>> -       spin_lock_bh(&ar->txqs_lock);
>>          rcu_read_lock();
>> +       spin_lock_bh(&ar->txqs_lock);
>>
> Ben,
>
> It is quite possible that push_pending can be preempted after acquiring rcu_lock which
> may lead to deadlock. no? I assume to prevent that spin_lock is taken first.
>
> Could you please explain how this reordering is fixing dead lock?

It did not obviously fix the spin lock issue, but the issue went away.  Maybe it
was because I fixed the stale memory access issues at around the same time.

But, I don't think you can deadlock by taking rcu lock first and then the spinlock.

I checked all places where the spinlock is held, and I do not see any way for any of
them to block forever (In my kernel, I have a 2000 time limit on spinning in the push pending
method, which can help make sure we don't spin forever).

http://dmz2.candelatech.com/?p=linux-4.7.dev.y/.git;a=commitdiff;h=5d192657269d8e20fce733f894bb1b68df71db00

I was also worried that some calls from mac80211 might be holding rcu_read_lock while calling into
ath10k code that would grab the spinlock.  If that is the case (and I didn't verify it was), then
you could have a lock inversion by taking spinlock before rcu read lock in the push-pending method.

Anyway, someone that understands locking subtleties better might have more clue about this code
than I do.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
