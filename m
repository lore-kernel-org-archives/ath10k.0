Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fZzjm-0004X5-KX
 for ath10k@lists.infradead.org; Mon, 02 Jul 2018 14:23:32 +0000
MIME-Version: 1.0
Subject: Re: [1/3] ath10k: sdio: use same endpoint id for all packets in a
 bundle
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20180620084222.3521-2-niklas.cassel@linaro.org>
References: <20180620084222.3521-2-niklas.cassel@linaro.org>
Message-Id: <20180702142319.C057C60B1E@smtp.codeaurora.org>
Date: Mon,  2 Jul 2018 14:23:19 +0000 (UTC)
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
To: Niklas Cassel <niklas.cassel@linaro.org>
Cc: alagusankar@silex-india.com, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, "David S. Miller" <davem@davemloft.net>

Niklas Cassel <niklas.cassel@linaro.org> wrote:

> All packets in a bundle should use the same endpoint id as the
> first lookahead.
> 
> This matches how things are done is ath6kl, however,
> this patch can theoretically handle several bundles
> in ath10k_sdio_mbox_rx_process_packets().
> 
> Without this patch we get lots of errors about invalid endpoint id:
> 
> ath10k_sdio mmc2:0001:1: invalid endpoint in look-ahead: 224
> ath10k_sdio mmc2:0001:1: failed to get pending recv messages: -12
> ath10k_sdio mmc2:0001:1: failed to process pending SDIO interrupts: -12
> 
> Co-Developed-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Alagu Sankar <alagusankar@silex-india.com>
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

3 patches applied to ath-next branch of ath.git, thanks.

679e1f07c862 ath10k: sdio: use same endpoint id for all packets in a bundle
d1d061b1395a ath10k: sdio: allocate correct size for RECV_1MORE_BLOCK rx packets
8530b4e7b22b ath10k: sdio: set skb len for all rx packets

-- 
https://patchwork.kernel.org/patch/10476637/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
