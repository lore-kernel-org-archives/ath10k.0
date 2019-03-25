Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8WBc-0005LJ-8l
 for ath10k@lists.infradead.org; Mon, 25 Mar 2019 20:27:15 +0000
Received: by mail-pl1-x644.google.com with SMTP id y5so484974plk.8
 for <ath10k@lists.infradead.org>; Mon, 25 Mar 2019 13:27:11 -0700 (PDT)
Date: Mon, 25 Mar 2019 13:27:07 -0700
From: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH] ath10k: pci: use mutex for diagnostic window CE polling
Message-ID: <20190325202706.GA68720@google.com>
References: <20190207014143.41529-1-briannorris@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190207014143.41529-1-briannorris@chromium.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Carl Huang <cjhuang@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Wen Gong <wgong@codeaurora.org>

Hi Kalle,

On Wed, Feb 06, 2019 at 05:41:43PM -0800, Brian Norris wrote:
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

It would appear that this triggers new warnings

  BUG: sleeping function called from invalid context

when handling firmware crashes. The call stack is

  ath10k_pci_fw_crashed_dump
    -> ath10k_pci_dump_memory
    ...
      -> ath10k_pci_diag_read_mem

and the problem is that we're holding the 'data_lock' spinlock with
softirqs disabled, while later trying to grab this new mutex.

Unfortunately, data_lock is used in a lot of places, and it's unclear if
it can be migrated to a mutex as well. It seems like it probably can be,
but I'd have to audit a little more closely.

Any thoughts on what the short- and long-term solutions should be? I can
send a revert, to get v5.1 fixed. But it still seems like we should
avoid disabling softirqs for so long.

Brian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
