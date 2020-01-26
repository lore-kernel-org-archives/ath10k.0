Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail25.static.mailgun.info ([104.130.122.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iviuF-0008Jl-4I
 for ath10k@lists.infradead.org; Sun, 26 Jan 2020 14:28:56 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Correct the DMA direction for management tx
 buffers
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1579590748-17883-1-git-send-email-pillair@codeaurora.org>
References: <1579590748-17883-1-git-send-email-pillair@codeaurora.org>
Message-Id: <20200126142852.64BA3C43383@smtp.codeaurora.org>
Date: Sun, 26 Jan 2020 14:28:52 +0000 (UTC)
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
To: Rakesh Pillai <pillair@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Rakesh Pillai <pillair@codeaurora.org> wrote:

> The management packets, send to firmware via WMI, are
> mapped using the direction DMA_TO_DEVICE. Currently in
> case of wmi cleanup, these buffers are being unmapped
> using an incorrect DMA direction. This can cause unwanted
> behavior when the host driver is handling a restart
> of the wlan firmware.
> 
> We might see a trace like below
> 
> [<ffffff8008098b18>] __dma_inv_area+0x28/0x58
> [<ffffff8001176734>] ath10k_wmi_mgmt_tx_clean_up_pending+0x60/0xb0 [ath10k_core]
> [<ffffff80088c7c50>] idr_for_each+0x78/0xe4
> [<ffffff80011766a4>] ath10k_wmi_detach+0x4c/0x7c [ath10k_core]
> [<ffffff8001163d7c>] ath10k_core_stop+0x58/0x68 [ath10k_core]
> [<ffffff800114fb74>] ath10k_halt+0xec/0x13c [ath10k_core]
> [<ffffff8001165110>] ath10k_core_restart+0x11c/0x1a8 [ath10k_core]
> [<ffffff80080c36bc>] process_one_work+0x16c/0x31c
> 
> Fix the incorrect DMA direction during the wmi
> management tx buffer cleanup.
> 
> Tested HW: WCN3990
> Tested FW: WLAN.HL.3.1-00784-QCAHLSWMTPLZ-1
> 
> Fixes: dc405152bb6 ("ath10k: handle mgmt tx completion event")
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

6ba8b3b6bd77 ath10k: Correct the DMA direction for management tx buffers

-- 
https://patchwork.kernel.org/patch/11343145/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
