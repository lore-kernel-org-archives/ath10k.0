Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fxwkx-0006Y5-VI
 for ath10k@lists.infradead.org; Thu, 06 Sep 2018 16:03:45 +0000
MIME-Version: 1.0
Subject: Re: [PATCHv2 1/4] ath10k: get the legacy rate index to update the
 txrate table
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1536043516-12462-2-git-send-email-akolli@codeaurora.org>
References: <1536043516-12462-2-git-send-email-akolli@codeaurora.org>
Message-Id: <20180906160333.9D7FC605A4@smtp.codeaurora.org>
Date: Thu,  6 Sep 2018 16:03:33 +0000 (UTC)
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
To: akolli@codeaurora.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

akolli@codeaurora.org wrote:

> Get the legacy rate index to update the pkts/bytes counter
> against each possible tx rate.
> 
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

4 patches applied to ath-next branch of ath.git, thanks.

0189dbd71cbd ath10k: get the legacy rate index to update the txrate table
348cd95c8196 ath10k: add debugfs entry to enable extended tx stats
a904417fc876 ath10k: add extended per sta tx statistics support
85dd28eb9917 ath10k: add debugfs support to dump per sta tx stats

-- 
https://patchwork.kernel.org/patch/10586755/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
