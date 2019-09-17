Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAE9h-0002aj-4i
 for ath10k@lists.infradead.org; Tue, 17 Sep 2019 14:08:34 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v3] ath10k: avoid leaving .bss_info_changed prematurely
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20190703141949.9295-1-sven@narfation.org>
References: <20190703141949.9295-1-sven@narfation.org>
Message-Id: <20190917140832.C7A7460790@smtp.codeaurora.org>
Date: Tue, 17 Sep 2019 14:08:32 +0000 (UTC)
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
To: Sven Eckelmann <sven@narfation.org>
Cc: linux-wireless@vger.kernel.org, Sven Eckelmann <seckelmann@datto.com>, ath10k@lists.infradead.org, Sriram R <srirrama@codeaurora.org>

Sven Eckelmann <sven@narfation.org> wrote:

> ath10k_bss_info_changed() handles various events from the upper layers. It
> parses the changed bitfield and then configures the driver/firmware
> accordingly. Each detected event is handled in a separate scope which is
> independent of each other - but in the same function.
> 
> The commit f279294e9ee2 ("ath10k: add support for configuring management
> packet rate") changed this behavior by returning from this function
> prematurely when some precondition was not fulfilled. All new event
> handlers added after the BSS_CHANGED_BASIC_RATES event handler would then
> also be skipped.
> 
> Signed-off-by: Sven Eckelmann <seckelmann@datto.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

0227ff3656f2 ath10k: avoid leaving .bss_info_changed prematurely

-- 
https://patchwork.kernel.org/patch/11029683/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
