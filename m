Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCjzk-0007Hy-3o
 for ath10k@lists.infradead.org; Tue, 24 Sep 2019 12:32:41 +0000
MIME-Version: 1.0
Date: Tue, 24 Sep 2019 20:32:38 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH v5 0/8] ath10k: improve throughout of tcp/udp TX/RX of sdio
In-Reply-To: <87sgon8inp.fsf@codeaurora.org>
References: <1567679893-14029-1-git-send-email-wgong@codeaurora.org>
 <87sgon8inp.fsf@codeaurora.org>
Message-ID: <11062c4e1659ac759cb73af7d46a6db2@codeaurora.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 2019-09-23 17:29, Kalle Valo wrote:
> Wen Gong <wgong@codeaurora.org> writes:
> 
>> The bottleneck of throughout on sdio chip is the bus bandwidth, to the
>> patches are all to increase the use ratio of sdio bus.
>> 
>>                       udp-rx    udp-tx    tcp-rx    tcp-tx
>> without patches(Mbps)  320        180       170       151
>> with patches(Mbps)     450        410       400       320
>> 
>> These patches only affect sdio bus chip, explanation is mentioned in 
>> each
>> patch's commit log.
> 
> Below is my summary of the patchset. I recommend splitting these into
> smaller sets, makes it a lot easier to review and apply. And please 
> send
> only one or two patchsets at a time.
> 
> [PATCH v5 1/8] ath10k: adjust skb length in ath10k_sdio_mbox_rx_packet
> 
> Applied.
> 
> Patchset 1:
> 
> [PATCH v5 2/8] ath10k: enable RX bundle receive for sdio
> [PATCH v5 3/8] ath10k: change max RX bundle size from 8 to 32 for sdio
> 
> Reasonal but needs some cleanup.
[PATCH v5 2/8] I will use sk_buff_head to replace the 
ath10k_sdio_rx_request, then it will be simple
[PATCH v5 3/8] FIELD_GET is to >>, not <<, so << still need by my 
understand
> 
> Patchset 2:
> 
> [PATCH v5 4/8] ath10k: add workqueue for RX path of sdio
> 
> Is really another thread needed? We already have one for SDIO.

the SDIO thread is used for async tx, this queue is for RX, and it will 
improve udp rx
from 200Mbps to 400Mbps. And it used the workqueue_aux of ar, not new 
created.
this patch is better to put to Patchset 1, it helps RX, so it should put 
together with the
[PATCH v5 2/8] ath10k: enable RX bundle receive for sdio

> 
> [PATCH v5 6/8] ath10k: add htt TX bundle for sdio
> 
> And again a new thread so that we would have three threads for SDIO? 
> I'm
> not convinced about that.
The thread is for tx complete indication and the thread only used for tx 
bundle, if it does not have
heavy traffic, then it will not bundle, then the thread will not run.
for bundled tx, after bundled, it has max 32 packets in each bundle, the 
tx complete for the 32 packets will cost much time, if not give the tx 
complete task to the thread, then it will much delay the bundle of the 
next packets, then it will drop throughput.
> 
> Patchset 3:
> 
> [PATCH v5 7/8] ath10k: enable alt data of TX path for sdio
> 
> Again another module parameter?
the alt_data could be removed
> 
> [PATCH v5 8/8] ath10k: enable napi on RX path for sdio
> 
> Seems reasonable, but worried about breaking USB.
it can change to check napi enabled, if not, will use old 
ieee80211_rx_ni in ath10k_htt_rx_proc_rx_ind_hl
> 
> Patchset 4:
> 
> [PATCH v5 5/8] ath10k: disable TX complete indication of htt for sdio
> 
> Quite hackish and I need numbers how much it really improves throughput
it will improve throughput,
for udp tx, it can arrive to 400Mbps, if remove this patch, it will drop 
to
130M. it not only remove the tx complete message's bus bandwidth of 
sdio, and it also
has a improvement in firmware's tx path's logic, it will change the 
logic
of tx simple both in firmware and ath10k and faster the tx circle.
And the paramter disable_tx_comp can be removed.
this patch shoud be put in Patchset 2, it help TX, so it is better to 
put together with the
[PATCH v5 6/8] ath10k: add htt TX bundle for sdio.



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
