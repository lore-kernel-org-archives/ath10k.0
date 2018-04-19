Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f9CKF-0007vq-EB
 for ath10k@lists.infradead.org; Thu, 19 Apr 2018 16:22:28 +0000
MIME-Version: 1.0
Subject: Re: ath10k: Fix fw path name for WCN3990 target
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1523852805-14292-1-git-send-email-govinds@codeaurora.org>
References: <1523852805-14292-1-git-send-email-govinds@codeaurora.org>
Message-Id: <20180419162212.A9AF360500@smtp.codeaurora.org>
Date: Thu, 19 Apr 2018 16:22:12 +0000 (UTC)
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

> FW path is mapped incorrectly for the WCN3990
> hw version. Fix fw path with correct hw1.0 name.
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

6da2b2d46ff9 ath10k: fix fw path name for WCN3990 target

-- 
https://patchwork.kernel.org/patch/10342185/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
