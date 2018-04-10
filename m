Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f5uIq-0006b8-TY
 for ath10k@lists.infradead.org; Tue, 10 Apr 2018 14:31:24 +0000
MIME-Version: 1.0
Subject: Re: ath10k: sdio: fix memory leak for probe allocations
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20180327203144.8998-1-marcus.folkesson@gmail.com>
References: <20180327203144.8998-1-marcus.folkesson@gmail.com>
Message-Id: <20180410143110.882DF60AE0@smtp.codeaurora.org>
Date: Tue, 10 Apr 2018 14:31:10 +0000 (UTC)
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
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Marcus Folkesson <marcus.folkesson@gmail.com> wrote:

> These allocations are not freed upon release.
> When on it; go for managed resources instead.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> [kvalo: fix two checkpatch warnings]
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

ec2c64e20257 ath10k: sdio: fix memory leak for probe allocations

-- 
https://patchwork.kernel.org/patch/10311597/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
