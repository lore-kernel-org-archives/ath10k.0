Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1baihf-0006rd-1V
 for ath10k@lists.infradead.org; Fri, 19 Aug 2016 12:15:16 +0000
From: "Manoharan, Rajkumar" <rmanohar@qti.qualcomm.com>
Subject: Re: master-pending: ODEBUG: free active (active state 0) object type:
 timer_list hint: ath10k_htt_rx_ring_refill_retry+0x0/0x10
 [ath10k_core]
Date: Fri, 19 Aug 2016 12:14:47 +0000
Message-ID: <1471608887214.2763@qti.qualcomm.com>
References: <874m6i15ct.fsf@kamboji.qca.qualcomm.com>,
 <878tvtyo1b.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <878tvtyo1b.fsf@kamboji.qca.qualcomm.com>
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

[...]
>>
>> [  277.244673] ------------[ cut here ]------------
>> [  277.244685] WARNING: CPU: 2 PID: 2162 at lib/debugobjects.c:263 debug_print_object+0x85/0xa0
>> [  277.244707] ODEBUG: free active (active state 0) object type: timer_list hint: ath10k_htt_rx_ring_refill_retry+0x0/0x10 [ath10k_core]
>
> I bisected this to:
>
> [v2] ath10k: implement NAPI support
>
> https://patchwork.kernel.org/patch/9240975/
> 
> I'll reply to that patch for more info.
> 
Oops.. my bad.. Sorry for the regression..Good that it is captured at earliest.
Thanks Kalle for reporting the issue.

It seems during deinit, driver is not waiting for NAPI completion. What debug options should be enabled to see this warning?
If possible, could you please try below change?

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 33380fba5948..29fc9052e51a 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1759,6 +1759,7 @@ void ath10k_pci_ce_deinit(struct ath10k *ar)

 void ath10k_pci_flush(struct ath10k *ar)
 {
+       napi_synchronize(&ar->napi);
        ath10k_pci_rx_retry_sync(ar);
        ath10k_pci_buffer_cleanup(ar);
 }

-Rajkumar
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
