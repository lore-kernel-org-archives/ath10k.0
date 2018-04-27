Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fC1jx-0008Le-2B
 for ath10k@lists.infradead.org; Fri, 27 Apr 2018 11:40:49 +0000
MIME-Version: 1.0
Subject: Re: ath10k: sdio: jump to correct label in error handling path
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20180426123502.23962-1-niklas.cassel@linaro.org>
References: <20180426123502.23962-1-niklas.cassel@linaro.org>
Message-Id: <20180427114026.B3A46605FF@smtp.codeaurora.org>
Date: Fri, 27 Apr 2018 11:40:26 +0000 (UTC)
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
To: Niklas Cassel <niklas.cassel@linaro.org>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Kalle Valo <kvalo@qca.qualcomm.com>

Niklas Cassel <niklas.cassel@linaro.org> wrote:

> Jump to the correct label in error handling path.
> At this point of execution create_singlethread_workqueue() has succeeded,
> so it should be properly destroyed.
> 
> Jump label was renamed in commit ec2c64e20257 ("ath10k: sdio: fix memory
> leak for probe allocations").
> However, the bug was originally introduced in commit d96db25d2025
> ("ath10k: add initial SDIO support").
> 
> Fixes: d96db25d2025 ("ath10k: add initial SDIO support")
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

e60a92590187 ath10k: sdio: jump to correct label in error handling path

-- 
https://patchwork.kernel.org/patch/10365901/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
