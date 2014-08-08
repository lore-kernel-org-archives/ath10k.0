Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFpx4-00036O-Nb
 for ath10k@lists.infradead.org; Fri, 08 Aug 2014 19:35:47 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: crash in ath10k_spectral_destroy()
Date: Fri, 8 Aug 2014 22:35:17 +0300
Message-ID: <8761i2ydu2.fsf@kamboji.qca.qualcomm.com>
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
To: ath10k@lists.infradead.org
Cc: Simon Wunderlich <sw@simonwunderlich.de>

Hi,

every time I reload ath10k kernel modules I seem to have a crash in
ath10k_spectral_destory(). I didn't immeadiately understand what's wrong
and I don't have time to debug this right now, but if I comment out
relay_close() the crash goes away. And I see 6b6b6b which implies we are
using already freed memory.

Does debugfs_remove() automatically remove relayfs files or what?

This is with commit f673f3ae9d09 from ath.git master branch.

[  173.108446] cfg80211:   (5735000 KHz - 5835000 KHz @ 80000 KHz), (N/A, 3000 mBm), (N/A)
[  173.109180] cfg80211:   (57240000 KHz - 63720000 KHz @ 2160000 KHz), (N/A, 4000 mBm), (N/A)
[  192.537708] BUG: unable to handle kernel paging request at 6b6b6ba3
[  192.537965] IP: [<c12b6735>] debugfs_remove+0x25/0x80
[  192.538208] *pde = 00000000 
[  192.538404] Oops: 0000 [#1] SMP DEBUG_PAGEALLOC
[  192.538780] Modules linked in: ath10k_pci(-) ath10k_core ath mac80211 cfg80211 [last unloaded: cfg80211]
[  192.539484] CPU: 3 PID: 4058 Comm: rmmod Not tainted 3.16.0-wl-ath+ #570
[  192.539604] Hardware name: Hewlett-Packard HP ProBook 6540b/1722, BIOS 68CDD Ver. F.04 01/27/2010
[  192.539760] task: f47dc3e0 ti: eb75e000 task.ti: eb75e000
[  192.539896] EIP: 0060:[<c12b6735>] EFLAGS: 00010202 CPU: 3
[  192.540018] EIP is at debugfs_remove+0x25/0x80
[  192.540122] EAX: ebc98e10 EBX: ebc98e10 ECX: 00000006 EDX: fb2c9fe0
[  192.540235] ESI: 6b6b6b6b EDI: f3fd0000 EBP: eb75fe64 ESP: eb75fe5c
[  192.540348]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[  192.540453] CR0: 8005003b CR2: 6b6b6ba3 CR3: 2b51b000 CR4: 000007d0
[  192.540565] Stack:
[  192.540637]  ed9e48a0 eb7117e0 eb75fe6c fb2c024d eb75fe78 c10fbc8c efbb7310 eb75fe9c
[  192.541218]  c10fbd78 eda5b000 eda5b000 eb7117e0 f3fd0000 eb7117e0 eb7117e0 f3fd0000
[  192.541840]  eb75fea8 fb2c06ca eb7117e0 eb75feb4 fb2b43b5 00000000 eb75fed4 fb1a8154
[  192.542511] Call Trace:
[  192.545570]  [<fb2c024d>] remove_buf_file_handler+0xd/0x20 [ath10k_core]
[  192.548751]  [<c10fbc8c>] relay_close_buf+0x2c/0x50
[  192.551924]  [<c10fbd78>] relay_close+0xc8/0x120
[  192.555048]  [<fb2c06ca>] ath10k_spectral_destroy+0x1a/0x30 [ath10k_core]
[  192.558197]  [<fb2b43b5>] ath10k_core_unregister+0x35/0x40 [ath10k_core]
[  192.561310]  [<fb1a8154>] ath10k_pci_remove+0x44/0xa0 [ath10k_pci]
[  192.564436]  [<c132f5b8>] pci_device_remove+0x28/0x50
[  192.567530]  [<c146cbee>] __device_release_driver+0x4e/0xb0
[  192.570617]  [<c146d437>] driver_detach+0x97/0xa0
[  192.573667]  [<c146caa0>] bus_remove_driver+0x40/0x80
[  192.576700]  [<c146ddaa>] driver_unregister+0x2a/0x60
[  192.579771]  [<c10a61eb>] ? trace_hardirqs_on+0xb/0x10
[  192.582870]  [<c132f6c8>] pci_unregister_driver+0x18/0x70
[  192.585943]  [<c104de2e>] ? put_online_cpus+0x5e/0x80
[  192.588986]  [<fb1ad009>] ath10k_pci_exit+0xd/0xf [ath10k_pci]
[  192.592030]  [<c10d652c>] SyS_delete_module+0xfc/0x170
[  192.595056]  [<c116a8a6>] ? vm_munmap+0x46/0x60
[  192.598083]  [<c1808cc7>] ? sysenter_exit+0xf/0x16
[  192.601068]  [<c10a6114>] ? trace_hardirqs_on_caller+0xf4/0x1c0
[  192.604028]  [<c116a8a6>] ? vm_munmap+0x46/0x60
[  192.607019]  [<c1808c98>] sysenter_do_call+0x12/0x12
[  192.610043] Code: 90 90 90 90 90 90 55 89 e5 83 ec 08 89 5d f8 89 75 fc 66 66 66 66 90 85 c0 89 c3 74 3e 3d 00 f0 ff ff 77 37 8b 70 28 85 f6 74 30 <8b> 46 38 85 c0 74 29 05 a8 00 00 00 31 d2 e8 d8 ed 54 00 8d 56
[  192.620991] EIP: [<c12b6735>] debugfs_remove+0x25/0x80 SS:ESP 0068:eb75fe5c
[  192.624616] CR2: 000000006b6b6ba3
[  192.646953] ---[ end trace 17a70ef1079e4ef4 ]---
[  192.647045] Kernel panic - not syncing: Fatal exception
[  192.650582] Kernel Offset: 0x0 from 0xc1000000 (relocation range: 0xc0000000-0xf7ffdfff)
[  192.654019] drm_kms_helper: panic occurred, switching back to text console
[  192.659628] Rebooting in 10 seconds..
[  202.684887] ACPI MEMORY or I/O RESET_REG.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
