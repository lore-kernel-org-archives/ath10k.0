Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cHSBY-0003oB-1r
 for ath10k@lists.infradead.org; Thu, 15 Dec 2016 09:18:44 +0000
MIME-Version: 1.0
Subject: Re: ath10k: Avoid potential page alloc BUG_ON in tx free path
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1481086832-17281-1-git-send-email-mohammed@qca.qualcomm.com>
References: <1481086832-17281-1-git-send-email-mohammed@qca.qualcomm.com>
Message-ID: <d64a028b471e4d38b6d9ac3e664f7c4d@euamsexm01a.eu.qualcomm.com>
Date: Thu, 15 Dec 2016 10:18:15 +0100
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
To: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
Cc: mohammed@codeaurora.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com> wrote:
> From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
> 
> 'ath10k_htt_tx_free_cont_txbuf' and 'ath10k_htt_tx_free_cont_frag_desc'
> have NULL pointer checks to avoid crash if they are called twice
> but this is as of now not sufficient as these pointers are not assigned
> to NULL once the contiguous DMA memory allocation is freed, fix this.
> Though this may not be hit with the explicity check of state variable
> 'tx_mem_allocated' check, good to have this addressed as well.
> 
> Below BUG_ON is hit when the above scenario is simulated
> with kernel debugging enabled
> 
>  page:f6d09a00 count:0 mapcount:-127 mapping:  (null)
> index:0x0
>  flags: 0x40000000()
>  page dumped because: VM_BUG_ON_PAGE(page_ref_count(page)
> == 0)
>  ------------[ cut here ]------------
>  kernel BUG at ./include/linux/mm.h:445!
>  invalid opcode: 0000 [#1] SMP DEBUG_PAGEALLOC
>  EIP is at put_page_testzero.part.88+0xd/0xf
>  Call Trace:
>   [<c118a2cc>] __free_pages+0x3c/0x40
>   [<c118a30e>] free_pages+0x3e/0x50
>   [<c10222b4>] dma_generic_free_coherent+0x24/0x30
>   [<f8c1d9a8>] ath10k_htt_tx_free_cont_txbuf+0xf8/0x140
> 
>   [<f8c1e2a9>] ath10k_htt_tx_destroy+0x29/0xa0
> 
>   [<f8c143e0>] ath10k_core_destroy+0x60/0x80 [ath10k_core]
>   [<f8acd7e9>] ath10k_pci_remove+0x79/0xa0 [ath10k_pci]
>   [<c13ed7a8>] pci_device_remove+0x38/0xb0
>   [<c14d3492>] __device_release_driver+0x72/0x100
>   [<c14d36b7>] driver_detach+0x97/0xa0
>   [<c14d29c0>] bus_remove_driver+0x40/0x80
>   [<c14d427a>] driver_unregister+0x2a/0x60
>   [<c13ec768>] pci_unregister_driver+0x18/0x70
>   [<f8aced4f>] ath10k_pci_exit+0xd/0x2be [ath10k_pci]
>   [<c1101e78>] SyS_delete_module+0x158/0x210
>   [<c11b34f1>] ? __might_fault+0x41/0xa0
>   [<c11b353b>] ? __might_fault+0x8b/0xa0
>   [<c1001a4b>] do_fast_syscall_32+0x9b/0x1c0
>   [<c178da34>] sysenter_past_esp+0x45/0x74
> 
> Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

02a9e08d7374 ath10k: Avoid potential page alloc BUG_ON in tx free path

-- 
https://patchwork.kernel.org/patch/9463923/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
