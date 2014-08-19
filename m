Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XJkDR-0007RT-IQ
 for ath10k@lists.infradead.org; Tue, 19 Aug 2014 14:16:49 +0000
Message-ID: <53F35C36.9060404@candelatech.com>
Date: Tue, 19 Aug 2014 07:16:22 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k:  improve logging in firmware crash routine.
References: <1407271772-14874-1-git-send-email-greearb@candelatech.com>
 <87ppfwadcm.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87ppfwadcm.fsf@kamboji.qca.qualcomm.com>
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



On 08/19/2014 05:11 AM, Kalle Valo wrote:
> greearb@candelatech.com writes:
>
>> From: Ben Greear <greearb@candelatech.com>
>>
>> Only print error message upon failure, and print more
>> details in case it does find an error.
>>
>> Signed-off-by: Ben Greear <greearb@candelatech.com>
>> ---
>>
>> This is on top of the firmware crash reporting patches,
>> not sure it would apply clean until those get in.
>
> Yeah, this does conflict with the firmware crash dump patches.
>
>>   drivers/net/wireless/ath/ath10k/pci.c | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
>> index 24688b7..085c0c8 100644
>> --- a/drivers/net/wireless/ath/ath10k/pci.c
>> +++ b/drivers/net/wireless/ath/ath10k/pci.c
>> @@ -929,12 +929,11 @@ static void ath10k_pci_hif_dump_area(struct ath10k *ar)
>>   	ret = ath10k_pci_diag_read_mem(ar, host_addr,
>>   				       &reg_dump_area, sizeof(u32));
>>   	if (ret) {
>> -		ath10k_err("failed to read FW dump area address: %d\n", ret);
>> +		ath10k_err("failed to read FW dump area address: %d  (hostaddr 0x%08X  hi-failure-state 0x%08lX)\n",
>> +			   ret, host_addr, HI_ITEM(hi_failure_state));
>>   		goto exit;
>>   	}
>
> As I reworked how the diag interface is used, this doesn't directly
> apply anymore. And are these values really that important?
>
>> -	ath10k_err("target register Dump Location: 0x%08X\n", reg_dump_area);
>
> I actually removed this line in the firmware crash dump patchset.

Probably with your re-work, this patch is no longer useful.  At the time I wrote it,
it allowed a bit more information in error cases and less noise when everything was
OK.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
