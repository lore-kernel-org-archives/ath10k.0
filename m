Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gBNWi-0005mc-8p
 for ath10k@lists.infradead.org; Sat, 13 Oct 2018 17:16:33 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Fix possible out of bound access of ath10k_rates
 array
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1538536430-6555-1-git-send-email-srirrama@codeaurora.org>
References: <1538536430-6555-1-git-send-email-srirrama@codeaurora.org>
Message-Id: <20181013171621.D32AF6079B@smtp.codeaurora.org>
Date: Sat, 13 Oct 2018 17:16:21 +0000 (UTC)
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
To: Sriram R <srirrama@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Sriram R <srirrama@codeaurora.org> wrote:

> While using 'ath10k_mac_get_rate_hw_value()' to obtain the hw value
> from the passed bitrate, there is a chance of out of bound array access
> when wrong bitrate is passed. This is fixed by comparing the bitrates
> within the correct size of the ath10k_rates array.
> 
> Fixes commit f279294e9ee2 ("ath10k: add support for configuring management
> packet rate"). Also correction made to some indents used in the above commit.
> 
> Signed-off-by: Sriram R <srirrama@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

34e141eea7dd ath10k: fix possible out of bound access of ath10k_rates array

-- 
https://patchwork.kernel.org/patch/10624225/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
