Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ejQPa-0007Xi-9p
 for ath10k@lists.infradead.org; Wed, 07 Feb 2018 14:09:23 +0000
MIME-Version: 1.0
Subject: Re: ath10k: correct the length of DRAM dump for QCA6174 hw3.x/QCA9377
 hw1.1
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1516945221-4710-2-git-send-email-yyuwang@codeaurora.org>
References: <1516945221-4710-2-git-send-email-yyuwang@codeaurora.org>
Message-Id: <20180207140911.6CB9760767@smtp.codeaurora.org>
Date: Wed,  7 Feb 2018 14:09:11 +0000 (UTC)
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

> The length of DRAM dump for QCA6174 hw3.0/hw3.2 and QCA9377 hw1.1
> are less than the actual value, some coredump contents are missed.
> To fix it, change the length from 0x90000 to 0xa8000.
> 
> Fixes: 703f261dd77f ("ath10k: add memory dump support for QCA6174/QCA9377")
> Signed-off-by: Yu Wang <yyuwang@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-current branch of ath.git, thanks.

0a7fe718239e ath10k: correct the length of DRAM dump for QCA6174 hw3.x/QCA9377 hw1.1

-- 
https://patchwork.kernel.org/patch/10185101/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
