Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g6yee-0003aO-0U
 for ath10k@lists.infradead.org; Mon, 01 Oct 2018 13:54:33 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: utilize random MAC address if none is provided
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20180907172157.203785-1-briannorris@chromium.org>
References: <20180907172157.203785-1-briannorris@chromium.org>
Message-Id: <20181001135418.4042860AD8@smtp.codeaurora.org>
Date: Mon,  1 Oct 2018 13:54:18 +0000 (UTC)
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

> Since commit 9d5804662ce1 ("ath10k: retrieve MAC address from system
> firmware if provided"), we support pulling our MAC address from system
> firmware. Along with this, we should admit that it's possible for system
> firmware to be screwed up as well, omitting the MAC address there.
> 
> Provide a fallback, such that we choose a randomly-generated MAC
> address, with the local assignment bit set.
> 
> This is not a preferred mode of operation and really should only serve
> the purpose of keeping the system chugging along while someone figures
> out what's wrong with the system. Grepping through other wireless
> drivers shows very similar fallback logic though, so why not?
> 
>   git grep eth_random_addr drivers/net/wireless/
> 
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

234e4307cf7f ath10k: utilize random MAC address if none is provided

-- 
https://patchwork.kernel.org/patch/10592411/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
