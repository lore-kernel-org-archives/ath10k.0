Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fHQRK-0006si-V0
 for ath10k@lists.infradead.org; Sat, 12 May 2018 09:03:44 +0000
MIME-Version: 1.0
Subject: Re: ath10k: fix return value check in wake_tx_q op
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20180506132500.16888-1-erik.stromdahl@gmail.com>
References: <20180506132500.16888-1-erik.stromdahl@gmail.com>
Message-Id: <20180512090332.A964D60850@smtp.codeaurora.org>
Date: Sat, 12 May 2018 09:03:32 +0000 (UTC)
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

> ath10k_mac_tx_push_txq returns either a postive integer (length) on
> success or a negative error code on error.
> 
> The "if (ret) break;" statement will thus always break out of the loop
> immediately after ath10k_mac_tx_push_txq has returned (making the loop
> pointless).
> 
> A side effect of this fix is that we will iterate the queue until
> ath10k_mac_tx_push_txq returns -ENOENT. This will make sure the queue is
> not added back to ar->txqs when it is empty. This could potentially
> improve performance somewhat (I have seen a small improvement with SDIO
> devices).
> 
> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

e3148cc5fecf ath10k: fix return value check in wake_tx_q op

-- 
https://patchwork.kernel.org/patch/10382789/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
