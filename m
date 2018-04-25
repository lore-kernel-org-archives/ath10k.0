Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vk0-x233.google.com ([2607:f8b0:400c:c05::233])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fBSH6-0002Ib-Cz
 for ath10k@lists.infradead.org; Wed, 25 Apr 2018 21:48:30 +0000
Received: by mail-vk0-x233.google.com with SMTP id v134so14792429vkd.10
 for <ath10k@lists.infradead.org>; Wed, 25 Apr 2018 14:48:16 -0700 (PDT)
MIME-Version: 1.0
From: "ojab //" <ojab@ojab.ru>
Date: Wed, 25 Apr 2018 21:48:15 +0000
Message-ID: <CAKzrAgRkSCQvRKm8kL4Kc220--umjsA407Br1XeA6j045KSBFA@mail.gmail.com>
Subject: ath10k load fails with `swiotlb buffer is full (sz: 1172264 bytes)`
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
To: ath10k@lists.infradead.org

Oh hai!

I've changed motherboard and after that ath10k load fails with

[    5.677180] ath10k_pci 0000:03:00.0: swiotlb buffer is full (sz:
1172264 bytes)
[    5.677471] ath10k_pci 0000:03:00.0: swiotlb: coherent allocation
failed, size=1172264
[    5.677745] CPU: 4 PID: 137 Comm: kworker/u16:6 Not tainted 4.16.4-ojab #19
[    5.677964] Workqueue: ath10k_aux_wq
ath10k_wmi_event_service_ready_work [ath10k_core]
[    5.678238] Call Trace:
[    5.678403]  dump_stack+0x67/0x93
[    5.678575]  swiotlb_alloc_coherent+0x1da/0x1f0
[    5.678763]  ath10k_wmi_event_service_ready_work+0x3b0/0x670 [ath10k_core]
[    5.678978]  process_one_work+0x1d3/0x3c0
[    5.679158]  worker_thread+0x2e/0x400
[    5.679333]  ? trace_event_raw_event_workqueue_execute_start+0x100/0x100
[    5.679544]  kthread+0x113/0x130
[    5.679713]  ? kthread_create_worker+0x80/0x80
[    5.679897]  ret_from_fork+0x27/0x50

vanilla kernel 4.16.4, cards are WLE1216V5-23 & WLE1216V2-20 (both
QCA9884-based, fails with the same symptoms), motherboard is asus
A320M-K with iommu disabled.

How can I get it working?

//wbr ojab

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
