Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hO0c4-0006G3-MY
 for ath10k@lists.infradead.org; Tue, 07 May 2019 13:58:34 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: change swap mail box config for UTF mode of SDIO
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1554870654-4236-1-git-send-email-wgong@codeaurora.org>
References: <1554870654-4236-1-git-send-email-wgong@codeaurora.org>
Message-Id: <20190507135832.2042360AA8@smtp.codeaurora.org>
Date: Tue,  7 May 2019 13:58:31 +0000 (UTC)
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

> For SDIO chip, it does not have HTT connect step in boot phase of UTF
> mode, so it does not need the swap configuration for UTF mode, otherwise
> it will trigger UTF load fail. For normal mode, it is swap between HTT
> and WMI, for UTF mode, it does not have HTT, so it can not swap between
> HTT and WMI.
> 
> Disable swap mail box for UTF mode will let UTF mode load success.
> 
> Tested with QCA6174 SDIO with firmware
> WLAN.RMH.4.4.1-00007-QCARMSWP-1.
> 
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

8cdee1affe90 ath10k: change swap mail box config for UTF mode of SDIO

-- 
https://patchwork.kernel.org/patch/10893131/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
