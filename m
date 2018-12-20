Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ga1lm-0003WD-Df
 for ath10k@lists.infradead.org; Thu, 20 Dec 2018 17:06:00 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: fix a NULL vs IS_ERR() check
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20181126081143.tvu55aimdc3safcq@kili.mountain>
References: <20181126081143.tvu55aimdc3safcq@kili.mountain>
Message-Id: <20181220170543.2DC646076A@smtp.codeaurora.org>
Date: Thu, 20 Dec 2018 17:05:43 +0000 (UTC)
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
Cc: kernel-janitors@vger.kernel.org, Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The devm_memremap() function doesn't return NULLs, it returns error
> pointers.
> 
> Fixes: ba94c753ccb4 ("ath10k: add QMI message handshake for wcn3990 client")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

c28dcbce0592 ath10k: fix a NULL vs IS_ERR() check

-- 
https://patchwork.kernel.org/patch/10697755/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
