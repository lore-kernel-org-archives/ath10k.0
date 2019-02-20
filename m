Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwNJ6-0007sb-KM
 for ath10k@lists.infradead.org; Wed, 20 Feb 2019 08:32:46 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: change 'unsigned long int' to 'unsigned long'
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1550578303-15962-1-git-send-email-kvalo@codeaurora.org>
References: <1550578303-15962-1-git-send-email-kvalo@codeaurora.org>
Message-Id: <20190220083242.0EEDE60388@smtp.codeaurora.org>
Date: Wed, 20 Feb 2019 08:32:41 +0000 (UTC)
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Kalle Valo <kvalo@codeaurora.org> wrote:

> Fixes checkpatch warnings:
> 
> Prefer 'unsigned long' over 'unsigned long int' as the int is unnecessary
> 
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

28bbe2374041 ath10k: change 'unsigned long int' to 'unsigned long'

-- 
https://patchwork.kernel.org/patch/10819777/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
