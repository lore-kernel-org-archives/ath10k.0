Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fHQnN-0001Ks-Kw
 for ath10k@lists.infradead.org; Sat, 12 May 2018 09:26:31 +0000
MIME-Version: 1.0
Subject: Re: [v2] ath10k: Replace bit shifts with the BIT() macro for rx desc
 bits
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20180509093321.15269-1-govinds@codeaurora.org>
References: <20180509093321.15269-1-govinds@codeaurora.org>
Message-Id: <20180512092619.01F9F607E1@smtp.codeaurora.org>
Date: Sat, 12 May 2018 09:26:18 +0000 (UTC)
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

> Use the BIT() macro from 'linux/bitops.h' to define the rx desc
> bit flags to have consistency with new definitions.
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

c3f7f31efe39 ath10k: replace bit shifts with the BIT() macro for rx desc bits

-- 
https://patchwork.kernel.org/patch/10388887/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
