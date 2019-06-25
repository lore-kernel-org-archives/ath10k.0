Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfkrf-0002FN-31
 for ath10k@lists.infradead.org; Tue, 25 Jun 2019 12:48:00 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ath10k: add inline wrapper for htt_h2t_aggr_cfg_msg
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20190326162904.6737-1-erik.stromdahl@gmail.com>
References: <20190326162904.6737-1-erik.stromdahl@gmail.com>
Message-Id: <20190625124758.22A1960909@smtp.codeaurora.org>
Date: Tue, 25 Jun 2019 12:47:57 +0000 (UTC)
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Erik Stromdahl <erik.stromdahl@gmail.com> wrote:

> This is done in order to make the *htt_h2t_aggr_cfg_msg* op align better
> with the rest of the htt ops (whom all have inline wrappers).
> 
> It also adds support for the case when the op is missing (function
> pointer is NULL).
> 
> As a result of this, the name of the 32 bit implementation in htt_tx.c
> was changed and the function was made static.
> 
> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

2 patches applied to ath-next branch of ath.git, thanks.

74ee5715991f ath10k: add inline wrapper for htt_h2t_aggr_cfg_msg
bc31c2cfecc7 ath10k: add htt_h2t_aggr_cfg_msg op for high latency devices

-- 
https://patchwork.kernel.org/patch/10871563/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
