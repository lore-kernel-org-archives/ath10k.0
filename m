Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hO0iw-00010j-QP
 for ath10k@lists.infradead.org; Tue, 07 May 2019 14:05:43 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath10k: fix different tx duration output
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1555489045-18070-1-git-send-email-leiwa@codeaurora.org>
References: <1555489045-18070-1-git-send-email-leiwa@codeaurora.org>
Message-Id: <20190507140538.7B155609CD@smtp.codeaurora.org>
Date: Tue,  7 May 2019 14:05:38 +0000 (UTC)
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
To: Lei Wang <leiwa@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Lei Wang <leiwa@codeaurora.org> wrote:

> TX duration output of tx_stats in debugfs and station dump had big
> difference because they got tx duration value from different statistic
> data. We should use the same statistic data.
> 
> Tested: QCA988X with firmware ver 10.2.4-1.0-00043
> 
> Signed-off-by: Lei Wang <leiwa@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Dropping per discussion, please resend once everything is clarified.

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/patch/10904909/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
