Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jR9QP-00055Q-Ns
 for ath10k@lists.infradead.org; Wed, 22 Apr 2020 07:04:05 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: drop the TX packet which size exceed credit size
 for sdio
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <0101016ea7014696-55ae954e-6272-4899-bd03-d8012e217b9e-000000@us-west-2.amazonses.com>
References: <0101016ea7014696-55ae954e-6272-4899-bd03-d8012e217b9e-000000@us-west-2.amazonses.com>
Message-Id: <20200422070351.DFAEFC433F2@smtp.codeaurora.org>
Date: Wed, 22 Apr 2020 07:03:51 +0000 (UTC)
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
To: Wen Gong <wgong@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Wen Gong <wgong@codeaurora.org> wrote:

> sdio chip use DMA buffer to receive TX packet from ath10k, and it has
> limitation of each buffer, if the packet size exceed the credit size,
> it will trigger error in firmware.
> 
> Tested with QCA6174 SDIO with firmware
> WLAN.RMH.4.4.1-00017-QCARMSWP-1.
> 
> Signed-off-by: Wen Gong <wgong@codeaurora.org>

This doesn't apply anymore, please rebase.

error: patch failed: drivers/net/wireless/ath/ath10k/htc.c:846
error: drivers/net/wireless/ath/ath10k/htc.c: patch does not apply
stg import: Diff does not apply cleanly

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/patch/11261695/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
