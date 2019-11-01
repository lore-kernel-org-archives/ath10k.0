Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQRrF-0007ET-9U
 for ath10k@lists.infradead.org; Fri, 01 Nov 2019 08:00:34 +0000
MIME-Version: 1.0
Date: Fri, 01 Nov 2019 16:00:31 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH v6] ath10k: enable napi on RX path for sdio
In-Reply-To: <87tv7p1cz1.fsf@kamboji.qca.qualcomm.com>
References: <20191014114753.7459-1-wgong@codeaurora.org>
 <87tv7p1cz1.fsf@kamboji.qca.qualcomm.com>
Message-ID: <e9db35228a09ccc14ac0ec31e9a10552@codeaurora.org>
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

On 2019-10-31 17:27, Kalle Valo wrote:
> Wen Gong <wgong@codeaurora.org> writes:
> 
>> For tcp RX, the quantity of tcp acks to remote is 1/2 of the quantity
>> of tcp data from remote, then it will have many small length packets
>> on TX path of sdio bus, then it reduce the RX packets's bandwidth of
>> tcp.
>> 
>> This patch enable napi on RX path, then the RX packet of tcp will not
>> feed to tcp stack immeditely from mac80211 since GRO is enabled by
>> default, it will feed to tcp stack after napi complete, if rx bundle
>> is enabled, then it will feed to tcp stack one time for each bundle
>> of RX. For example, RX bundle size is 32, then tcp stack will receive
>> one large length packet, its length is neary 1500*32, then tcp stack
>> will send a tcp ack for this large packet, this will reduce the tcp
>> acks ratio from 1/2 to 1/32. This results in significant performance
>> improvement for tcp RX.
>> 
>> Tcp rx throughout is 240Mbps without this patch, and it arrive 390Mbps
>> with this patch. The cpu usage has no obvious difference with and
>> without NAPI.
> 
> I have not done thorough review yet, but few quick questions:
> 
> This adds a new skb queue ar->htt.rx_indication_head to RX path, but on
> one of your earlier patches you also add another skb queue
> ar_sdio->rx_head. Is it really necessary to have two separate queues in
> RX path? Sounds like extra complexity to me.
it is because the ar_sdio->rx_head is for all rx of sdio bus, include 
wmi event, fw log event,
pkt log event, htt event... and ar_sdio->rx_head is a lower layer of 
stack,
but the NAPI it to improve htt rx data's performance, it is only for htt 
rx, also pcie has the same
queue in ath10k_htt for napi, but it only used for low latency.
> 
> The way I have understood that NAPI is used as a mechanism to disable
> interrupts on the device and gain throughput from that. But in your
> patch the poll function ath10k_sdio_napi_poll() doesn't touch the
> hardware at all, it just processes packets from
> ar->htt.rx_indication_head queue until budget runs out. I'm no NAPI
> expert so I can't claim it's wrong, but at least it feels odd to me.
The difference of this sdio NAPI and pcie NAPI is PCIE's napi_schedule 
is called in isr,
and sdio is called in indication_work of sdio rx, because ath10k's isr 
is not a real isr, it is
owned by sdio host, and actually it is a thread.
When napi_schedule called, it will raise a soft irq in the same context, 
it will block current thread
but not block current isr, in order not to block sdio host thread, so 
called napi_schedule in indication_work of sdio rx is the best choise.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
