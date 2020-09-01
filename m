Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kD4xS-0000R4-KB
 for ath10k@lists.infradead.org; Tue, 01 Sep 2020 12:00:18 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Add interrupt summary based CE processing
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1593193967-29897-1-git-send-email-pillair@codeaurora.org>
References: <1593193967-29897-1-git-send-email-pillair@codeaurora.org>
Message-Id: <20200901115959.87DCBC433CB@smtp.codeaurora.org>
Date: Tue,  1 Sep 2020 11:59:59 +0000 (UTC)
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
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

Rakesh Pillai <pillair@codeaurora.org> wrote:

> Currently the NAPI processing loops through all
> the copy engines and processes a particular copy
> engine is the copy completion is set for that copy
> engine. The host driver is not supposed to access
> any copy engine register after clearing the interrupt
> status register.
> 
> This might result in kernel crash like the one below
> [ 1159.220143] Call trace:
> [ 1159.220170]  ath10k_snoc_read32+0x20/0x40 [ath10k_snoc]
> [ 1159.220193]  ath10k_ce_per_engine_service_any+0x78/0x130 [ath10k_core]
> [ 1159.220203]  ath10k_snoc_napi_poll+0x38/0x8c [ath10k_snoc]
> [ 1159.220270]  net_rx_action+0x100/0x3b0
> [ 1159.220312]  __do_softirq+0x164/0x30c
> [ 1159.220345]  run_ksoftirqd+0x2c/0x64
> [ 1159.220380]  smpboot_thread_fn+0x1b0/0x288
> [ 1159.220405]  kthread+0x11c/0x12c
> [ 1159.220423]  ret_from_fork+0x10/0x18
> 
> To avoid such a scenario, we generate an interrupt
> summary by reading the copy completion for all the
> copy engine before actually processing any of them.
> This will avoid reading the interrupt status register
> for any CE after the interrupt status is cleared.
> 
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.1-01040-QCAHLSWMTPLZ-1
> 
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Tested-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

b92aba35d39d ath10k: Add interrupt summary based CE processing

-- 
https://patchwork.kernel.org/patch/11628289/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
