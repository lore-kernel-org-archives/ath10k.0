Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fTTu9-0005ys-QA
 for ath10k@lists.infradead.org; Thu, 14 Jun 2018 15:11:19 +0000
MIME-Version: 1.0
Subject: Re: [net-next] ath10k: make some functions static
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1527733994-149212-1-git-send-email-weiyongjun1@huawei.com>
References: <1527733994-149212-1-git-send-email-weiyongjun1@huawei.com>
Message-Id: <20180614151107.7DA24606DB@smtp.codeaurora.org>
Date: Thu, 14 Jun 2018 15:11:07 +0000 (UTC)
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
To: "weiyongjun (A)" <weiyongjun1@huawei.com>
Cc: Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, ath10k@lists.infradead.org, Kalle Valo <kvalo@qca.qualcomm.com>

"weiyongjun \(A\)" <weiyongjun1@huawei.com> wrote:

> Fixes the following sparse warnings:
> 
> drivers/net/wireless/ath/ath10k/snoc.c:823:5: warning:
>  symbol 'ath10k_snoc_get_ce_id_from_irq' was not declared. Should it be static?
> drivers/net/wireless/ath/ath10k/snoc.c:871:6: warning:
>  symbol 'ath10k_snoc_init_napi' was not declared. Should it be static?
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

6ee0e175a33d ath10k: make some functions static

-- 
https://patchwork.kernel.org/patch/10440159/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
