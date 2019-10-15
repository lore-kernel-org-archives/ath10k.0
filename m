Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKFGw-0001Xg-PL
 for ath10k@lists.infradead.org; Tue, 15 Oct 2019 05:21:28 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v3 20/24] wireless: Remove call to memset after
 dma_alloc_coherent
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20190715031941.7120-1-huangfq.daxian@gmail.com>
References: <20190715031941.7120-1-huangfq.daxian@gmail.com>
Message-Id: <20191015052122.D2E0C60B7A@smtp.codeaurora.org>
Date: Tue, 15 Oct 2019 05:21:22 +0000 (UTC)
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
To: Fuqian Huang <huangfq.daxian@gmail.com>
Cc: brcm80211-dev-list.pdl@broadcom.com, Arend van Spriel <arend.vanspriel@broadcom.com>, Sergey Matyukevich <smatyukevich@quantenna.com>, netdev@vger.kernel.org, Chi-Hsien Lin <chi-hsien.lin@cypress.com>, linux-wireless@vger.kernel.org, Hante Meuleman <hante.meuleman@broadcom.com>, ath10k@lists.infradead.org, linux-kernel@vger.kernel.org, Igor Mitsyanko <imitsyanko@quantenna.com>, Wright Feng <wright.feng@cypress.com>, brcm80211-dev-list@cypress.com, Avinash Patil <avinashp@quantenna.com>, "David S . Miller" <davem@davemloft.net>, Franky Lin <franky.lin@broadcom.com>

Fuqian Huang <huangfq.daxian@gmail.com> wrote:

> In commit 518a2f1925c3
> ("dma-mapping: zero memory returned from dma_alloc_*"),
> dma_alloc_coherent has already zeroed the memory.
> So memset is not needed.
> 
> Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>

Patch applied to wireless-drivers-next.git, thanks.

52d4261862ec wireless: Remove call to memset after dma_alloc_coherent

-- 
https://patchwork.kernel.org/patch/11043359/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
