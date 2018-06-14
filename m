Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fTTzd-0000xH-4w
 for ath10k@lists.infradead.org; Thu, 14 Jun 2018 15:16:59 +0000
MIME-Version: 1.0
Subject: Re: [1/4] ath10k: snoc: use correct bus-specific pointer in RX retry
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20180611210946.241341-1-briannorris@chromium.org>
References: <20180611210946.241341-1-briannorris@chromium.org>
Message-Id: <20180614151646.CDAF0602D7@smtp.codeaurora.org>
Date: Thu, 14 Jun 2018 15:16:46 +0000 (UTC)
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
To: Brian Norris <briannorris@chromium.org>
Cc: Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Kalle Valo <kvalo@qca.qualcomm.com>

Brian Norris <briannorris@chromium.org> wrote:

> We're 'ath10k_snoc', not 'ath10k_pci'. This probably means we're
> accessing junk data in ath10k_snoc_rx_replenish_retry(), unless
> 'ath10k_snoc' and 'ath10k_pci' happen to have very similar struct
> layouts.
> 
> Noticed by inspection.
> 
> Fixes: d915105231ca ("ath10k: add hif rx methods for wcn3990")
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

4 patches applied to ath-next branch of ath.git, thanks.

426a0f0b5a2f ath10k: snoc: use correct bus-specific pointer in RX retry
8ac5fe8e3d11 ath10k: snoc: stop including pci.h
13e6cc0bd4ef ath10k: snoc: drop unused WCN3990_CE_ATTR_FLAGS
c9f3e7fa8bcb ath10k: snoc: sort include files

-- 
https://patchwork.kernel.org/patch/10458863/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
