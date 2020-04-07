Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLgGy-0008Qa-8x
 for ath10k@lists.infradead.org; Tue, 07 Apr 2020 04:55:44 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: fix kernel null pointer dereference
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1585736290-17661-1-git-send-email-vnaralas@codeaurora.org>
References: <1585736290-17661-1-git-send-email-vnaralas@codeaurora.org>
Message-Id: <20200407045527.C8BA0C433F2@smtp.codeaurora.org>
Date: Tue,  7 Apr 2020 04:55:27 +0000 (UTC)
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
To: Venkateswara Naralasetty <vnaralas@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Venkateswara Naralasetty <vnaralas@codeaurora.org> wrote:

> Currently sta airtime is updated without any lock in case of
> host based airtime calculation. Which may result in accessing the
> invalid sta pointer in case of continuous station connect/disconnect.
> 
> This patch fix the kernel null pointer dereference by updating the
> station airtime with proper RCU lock in case of host based airtime
> calculation.
> 
> Proceeding with the analysis of "ARM Kernel Panic".
> The APSS crash happened due to OOPS on CPU 0.
> Crash Signature : Unable to handle kernel NULL pointer dereference
> at virtual address 00000300
> During the crash,
> PC points to "ieee80211_sta_register_airtime+0x1c/0x448 [mac80211]"
> LR points to "ath10k_txrx_tx_unref+0x17c/0x364 [ath10k_core]".
> The Backtrace obtained is as follows:
> [<bf880238>] (ieee80211_sta_register_airtime [mac80211]) from
> [<bf945a38>] (ath10k_txrx_tx_unref+0x17c/0x364 [ath10k_core])
> [<bf945a38>] (ath10k_txrx_tx_unref [ath10k_core]) from
> [<bf9428e4>] (ath10k_htt_txrx_compl_task+0xa50/0xfc0 [ath10k_core])
> [<bf9428e4>] (ath10k_htt_txrx_compl_task [ath10k_core]) from
> [<bf9b9bc8>] (ath10k_pci_napi_poll+0x50/0xf8 [ath10k_pci])
> [<bf9b9bc8>] (ath10k_pci_napi_poll [ath10k_pci]) from
> [<c059e3b0>] (net_rx_action+0xac/0x160)
> [<c059e3b0>] (net_rx_action) from [<c02329a4>] (__do_softirq+0x104/0x294)
> [<c02329a4>] (__do_softirq) from [<c0232b64>] (run_ksoftirqd+0x30/0x90)
> [<c0232b64>] (run_ksoftirqd) from [<c024e358>] (smpboot_thread_fn+0x25c/0x274)
> [<c024e358>] (smpboot_thread_fn) from [<c02482fc>] (kthread+0xd8/0xec)
> 
> Tested HW: QCA9888
> Tested FW: 10.4-3.10-00047
> 
> Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

acb31476adc9 ath10k: fix kernel null pointer dereference

-- 
https://patchwork.kernel.org/patch/11468873/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
