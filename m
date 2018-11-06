Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gK3mB-0008Gt-Tl
 for ath10k@lists.infradead.org; Tue, 06 Nov 2018 16:00:25 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: add amsdu support for monitor mode
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1540794104-30957-2-git-send-email-yyuwang@codeaurora.org>
References: <1540794104-30957-2-git-send-email-yyuwang@codeaurora.org>
Message-Id: <20181106160009.E98C260741@smtp.codeaurora.org>
Date: Tue,  6 Nov 2018 16:00:09 +0000 (UTC)
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
To: Yu Wang <yyuwang@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Yu Wang <yyuwang@codeaurora.org> wrote:

> When processing HTT_T2H_MSG_TYPE_RX_IN_ORD_PADDR_IND, if the length of a msdu
> is larger than the tailroom of the rx skb, skb_over_panic issue will happen
> when calling skb_put.  In monitor mode, amsdu will be handled in this path, and
> msdu_len of the first msdu_desc is the length of the entire amsdu, which might
> be larger than the maximum length of a skb, in such case, it will hit the issue
> upon.
> 
> To fix this issue, process msdu list separately for monitor mode.
> 
> Successfully tested with:
> QCA6174 (FW version: RM.4.4.1.c2-00057-QCARMSWP-1).
> 
> Signed-off-by: Yu Wang <yyuwang@codeaurora.org>
> [kvalo@codeaurora.org: cosmetic cleanup]
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

I did some cosmetic changes (commit log, line wraps, declaring variables
beginning of the function), please check:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=8f5579342f10719341ae11307ce56c6235cfd484

-- 
https://patchwork.kernel.org/patch/10658777/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
