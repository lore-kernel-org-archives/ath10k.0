Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvjJN-0002rK-4O
 for ath10k@lists.infradead.org; Wed, 15 Jul 2020 15:27:10 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] net: ath10k: fix OOB: __ath10k_htt_rx_ring_fill_n
References: <20200623221105.3486-1-bruceshenzk@gmail.com>
Date: Wed, 15 Jul 2020 18:26:56 +0300
In-Reply-To: <20200623221105.3486-1-bruceshenzk@gmail.com> (Zekun Shen's
 message of "Tue, 23 Jun 2020 18:11:05 -0400")
Message-ID: <87mu4094u7.fsf@codeaurora.org>
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
To: Zekun Shen <bruceshenzk@gmail.com>
Cc: security@kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>

Zekun Shen <bruceshenzk@gmail.com> writes:

> The idx in __ath10k_htt_rx_ring_fill_n function lives in
> consistent dma region writable by the device. Malfunctional
> or malicious device could manipulate such idx to have a OOB
> write. Either by
>     htt->rx_ring.netbufs_ring[idx] = skb;
> or by
>     ath10k_htt_set_paddrs_ring(htt, paddr, idx);
>
> The idx can also be negative as it's signed, giving a large
> memory space to write to.
>
> It's possibly exploitable by corruptting a legit pointer with
> a skb pointer. And then fill skb with payload as rougue object.
>
> Signed-off-by: Zekun Shen <bruceshenzk@gmail.com>
> ---
> Part of the log here. Sometimes it appears as UAF when writing 
> to a freed memory by chance.
>
>  [   15.594376] BUG: unable to handle page fault for address: ffff887f5c1804f0
>  [   15.595483] #PF: supervisor write access in kernel mode
>  [   15.596250] #PF: error_code(0x0002) - not-present page
>  [   15.597013] PGD 0 P4D 0
>  [   15.597395] Oops: 0002 [#1] SMP KASAN PTI
>  [   15.597967] CPU: 0 PID: 82 Comm: kworker/u2:2 Not tainted 5.6.0 #69
>  [   15.598843] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), 
>  BIOS rel-1.12.1-0-ga5cab58e9a3f-prebuilt.qemu.org 04/01/2014
>  [   15.600438] Workqueue: ath10k_wq ath10k_core_register_work [ath10k_core]
>  [   15.601389] RIP: 0010:__ath10k_htt_rx_ring_fill_n 
>  (linux/drivers/net/wireless/ath/ath10k/htt_rx.c:173) ath10k_core

I added the log to the commit log as it looks useful.

Also I made minor changes to the title and to the error message.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
