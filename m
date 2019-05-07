Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hO0Ic-0004MX-NL
 for ath10k@lists.infradead.org; Tue, 07 May 2019 13:38:28 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ath10k: Extended the HTT stats support to retrieve
 Mu-MIMO related stats
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1551266682-32073-1-git-send-email-mkenna@codeaurora.org>
References: <1551266682-32073-1-git-send-email-mkenna@codeaurora.org>
Message-Id: <20190507133825.0527260A42@smtp.codeaurora.org>
Date: Tue,  7 May 2019 13:38:24 +0000 (UTC)
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
To: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Cc: vikpatel@codeaurora.org, arnagara@codeaurora.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Maharaja Kennadyrajan <mkenna@codeaurora.org> wrote:

> Extended the bit mask value of the HTT stats to get the Mu-MIMO
> related stats via tracing.
> 
> Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

2 patches applied to ath-next branch of ath.git, thanks.

14bf9217d66d ath10k: Extended the HTT stats support to retrieve Mu-MIMO related stats
473a4084e19e ath10k: Added support to reset HTT stats in debugfs

-- 
https://patchwork.kernel.org/patch/10831589/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
