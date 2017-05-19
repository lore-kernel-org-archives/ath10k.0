Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dBdnu-0000xT-K4
 for ath10k@lists.infradead.org; Fri, 19 May 2017 09:02:40 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] [ath10k] go back to using dma_alloc_coherent() for
 firmware scratch memory.
Date: Fri, 19 May 2017 09:02:08 +0000
Message-ID: <8760gxw776.fsf@kamboji.qca.qualcomm.com>
References: <20170501214327.5621-1-adrian@freebsd.org>
 <2107639.cIofNFgAHq@bentobox>
In-Reply-To: <2107639.cIofNFgAHq@bentobox> (Sven Eckelmann's message of "Wed, 
 17 May 2017 12:06:01 +0200")
Content-Language: en-US
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
To: Sven Eckelmann <sven.eckelmann@openmesh.com>
Cc: Adrian Chadd <adrian@freebsd.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "simon.wunderlich@openmesh.com" <simon.wunderlich@openmesh.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Sven Eckelmann <sven.eckelmann@openmesh.com> writes:

> On Montag, 1. Mai 2017 14:43:27 CEST Adrian Chadd wrote:
>> This reverts b057886524be060021e3cfad0ba8458c850330cd in 2015
>> which converted this allocation from dma_map_coherent() to
>> kzalloc() / dma_map_single().
>> 
>> The current problem manifests when using later model NICs with larger
>> (>700KiB) scratch spaces in memory.  Although the kzalloc call
>> succeeds, the software IOMMU TLB code (via dma_map_single()) panics
>> because it can't find 700KiB of linear physmem bounce buffers for DMA.
>> Now, this is a bit of a silly failure mode for the dma map API,
>> but it's what we currently have to play with.
> [....]
>> 
>> Signed-off-by: Adrian Chadd <adrian@FreeBSD.org>
>> ---
>>  drivers/net/wireless/ath/ath10k/wmi.c | 35 ++++++++++-------------------------
>>  1 file changed, 10 insertions(+), 25 deletions(-)
>
> Thanks for investigating this. This partial revert fixes following crash for
> me with QCA99X0 on amd64 with SWIOMMU:
>
>     [    9.167281] DMA: Out of SW-IOMMU space for 689816 bytes at device 0000:02:00.0
>     [    9.174719] Kernel panic - not syncing: DMA: Random memory could be DMA read

I recently got a Compex WLE1216V5-20 board and this patch also fixed a
similar crash for me on my HP x86_64 test laptop:

[  840.491019] do_IRQ: 3.82 No irq handler for vector
[  840.965049] ath10k_pci 0000:02:00.0: pci irq msi oper_irq_mode 2 irq_mode 0 reset_mode 0
[  841.094985] ath10k_pci 0000:02:00.0: qca9984/qca9994 hw1.0 target 0x01000000 chip_id 0x00000000 sub 168c:cafe
[  841.095096] ath10k_pci 0000:02:00.0: kconfig debug 1 debugfs 1 tracing 1 dfs 1 testmode 1
[  841.095603] ath10k_pci 0000:02:00.0: firmware ver 10.4-3.4-00082 api 5 features no-p2p,mfp,peer-flow-ctrl,btcoex-param,allows-mesh-bcast crc32 f301de65
[  842.518071] ath10k_pci 0000:02:00.0: board_file api 2 bmi_id 0:1 crc32 751efba1
[  845.220186] ath10k_pci 0000:02:00.0: swiotlb buffer is full (sz: 1172264 bytes)
[  845.220478] ath10k_pci 0000:02:00.0: DMA: Out of SW-IOMMU space for 1172264 bytes
[  845.220506] Kernel panic - not syncing: DMA: Random memory could be DMA accessed#012[  845.220506] 
[  845.220532] CPU: 0 PID: 116 Comm: kworker/u16:4 Tainted: G            E   4.11.0-wt-ath+ #336
[  845.220554] Hardware name: Hewlett-Packard HP ProBook 6540b/1722, BIOS 68CDD Ver. F.04 01/27/2010
[  845.220600] Workqueue: ath10k_aux_wq ath10k_wmi_event_service_ready_work [ath10k_core]
[  845.220626] Call Trace:
[  845.220656]  dump_stack+0x85/0xc2
[  845.220684]  panic+0xda/0x228
[  845.220719]  swiotlb_full+0x88/0xa0
[  845.220746]  swiotlb_map_page+0x214/0x280
[  845.220785]  ath10k_wmi_event_service_ready_work+0x3f2/0x7d0 [ath10k_core]
[  845.220812]  ? swiotlb_map_sg_attrs+0x140/0x140
[  845.220858]  process_one_work+0x23b/0x7d0
[  845.221093]  worker_thread+0x4e/0x4a0
[  845.221126]  kthread+0x117/0x150
[  845.221149]  ? process_one_work+0x7d0/0x7d0
[  845.221175]  ? kthread_create_on_node+0x40/0x40
[  845.221205]  ret_from_fork+0x31/0x40
[  845.221314] Kernel Offset: 0xb000000 from 0xffffffff81000000 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)


-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
