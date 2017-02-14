Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cdh5o-0007GI-I5
 for ath10k@lists.infradead.org; Tue, 14 Feb 2017 17:40:46 +0000
MIME-Version: 1.0
Subject: Re: [v4] ath10k: fix napi crash during rmmod when probe firmware fails
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <148672748569.28126.12259592472689214081.stgit@potku.adurom.net>
References: <148672748569.28126.12259592472689214081.stgit@potku.adurom.net>
Message-ID: <ecab7adaed014dc1a51eb4c063c879aa@eusanexr01a.eu.qualcomm.com>
Date: Tue, 14 Feb 2017 09:40:40 -0800
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> This fixes the below crash when ath10k probe firmware fails, NAPI polling tries
> to access a rx ring resource which was never allocated. An easy way to
> reproduce this is easy to remove all the firmware files, load ath10k modules
> and ath10k will crash when calling 'rmmod ath10k_pci'. The fix is to call
> napi_enable() from ath10k_pci_hif_start() so that it matches with
> napi_disable() being called from ath10k_pci_hif_stop().
> 
> Big thanks to Mohammed Shafi Shajakhan who debugged this and provided first
> version of the fix. In this patch I just fix the actual problem in pci.c
> instead of having a workaround in core.c.
> 
> BUG: unable to handle kernel NULL pointer dereference at (null)
> IP:  __ath10k_htt_rx_ring_fill_n+0x19/0x230 [ath10k_core]
> __ath10k_htt_rx_ring_fill_n+0x19/0x230 [ath10k_core]
> 
> Call Trace:
> 
> [<ffffffffa113ec62>] ath10k_htt_rx_msdu_buff_replenish+0x42/0x90
> [ath10k_core]
> [<ffffffffa113f393>] ath10k_htt_txrx_compl_task+0x433/0x17d0
> [ath10k_core]
> [<ffffffff8114406d>] ? __wake_up_common+0x4d/0x80
> [<ffffffff811349ec>] ? cpu_load_update+0xdc/0x150
> [<ffffffffa119301d>] ? ath10k_pci_read32+0xd/0x10 [ath10k_pci]
> [<ffffffffa1195b17>] ath10k_pci_napi_poll+0x47/0x110 [ath10k_pci]
> [<ffffffff817863af>] net_rx_action+0x20f/0x370
> 
> Reported-by: Ben Greear <greearb@candelatech.com>
> Fixes: 3c97f5de1f28 ("ath10k: implement NAPI support")
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

1427228d5869 ath10k: fix napi crash during rmmod when probe firmware fails

-- 
https://patchwork.kernel.org/patch/9566625/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
