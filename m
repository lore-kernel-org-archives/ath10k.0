Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiXfn-0006Mt-Ep
 for ath10k@lists.infradead.org; Tue, 09 Jun 2020 06:23:49 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Acquire tx_lock in tx error paths
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200604105901.1.I5b8b0c7ee0d3e51a73248975a9da61401b8f3900@changeid>
References: <20200604105901.1.I5b8b0c7ee0d3e51a73248975a9da61401b8f3900@changeid>
Message-Id: <20200609062336.3D4BAC4339C@smtp.codeaurora.org>
Date: Tue,  9 Jun 2020 06:23:36 +0000 (UTC)
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
To: Evan Green <evgreen@chromium.org>
Cc: Govind Singh <govinds@qti.qualcomm.com>, kuabhs@google.com.org, sujitka@chromium.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Michal Kazior <michal.kazior@tieto.com>, Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>

Evan Green <evgreen@chromium.org> wrote:

> ath10k_htt_tx_free_msdu_id() has a lockdep assertion that htt->tx_lock
> is held. Acquire the lock in a couple of error paths when calling that
> function to ensure this condition is met.
> 
> Fixes: 6421969f248fd ("ath10k: refactor tx pending management")
> Fixes: e62ee5c381c59 ("ath10k: Add support for htt_data_tx_desc_64 descriptor")
> Signed-off-by: Evan Green <evgreen@chromium.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

a738e766e3ed ath10k: Acquire tx_lock in tx error paths

-- 
https://patchwork.kernel.org/patch/11588229/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
