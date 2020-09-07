Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-11.smtp-out.us-west-2.amazonses.com ([54.240.27.11])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFJRW-0007ll-NY
 for ath10k@lists.infradead.org; Mon, 07 Sep 2020 15:52:31 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v4 1/2] ath10k: add refcount for ath10k_core_restart
References: <20200108031957.22308-1-wgong@codeaurora.org>
 <20200108031957.22308-2-wgong@codeaurora.org>
 <87imdlkuw8.fsf@codeaurora.org>
 <b5a894f46ce01d89a0887d63296fd139@codeaurora.org>
Date: Mon, 7 Sep 2020 15:52:27 +0000
In-Reply-To: <b5a894f46ce01d89a0887d63296fd139@codeaurora.org> (Wen Gong's
 message of "Tue, 18 Aug 2020 16:39:04 +0800")
Message-ID: <010101746944bea3-1e7a9544-4e7d-4ee8-b99f-209875199e06-000000@us-west-2.amazonses.com>
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
To: Wen Gong <wgong@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Wen Gong <wgong@codeaurora.org> writes:

> On 2020-08-15 01:19, Kalle Valo wrote:
>> Wen Gong <wgong@codeaurora.org> writes:
>>
> ...
>>> diff --git a/drivers/net/wireless/ath/ath10k/core.c
>>> b/drivers/net/wireless/ath/ath10k/core.c
>>> index 91f131b87efc..0e31846e6c89 100644
>>> --- a/drivers/net/wireless/ath/ath10k/core.c
>>> +++ b/drivers/net/wireless/ath/ath10k/core.c
>>> @@ -2199,6 +2199,14 @@ static void ath10k_core_restart(struct
>>> work_struct *work)
>>>  {
>>>  	struct ath10k *ar = container_of(work, struct ath10k, restart_work);
>>>  	int ret;
>>> +	int restart_count;
>>> +
>>> +	restart_count = atomic_add_return(1, &ar->restart_count);
>>> +	if (restart_count > 1) {
>>> +		ath10k_warn(ar, "can not restart, count: %d\n", restart_count);
>>> +		atomic_dec(&ar->restart_count);
>>> +		return;
>>> +	}
>>
>> I have been thinking a different approach for this. I think another
>> option is to have a function like this:
>>
>> ath10k_core_firmware_crashed()
>> {
>>         queue_work(ar->workqueue, &ar->restart_work);
>> }
>>
>> In patch 1 we would convert all existing callers to call that
>> function instead of queue_work() directly.
>>
>> In patch 2 we would add a new flag to enum ath10k_dev_flags, or maybe
>> should actually use existing ATH10K_FLAG_CRASH_FLUSH? Don't know yet
>> which one is better. Now the function would do:
>>
>> ath10k_core_firmware_crashed()
>> {
>>         if (test_bit(flag))
>>                 return
>>
>>         set_bit(flag)
>> 	queue_work(ar->workqueue, &ar->restart_work);
>> }
>>
>> That way restart_work queue would be called only one time.
>
> This is not muti-thread-safe, for example, if 2 thread entered to the
> test_bit(flag) meanwhile and both check pass, then it will have 2
> restart.

Good point, this was racy. And I see that you found test_and_set_bit()
already to fix the race.

> atomic_add_return is muti-thread-safe, if 2 thread entered it, only 1
> thread can pass the check, another will fail and return.

I'm not going to add new state variables unless the justification is
REALLY strong and sound. This firmware restart is complicated as is
already, there's no reason to complicate it even more.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
