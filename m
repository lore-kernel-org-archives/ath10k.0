Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bcaHu-0006gG-7f
 for ath10k@lists.infradead.org; Wed, 24 Aug 2016 15:40:26 +0000
From: "Manoharan, Rajkumar" <rmanohar@qti.qualcomm.com>
Subject: Re: master-pending: ODEBUG: free active (active state 0) object type:
 timer_list hint: ath10k_htt_rx_ring_refill_retry+0x0/0x10
 [ath10k_core]
Date: Wed, 24 Aug 2016 15:39:53 +0000
Message-ID: <1472053193355.82012@qti.qualcomm.com>
References: <874m6i15ct.fsf@kamboji.qca.qualcomm.com>
 <878tvtyo1b.fsf@kamboji.qca.qualcomm.com>
 <1471608887214.2763@qti.qualcomm.com>,
 <87a8g4x4rw.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87a8g4x4rw.fsf@kamboji.qca.qualcomm.com>
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

[...]
>>>>
>>>> [  277.244673] ------------[ cut here ]------------
>>>> [  277.244685] WARNING: CPU: 2 PID: 2162 at lib/debugobjects.c:263 debug_print_object+0x85/0xa0
>>>> [  277.244707] ODEBUG: free active (active state 0) object type: timer_list hint: ath10k_htt_rx_ring_refill_retry+0x0/0x10 [ath10k_core]
>>>>
>>>> I bisected this to:
>>>>
>>>> [v2] ath10k: implement NAPI support
>>>
>>> https://patchwork.kernel.org/patch/9240975/
>>>
>>> I'll reply to that patch for more info.
>>>
>> Oops.. my bad.. Sorry for the regression..Good that it is captured at
>> earliest. Thanks Kalle for reporting the issue.
>>
>> It seems during deinit, driver is not waiting for NAPI completion.
>> What debug options should be enabled to see this warning?
>
> I usually test with all sane[1] kernel debug infrastructure enabled. I have
> attached a kernel config I use with my x86 32-bit laptop.
> 
> [1] sane == not too spammy and still keeps the laptop barely usable
> 
Yes indeed. With your kernel config, I can able to repro the issue but machine is really slow ;)
Thanks a lot for sharing the config. It really helps.

>> If possible, could you please try below change?
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
>> index 33380fba5948..29fc9052e51a 100644
>> --- a/drivers/net/wireless/ath/ath10k/pci.c
>> +++ b/drivers/net/wireless/ath/ath10k/pci.c
>> @@ -1759,6 +1759,7 @@ void ath10k_pci_ce_deinit(struct ath10k *ar)
>>
>>  void ath10k_pci_flush(struct ath10k *ar)
>>  {
>> +       napi_synchronize(&ar->napi);
>>         ath10k_pci_rx_retry_sync(ar);
>>         ath10k_pci_buffer_cleanup(ar);
>>  }
>
> Sorry, didn't help:
>
It seems napi synchronization alone is not sufficient. NAPI should be disabled. Need your help again. ;)
With below change WARNING & KASAN BUG is gone. Could you please help to verify below change?

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 6e21fa1478ea..04ff45deb173 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1775,6 +1775,8 @@ static void ath10k_pci_hif_stop(struct ath10k *ar)
         */
        ath10k_pci_safe_chip_reset(ar);
 
+       napi_synchronize(&ar->napi);
+       napi_disable(&ar->napi);
        ath10k_pci_irq_disable(ar);
        ath10k_pci_irq_sync(ar);
        ath10k_pci_flush(ar);
@@ -2531,6 +2533,7 @@ static int ath10k_pci_hif_power_up(struct ath10k *ar)
                ath10k_err(ar, "could not wake up target CPU: %d\n", ret);
                goto err_ce;
        }
+       napi_enable(&ar->napi);
 
        return 0;
 
@@ -2878,7 +2881,6 @@ void ath10k_pci_init_napi(struct ath10k *ar)
 {
        netif_napi_add(&ar->napi_dev, &ar->napi, ath10k_pci_napi_poll,
                       ATH10K_NAPI_BUDGET);
-       napi_enable(&ar->napi);
 }
 
-Rajkumar
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
