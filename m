Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grl6T-0005cQ-DG
 for ath10k@lists.infradead.org; Thu, 07 Feb 2019 14:56:38 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: reduce transmit msdu count
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1548987429-14008-1-git-send-email-wgong@codeaurora.org>
References: <1548987429-14008-1-git-send-email-wgong@codeaurora.org>
Message-Id: <20190207145637.21B8F60247@smtp.codeaurora.org>
Date: Thu,  7 Feb 2019 14:56:36 +0000 (UTC)
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

> Reduce the transmit MSDU count for SDIO, to match with the descriptors
> as used by the firmware. This also acts as a high watermark level for
> transmit. Too many packets to the firmware results in transmit overflow
> interrupt.
> 
> It only affect SDIO chip, it will not cause functionaly changes to
> other hardware.
> 
> Tested with QCA6174 SDIO with firmware
> WLAN.RMH.4.4.1-00005-QCARMSWP-1.
> 
> Signed-off-by: Alagu Sankar <alagusankar@silex-india.com>
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

a73dbce3a6f4 ath10k: reduce transmit msdu count

-- 
https://patchwork.kernel.org/patch/10791705/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
