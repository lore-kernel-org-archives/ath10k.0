Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCJc0-0002TH-Vu
 for ath10k@lists.infradead.org; Mon, 23 Sep 2019 08:22:26 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ath10k: Fix rate table updation in tx stats
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1552319602-17795-2-git-send-email-pillair@codeaurora.org>
References: <1552319602-17795-2-git-send-email-pillair@codeaurora.org>
Message-Id: <20190923082224.A3404614C3@smtp.codeaurora.org>
Date: Mon, 23 Sep 2019 08:22:24 +0000 (UTC)
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

> The index for updating rate table, which is displayed
> in the tx stats via debugfs, is calculated using the
> bandwidth value. The bandwidth values do not map
> correctly with the bandwidth values shown in the rate table.
> 
> Correct the bandwidth value calculation which is used
> to calculate the index for rate table updation for tx stats.
> 
> Tested HW: WCN3990
> Tested FW: WLAN.HL.3.1-00784-QCAHLSWMTPLZ-1
> 
> Fixes: e88975ca37d1 ("ath10k: dump tx stats in rate table format")
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

I requested Surabhi to include these patches into his patchset, due to the dependency.

https://patchwork.kernel.org/project/linux-wireless/list/?series=85455&state=*&order=date

2 patches set to Changes Requested.

10847733 [1/2] ath10k: Fix rate table updation in tx stats
10847737 [2/2] ath10k: Fix NSS tx stats for legacy rates

-- 
https://patchwork.kernel.org/patch/10847733/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
