Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grl3e-00040E-Ey
 for ath10k@lists.infradead.org; Thu, 07 Feb 2019 14:53:43 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: sdio: add .owner field
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20190129231448.83305-1-briannorris@chromium.org>
References: <20190129231448.83305-1-briannorris@chromium.org>
Message-Id: <20190207145341.E5BCF6047C@smtp.codeaurora.org>
Date: Thu,  7 Feb 2019 14:53:41 +0000 (UTC)
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
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Wen Gong <wgong@codeaurora.org>

Brian Norris <briannorris@chromium.org> wrote:

> sdio_register_driver() doesn't do this for us, unlike (for example)
> platform_driver_register(). This is important for helping track
> module-to-device relationships.
> 
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

ea6959840814 ath10k: sdio: add .owner field

-- 
https://patchwork.kernel.org/patch/10787307/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
