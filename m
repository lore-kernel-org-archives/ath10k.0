Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fkCS0-0001e7-8Q
 for ath10k@lists.infradead.org; Mon, 30 Jul 2018 17:59:21 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: htt_tx: move lock into id_get function
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1531589900-29220-1-git-send-email-hofrat@osadl.org>
References: <1531589900-29220-1-git-send-email-hofrat@osadl.org>
Message-Id: <20180730175909.BF88360500@smtp.codeaurora.org>
Date: Mon, 30 Jul 2018 17:59:09 +0000 (UTC)
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
To: Nicholas Mc Guire <hofrat@osadl.org>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, "David S. Miller" <davem@davemloft.net>

Nicholas Mc Guire <hofrat@osadl.org> wrote:

> This is only code refactoring as all call sites of
> ath10k_htt_tx_alloc_msdu_id() take the same lock it can be moved into the
> id_get function and the assertion dropped.
> 
> Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

e82f57c8b970 ath10k: htt_tx: move lock into id_get function

-- 
https://patchwork.kernel.org/patch/10524837/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
