Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iHrda-0000qW-QZ
 for ath10k@lists.infradead.org; Tue, 08 Oct 2019 15:43:02 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Fix an && vs || typo
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191007085003.GB3865@mwanda>
References: <20191007085003.GB3865@mwanda>
Message-Id: <20191008154256.1E36B60ACF@smtp.codeaurora.org>
Date: Tue,  8 Oct 2019 15:42:55 +0000 (UTC)
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

> The kernel will Oops later in the function if either of these pointers
> is NULL so clearly || was intended instead of &&.
> 
> Fixes: 3f14b73c3843 ("ath10k: Enable MSA region dump support for WCN3990")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Sorry, Colin was faster :)

https://patchwork.kernel.org/patch/11174955/

Patch set to Rejected.

-- 
https://patchwork.kernel.org/patch/11176991/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
