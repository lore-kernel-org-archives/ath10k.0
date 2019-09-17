Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAEDY-0004Wi-95
 for ath10k@lists.infradead.org; Tue, 17 Sep 2019 14:12:33 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: fix latency issue for QCA988x
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1567046712-23057-1-git-send-email-miaoqing@codeaurora.org>
References: <1567046712-23057-1-git-send-email-miaoqing@codeaurora.org>
Message-Id: <20190917141232.0062C6141C@smtp.codeaurora.org>
Date: Tue, 17 Sep 2019 14:12:31 +0000 (UTC)
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
To: Miaoqing Pan <miaoqing@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Miaoqing Pan <miaoqing@codeaurora.org> wrote:

> Bad latency is found on QCA988x, the issue was introduced by
> commit 4504f0e5b571 ("ath10k: sdio: workaround firmware UART
> pin configuration bug"). If uart_pin_workaround is false, this
> change will set uart pin even if uart_print is false.
> 
> Tested HW: QCA9880
> Tested FW: 10.2.4-1.0-00037
> 
> Fixes: 4504f0e5b571 ("ath10k: sdio: workaround firmware UART pin configuration bug")
> Signed-off-by: Miaoqing Pan <miaoqing@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

1340cc631bd0 ath10k: fix latency issue for QCA988x

-- 
https://patchwork.kernel.org/patch/11122193/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
