Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fkPIf-0000x4-P0
 for ath10k@lists.infradead.org; Tue, 31 Jul 2018 07:42:35 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: fix parenthesis alignment
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <153297700266.4874.12439168003972242663.stgit@potku.adurom.net>
References: <153297700266.4874.12439168003972242663.stgit@potku.adurom.net>
Message-Id: <20180731074223.37DBE6071C@smtp.codeaurora.org>
Date: Tue, 31 Jul 2018 07:42:23 +0000 (UTC)
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Kalle Valo <kvalo@codeaurora.org> wrote:

> These were recently introduced and found by checkpatch:
> 
> drivers/net/wireless/ath/ath10k/mac.c:6118: Alignment should match open parenthesis
> drivers/net/wireless/ath/ath10k/mac.c:6121: Alignment should match open parenthesis
> drivers/net/wireless/ath/ath10k/mac.c:6124: Alignment should match open parenthesis
> 
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

ebfac1d0c166 ath10k: fix parenthesis alignment

-- 
https://patchwork.kernel.org/patch/10549583/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
