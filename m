Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjkck-0000rl-KQ
 for ath10k@lists.infradead.org; Fri, 12 Jun 2020 14:25:40 +0000
MIME-Version: 1.0
Date: Fri, 12 Jun 2020 19:55:35 +0530
From: pillair@codeaurora.org
Subject: Re: [PATCH] ath10k: Wait until copy complete is actually done before
 completing
In-Reply-To: <20200609082015.1.Ife398994e5a0a6830e4d4a16306ef36e0144e7ba@changeid>
References: <20200609082015.1.Ife398994e5a0a6830e4d4a16306ef36e0144e7ba@changeid>
Message-ID: <775536279e60ccc833c481ad6ab6dab2@codeaurora.org>
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
To: Douglas Anderson <dianders@chromium.org>
Cc: saiprakash.ranjan@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, "David S.
 Miller" <davem@davemloft.net>, kvalo@codeaurora.org, kuabhs@google.com

Hi Doug,

The send callback for the CEs do check for hw_index/SRRI before trying 
to free the buffer.
But adding a check for copy-complete (before calling the individual CE 
callbacks) seems to be the better approach. Hence I agree that this 
patch should be added.

Thanks,
Rakesh Pillai.

On 2020-06-09 20:50, Douglas Anderson wrote:
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


Reviewed-by: Rakesh Pillai <pillair@codeaurora.org>


> ---
> 
>  drivers/net/wireless/ath/ath10k/ce.c | 30 +++++++++++++++++++---------
>  1 file changed, 21 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/ce.c
> b/drivers/net/wireless/ath/ath10k/ce.c
> index 294fbc1e89ab..ffdd4b995f33 100644
> --- a/drivers/net/wireless/ath/ath10k/ce.c
> +++ b/drivers/net/wireless/ath/ath10k/ce.c
> @@ -481,6 +481,15 @@ static inline void
> ath10k_ce_engine_int_status_clear(struct ath10k *ar,
>  	ath10k_ce_write32(ar, ce_ctrl_addr + wm_regs->addr, mask);
>  }
> 
> +static inline bool ath10k_ce_engine_int_status_check(struct ath10k 
> *ar,
> +						     u32 ce_ctrl_addr,
> +						     unsigned int mask)
> +{
> +	struct ath10k_hw_ce_host_wm_regs *wm_regs = ar->hw_ce_regs->wm_regs;
> +
> +	return ath10k_ce_read32(ar, ce_ctrl_addr + wm_regs->addr) & mask;
> +}
> +
>  /*
>   * Guts of ath10k_ce_send.
>   * The caller takes responsibility for any needed locking.
> @@ -1301,19 +1310,22 @@ void ath10k_ce_per_engine_service(struct
> ath10k *ar, unsigned int ce_id)
> 
>  	spin_lock_bh(&ce->ce_lock);
> 
> -	/* Clear the copy-complete interrupts that will be handled here. */
> -	ath10k_ce_engine_int_status_clear(ar, ctrl_addr,
> -					  wm_regs->cc_mask);
> +	if (ath10k_ce_engine_int_status_check(ar, ctrl_addr,
> +					      wm_regs->cc_mask)) {
> +		/* Clear before handling */
> +		ath10k_ce_engine_int_status_clear(ar, ctrl_addr,
> +						  wm_regs->cc_mask);
> 
> -	spin_unlock_bh(&ce->ce_lock);
> +		spin_unlock_bh(&ce->ce_lock);
> 
> -	if (ce_state->recv_cb)
> -		ce_state->recv_cb(ce_state);
> +		if (ce_state->recv_cb)
> +			ce_state->recv_cb(ce_state);
> 
> -	if (ce_state->send_cb)
> -		ce_state->send_cb(ce_state);
> +		if (ce_state->send_cb)
> +			ce_state->send_cb(ce_state);
> 
> -	spin_lock_bh(&ce->ce_lock);
> +		spin_lock_bh(&ce->ce_lock);
> +	}
> 
>  	/*
>  	 * Misc CE interrupts are not being handled, but still need

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
