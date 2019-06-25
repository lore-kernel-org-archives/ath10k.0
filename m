Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfkwh-0004Bl-Hq
 for ath10k@lists.infradead.org; Tue, 25 Jun 2019 12:53:12 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v3] ath10k: add support for firmware crash recovery on
 SDIO chip
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1558506776-19702-1-git-send-email-wgong@codeaurora.org>
References: <1558506776-19702-1-git-send-email-wgong@codeaurora.org>
Message-Id: <20190625125311.35171601B4@smtp.codeaurora.org>
Date: Tue, 25 Jun 2019 12:53:11 +0000 (UTC)
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

> The command to simulate firmware crash:
> echo soft > /sys/kernel/debug/ieee80211/phy0/ath10k/simulate_fw_crash
> 
> It will send WMI_FORCE_FW_HANG_ASSERT to firmware, then it will trigger
> CPU interrupt status register for SDIO chip, ath10k driver need to
> configure it while enable SDIO interrupt, otherwise ath10k driver will
> not get the assert error info.
> 
> After this change, it will success for simulate firmware crash.
> 
> Tested with QCA6174 SDIO with firmware
> WLAN.RMH.4.4.1-00007-QCARMSWP-1.
> 
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> Tested-by: Claire Chang <tientzu@chromium.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

0f132ba7ac64 ath10k: add support for firmware crash recovery on SDIO chip

-- 
https://patchwork.kernel.org/patch/10955189/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
