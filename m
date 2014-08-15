Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XII8r-0007at-Sf
 for ath10k@lists.infradead.org; Fri, 15 Aug 2014 14:06:06 +0000
Message-ID: <53EE13B4.3030304@candelatech.com>
Date: Fri, 15 Aug 2014 07:05:40 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: extra logging for core-restart state change logic.
References: <1407272099-6271-1-git-send-email-greearb@candelatech.com>
 <87egwij6x0.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87egwij6x0.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org



On 08/15/2014 05:04 AM, Kalle Valo wrote:
> greearb@candelatech.com writes:
>
>> From: Ben Greear <greearb@candelatech.com>
>>
>> Signed-off-by: Ben Greear <greearb@candelatech.com>
>> ---
>
> [...]
>
>> --- a/drivers/net/wireless/ath/ath10k/core.c
>> +++ b/drivers/net/wireless/ath/ath10k/core.c
>> @@ -700,6 +700,7 @@ static void ath10k_core_restart(struct work_struct *work)
>>   	switch (ar->state) {
>>   	case ATH10K_STATE_ON:
>>   		ar->state = ATH10K_STATE_RESTARTING;
>> +		ath10k_warn("core-restart, going to state RESTARTING from ON\n");
>>   		del_timer_sync(&ar->scan.timeout);
>>   		ath10k_reset_scan((unsigned long)ar);
>>   		ieee80211_restart_hw(ar->hw);
>> @@ -713,10 +714,11 @@ static void ath10k_core_restart(struct work_struct *work)
>>   		/* hw restart might be requested from multiple places */
>>   		break;
>>   	case ATH10K_STATE_RESTARTED:
>> -		ar->state = ATH10K_STATE_WEDGED;
>>   		/* fall through */
>>   	case ATH10K_STATE_WEDGED:
>> -		ath10k_warn("device is wedged, will not restart\n");
>> +		ath10k_warn("device is wedged, will not restart (state %d)\n",
>> +			ar->state);
>> +		ar->state = ATH10K_STATE_WEDGED;
>>   		break;
>>   	}
>
> I think state prints should be debug messages, not part of error
> messages. For example, we could add new debug level ATH10K_DBG_CORE or
> something like that.

I'll respin the patch accordingly when I get a chance.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
