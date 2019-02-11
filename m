Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtEVT-0002J1-10
 for ath10k@lists.infradead.org; Mon, 11 Feb 2019 16:32:32 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: pci: use mutex for diagnostic window CE polling
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20190207014143.41529-1-briannorris@chromium.org>
References: <20190207014143.41529-1-briannorris@chromium.org>
Message-Id: <20190211163230.B4A4F60208@smtp.codeaurora.org>
Date: Mon, 11 Feb 2019 16:32:30 +0000 (UTC)
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
Cc: Carl Huang <cjhuang@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Wen Gong <wgong@codeaurora.org>

Brian Norris <briannorris@chromium.org> wrote:

> The DIAG copy engine is only used via polling, but it holds a spinlock
> with softirqs disabled. Each iteration of our read/write loops can
> theoretically take 20ms (two 10ms timeout loops), and this loop can be
> run an unbounded number of times while holding the spinlock -- dependent
> on the request size given by the caller.
> 
> As of commit 39501ea64116 ("ath10k: download firmware via diag Copy
> Engine for QCA6174 and QCA9377."), we transfer large chunks of firmware
> memory using this mechanism. With large enough firmware segments, this
> becomes an exceedingly long period for disabling soft IRQs. For example,
> with a 500KiB firmware segment, in testing QCA6174A, I see 200 loop
> iterations of about 50-100us each, which can total about 10-20ms.
> 
> In reality, we don't really need to block softirqs for this duration.
> The DIAG CE is only used in polling mode, and we only need to hold
> ce_lock to make sure any CE bookkeeping is done without screwing up
> another CE. Otherwise, we only need to ensure exclusion between
> ath10k_pci_diag_{read,write}_mem() contexts.
> 
> This patch moves to use fine-grained locking for the shared ce_lock,
> while adding a new mutex just to ensure mutual exclusion of diag
> read/write operations.
> 
> Tested on QCA6174A, firmware version WLAN.RM.4.4.1-00132-QCARMSWPZ-1.
> 
> Fixes: 39501ea64116 ("ath10k: download firmware via diag Copy Engine for QCA6174 and QCA9377.")
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

25733c4e67df ath10k: pci: use mutex for diagnostic window CE polling

-- 
https://patchwork.kernel.org/patch/10800343/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
