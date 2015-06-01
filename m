Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YzK5x-0001EH-8S
 for ath10k@lists.infradead.org; Mon, 01 Jun 2015 07:25:13 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix possible ps sleep crash
References: <1432877724-8256-1-git-send-email-michal.kazior@tieto.com>
Date: Mon, 1 Jun 2015 10:24:44 +0300
In-Reply-To: <1432877724-8256-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 29 May 2015 07:35:24 +0200")
Message-ID: <87mw0jvqkj.fsf@kamboji.qca.qualcomm.com>
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

> If probing failed pci sleep timer could remain
> running and trigger after ath10k structures were
> freed causing invalid pointer dereference:
>
>  BUG: unable to handle kernel paging request at ffffc90001c80004
>  IP: [<ffffffff81354728>] iowrite32+0x38/0x40
>  ...
>  Call Trace:
>   <IRQ>
>   [<ffffffffa00da048>] ? __ath10k_pci_sleep+0x48/0x60 [ath10k_pci]
>   [<ffffffffa00da44e>] ath10k_pci_ps_timer+0x5e/0x80 [ath10k_pci]
>   [<ffffffff810b210e>] call_timer_fn+0x3e/0x120
>   [<ffffffffa00da3f0>] ? ath10k_pci_wake+0x150/0x150 [ath10k_pci]
>   [<ffffffff810b3d11>] run_timer_softirq+0x201/0x2e0
>   [<ffffffff8105d73f>] __do_softirq+0xaf/0x290
>   [<ffffffff8105da95>] irq_exit+0x95/0xa0
>   [<ffffffff81950406>] smp_apic_timer_interrupt+0x46/0x60
>   [<ffffffff8194e77e>] apic_timer_interrupt+0x6e/0x80
>
> Fixes: 77258d409ce4 ("ath10k: enable pci soc powersaving")
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
