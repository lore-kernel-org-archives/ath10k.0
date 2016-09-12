Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bjUFf-0005Zr-E6
 for ath10k@lists.infradead.org; Mon, 12 Sep 2016 16:38:35 +0000
Subject: Re: [PATCH 2/3] ath10k: Grab rcu_read_lock before the txqs spinlock.
References: <1471569995-10028-1-git-send-email-greearb@candelatech.com>
 <1471569995-10028-2-git-send-email-greearb@candelatech.com>
 <87k2elp53z.fsf@kamboji.qca.qualcomm.com> <57D2CB92.3020407@candelatech.com>
 <1473662509.4201.0.camel@sipsolutions.net>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <d182bdea-089a-7b44-302c-cedcda1aa1ec@candelatech.com>
Date: Mon, 12 Sep 2016 09:37:46 -0700
MIME-Version: 1.0
In-Reply-To: <1473662509.4201.0.camel@sipsolutions.net>
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
To: Johannes Berg <johannes@sipsolutions.net>, "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 09/11/2016 11:41 PM, Johannes Berg wrote:
>
>>>> -	rcu_read_unlock();
>>>>   	spin_unlock_bh(&ar->txqs_lock);
>>>> +	rcu_read_unlock();
>>>
>>> I'm no RCU expert but this isn't making any sense. Maybe it changes
>>> timings on your kernel so that it hides the real problem?
>>
>> I'm not sure this fixed anything or not, it just seemed weird so I
>> changed it.
>>
>> I was hoping someone that understood rcu locking would comment...
>>
>
> RCU is no "locking". The sooner you get over that notion, the better.
>
> This therefore make no sense whatsoever.
>
> In fact, you want to keep the RCU protected section *small*, so having
> the spinlock inside hurts overall system performance.

Ok, thanks for the review.  I'll drop this patch from my tree.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
