Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQ6kA-0004Kp-Nq
 for ath10k@lists.infradead.org; Thu, 31 Oct 2019 09:27:52 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v6] ath10k: enable napi on RX path for sdio
References: <20191014114753.7459-1-wgong@codeaurora.org>
Date: Thu, 31 Oct 2019 11:27:46 +0200
In-Reply-To: <20191014114753.7459-1-wgong@codeaurora.org> (Wen Gong's message
 of "Mon, 14 Oct 2019 19:47:53 +0800")
Message-ID: <87tv7p1cz1.fsf@kamboji.qca.qualcomm.com>
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
To: Wen Gong <wgong@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Wen Gong <wgong@codeaurora.org> writes:

> For tcp RX, the quantity of tcp acks to remote is 1/2 of the quantity
> of tcp data from remote, then it will have many small length packets
> on TX path of sdio bus, then it reduce the RX packets's bandwidth of
> tcp.
>
> This patch enable napi on RX path, then the RX packet of tcp will not
> feed to tcp stack immeditely from mac80211 since GRO is enabled by
> default, it will feed to tcp stack after napi complete, if rx bundle
> is enabled, then it will feed to tcp stack one time for each bundle
> of RX. For example, RX bundle size is 32, then tcp stack will receive
> one large length packet, its length is neary 1500*32, then tcp stack
> will send a tcp ack for this large packet, this will reduce the tcp
> acks ratio from 1/2 to 1/32. This results in significant performance
> improvement for tcp RX.
>
> Tcp rx throughout is 240Mbps without this patch, and it arrive 390Mbps
> with this patch. The cpu usage has no obvious difference with and
> without NAPI.

I have not done thorough review yet, but few quick questions:

This adds a new skb queue ar->htt.rx_indication_head to RX path, but on
one of your earlier patches you also add another skb queue
ar_sdio->rx_head. Is it really necessary to have two separate queues in
RX path? Sounds like extra complexity to me.

The way I have understood that NAPI is used as a mechanism to disable
interrupts on the device and gain throughput from that. But in your
patch the poll function ath10k_sdio_napi_poll() doesn't touch the
hardware at all, it just processes packets from
ar->htt.rx_indication_head queue until budget runs out. I'm no NAPI
expert so I can't claim it's wrong, but at least it feels odd to me.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
