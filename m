Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ebSJu-0001rW-E4
 for ath10k@lists.infradead.org; Tue, 16 Jan 2018 14:34:36 +0000
MIME-Version: 1.0
Subject: Re: ath10k: remove redundant -ve check against u32 integer size
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20180112172713.28252-1-colin.king@canonical.com>
References: <20180112172713.28252-1-colin.king@canonical.com>
Message-Id: <20180116143424.149C66083C@smtp.codeaurora.org>
Date: Tue, 16 Jan 2018 14:34:24 +0000 (UTC)
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
To: Colin Ian King <colin.king@canonical.com>
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Kalle Valo <kvalo@qca.qualcomm.com>

Colin Ian King <colin.king@canonical.com> wrote:

> Variable section_table.size is a u32 and so cannot be less than
> zero, hence the less than zero check is redundant and can be
> removed.
> 
> Detected by CoverityScan, CID#1463855 ("Unsigned compared against 0")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

95f27a51ee02 ath10k: remove redundant -ve check against u32 integer size

-- 
https://patchwork.kernel.org/patch/10161483/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
