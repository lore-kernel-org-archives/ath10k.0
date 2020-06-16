Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jl6kh-0006Iu-O5
 for ath10k@lists.infradead.org; Tue, 16 Jun 2020 08:15:31 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: fix retry packets update in station dump
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1591856446-26977-1-git-send-email-vnaralas@codeaurora.org>
References: <1591856446-26977-1-git-send-email-vnaralas@codeaurora.org>
Message-Id: <20200616081517.C94F2C433C8@smtp.codeaurora.org>
Date: Tue, 16 Jun 2020 08:15:17 +0000 (UTC)
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

> When tx status enabled, retry count is updated from tx completion status.
> which is not working as expected due to firmware limitation where
> firmware can not provide per MSDU rate statistics from tx completion
> status. Due to this tx retry count is always 0 in station dump.
> 
> Fix this issue by updating the retry packet count from per peer
> statistics. This patch will not break on SDIO devices since, this retry
> count is already updating from peer statistics for SDIO devices.
> 
> Tested-on: QCA9984 PCI 10.4-3.6-00104
> Tested-on: QCA9882 PCI 10.2.4-1.0-00047
> 
> Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

67b927f98208 ath10k: fix retry packets update in station dump

-- 
https://patchwork.kernel.org/patch/11599289/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
