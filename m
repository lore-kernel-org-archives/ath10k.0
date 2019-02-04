Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqgXq-0002kU-65
 for ath10k@lists.infradead.org; Mon, 04 Feb 2019 15:52:27 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Add support for extended HTT aggr msg support
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20190116112942.11687-1-govinds@codeaurora.org>
References: <20190116112942.11687-1-govinds@codeaurora.org>
Message-Id: <20190204155225.B61EF607F5@smtp.codeaurora.org>
Date: Mon,  4 Feb 2019 15:52:25 +0000 (UTC)
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
To: Govind Singh <govinds@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Govind Singh <govinds@codeaurora.org> wrote:

> HTT aggr message parameter in HL2.0 fw are different in comparison
> to legacy fw version. Fill correct HTT aggr msg parameter for
> targets using HL2.0 firmware.
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

5cbb11747750 ath10k: Add support for extended HTT aggr msg support

-- 
https://patchwork.kernel.org/patch/10765773/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
