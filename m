Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ga1n1-0003hg-97
 for ath10k@lists.infradead.org; Thu, 20 Dec 2018 17:07:16 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: remove an unnecessary NULL check
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20181129142406.GV3073@unbuntlaptop>
References: <20181129142406.GV3073@unbuntlaptop>
Message-Id: <20181220170704.EA17D60734@smtp.codeaurora.org>
Date: Thu, 20 Dec 2018 17:07:04 +0000 (UTC)
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
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, Rakesh Pillai <pillair@codeaurora.org>, ath10k@lists.infradead.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The "survey" pointer is the address of an array element.  We know that
> it can't be NULL so this check can be removed.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

27120f2ac995 ath10k: remove an unnecessary NULL check

-- 
https://patchwork.kernel.org/patch/10704625/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
