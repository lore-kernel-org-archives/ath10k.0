Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkwTV-0000ej-1s
 for ath10k@lists.infradead.org; Thu, 15 May 2014 14:17:33 +0000
Message-ID: <5374CC65.9010402@candelatech.com>
Date: Thu, 15 May 2014 07:17:09 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Any ideas on how to fix rssi?
References: <5373FAA0.8090801@candelatech.com> <5374053F.40804@candelatech.com>
 <CALhHN=qM=Kv+rKOyH4gDTNCfnPxTttCyF+gcLZnZP-R+Wa73JQ@mail.gmail.com>
In-Reply-To: <CALhHN=qM=Kv+rKOyH4gDTNCfnPxTttCyF+gcLZnZP-R+Wa73JQ@mail.gmail.com>
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
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: ath10k <ath10k@lists.infradead.org>

On 05/14/2014 10:07 PM, Janusz Dziedzic wrote:
> On 15 May 2014 02:07, Ben Greear <greearb@candelatech.com> wrote:
>> On 05/14/2014 04:22 PM, Ben Greear wrote:
>>> I'm seeing incorrect signal strength when running a rate-vs-range
>>> test through an attenuator.  Maybe the FIXME below is the reason?
>>>
>>> Any suggestions on what needs doing here?
>>
>> Actually, it wasn't (just?) this...the patch below makes the numbers look
>> good, but obviously there could be a better fix:
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
>> index ccbc363..f26f296 100644
>> --- a/drivers/net/wireless/ath/ath10k/htt_rx.c
>> +++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
>> @@ -1218,8 +1218,13 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
>>         mpdu_ranges = htt_rx_ind_get_mpdu_ranges(rx);
>>
>>         /* Fill this once, while this is per-ppdu */
>> -       rx_status->signal  = ATH10K_DEFAULT_NOISE_FLOOR;
>> -       rx_status->signal += rx->ppdu.combined_rssi;
> 
> Seems you have old code without ath10k: fix rssi and rate reporting patch.

Yes, thanks for the suggestion.  I had patches on each side of that one,
but somehow I had missed it.  Will test with it today.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
