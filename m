Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iIHte-0003vr-Ma
 for ath10k@lists.infradead.org; Wed, 09 Oct 2019 19:45:20 +0000
Received: by mail-lj1-x243.google.com with SMTP id y3so3724684ljj.6
 for <ath10k@lists.infradead.org>; Wed, 09 Oct 2019 12:45:18 -0700 (PDT)
Subject: Re: [PATCH 2/2] ath10k: switch to ieee80211_tx_dequeue_ni
From: Erik Stromdahl <erik.stromdahl@gmail.com>
References: <20190617200140.6189-1-erik.stromdahl@gmail.com>
 <20190617200140.6189-2-erik.stromdahl@gmail.com>
 <87eezw660r.fsf@kamboji.qca.qualcomm.com>
 <19f8023a-1943-9bf5-9a59-a7643f7692bf@eero.com>
 <fd43b218-7dc7-22dd-664b-46c55c3dd94e@gmail.com>
Message-ID: <f1669b69-6762-1341-8822-de08d9ddd55b@gmail.com>
Date: Wed, 9 Oct 2019 21:45:15 +0200
MIME-Version: 1.0
In-Reply-To: <fd43b218-7dc7-22dd-664b-46c55c3dd94e@gmail.com>
Content-Language: en-US
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
To: Peter Oh <peter.oh@eero.com>, Kalle Valo <kvalo@codeaurora.org>
Cc: johannes@sipsolutions.net, linux-wireless@vger.kernel.org, davem@davemloft.net, ath10k@lists.infradead.org, linux-kernel@vger.kernel.org



On 10/9/19 9:23 PM, Erik Stromdahl wrote:
> 
> 
> On 10/1/19 7:13 PM, Peter Oh wrote:
>>
>> On 10/1/19 4:48 AM, Kalle Valo wrote:
>>> Erik Stromdahl <erik.stromdahl@gmail.com> writes:
>>>
>>>> Since ath10k_mac_tx_push_txq() can be called from process context, we
>>>> must explicitly disable softirqs before the call into mac80211.
>>>>
>>>> By calling ieee80211_tx_dequeue_ni() instead of ieee80211_tx_dequeue()
>>>> we make sure softirqs are always disabled even in the case when
>>>> ath10k_mac_tx_push_txq() is called from process context.
>>>>
>>>> Calling ieee80211_tx_dequeue_ni() with softirq's already disabled
>>>> (e.g., from softirq context) should be safe as the local_bh_disable()
>>>> and local_bh_enable() functions (called from ieee80211_tx_dequeue_ni)
>>>> are fully reentrant.
>>>>
>>>> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
>>> I already applied this, but I still want to check _why_ you are changing
>>> this? Is it that you want to call ath10k_mac_tx_push_pending() from a
>>> workqueue in sdio.c in a future patch, or what? Because at the moment me
>>> and Johannes were not able to find where this is called in process
>>> context.
>>>
> SDIO irqs are threaded irqs (at least on my iMX6 board) and hence process context.
> I will see if I can find a trace that shows the call chain more exactly.
> 

I found this backtrace in a log file:
(it does not show the call to ieee80211_tx_dequeue_ni(), but it shows that
ath10k_sdio_irq_handler() is called from process context)

          irq/62-mmc1-65    [000] ....   785.261081: ath10k_mac_op_wake_tx_queue <-ieee80211_queue_skb
          irq/62-mmc1-65    [000] ....   785.261090: <stack trace>
      => ieee80211_queue_skb
      => __ieee80211_subif_start_xmit
      => ieee80211_subif_start_xmit
      => dev_hard_start_xmit
      => __dev_queue_xmit
      => dev_queue_xmit
      => ip_finish_output2
      => ip_finish_output
      => ip_output
      => ip_local_out
      => ip_queue_xmit
      => tcp_transmit_skb
      => tcp_write_xmit
      => __tcp_push_pending_frames
      => tcp_rcv_established
      => tcp_v4_do_rcv
      => tcp_v4_rcv
      => ip_local_deliver_finish
      => ip_local_deliver
      => ip_rcv_finish
      => ip_rcv
      => __netif_receive_skb_core
      => __netif_receive_skb
      => netif_receive_skb_internal
      => netif_receive_skb
      => ieee80211_deliver_skb
      => ieee80211_rx_handlers
      => ieee80211_prepare_and_rx_handle
      => ieee80211_rx_napi
      => ath10k_htt_t2h_msg_handler
      => ath10k_htt_htc_t2h_msg_handler
      => ath10k_sdio_mbox_rxmsg_pending_handler
      => ath10k_sdio_irq_handler                        <- ath10k_mac_tx_push_pending() is called from here
      => process_sdio_pending_irqs
      => sdio_run_irqs
      => sdhci_thread_irq
      => irq_thread_fn
      => irq_thread
      => kthread
      => ret_from_fork
      => 0

 From ath10k_sdio_irq_handler(), the call chain down to ieee80211_tx_dequeue_ni()
looks like this:

ath10k_sdio_irq_handler() =>
   ath10k_mac_tx_push_pending() =>
     ath10k_mac_schedule_txq() =>
       ath10k_mac_tx_push_txq() =>
         ieee80211_tx_dequeue_ni()

> 
>> It seems Johannes wants to fix it in mac80211.
>>
>> [PATCH v2] mac80211: keep BHs disabled while calling drv_tx_wake_queue()
>>
>> Drivers typically expect this, as it's the case for almost all cases
>> where this is called (i.e. from the TX path). Also, the code in mac80211
>> itself (if the driver calls ieee80211_tx_dequeue()) expects this as it
>> uses this_cpu_ptr() without additional protection.
>>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
