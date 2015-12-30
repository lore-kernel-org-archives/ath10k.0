Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aE4rZ-0003kA-EH
 for ath10k@lists.infradead.org; Wed, 30 Dec 2015 00:43:37 +0000
Received: from [192.168.100.149] (firewall.candelatech.com [50.251.239.81])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 2385840B79B
 for <ath10k@lists.infradead.org>; Tue, 29 Dec 2015 16:43:15 -0800 (PST)
Subject: Re: Today's kvalo/ath.git crashes upon trying to load beeliner NIC.
References: <568316CE.4040708@candelatech.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <568328A2.3070501@candelatech.com>
Date: Tue, 29 Dec 2015 16:43:14 -0800
MIME-Version: 1.0
In-Reply-To: <568316CE.4040708@candelatech.com>
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
To: ath10k <ath10k@lists.infradead.org>

enabling vt-d in the BIOS made this go away

Still can't get the wlan2 on the 4x4 NIC to associate to an AP (ath9k),
however.

Thanks,
Ben

On 12/29/2015 03:27 PM, Ben Greear wrote:
> This is with stock firmware.  It was at least somewhat working back
> in the 4.3-rc6 time-frame.....
>
>
> DMA: Out of SW-IOMMU space for 274432 bytes at device 0000:05:00.0
> Kernel panic - not syncing: DMA: Random memory could be DMA read
>
> CPU: 0 PID: 256 Comm: kworker/u8:3 Not tainted 4.4.0-rc7-wt-ath+ #32
> Hardware name: To be filled by O.E.M. To be filled by O.E.M./HURONRIVER, BIOS 4.6.5 05/02/2012
> Workqueue: ath10k_aux_wq ath10k_wmi_event_service_ready_work [ath10k_core]
>   0000000000000000 ffff8802138dfc38 ffffffff813388c8 ffffffff81ab333b
>   ffff8802138dfcb8 ffffffff81196589 ffff880200000008 ffff8802138dfcc8
>   ffff8802138dfc60 ffffffff811968f5 ffff88021ea0dab8 0000000000000042
> Call Trace:
>   [<ffffffff813388c8>] dump_stack+0x4b/0x6c
>   [<ffffffff81196589>] panic+0xc2/0x209
>   [<ffffffff811968f5>] ? printk+0x43/0x4b
>   [<ffffffff8135c0bc>] swiotlb_map_page+0xe0/0x178
>   [<ffffffffa0dbf3f4>] dma_map_single_attrs.constprop.33+0x6c/0x6e [ath10k_core]
>   [<ffffffffa0dc5dc5>] ath10k_wmi_event_service_ready_work+0x4c6/0x561 [ath10k_core]
>   [<ffffffff810fa734>] process_one_work+0x151/0x261
>   [<ffffffff810facd7>] worker_thread+0x1e4/0x28f
>   [<ffffffff810faaf3>] ? rescuer_thread+0x285/0x285
>   [<ffffffff810feec1>] kthread+0xa0/0xa8
>   [<ffffffff810fee21>] ? kthread_parkme+0x1f/0x1f
>   [<ffffffff8169b70f>] ret_from_fork+0x3f/0x70
>   [<ffffffff810fee21>] ? kthread_parkme+0x1f/0x1f
> Kernel Offset: disabled
> ---[ end Kernel panic - not syncing: DMA: Random memory could be DMA read
>
>
> Thanks,
> Ben
>
>


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
