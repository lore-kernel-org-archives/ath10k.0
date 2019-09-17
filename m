Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAEAc-0002qI-9J
 for ath10k@lists.infradead.org; Tue, 17 Sep 2019 14:09:31 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Use ARRAY_SIZE
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20190718203032.15528-1-gomonovych@gmail.com>
References: <20190718203032.15528-1-gomonovych@gmail.com>
Message-Id: <20190917140930.0150B611BE@smtp.codeaurora.org>
Date: Tue, 17 Sep 2019 14:09:29 +0000 (UTC)
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
To: Vasyl Gomonovych <gomonovych@gmail.com>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, davem@davemloft.net

Vasyl Gomonovych <gomonovych@gmail.com> wrote:

> fix coccinelle warning, use ARRAY_SIZE
> 
> Signed-off-by: Vasyl Gomonovych <gomonovych@gmail.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

7921ae091907 ath10k: Use ARRAY_SIZE

-- 
https://patchwork.kernel.org/patch/11049553/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
