Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173]
 helo=mail3.candelatech.com)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kn0xa-0000rZ-UP
 for ath10k@lists.infradead.org; Wed, 09 Dec 2020 15:00:56 +0000
Subject: Re: [PATCH v3] ath10k: add flag to protect napi operation to avoid
 dead loop hang
References: <1598617348-2325-1-git-send-email-wgong@codeaurora.org>
 <87d02x1rqb.fsf@codeaurora.org>
 <010101746bd17881-819242de-7cbb-4df3-93e2-59473d281155-000000@us-west-2.amazonses.com>
 <87r1nzbadn.fsf@codeaurora.org>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <8a97f5ba-8eba-d61b-4c92-bdfd08d388ee@candelatech.com>
Date: Wed, 9 Dec 2020 07:00:52 -0800
MIME-Version: 1.0
In-Reply-To: <87r1nzbadn.fsf@codeaurora.org>
Content-Language: en-MW
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
To: Kalle Valo <kvalo@codeaurora.org>, Wen Gong <wgong@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 12/9/20 1:24 AM, Kalle Valo wrote:
> Wen Gong <wgong@codeaurora.org> writes:
> 
>> On 2020-09-08 00:22, Kalle Valo wrote:
>>
>>> Just like with the recent firmware restart patch, isn't
>>> ar->napi_enabled
>>> racy? Wouldn't test_and_set_bit() and test_and_clear_bit() be safer?
>>>
>>> Or are we holding a lock? But then that should be documented with
>>> lockdep_assert_held().
>>
>> yes, ath10k_hif_start is only called from ath10k_core_start, it has
>> "lockdep_assert_held(&ar->conf_mutex)", and ath10k_hif_stop is only
>> called from ath10k_core_stop, it also has
>> "lockdep_assert_held(&ar->conf_mutex)". then it will not 2 thread both
>> enter ath10k_hif_start/ath10k_hif_stop meanwhile.
> 
> Ok, but every function depending on a lock being held should still call
> lockdep_assert_held(), that way we can catch the bug if locking changes
> later. So it's not enough that ath10k_core_stop() has
> lockdep_assert_held(), also these napi functions should have it.
> 
> I actually decided to switch using ATH10K_FLAG_NAPI_ENABLED with
> set_bit() & co, simpler locking that way and no lockdep_assert_held()
> needed anymore. Please check my changes in the pending branch, I have
> only compile tested them:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=e0a466d296bd862080f7796b41349f9f586272c9
> 

Why do you not need locking?  You can't just check a bit is set and then do work and set
it later without locking, two concurrent CPU threads can pass the first check and both get into
the logic below it?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
