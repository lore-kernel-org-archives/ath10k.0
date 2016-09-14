Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkBuf-0007L9-DL
 for ath10k@lists.infradead.org; Wed, 14 Sep 2016 15:15:50 +0000
Message-ID: <57D96669.20209@candelatech.com>
Date: Wed, 14 Sep 2016 08:02:01 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2 04/21] ath10k: rate-limit packet tx errors
References: <1462986153-16318-1-git-send-email-greearb@candelatech.com>
 <1462986153-16318-5-git-send-email-greearb@candelatech.com>
 <87wpieefr9.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87wpieefr9.fsf@kamboji.qca.qualcomm.com>
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>



On 09/14/2016 07:07 AM, Valo, Kalle wrote:
> greearb@candelatech.com writes:
>
>> From: Ben Greear <greearb@candelatech.com>
>>
>> When firmware crashes, stack can continue to send packets
>> for a bit, and existing code was spamming logs.
>>
>> So, rate-limit the error message for tx failures.
>>
>> Signed-off-by: Ben Greear <greearb@candelatech.com>
>> ---
>>   drivers/net/wireless/ath/ath10k/mac.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
>> index cd3016d..42cac32 100644
>> --- a/drivers/net/wireless/ath/ath10k/mac.c
>> +++ b/drivers/net/wireless/ath/ath10k/mac.c
>> @@ -3432,8 +3432,9 @@ static int ath10k_mac_tx_submit(struct ath10k *ar,
>>   	}
>>
>>   	if (ret) {
>> -		ath10k_warn(ar, "failed to transmit packet, dropping: %d\n",
>> -			    ret);
>> +		if (net_ratelimit())
>> +			ath10k_warn(ar, "failed to transmit packet, dropping: %d\n",
>> +				    ret);
>>   		ieee80211_free_txskb(ar->hw, skb);
>>   	}
>
> ath10k_warn() is already rate limited. If there's something wrong then
> that function should be fixed, not the callers.
>
> void ath10k_warn(struct ath10k *ar, const char *fmt, ...)
> {
> 	struct va_format vaf = {
> 		.fmt = fmt,
> 	};
> 	va_list args;
>
> 	va_start(args, fmt);
> 	vaf.va = &args;
> 	dev_warn_ratelimited(ar->dev, "%pV", &vaf);
> 	trace_ath10k_log_warn(ar, &vaf);
>
> 	va_end(args);
> }

The problem with having the ratelimit here is that you may miss
rare warnings due to a flood of common warnings.

That is why it is still useful to ratelimit potential floods
of warnings.

I would like to remove the ratelimit from ath10k_warn eventually.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
