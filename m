Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fTTxB-0006ua-Sp
 for ath10k@lists.infradead.org; Thu, 14 Jun 2018 15:14:27 +0000
MIME-Version: 1.0
Subject: Re: ath10k: snoc: use module_platform_driver() macro
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20180611193540.190255-1-briannorris@chromium.org>
References: <20180611193540.190255-1-briannorris@chromium.org>
Message-Id: <20180614151415.9374C60795@smtp.codeaurora.org>
Date: Thu, 14 Jun 2018 15:14:15 +0000 (UTC)
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
To: Brian Norris <briannorris@chromium.org>
Cc: Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Kalle Valo <kvalo@qca.qualcomm.com>

Brian Norris <briannorris@chromium.org> wrote:

> ath10k_snoc_init()/ath10k_snoc_exit() don't add much value;
> module_platform_driver() can remove the boilerplate.
> 
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

0644fef97451 ath10k: snoc: use module_platform_driver() macro

-- 
https://patchwork.kernel.org/patch/10458705/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
