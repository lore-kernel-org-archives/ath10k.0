Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-eopbgr40125.outbound.protection.outlook.com
 ([40.107.4.125] helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dZZfS-0006Gt-VB
 for ath10k@lists.infradead.org; Mon, 24 Jul 2017 09:28:49 +0000
Subject: Re: WARN_ON_ONCE(work > weight) in napi_poll()
References: <26670dce-4dd2-f8e4-0e14-90d74257e739@virtuozzo.com>
 <87wp7oia6j.fsf@kamboji.qca.qualcomm.com>
 <952aefe1-6f6a-3978-e7e7-5e74076f26a3@virtuozzo.com>
 <b418d63d-d348-90b5-ea58-6478a1a037f5@qca.qualcomm.com>
 <8cb28d9b-41c9-043c-16ca-f0bea41944e9@virtuozzo.com>
 <3ce246b3-b110-dd50-bf29-45ee78985872@quantenna.com>
 <daa2fbf9-ac75-a7eb-f2b7-054dfae6fc56@qca.qualcomm.com>
From: Andrey Ryabinin <aryabinin@virtuozzo.com>
Message-ID: <b5e60c2f-c719-0c65-f2c4-bb280fee2eb7@virtuozzo.com>
Date: Mon, 24 Jul 2017 12:30:44 +0300
MIME-Version: 1.0
In-Reply-To: <daa2fbf9-ac75-a7eb-f2b7-054dfae6fc56@qca.qualcomm.com>
Content-Language: en-US
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
To: Ryan Hsu <ryanhsu@qti.qualcomm.com>, Igor Mitsyanko <igor.mitsyanko.os@quantenna.com>, Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Networking <netdev@vger.kernel.org>, linux-wireless <linux-wireless@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 07/18/2017 09:47 AM, Ryan Hsu wrote:
> On 07/11/2017 06:19 PM, Igor Mitsyanko wrote:
> 
>> On 07/11/2017 10:28 AM, Andrey Ryabinin wrote:
>>>
>>> It gave me this:
>>>
>>> [118648.825347] #1 quota too big 72 64 16
>>> [118648.825351] #2 quota too big 72 64 16
>>> [118648.825471] ------------[ cut here ]------------
>>> [118648.825484] WARNING: CPU: 0 PID: 0 at ../net/core/dev.c:5274 net_rx_action+0x258/0x360
>>>
>>> So this means that we didn't met the condition bellow, i.e. skb_queue_empty() returned true.
>>>
>>>          ath10k_htt_txrx_compl_task():
>>>
>>>                  if ((quota > ATH10K_NAPI_QUOTA_LIMIT) &&
>>>                      !skb_queue_empty(&htt->rx_in_ord_compl_q)) {
>>>                          resched_napi = true;
>>>                          goto exit;
>>>                  }
>>>
>>>> Also WLAN.RM.2.0-00180-QCARMSWPZ-1 firmware is a bit old, could you also update firmware to give it a try?
>>>> https://github.com/kvalo/ath10k-firmware/tree/master/QCA6174/hw3.0/4.4
>>>>
>>>
>>> Will try.
>>>
>>
>> Maybe ath10k_htt_rx_in_ord_ind() has to accept "budget_left" parameter and use it to limit number of processed MSDUs in queued AMSDU and saving rest for later (NAPI has to be rescheduled in this case).
>> It seems natural that this problem happens with current logic, in case AMSDU in Rx queue has more elements then left in budget.
> 
> Thanks, likely in current logic, it does have chance to exceed the budget while dequeuing from the last list.
> 
> Can you give it a try this one? for QCA6174 reorder is offload, so this should be good enough for your case to test, will have to check non-offload reorder case... but let me know if you're seeing something different....
> 

I've been running with this patch almost a week and haven't seen the WARNING. One week is usually enough to trigger it several times.
I guess we can assume that the patch fixed the problem.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
