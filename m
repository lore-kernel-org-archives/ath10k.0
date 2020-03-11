Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC4O1-0006tW-2D
 for ath10k@lists.infradead.org; Wed, 11 Mar 2020 16:39:18 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: start recovery process when read int status fail
 for sdio
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200214034007.24512-1-wgong@codeaurora.org>
References: <20200214034007.24512-1-wgong@codeaurora.org>
Message-Id: <20200311163906.883A6C432C2@smtp.codeaurora.org>
Date: Wed, 11 Mar 2020 16:39:06 +0000 (UTC)
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

> When running simulate crash stress test, it happened
> "failed to read from address 0x800: -110".
> 
> Test steps:
> 1. Run command continuous
> echo soft > /sys/kernel/debug/ieee80211/phy0/ath10k/simulate_fw_crash
> 
> 2. error happened and it did not begin recovery for long time.
> [74377.334846] ath10k_sdio mmc1:0001:1: simulating soft firmware crash
> [74378.378217] ath10k_sdio mmc1:0001:1: failed to read from address 0x800: -110
> [74378.378371] ath10k_sdio mmc1:0001:1: failed to process pending SDIO interrupts: -110
> 
> It has sdio errors since it can not read MBOX_HOST_INT_STATUS_ADDRESS,
> then it has to do recovery process to recovery ath10k.
> 
> Tested with QCA6174 SDIO with firmware WLAN.RMH.4.4.1-00042.
> 
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

37b7ecb75627 ath10k: start recovery process when read int status fail for sdio

-- 
https://patchwork.kernel.org/patch/11381639/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
