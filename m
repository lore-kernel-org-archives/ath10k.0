Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ebSL4-0003US-AV
 for ath10k@lists.infradead.org; Tue, 16 Jan 2018 14:35:47 +0000
MIME-Version: 1.0
Subject: Re: ath10k: fix recently introduced checkpatch warnings
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <151610005703.17030.17977783056615638055.stgit@potku.adurom.net>
References: <151610005703.17030.17977783056615638055.stgit@potku.adurom.net>
Message-Id: <20180116143535.F03BD601D4@smtp.codeaurora.org>
Date: Tue, 16 Jan 2018 14:35:35 +0000 (UTC)
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

> Checkpatch found these issues:
> 
> drivers/net/wireless/ath/ath10k/ce.h:324: Please use a blank line after function/struct/union/enum declarations
> drivers/net/wireless/ath/ath10k/core.c:1321: Please don't use multiple blank lines
> drivers/net/wireless/ath/ath10k/htt.h:1859: Please use a blank line after function/struct/union/enum declarations
> 
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

a3e712b74b5f ath10k: fix recently introduced checkpatch warnings

-- 
https://patchwork.kernel.org/patch/10166449/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
