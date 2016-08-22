Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bbqBJ-0003zu-FQ
 for ath10k@lists.infradead.org; Mon, 22 Aug 2016 14:26:30 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: master-pending: ODEBUG: free active (active state 0) object type:
 timer_list hint: ath10k_htt_rx_ring_refill_retry+0x0/0x10
 [ath10k_core]
Date: Mon, 22 Aug 2016 14:25:14 +0000
Message-ID: <8760qsx4mv.fsf@kamboji.qca.qualcomm.com>
References: <874m6i15ct.fsf@kamboji.qca.qualcomm.com>
 <daf51642-2979-5376-d3e4-8a5e22c5504c@candelatech.com>
In-Reply-To: <daf51642-2979-5376-d3e4-8a5e22c5504c@candelatech.com> (Ben
 Greear's message of "Thu, 18 Aug 2016 08:18:59 -0700")
Content-Language: en-US
Content-ID: <1AF953F742192342A903B78469B67B3D@qualcomm.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Ben Greear <greearb@candelatech.com> writes:

> On 08/18/2016 08:09 AM, Valo, Kalle wrote:
>> Hi,
>>
>> I was testing master-pending branch and saw these warnings when I was
>> reloading ath10k. I have seen this two times out of two tests so seems
>> to be easy to reproduce. I don't have time to investigate this more at
>> this time but I'll post this anyway.
>
> I'm not sure I am seeing the same issue, but this patch below helps
> keep me from crashing when firmware dies. I'm not sure the spinlock
> change matters, but the txq_unref fixes the crash....

This didn't apply for me but I see that you submitted them as proper
patches later. I'll test those when I start debugging this NAPI issue
more.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
