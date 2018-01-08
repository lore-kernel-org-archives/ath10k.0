Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eYY2J-00055f-4Y
 for ath10k@lists.infradead.org; Mon, 08 Jan 2018 14:04:25 +0000
From: Govind Singh <govinds@qti.qualcomm.com>
Subject: RE: [RFC v3 03/11] ath10k: per target configurablity of various items
Date: Mon, 8 Jan 2018 14:03:40 +0000
Message-ID: <ab162551fa9949daadc870edc9bfe792@aphydexm01b.ap.qualcomm.com>
References: <20170917194013.8658-1-erik.stromdahl@gmail.com>
 <20170917194013.8658-4-erik.stromdahl@gmail.com>
 <87wp1eaiz0.fsf@kamboji.qca.qualcomm.com>
 <c34f5c79-61a9-28b2-439c-f02045d06299@gmail.com>
 <87wp0s31sw.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87wp0s31sw.fsf@kamboji.qca.qualcomm.com>
Content-Language: en-US
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
To: Kalle Valo <kvalo@codeaurora.org>, Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Rakesh Pillai <pillair@qti.qualcomm.com>

>> A good point, I didn't thought of that during review. No time to investigate this right now, but maybe Rakesh and Govind (CCed) can comment?
Yes, ar->max_num_peers needs to be assigned with ar->hw_param->num_peers. This can create mismatch for wcn3990 target if we 
create multiple peers( TARGET_HL_10_TLV_NUM_PEERS vs TARGET_TLV_NUM_PEERS). We will fix this and raise this as separate change.

>>> Btw, what the heck is SNOC anyway?
SNOC is system NOC(network on chip). WCN3990 is integrated chipset connected over SNOC and only RF part is discrete to the SoC.

BR,
Govind

-----Original Message-----
From: Kalle Valo [mailto:kvalo@codeaurora.org] 
Sent: Monday, January 8, 2018 7:12 PM
To: Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: linux-wireless@vger.kernel.org; ath10k@lists.infradead.org; Rakesh Pillai <pillair@qti.qualcomm.com>; Govind Singh <govinds@qti.qualcomm.com>
Subject: Re: [RFC v3 03/11] ath10k: per target configurablity of various items

Erik Stromdahl <erik.stromdahl@gmail.com> writes:

> On 2017-12-22 16:19, Kalle Valo wrote:
>
>> I was a bit torn about this, I definitely see the need for this but 
>> on the other hand it creates duplicate data (for example two entries 
>> for
>> QCA9377 chip). I guess this is the right approach, at least I cannot 
>> come up anything better.
>>
>> But this patch should be split into two:
>>
>> 1) add bus field to struct ath10k_hw_params
>>
>> 2) add max_num_peers field to struct ath10k_hw_params
>>
>> And it seems 2) is already implemented in commit 9f2992fea580 ("ath10k:
>> wmi: get wmi init parameter values from hw params"), so hopefully we 
>> only need 1) anymore.
>>
>
> Before commit 9f2992fea580a48135591873e5e3ac7e01444207,
> TARGET_TLV_NUM_PEERS was used both in the WMI TLV init command and as 
> the value of *max_num_peers* in *struct ath10k* (ar->max_num_peers).
>
> commit 9f2992fea580a48135591873e5e3ac7e01444207 does not set
> *ar->max_num_peers* to the value of *ar->hw_param->num_peers*.
>
> Is this correct?
>
> As I see it, there is a possible mismatch between what is written to 
> the device in the WMI init message and the value of *ar->max_num_peers*.
>
> Do we still need *max_num_peers* in *struct ath10k* now that we have 
> the
> *num_peers* member in *struct ath10k_hw_params*?

A good point, I didn't thought of that during review. No time to investigate this right now, but maybe Rakesh and Govind (CCed) can comment?

> I am currently rewriting my HL patches and I was thinking about adding 
> a separate patch related to this.

Yeah, a separate patch to sort that out is a good idea.

>>> --- a/drivers/net/wireless/ath/ath10k/core.c
>>> +++ b/drivers/net/wireless/ath/ath10k/core.c
>>> @@ -1663,9 +1663,19 @@ static int ath10k_init_hw_params(struct ath10k *ar)
>>>   	for (i = 0; i < ARRAY_SIZE(ath10k_hw_params_list); i++) {
>>>   		hw_params = &ath10k_hw_params_list[i];
>>>   -		if (hw_params->id == ar->target_version &&
>>> -		    hw_params->dev_id == ar->dev_id)
>>> -			break;
>>> +		if (ar->is_high_latency) {
>>> +			/* High latency devices will use different fw depending
>>> +			 * on if it is a USB or SDIO device.
>>> +			 */
>>> +			if (hw_params->bus == ar->hif.bus &&
>>> +			    hw_params->id == ar->target_version &&
>>> +			    hw_params->dev_id == ar->dev_id)
>>> +				break;
>>> +		} else {
>>> +			if (hw_params->id == ar->target_version &&
>>> +			    hw_params->dev_id == ar->dev_id)
>>> +				break;
>>> +		}
>>
>> I don't like the is_high_latency test here at all. The bus field 
>> should be checked with all entries, not just high latency ones. And 
>> because of this even most of the hw_param bus field entries were not initialised.
>>
>> So only thing to do is to initialise the bus field for all the 
>> entries and the ugly test here can be removed. Just remember that 
>> QCA4019 uses AHB, I think all the rest is PCI. Or do we have AHB devices supported?
>
> I noticed that there has been introduced a new bus type (SNOC).
> Do you know which devices are SNOC devices?

SNOC is for wcn3990.

> Btw, what the heck is SNOC anyway?

I have forgetten already what the acronym meant but it's basically some sort of shared memory communication method with the firmware.

--
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
