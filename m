Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gBNhD-0001E3-7H
 for ath10k@lists.infradead.org; Sat, 13 Oct 2018 17:27:24 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: htt: remove some dead code
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20181011080920.GA15131@mwanda>
References: <20181011080920.GA15131@mwanda>
Message-Id: <20181013172712.DB10E60C55@smtp.codeaurora.org>
Date: Sat, 13 Oct 2018 17:27:12 +0000 (UTC)
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
Cc: kernel-janitors@vger.kernel.org, Anilkumar Kolli <akolli@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> We added an unnecessary condition here in commit a904417fc876 ("ath10k:
> add extended per sta tx statistics support").  "legacy_rate_idx" is a u8
> so it can't be negative.  The caller doesn't pass negatives either.  I
> have deleted this code.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

e3bfecd5cd37 ath10k: htt: remove some dead code

-- 
https://patchwork.kernel.org/patch/10636255/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
