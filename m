Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aykCp-0005u6-Bi
 for ath10k@lists.infradead.org; Fri, 06 May 2016 18:10:28 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix kernel panic, move arvifs list head init
 before htt init
Date: Fri, 6 May 2016 18:09:58 +0000
Message-ID: <87a8k3njm2.fsf@kamboji.qca.qualcomm.com>
References: <1461686748-862-1-git-send-email-akolli@qti.qualcomm.com>
In-Reply-To: <1461686748-862-1-git-send-email-akolli@qti.qualcomm.com>
 (akolli@qti.qualcomm.com's message of "Tue, 26 Apr 2016 21:35:48	+0530")
Content-Language: en-US
Content-ID: <CF11977500E16D4D943A549361EE1044@qualcomm.com>
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
To: "Kolli, Anilkumar" <akolli@qti.qualcomm.com>
Cc: "akolli@codeaurora.org" <akolli@codeaurora.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

<akolli@qti.qualcomm.com> writes:

> From: Anilkumar Kolli <akolli@qti.qualcomm.com>
>
> It is observed that while loading and unloading ath10k modules
> in an infinite loop, before ath10k_core_start() completion HTT
> rx frames are received, while processing these frames,
> dereferencing the arvifs list code is getting hit before
> initilizing the arvifs list, causing a kernel panic.
>
> This patch initilizes the arvifs list before initilizing htt.
>
> Fixes the below issue:
>  [<bf88b058>] (ath10k_htt_rx_pktlog_completion_handler+0x278/0xd08 [ath10k_core])
>  [<bf88b058>] (ath10k_htt_rx_pktlog_completion_handler [ath10k_core])
>  [<bf88c0dc>] (ath10k_htt_txrx_compl_task+0x5f4/0xeb0 [ath10k_core])
>  [<bf88c0dc>] (ath10k_htt_txrx_compl_task [ath10k_core])
>  [<c0234100>] (tasklet_action+0x8c/0xec)
>  [<c0234100>] (tasklet_action)
>  [<c02337c0>] (__do_softirq+0xf8/0x228)
>  [<c02337c0>] (__do_softirq)  [<c0233920>] (run_ksoftirqd+0x30/0x90)
>  Code: e5954ad8 e2899008 e1540009 0a00000d (e5943008)
>  ---[ end trace 71de5c2e011dbf56 ]---
>  Kernel panic - not syncing: Fatal exception in interrupt
>
> Fixes: 500ff9f9389d ("ath10k: implement chanctx API")
> Cc: stable@vger.kernel.org
>
> Signed-off-by: Anilkumar Kolli <akolli@qti.qualcomm.com>

Applied, thanks.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
