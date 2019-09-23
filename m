Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCKfH-0007hP-Ip
 for ath10k@lists.infradead.org; Mon, 23 Sep 2019 09:29:54 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v5 0/8] ath10k: improve throughout of tcp/udp TX/RX of sdio
References: <1567679893-14029-1-git-send-email-wgong@codeaurora.org>
Date: Mon, 23 Sep 2019 12:29:46 +0300
In-Reply-To: <1567679893-14029-1-git-send-email-wgong@codeaurora.org> (Wen
 Gong's message of "Thu, 5 Sep 2019 18:38:05 +0800")
Message-ID: <87sgon8inp.fsf@codeaurora.org>
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

> The bottleneck of throughout on sdio chip is the bus bandwidth, to the
> patches are all to increase the use ratio of sdio bus.
>
>                       udp-rx    udp-tx    tcp-rx    tcp-tx
> without patches(Mbps)  320        180       170       151
> with patches(Mbps)     450        410       400       320
>
> These patches only affect sdio bus chip, explanation is mentioned in each
> patch's commit log.

Below is my summary of the patchset. I recommend splitting these into
smaller sets, makes it a lot easier to review and apply. And please send
only one or two patchsets at a time.

[PATCH v5 1/8] ath10k: adjust skb length in ath10k_sdio_mbox_rx_packet

Applied.

Patchset 1:

[PATCH v5 2/8] ath10k: enable RX bundle receive for sdio
[PATCH v5 3/8] ath10k: change max RX bundle size from 8 to 32 for sdio

Reasonal but needs some cleanup.

Patchset 2:

[PATCH v5 4/8] ath10k: add workqueue for RX path of sdio

Is really another thread needed? We already have one for SDIO.

[PATCH v5 6/8] ath10k: add htt TX bundle for sdio

And again a new thread so that we would have three threads for SDIO? I'm
not convinced about that.

Patchset 3:

[PATCH v5 7/8] ath10k: enable alt data of TX path for sdio

Again another module parameter?

[PATCH v5 8/8] ath10k: enable napi on RX path for sdio

Seems reasonable, but worried about breaking USB.

Patchset 4:

[PATCH v5 5/8] ath10k: disable TX complete indication of htt for sdio

Quite hackish and I need numbers how much it really improves throughput

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
