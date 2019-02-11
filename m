Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtEYP-00044e-7s
 for ath10k@lists.infradead.org; Mon, 11 Feb 2019 16:35:34 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Fix shadow register implementation for WCN3990
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1548755647-23356-1-git-send-email-pillair@codeaurora.org>
References: <1548755647-23356-1-git-send-email-pillair@codeaurora.org>
Message-Id: <20190211163532.B76AC60A4E@smtp.codeaurora.org>
Date: Mon, 11 Feb 2019 16:35:32 +0000 (UTC)
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
To: Rakesh Pillai <pillair@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Rakesh Pillai <pillair@codeaurora.org> wrote:

> WCN3990 supports shadow registers write operation support
> for copy engine for regular operation in powersave mode.
> 
> Since WCN3990 is a 64-bit target, the shadow register
> implementation needs to be done in the copy engine handlers
> for 64-bit target. Currently the shadow register implementation
> is present in the 32-bit target handlers of copy engine.
> 
> Fix the shadow register copy engine write operation
> implementation for 64-bit target(WCN3990).
> 
> Tested HW: WCN3990
> Tested FW: WLAN.HL.2.0-01188-QCAHLSWMTPLZ-1
> 
> Fixes: b7ba83f7c414 ("ath10k: add support for shadow register for WNC3990")
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

1863008369ae ath10k: fix shadow register implementation for WCN3990

-- 
https://patchwork.kernel.org/patch/10785903/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
