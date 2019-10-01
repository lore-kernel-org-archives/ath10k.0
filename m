Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFLiX-0006TF-EN
 for ath10k@lists.infradead.org; Tue, 01 Oct 2019 17:13:42 +0000
Received: by mail-pg1-x541.google.com with SMTP id d26so4629655pgl.7
 for <ath10k@lists.infradead.org>; Tue, 01 Oct 2019 10:13:40 -0700 (PDT)
Subject: Re: [PATCH 2/2] ath10k: switch to ieee80211_tx_dequeue_ni
References: <20190617200140.6189-1-erik.stromdahl@gmail.com>
 <20190617200140.6189-2-erik.stromdahl@gmail.com>
 <87eezw660r.fsf@kamboji.qca.qualcomm.com>
From: Peter Oh <peter.oh@eero.com>
Message-ID: <19f8023a-1943-9bf5-9a59-a7643f7692bf@eero.com>
Date: Tue, 1 Oct 2019 10:13:35 -0700
MIME-Version: 1.0
In-Reply-To: <87eezw660r.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@codeaurora.org>, Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: johannes@sipsolutions.net, linux-wireless@vger.kernel.org, davem@davemloft.net, ath10k@lists.infradead.org, linux-kernel@vger.kernel.org


On 10/1/19 4:48 AM, Kalle Valo wrote:
> Erik Stromdahl <erik.stromdahl@gmail.com> writes:
>
>> Since ath10k_mac_tx_push_txq() can be called from process context, we
>> must explicitly disable softirqs before the call into mac80211.
>>
>> By calling ieee80211_tx_dequeue_ni() instead of ieee80211_tx_dequeue()
>> we make sure softirqs are always disabled even in the case when
>> ath10k_mac_tx_push_txq() is called from process context.
>>
>> Calling ieee80211_tx_dequeue_ni() with softirq's already disabled
>> (e.g., from softirq context) should be safe as the local_bh_disable()
>> and local_bh_enable() functions (called from ieee80211_tx_dequeue_ni)
>> are fully reentrant.
>>
>> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
> I already applied this, but I still want to check _why_ you are changing
> this? Is it that you want to call ath10k_mac_tx_push_pending() from a
> workqueue in sdio.c in a future patch, or what? Because at the moment me
> and Johannes were not able to find where this is called in process
> context.
>
It seems Johannes wants to fix it in mac80211.

[PATCH v2] mac80211: keep BHs disabled while calling drv_tx_wake_queue()

Drivers typically expect this, as it's the case for almost all cases
where this is called (i.e. from the TX path). Also, the code in mac80211
itself (if the driver calls ieee80211_tx_dequeue()) expects this as it
uses this_cpu_ptr() without additional protection.


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
