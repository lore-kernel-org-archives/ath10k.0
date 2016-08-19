Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bajxB-0000dL-TP
 for ath10k@lists.infradead.org; Fri, 19 Aug 2016 13:35:22 +0000
Message-ID: <57B70AED.2010200@candelatech.com>
Date: Fri, 19 Aug 2016 06:34:37 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] ath10k: Ensure there are no stale ar->txqs entries.
References: <1471569995-10028-1-git-send-email-greearb@candelatech.com>
 <CA+BoTQn0d1bEB662r-Yivmdk_21LhjCQjJP_GoPaj-WT2wA=1g@mail.gmail.com>
In-Reply-To: <CA+BoTQn0d1bEB662r-Yivmdk_21LhjCQjJP_GoPaj-WT2wA=1g@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>



On 08/18/2016 11:59 PM, Michal Kazior wrote:
> On 19 August 2016 at 03:26,  <greearb@candelatech.com> wrote:
>> From: Ben Greear <greearb@candelatech.com>
>>
>> I was seeing kernel crashes due to accessing freed memory
>> while debugging a 9984 firmware that was crashing often.
>>
>> This patch fixes the crashes.  I am not certain if there
>> is a better way or not.
>>
>> Signed-off-by: Ben Greear <greearb@candelatech.com>
>> ---
>>   drivers/net/wireless/ath/ath10k/mac.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
>> index 5659ef1..916119c 100644
>> --- a/drivers/net/wireless/ath/ath10k/mac.c
>> +++ b/drivers/net/wireless/ath/ath10k/mac.c
>> @@ -4172,8 +4172,10 @@ static void ath10k_mac_txq_init(struct ieee80211_txq *txq)
>>   static void ath10k_mac_txq_unref(struct ath10k *ar, struct ieee80211_txq *txq)
>>   {
>>          struct ath10k_txq *artxq = (void *)txq->drv_priv;
>> +       struct ath10k_txq *tmp, *walker;
>>          struct ath10k_skb_cb *cb;
>>          struct sk_buff *msdu;
>> +       struct ieee80211_txq *txq_tmp;
>>          int msdu_id;
>>
>>          if (!txq)
>> @@ -4182,6 +4184,14 @@ static void ath10k_mac_txq_unref(struct ath10k *ar, struct ieee80211_txq *txq)
>>          spin_lock_bh(&ar->txqs_lock);
>>          if (!list_empty(&artxq->list))
>>                  list_del_init(&artxq->list);
>> +
>> +       /* Remove from ar->txqs in case it still exists there. */
>> +       list_for_each_entry_safe(walker, tmp, &ar->txqs, list) {
>> +               txq_tmp = container_of((void *)walker, struct ieee80211_txq,
>> +                                      drv_priv);
>> +               if (txq_tmp == txq)
>> +                       list_del(&walker->list);
>> +       }
>
> How could this even happen? All artxq->list accesses (add/del) are
> protected by txqs_lock so this shouldn't happen, no?
>
> Do you perhaps have the logic around txqs reworked in your tree?

I don't have any significant changes as far as I can tell.

I can build you a buggy 9984 firmware to reproduce the problem if you want...

Maybe the upstream patch could WARN_ON in this case to see if anyone else
ever hits it?

I did see a comment in the mac80211 about some assumptions on the driver with
regard to station teardown...I am not 100% sure ath10k meets that assumption,
so maybe that is why I could see this problem.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
