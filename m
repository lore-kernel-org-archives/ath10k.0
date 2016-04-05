Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by merlin.infradead.org with esmtps (Exim 4.85 #2 (Red Hat Linux))
 id 1anR8N-0004pO-Ja
 for ath10k@lists.infradead.org; Tue, 05 Apr 2016 13:35:11 +0000
MIME-Version: 1.0
Date: Tue, 05 Apr 2016 19:04:43 +0530
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: [PATCH 3/3] ath10k: fix unconditional num_mpdus_ready subtraction
In-Reply-To: <87shz0b4s2.fsf@kamboji.qca.qualcomm.com>
References: <1459352551-11773-1-git-send-email-rmanohar@qti.qualcomm.com>
 <1459352551-11773-3-git-send-email-rmanohar@qti.qualcomm.com>
 <87shz0b4s2.fsf@kamboji.qca.qualcomm.com>
Message-ID: <6a0952fb8bfc92769b93f602189ddeac@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, "Manoharan,
 Rajkumar" <rmanohar@qti.qualcomm.com>, ath10k@lists.infradead.org

On 2016-04-05 18:18, Valo, Kalle wrote:
> Rajkumar Manoharan <rmanohar@qti.qualcomm.com> writes:
> 
>> Decrement num_mpdus_ready only when rx amsdu is processed 
>> successfully.
>> Not doing so, will result in leak and impact stabilty under low memory
>> cases.
>> 
>> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
>> ---
>>  drivers/net/wireless/ath/ath10k/htt_rx.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>> 
>> diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c 
>> b/drivers/net/wireless/ath/ath10k/htt_rx.c
>> index 96a7417..9696c2e 100644
>> --- a/drivers/net/wireless/ath/ath10k/htt_rx.c
>> +++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
>> @@ -2412,14 +2412,12 @@ static void 
>> ath10k_htt_txrx_compl_task(unsigned long ptr)
>>  	struct ath10k_htt *htt = (struct ath10k_htt *)ptr;
>>  	struct ath10k *ar = htt->ar;
>>  	struct htt_tx_done tx_done = {};
>> -	struct sk_buff_head rx_q;
>>  	struct sk_buff_head rx_ind_q;
>>  	struct sk_buff_head tx_ind_q;
>>  	struct sk_buff *skb;
>>  	unsigned long flags;
>>  	int num_mpdus;
>> 
>> -	__skb_queue_head_init(&rx_q);
>>  	__skb_queue_head_init(&rx_ind_q);
>>  	__skb_queue_head_init(&tx_ind_q);
> 
> I guess you are removing the unused rx_q just as a cleanup? It's good
> practise to mention that in the commit log (or better yet in a separate
> patch).

update the commit log and send next version.

-Rajkumar

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
