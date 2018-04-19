Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f9BqN-00033o-Sw
 for ath10k@lists.infradead.org; Thu, 19 Apr 2018 15:51:34 +0000
MIME-Version: 1.0
Subject: Re: ath10k: build ce layer in ath10k core module
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1521615247-3715-1-git-send-email-govinds@codeaurora.org>
References: <1521615247-3715-1-git-send-email-govinds@codeaurora.org>
Message-Id: <20180419155121.0A67560F90@smtp.codeaurora.org>
Date: Thu, 19 Apr 2018 15:51:21 +0000 (UTC)
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
To: Govind Singh <govinds@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Govind Singh <govinds@codeaurora.org> wrote:

> CE layer is shared between pci and snoc target and results
> in duplicate object inclusion if both modules are compiled
> together statically and undefined KBUILD_MODNAME if
> compiled as module.
> 
> Fix this by building ce layer in ath10k core module by
> adding ce object inclusion with ATH10K_CE boolean CONFIG.
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

a0aedd6e0b57 ath10k: build ce layer in ath10k core module

-- 
https://patchwork.kernel.org/patch/10298657/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
