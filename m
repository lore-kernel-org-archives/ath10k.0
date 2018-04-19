Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f9CIv-0007WE-TC
 for ath10k@lists.infradead.org; Thu, 19 Apr 2018 16:21:03 +0000
MIME-Version: 1.0
Subject: Re: [1/2] ath10k: add inlined wrappers for htt tx ops
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20180415122228.12565-2-erik.stromdahl@gmail.com>
References: <20180415122228.12565-2-erik.stromdahl@gmail.com>
Message-Id: <20180419162051.850186022B@smtp.codeaurora.org>
Date: Thu, 19 Apr 2018 16:20:51 +0000 (UTC)
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

> These wrappers makes the HTT ops align better with the HIF ops
> (where similar wrappers are used).
> 
> It also makes it easier for a target to have unsupported ops
> (by letting the corresponding function pointer be NULL).
> 
> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

2 patches applied to ath-next branch of ath.git, thanks.

5df6e1313044 ath10k: add inlined wrappers for htt tx ops
9a5511d5f24f ath10k: add inlined wrappers for htt rx ops

-- 
https://patchwork.kernel.org/patch/10341545/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
