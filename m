Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kavLx-0007Ew-2g
 for ath10k@lists.infradead.org; Fri, 06 Nov 2020 06:36:09 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath10k: sdio: remove redundant check in for loop
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200916165748.20927-1-alex.dewar90@gmail.com>
References: <20200916165748.20927-1-alex.dewar90@gmail.com>
Message-Id: <20201106063600.81C19C433F0@smtp.codeaurora.org>
Date: Fri,  6 Nov 2020 06:36:00 +0000 (UTC)
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
To: Alex Dewar <alex.dewar90@gmail.com>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Saeed Mahameed <saeedm@nvidia.com>

Alex Dewar <alex.dewar90@gmail.com> wrote:

> The for loop checks whether cur_section is NULL on every iteration, but
> we know it can never be NULL as there is another check towards the
> bottom of the loop body. Refactor to avoid this unnecessary check.
> 
> Also, increment the variable i inline for clarity
> 
> Addresses-Coverity: 1496984 ("Null pointer dereferences)
> Suggested-by: Saeed Mahameed <saeedm@nvidia.com>
> Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

dbeb101d28eb ath10k: sdio: remove redundant check in for loop

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20200916165748.20927-1-alex.dewar90@gmail.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
