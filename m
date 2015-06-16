Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z4nqm-0001PO-69
 for ath10k@lists.infradead.org; Tue, 16 Jun 2015 10:12:12 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: prevent debugfs mmio access crash kernel
References: <1434008594-6726-1-git-send-email-michal.kazior@tieto.com>
Date: Tue, 16 Jun 2015 13:11:41 +0300
In-Reply-To: <1434008594-6726-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 11 Jun 2015 09:43:14 +0200")
Message-ID: <87ioao7yjm.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> It was possible to force an out of bounds MMIO
> read/write via debugfs. E.g. on QCA988X this could
> be triggered with:
>
>  echo 0x2080e0 | tee /sys/kernel/debug/ieee80211/*/ath10k/reg_addr
>  cat /sys/kernel/debug/ieee80211/*/ath10k/reg_value
>
>  BUG: unable to handle kernel paging request at ffffc90001e080e0
>  IP: [<ffffffff8135c860>] ioread32+0x40/0x50
>  ...
>  Call Trace:
>   [<ffffffffa00d0c7f>] ? ath10k_pci_read32+0x4f/0x70 [ath10k_pci]
>   [<ffffffffa0080f50>] ath10k_reg_value_read+0x90/0xf0 [ath10k_core]
>   [<ffffffff8115c2c1>] ? handle_mm_fault+0xa91/0x1050
>   [<ffffffff81189758>] __vfs_read+0x28/0xe0
>   [<ffffffff812e4694>] ? security_file_permission+0x84/0xa0
>   [<ffffffff81189ce3>] ? rw_verify_area+0x53/0x100
>   [<ffffffff81189e1a>] vfs_read+0x8a/0x140
>   [<ffffffff8118acb9>] SyS_read+0x49/0xb0
>   [<ffffffff8104e39c>] ? trace_do_page_fault+0x3c/0xc0
>   [<ffffffff8196596e>] system_call_fastpath+0x12/0x71
>
> Reported-by: Ben Greear <greearb@candelatech.com>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
