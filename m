Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzHLG-000384-1B
 for ath10k@lists.infradead.org; Thu, 28 Feb 2019 08:46:59 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/4] ath10k: Fix the incorrect updation of NSS data in
 tx stats
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1551173278-20926-2-git-send-email-svishnoi@codeaurora.org>
References: <1551173278-20926-2-git-send-email-svishnoi@codeaurora.org>
Message-Id: <20190228084657.B750960E7A@smtp.codeaurora.org>
Date: Thu, 28 Feb 2019 08:46:57 +0000 (UTC)
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
To: Surabhi Vishnoi <svishnoi@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Surabhi Vishnoi <svishnoi@codeaurora.org> wrote:

> The NSS data is updated incorrectly in the tx stats as the array
> indexing starts from zero.
> 
> Fix the incorrect updation of NSS data in tx_stats by taking into
> consideration the array index starting from zero.
> 
> Tested HW: WCN3990
> Tested FW: WLAN.HL.3.1-00784-QCAHLSWMTPLZ-1
> 
> Fixes: a904417fc876 ("ath10k: add extended per sta tx statistics support")
> Signed-off-by: Surabhi Vishnoi <svishnoi@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

4 patches applied to ath-next branch of ath.git, thanks.

3a08ac3e79e8 ath10k: Fix the incorrect updation of NSS data in tx stats
ef9051c72ab7 ath10k: Fix the wrong updation of BW in tx_stats debugfs entry
8e55fdaa8ea7 ath10k: Fix the wrong updation of SGI in tx_stats debugfs
d23c2cdaa013 ath10k: Fix the wrong calculation ht_idx and idx of rate table for tx_stats

-- 
https://patchwork.kernel.org/patch/10829765/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
