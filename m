Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gpFeQ-0001gr-UZ
 for ath10k@lists.infradead.org; Thu, 31 Jan 2019 16:57:22 +0000
MIME-Version: 1.0
Subject: Re: [PATCH for-5.0] ath10k: correct bus type for WCN3990
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20190129231201.42230-1-briannorris@chromium.org>
References: <20190129231201.42230-1-briannorris@chromium.org>
Message-Id: <20190131165718.3D9F1608C5@smtp.codeaurora.org>
Date: Thu, 31 Jan 2019 16:57:18 +0000 (UTC)
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
Cc: Govind Singh <govinds@codeaurora.org>, Erik Stromdahl <erik.stromdahl@gmail.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Wen Gong <wgong@codeaurora.org>

Brian Norris <briannorris@chromium.org> wrote:

> WCN3990 is SNOC, not PCI. This prevents probing WCN3990.
> 
> Fixes: 367c899f622c ("ath10k: add bus type check in ath10k_init_hw_params")
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Patch applied to wireless-drivers.git, thanks.

2c2008a63e48 ath10k: correct bus type for WCN3990

-- 
https://patchwork.kernel.org/patch/10787301/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
