Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSTir-0000RL-C8
 for ath10k@lists.infradead.org; Tue, 25 Mar 2014 15:57:05 +0000
Message-ID: <5331A73B.9080803@candelatech.com>
Date: Tue, 25 Mar 2014 08:56:43 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH 4/4 v2] ath10k:  invalid msdu-id logging
References: <1395688844-24640-1-git-send-email-greearb@candelatech.com>
 <1395688844-24640-5-git-send-email-greearb@candelatech.com>
 <87txam1o70.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87txam1o70.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 03/25/2014 05:02 AM, Kalle Valo wrote:
> greearb@candelatech.com writes:
> 
>> From: Ben Greear <greearb@candelatech.com>
>>
>> Make this message more obvious that it is a serious
>> problem (will cause tx flush issues, at least).
>>
>> Signed-off-by: Ben Greear <greearb@candelatech.com>
>> ---
>>
>> v2:  Add this to series, but ordering is not overly important.
>>
> 
> [...]
> 
>> --- a/drivers/net/wireless/ath/ath10k/txrx.c
>> +++ b/drivers/net/wireless/ath/ath10k/txrx.c
>> @@ -58,7 +58,7 @@ void ath10k_txrx_tx_unref(struct ath10k_htt *htt,
>>  		   tx_done->msdu_id, !!tx_done->discard, !!tx_done->no_ack);
>>  
>>  	if (tx_done->msdu_id >= htt->max_num_pending_tx) {
>> -		ath10k_warn("warning: msdu_id %d too big, ignoring\n",
>> +		ath10k_warn("error: msdu_id %d too big, ignoring\n",
>>  			    tx_done->msdu_id);
>>  		return;
>>  	}
> 
> To me any warning is a serious matter, I'm not sure how changing this to
> message to use "error:" makes any difference?

To me, warning is bad, but probably not critical.  Error would be a failure that
is not (easily) recovered from.  In the case above, the result of this problem
would be effectively a reference counting leak that hangs the driver for 5 seconds
(under rtnl lock, I believe) each time the driver tries to flush.  This will never
recover until firmware is restarted.

So, I think it is more of an error than warning, but it is not a big deal
either way, so feel free to just drop the patch.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
