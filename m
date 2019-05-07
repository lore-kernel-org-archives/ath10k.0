Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hO0gr-00082n-4x
 for ath10k@lists.infradead.org; Tue, 07 May 2019 14:03:33 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath10k: add peer id check in ath10k_peer_find_by_id
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1556536632-19433-1-git-send-email-wgong@codeaurora.org>
References: <1556536632-19433-1-git-send-email-wgong@codeaurora.org>
Message-Id: <20190507140328.DA6A46016D@smtp.codeaurora.org>
Date: Tue,  7 May 2019 14:03:28 +0000 (UTC)
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

Wen Gong <wgong@codeaurora.org> wrote:

> For some SDIO chip, the peer id is 65535 for MPDU with error status,
> then test_bit will trigger buffer overflow for peer's memory, if kasan
> enabled, it will report error.
> 
> Reason is when station is in disconnecting status, firmware do not delete
> the peer info since it not disconnected completely, meanwhile some AP will
> still send data packet to station, then hardware will receive the packet
> and send to firmware, firmware's logic will report peer id of 65535 for
> MPDU with error status.
> 
> Add check for overflow the size of peer's peer_ids will avoid the buffer
> overflow access.
> 
> Call trace of kasan:
> dump_backtrace+0x0/0x2ec
> show_stack+0x20/0x2c
> __dump_stack+0x20/0x28
> dump_stack+0xc8/0xec
> print_address_description+0x74/0x240
> kasan_report+0x250/0x26c
> __asan_report_load8_noabort+0x20/0x2c
> ath10k_peer_find_by_id+0x180/0x1e4 [ath10k_core]
> ath10k_htt_t2h_msg_handler+0x100c/0x2fd4 [ath10k_core]
> ath10k_htt_htc_t2h_msg_handler+0x20/0x34 [ath10k_core]
> ath10k_sdio_irq_handler+0xcc8/0x1678 [ath10k_sdio]
> process_sdio_pending_irqs+0xec/0x370
> sdio_run_irqs+0x68/0xe4
> sdio_irq_work+0x1c/0x28
> process_one_work+0x3d8/0x8b0
> worker_thread+0x508/0x7cc
> kthread+0x24c/0x264
> ret_from_fork+0x10/0x18
> 
> Tested with QCA6174 SDIO with firmware
> WLAN.RMH.4.4.1-00007-QCARMSWP-1.
> 
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

49ed34b835e2 ath10k: add peer id check in ath10k_peer_find_by_id

-- 
https://patchwork.kernel.org/patch/10921671/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
