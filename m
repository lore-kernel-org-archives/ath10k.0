Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfkyw-0005uZ-RZ
 for ath10k@lists.infradead.org; Tue, 25 Jun 2019 12:55:32 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: acquire lock to fix lockdep's warning
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20190506073836.184059-1-tientzu@chromium.org>
References: <20190506073836.184059-1-tientzu@chromium.org>
Message-Id: <20190625125530.7E8E260312@smtp.codeaurora.org>
Date: Tue, 25 Jun 2019 12:55:30 +0000 (UTC)
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
Cc: drinkcat@chromium.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, wgong@codeaurora.org

Claire Chang <tientzu@chromium.org> wrote:

> Lockdep warns at lockdep_assert_held(&ar->data_lock) in
> ath10k_htt_rx_pn_check_replay_hl(). Acquire ar->data_lock before calling
> ath10k_htt_rx_pn_check_replay_hl() to fix it.
> 
> Call trace:
> ath10k_htt_rx_pn_check_replay_hl+0x118/0x134 [ath10k_core]
> ath10k_htt_rx_proc_rx_ind_hl+0xd8/0x250 [ath10k_core]
> ath10k_htt_t2h_msg_handler+0x148/0xf30 [ath10k_core]
> ath10k_htt_htc_t2h_msg_handler+0x24/0x40 [ath10k_core]
> ath10k_sdio_irq_handler+0x374/0xaa4 [ath10k_sdio]
> 
> Fixes: 130c77495708 ("ath10k: add PN replay protection for high latency devices")
> Signed-off-by: Claire Chang <tientzu@chromium.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

ef9cc0c44394 ath10k: acquire lock to fix lockdep's warning

-- 
https://patchwork.kernel.org/patch/10930667/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
