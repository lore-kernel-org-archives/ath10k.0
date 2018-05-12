Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fHQkM-0007gc-Cr
 for ath10k@lists.infradead.org; Sat, 12 May 2018 09:23:23 +0000
MIME-Version: 1.0
Subject: Re: [v2] ath10k: remove variables which set but not used
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20180507093948.GA7905@blackstone>
References: <20180507093948.GA7905@blackstone>
Message-Id: <20180512092311.A8ABD60618@smtp.codeaurora.org>
Date: Sat, 12 May 2018 09:23:11 +0000 (UTC)
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
To: Kenneth Lu <kuohsianglu@gmail.com>
Cc: kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Kenneth Lu <kuohsianglu@gmail.com> wrote:

> Variable buf_len and num_vdev_stats are being assigned but never read.
> These are redundant and can be remove.
> 
> Signed-off-by: Kenneth Lu <kuohsianglu@gmail.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

3e2740cda224 ath10k: remove variables which set but not used

-- 
https://patchwork.kernel.org/patch/10383773/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
