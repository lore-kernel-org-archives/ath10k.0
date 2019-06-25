Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfl2B-00071m-Lz
 for ath10k@lists.infradead.org; Tue, 25 Jun 2019 12:58:53 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: add missing error handling
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20190523071534.254611-1-tientzu@chromium.org>
References: <20190523071534.254611-1-tientzu@chromium.org>
Message-Id: <20190625125851.44127602F4@smtp.codeaurora.org>
Date: Tue, 25 Jun 2019 12:58:51 +0000 (UTC)
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
To: Claire Chang <tientzu@chromium.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, wgong@codeaurora.org

Claire Chang <tientzu@chromium.org> wrote:

> In function ath10k_sdio_mbox_rx_alloc() [sdio.c],
> ath10k_sdio_mbox_alloc_rx_pkt() is called without handling the error cases.
> This will make the driver think the allocation for skb is successful and
> try to access the skb. If we enable failslab, system will easily crash with
> NULL pointer dereferencing.
> 
> Call trace of CONFIG_FAILSLAB:
> ath10k_sdio_irq_handler+0x570/0xa88 [ath10k_sdio]
> process_sdio_pending_irqs+0x4c/0x174
> sdio_run_irqs+0x3c/0x64
> sdio_irq_work+0x1c/0x28
> 
> Fixes: d96db25d2025 ("ath10k: add initial SDIO support")
> Signed-off-by: Claire Chang <tientzu@chromium.org>
> Reviewed-by: Brian Norris <briannorris@chromium.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

4b553f3ca4cb ath10k: add missing error handling

-- 
https://patchwork.kernel.org/patch/10957013/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
