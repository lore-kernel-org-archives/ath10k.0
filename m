Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grl2U-0003p0-0e
 for ath10k@lists.infradead.org; Thu, 07 Feb 2019 14:52:31 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Change swap mail box check after htc ready
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1548763392-3378-1-git-send-email-wgong@codeaurora.org>
References: <1548763392-3378-1-git-send-email-wgong@codeaurora.org>
Message-Id: <20190207145229.64F1E608D4@smtp.codeaurora.org>
Date: Thu,  7 Feb 2019 14:52:29 +0000 (UTC)
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

> The swap box flag of firmware is not set before htc ready, then it
> will not set swap box flag in ath10k driver, and it will let swap
> box setting not same between firmware and ath10k driver, then it
> will trigger firmware assert failure.
> 
> Check the flag and set swap box after htc ready will fix the firmware
> assert failure.
> 
> Tested with QCA6174 SDIO with firmware
> WLAN.RMH.4.4.1-00005-QCARMSWP-1.
> 
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

40194e3b36bf ath10k: change swap mail box check after htc ready

-- 
https://patchwork.kernel.org/patch/10786095/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
