Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7Cdu-0006nE-PU
 for ath10k@lists.infradead.org; Tue, 02 Oct 2018 04:50:44 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: add missing sanity check on diag download
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20180921204241.34316-1-briannorris@chromium.org>
References: <20180921204241.34316-1-briannorris@chromium.org>
Message-Id: <20181002045032.2D42D60C1B@smtp.codeaurora.org>
Date: Tue,  2 Oct 2018 04:50:32 +0000 (UTC)
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
Cc: Carl Huang <cjhuang@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Brian Norris <briannorris@chromium.org> wrote:

> ath10k_hw_diag_fast_download() generally has good boundary checking, but
> it misses verifying that the next metadata header actually fits in the
> remaining buffer space. Add such a check.
> 
> Fixes: 39501ea64116 ("ath10k: download firmware via diag Copy Engine for QCA6174 and QCA9377.")
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

e720ba1dcc33 ath10k: add missing sanity check on diag download

-- 
https://patchwork.kernel.org/patch/10610975/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
