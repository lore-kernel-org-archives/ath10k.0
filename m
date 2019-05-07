Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hO0NJ-00067Z-Bz
 for ath10k@lists.infradead.org; Tue, 07 May 2019 13:43:18 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Fix the tx stats bytes & packets parsing
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1552365219-16842-1-git-send-email-yanghuan@codeaurora.org>
References: <1552365219-16842-1-git-send-email-yanghuan@codeaurora.org>
Message-Id: <20190507134317.152F060CEC@smtp.codeaurora.org>
Date: Tue,  7 May 2019 13:43:17 +0000 (UTC)
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
To: Brandon Huang <yanghuan@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Brandon Huang <yanghuan@codeaurora.org> wrote:

> In tx_stats debugfs, txrate->flags may contain multiple bits. For
> example, RATE_INFO_FLAGS_SHORT_GI could be set, and tx stats bytes
> and packets will be not updated correctly.
> 
> Fix this issue by using bit operation to check txrate->flags.
> 
> Tested HW: QCA9984
> Tested Firmware: 10.4-3.9.0.1-00007
> 
> Signed-off-by: Brandon Huang <yanghuan@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

9e0b341a3d66 ath10k: Fix the tx stats bytes & packets parsing

-- 
https://patchwork.kernel.org/patch/10848577/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
