Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bNPFD-0005MO-15
 for ath10k@lists.infradead.org; Wed, 13 Jul 2016 18:50:51 +0000
Subject: Re: Anyone brought up 9984 NIC on x86-64?
References: <578673DA.1010907@candelatech.com>
 <1468430769350.75672@qti.qualcomm.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <57868038.3040907@candelatech.com>
Date: Wed, 13 Jul 2016 10:54:00 -0700
MIME-Version: 1.0
In-Reply-To: <1468430769350.75672@qti.qualcomm.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: "Manoharan, Rajkumar" <rmanohar@qti.qualcomm.com>, ath10k <ath10k@lists.infradead.org>

On 07/13/2016 10:26 AM, Manoharan, Rajkumar wrote:
>> I added a few patches to my 4.7 kernel to enable ath10k to load for 9984,
>> but it immediately crashes due to IOMMU error when trying to allocate
>> memory.
>>
>> I'm building the latest linux-ath tree now and will test that when it
>> is done, but I am curious to know if anyone has successfully booted
>> 9984 on x86-64?
>>
> Ben,
>
> Are you seeing IOMMU error even after wtih your DMA_BIDIRECTIONAL change? Could you please try with

My BIDIRECTIONAL patch is in my 4.7, and that did not fix the issue.

It is more for the IOMMU access failures that I saw and the redhat user reported.

I would appreciate it if you could roll that patch into your testing set and
make sure you don't see regressions on your systems.  That way maybe it can go
upstream.



For reference, this is today's un-patched linux-ath:

DMA: Out of SW-IOMMU space for 770224 bytes at device 0000:05:00.0
Kernel panic - not syncing: DMA: Random memory could be DMA read

CPU: 5 PID: 288 Comm: kworker/u16:3 Not tainted 4.7.0-rc7-wt-ath+ #34
Hardware name: To be filled by O.E.M. To be filled by O.E.M./ChiefRiver, BIOS 4.6.5 06/07/2013
Workqueue: ath10k_aux_wq ath10k_wmi_event_service_ready_work [ath10k_core]
  0000000000000000 ffff8800d3edfbf0 ffffffff8140abd1 ffffffff81c88b78
  ffff8800d3edfc80 ffff8800d3edfc70 ffffffff811ea260 ffff880000000008
  ffff8800d3edfc80 ffff8800d3edfc18 ffffffff811ea591 ffff88021e34db68
Call Trace:
  [<ffffffff8140abd1>] dump_stack+0x63/0x82
  [<ffffffff811ea260>] panic+0xca/0x216
  [<ffffffff811ea591>] ? printk+0x43/0x4b
  [<ffffffff814382a2>] swiotlb_map_page+0x1a2/0x1d0
  [<ffffffffa07ea1a9>] ath10k_wmi_event_service_ready_work+0x3f9/0x750 [ath10k_core]
  [<ffffffff8113667a>] ? dequeue_entity+0x26a/0xba0
  [<ffffffff8111aebd>] process_one_work+0x15d/0x4b0
  [<ffffffff8111b253>] worker_thread+0x43/0x4e0
  [<ffffffff8111b210>] ? process_one_work+0x4b0/0x4b0
  [<ffffffff81120a34>] kthread+0xc4/0xe0
  [<ffffffff81853e9f>] ret_from_fork+0x1f/0x40
  [<ffffffff81120970>] ? kthread_worker_fn+0x180/0x180
Kernel Offset: disabled
---[ end Kernel panic - not syncing: DMA: Random memory could be DMA read

I tried with your patch set to 512 block size, but that fails with
similar DMA error and reboots.

Your original patch with 256 block size boots up the firmware OK on my
system.

I guess I'll do more testing with your original 256k chunk patch and see
how that works.


Thanks,
Ben

>
> https://patchwork.kernel.org/patch/9175029/
>
> But increase WMI_MAX_MEM_CHUNK_SIZE to 512.
>
> -Rajkumar
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
>


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
