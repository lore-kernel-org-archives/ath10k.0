Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1WPe-0002KK-Cm
 for ath10k@lists.infradead.org; Tue, 11 Feb 2020 14:21:21 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: fix few checkpatch warnings
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1581411578-26388-1-git-send-email-kvalo@codeaurora.org>
References: <1581411578-26388-1-git-send-email-kvalo@codeaurora.org>
Message-Id: <20200211142115.DE157C4479D@smtp.codeaurora.org>
Date: Tue, 11 Feb 2020 14:21:15 +0000 (UTC)
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

> Fix warnings which were recently introduced:
> 
> drivers/net/wireless/ath/ath10k/ahb.c:462: Alignment should match open parenthesis
> drivers/net/wireless/ath/ath10k/ahb.c:470: Alignment should match open parenthesis
> drivers/net/wireless/ath/ath10k/sdio.c:697: space prohibited before that close parenthesis ')'
> 
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

9a5fccc1e807 ath10k: fix few checkpatch warnings

-- 
https://patchwork.kernel.org/patch/11375089/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
