Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSzsy-0003uh-5j
 for ath10k@lists.infradead.org; Fri, 08 Nov 2019 08:44:53 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: fix potential issue of peer stats allocation
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1572486133-23516-1-git-send-email-zhichen@codeaurora.org>
References: <1572486133-23516-1-git-send-email-zhichen@codeaurora.org>
Message-Id: <20191108084451.DB0846087D@smtp.codeaurora.org>
Date: Fri,  8 Nov 2019 08:44:51 +0000 (UTC)
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
To: Zhi Chen <zhichen@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Zhi Chen <zhichen@codeaurora.org> wrote:

> STA number was not restored if OOM happened.
> 
> Tested: QCA9984 with firmware ver 10.4-3.9.0.1-00018
> Signed-off-by: Zhi Chen <zhichen@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

402838a05def ath10k: fix potential issue of peer stats allocation

-- 
https://patchwork.kernel.org/patch/11220555/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
