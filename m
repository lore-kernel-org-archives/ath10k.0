Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfky2-0004ZE-US
 for ath10k@lists.infradead.org; Tue, 25 Jun 2019 12:54:38 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: change firmware file name for UTF mode of SDIO/USB
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1557891047-16606-1-git-send-email-wgong@codeaurora.org>
References: <1557891047-16606-1-git-send-email-wgong@codeaurora.org>
Message-Id: <20190625125434.A1769602F4@smtp.codeaurora.org>
Date: Tue, 25 Jun 2019 12:54:34 +0000 (UTC)
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

> Firmware name for UTF mode of SDIO has changed from utf-2.bin to
> utf-sdio-2.bin, so it need to change in ath10k, otherwise it will
> fail for UTF mode.
> 
> After change the name in ath10k, it will success for UTF mode of
> SDIO/USB.
> 
> Tested with QCA6174 SDIO with firmware
> WLAN.RMH.4.4.1-00007-QCARMSWP-1.
> 
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

54f6643bf19e ath10k: change firmware file name for UTF mode of SDIO/USB

-- 
https://patchwork.kernel.org/patch/10944213/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
