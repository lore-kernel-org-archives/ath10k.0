Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkqAV-0001h5-UN
 for ath10k@lists.infradead.org; Mon, 15 Jun 2020 14:33:04 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Wait until copy complete is actually done before
 completing
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200609082015.1.Ife398994e5a0a6830e4d4a16306ef36e0144e7ba@changeid>
References: <20200609082015.1.Ife398994e5a0a6830e4d4a16306ef36e0144e7ba@changeid>
Message-Id: <20200615143237.5A57BC433CB@smtp.codeaurora.org>
Date: Mon, 15 Jun 2020 14:32:37 +0000 (UTC)
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
To: Douglas Anderson <dianders@chromium.org>
Cc: saiprakash.ranjan@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, linux-kernel@vger.kernel.org, pillair@codeaurora.org, netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, kuabhs@google.com

Douglas Anderson <dianders@chromium.org> wrote:

> On wcn3990 we have "per_ce_irq = true".  That makes the
> ath10k_ce_interrupt_summary() function always return 0xfff. The
> ath10k_ce_per_engine_service_any() function will see this and think
> that _all_ copy engines have an interrupt.  Without checking, the
> ath10k_ce_per_engine_service() assumes that if it's called that the
> "copy complete" (cc) interrupt fired.  This combination seems bad.
> 
> Let's add a check to make sure that the "copy complete" interrupt
> actually fired in ath10k_ce_per_engine_service().
> 
> This might fix a hard-to-reproduce failure where it appears that the
> copy complete handlers run before the copy is really complete.
> Specifically a symptom was that we were seeing this on a Qualcomm
> sc7180 board:
>   arm-smmu 15000000.iommu: Unhandled context fault:
>   fsr=0x402, iova=0x7fdd45780, fsynr=0x30003, cbfrsynra=0xc1, cb=10
> 
> Even on platforms that don't have wcn3990 this still seems like it
> would be a sane thing to do.  Specifically the current IRQ handler
> comments indicate that there might be other misc interrupt sources
> firing that need to be cleared.  If one of those sources was the one
> that caused the IRQ handler to be called it would also be important to
> double-check that the interrupt we cared about actually fired.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

ath10k firmwares work very differently, on what hardware and firmware did you
test this? I'll add that information to the commit log.

-- 
https://patchwork.kernel.org/patch/11595887/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
