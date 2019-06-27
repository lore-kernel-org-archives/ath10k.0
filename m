Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgYg1-00051O-N1
 for ath10k@lists.infradead.org; Thu, 27 Jun 2019 17:59:19 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: add new hw_ops for sdio chip
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1560757048-19223-1-git-send-email-wgong@codeaurora.org>
References: <1560757048-19223-1-git-send-email-wgong@codeaurora.org>
Message-Id: <20190627175914.7D99D60A05@smtp.codeaurora.org>
Date: Thu, 27 Jun 2019 17:59:14 +0000 (UTC)
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

> It report error message while suspend/resume test.
> dmesg log:
> [  150.749962] ath10k_sdio mmc1:0001:1: hif read32 not supported
> [  150.755728] ath10k_sdio mmc1:0001:1: failed to set coverage class: expected integer microsecond value in register
> 
> Reason is sdio chip does not support set_coverage_class as well as
> pcie chip, remove the set_coverage_class handler will avoid it.
> 
> callstack of the error message:
> OUTLINED_FUNCTION_6+0xc/0x14 [ath10k_core]
> ath10k_mac_op_set_coverage_class+0x2c/0x40 [ath10k_core]
> ieee80211_reconfig+0x5d0/0x108c [mac80211]
> ieee80211_resume+0x34/0x6c [mac80211]
> wiphy_resume+0xbc/0x13c [cfg80211]
> dpm_run_callback+0xa4/0x168
> device_resume+0x1d4/0x200
> async_resume+0x1c/0x34
> async_run_entry_fn+0x48/0xf8
> process_one_work+0x178/0x2f8
> worker_thread+0x1d8/0x2cc
> kthread+0x11c/0x12c
> ret_from_fork+0x10/0x18
> 
> the error log will not happen after this patch applied.
> 
> Tested with QCA6174 SDIO with firmware
> WLAN.RMH.4.4.1-00007-QCARMSWP-1.
> 
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

6b4021deb03f ath10k: add new hw_ops for sdio chip

-- 
https://patchwork.kernel.org/patch/10998099/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
