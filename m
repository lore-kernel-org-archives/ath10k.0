Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f9Bxx-000689-5y
 for ath10k@lists.infradead.org; Thu, 19 Apr 2018 15:59:22 +0000
MIME-Version: 1.0
Subject: Re: ath10k: correct target assert problem due to CE5 stuck
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1523535410-29333-1-git-send-email-mpubbise@codeaurora.org>
References: <1523535410-29333-1-git-send-email-mpubbise@codeaurora.org>
Message-Id: <20180419155910.B3C4F60117@smtp.codeaurora.org>
Date: Thu, 19 Apr 2018 15:59:10 +0000 (UTC)
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
To: mpubbise@codeaurora.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

mpubbise@codeaurora.org wrote:

> Correct a minor bug in the commit 0628467f97b5 ("ath10k: fix
> copy engine 5 destination ring stuck") which introduced a change to fix
> firmware assert that happens when ring indices of copy engine 5 are stuck
> for a specific duration, problem with this fix is that it did not use
> ring arithmatic. As a result,firmware asserts did not go away entirely
> athough the frequency of occurrence has reduced. Using ring arithmatic
> to fix the issue.
> 
> Tested on QCA9984(fw version-10.4-3.4-00082).
> 
> Fixes: 0628467f97b5 ("ath10k: fix copy engine 5 destination ring stuck)
> Signed-off-by: Manikanta Pubbisetty <mpubbise@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

1e8f77502341 ath10k: correct target assert problem due to CE5 stuck

-- 
https://patchwork.kernel.org/patch/10338443/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
