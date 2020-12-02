Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a2.mail.mailgun.net ([198.61.254.61])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkWvG-0007G8-MY
 for ath10k@lists.infradead.org; Wed, 02 Dec 2020 18:32:15 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ath10k: Fix an error handling path
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20201122170342.1346011-1-christophe.jaillet@wanadoo.fr>
References: <20201122170342.1346011-1-christophe.jaillet@wanadoo.fr>
Message-Id: <20201202183211.C302BC433C6@smtp.codeaurora.org>
Date: Wed,  2 Dec 2020 18:32:11 +0000 (UTC)
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
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: kernel-janitors@vger.kernel.org, erik.stromdahl@gmail.com, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, kuba@kernel.org, davem@davemloft.net

Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> If 'ath10k_usb_create()' fails, we should release some resources and report
> an error instead of silently continuing.
> 
> Fixes: 4db66499df91 ("ath10k: add initial USB support")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

2 patches applied to ath-next branch of ath.git, thanks.

ed3573bc3943 ath10k: Fix an error handling path
6364e693f4a7 ath10k: Release some resources in an error handling path

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20201122170342.1346011-1-christophe.jaillet@wanadoo.fr/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
