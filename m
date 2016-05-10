Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1b08ri-0001nc-Up
 for ath10k@lists.infradead.org; Tue, 10 May 2016 14:42:28 +0000
Message-ID: <5731F328.30803@candelatech.com>
Date: Tue, 10 May 2016 07:41:44 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2 3/5] ath10k: Add WARN_ON if we over-write peer-map
 pointer.
References: <1459545132-11295-1-git-send-email-greearb@candelatech.com>
 <1459545132-11295-3-git-send-email-greearb@candelatech.com>
 <20160510071214.GD25626@atheros-ThinkPad-T61>
In-Reply-To: <20160510071214.GD25626@atheros-ThinkPad-T61>
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
To: Mohammed Shafi Shajakhan <mohammed@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org



On 05/10/2016 12:12 AM, Mohammed Shafi Shajakhan wrote:
> Hi Ben,
>
> On Fri, Apr 01, 2016 at 02:12:10PM -0700, greearb@candelatech.com wrote:
>> From: Ben Greear <greearb@candelatech.com>
>>
>> Not sure this can happen, but seems like a reasonable sanity
>> check.
>
> [shafi] possibly if the peer is removed and the bit is not cleared in the driver
> ? when the new peer occupies the slot

A firmware bug could cause this, but I never saw this WARN hit.  Still seems like
a good sanity check to me, though...it would be quite hard to debug this sort of bug
if it actually did happen.

Thanks,
Ben

>
>>
>> Signed-off-by: Ben Greear <greearb@candelatech.com>
>> ---
>>   drivers/net/wireless/ath/ath10k/txrx.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/txrx.c b/drivers/net/wireless/ath/ath10k/txrx.c
>> index a779a4e..2edef8a 100644
>> --- a/drivers/net/wireless/ath/ath10k/txrx.c
>> +++ b/drivers/net/wireless/ath/ath10k/txrx.c
>> @@ -309,6 +309,7 @@ void ath10k_peer_map_event(struct ath10k_htt *htt,
>>   	ath10k_warn(ar, /*ATH10K_DBG_HTT,*/ "htt peer map vdev %d peer %pM id %d\n",
>>   		   ev->vdev_id, ev->addr, ev->peer_id);
>>
>> +	WARN_ON(ar->peer_map[ev->peer_id] && (ar->peer_map[ev->peer_id] != peer));
>>   	ar->peer_map[ev->peer_id] = peer;
>>   	set_bit(ev->peer_id, peer->peer_ids);
>>   exit:
>> --
>> 2.4.3
>
> regards,
> shafi
>
>>
>>
>> _______________________________________________
>> ath10k mailing list
>> ath10k@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/ath10k
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
>

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
