Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pd0-x235.google.com ([2607:f8b0:400e:c02::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VAGcO-0005Qj-Ui
 for ath10k@lists.infradead.org; Fri, 16 Aug 2013 09:46:53 +0000
Received: by mail-pd0-f181.google.com with SMTP id g10so2050182pdj.12
 for <ath10k@lists.infradead.org>; Fri, 16 Aug 2013 02:46:31 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 16 Aug 2013 17:46:31 +0800
Message-ID: <CABQkniCRG=UhP2TtKRxC5tquoCoMfuVsuGPPz=zGVKzUcakGxw@mail.gmail.com>
Subject: Crash when loading module
From: Zaki <zaki.bm@gmail.com>
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

Hi,

I am new to ath10k.  Used to have ath9k-based module last time.  I am
using Freescale MPC8315ERDB board to host the QCA988X_2_0_DEVICE_ID
device.  I am forcing the module to use legacy interrupt handler
because my BSP doesn't support MSI or MSI-X just yet.
During the module loading, the system crash.  Looks like it failed at
some reset device or reset target function, but i am not too sure
which one causing it.  Below are the logs i collected.  I would
apopreciate any help.  Thanks a lot in advance.

# modprobe ath10k_pci.ko
[   42.465296] cfg80211: Calling CRDA to update world regulatory domain
[   42.744607] ath10k_pci 0001:02:00.0: BAR 0: assigned [mem 0xa0000000-0xa01ff]
[   42.752698] ath10k_pci 0001:02:00.0: enabling device (0000 -> 0002)
[   42.759300] ath10k: MSI-X didn't succeed (1), trying MSI
[   42.785492] ath10k: legacy interrupt handling
[   42.850072] Oops: Machine check, sig: 7 [#1]
[   42.854333] DEBUG_PAGEALLOC MPC831x RDB
[   42.858157] Modules linked in: ath10k_pci(+) ath10k_core ath mac80211 cfg802s
[   42.868341] CPU: 0 PID: 1328 Comm: modprobe Tainted: G        W    3.11.0-rc1
[   42.876313] task: c6ea5000 ti: c6cee000 task.ti: c6cee000
[   42.881688] NIP: 00000500 LR: c9a6d31c CTR: c201415c
[   42.886632] REGS: c6cefae0 TRAP: 0200   Tainted: G        W     (3.11.0-rc3-)
[   42.894249] MSR: 00041000 <ME>  CR: 22008842  XER: 20000000
[   42.899812]
GPR00: c9a6d314 c6cefb90 c6ea5000 00000000 00000001 00000005 c2219188 00000000
GPR08: 000006cc c25a708c 000006cc c25b6288 c201415c 100b1254 c6cefe44 c2580000
GPR16: c2420000 c6cefe2c c2580000 c2580000 00000000 c9a80000 c9a70000 c6d2ac00
GPR24: c72b4c80 00000001 c7858468 c9b00004 00000001 c9a80000 c72b4c80 00000063
[   42.929482] NIP [00000500] 0x500
[   42.932730] LR [c9a6d31c] ath10k_pci_target_is_awake+0x2c/0x64 [ath10k_pci]
[   42.939657] Call Trace:
[   42.942109] [c6cefb90] [c9a6d314] ath10k_pci_target_is_awake+0x24/0x64 [ath1)
[   42.950876] [c6cefbb0] [c9a6d51c] ath10k_pci_wait+0x40/0xa0 [ath10k_pci]
[   42.957563] [c6cefbc0] [c9a6e128] ath10k_pci_hif_power_up+0x12c/0x6d8 [ath10]
[   42.965130] [c6cefc10] [c9a48698] ath10k_core_register+0x24/0x304 [ath10k_co]
[   42.972425] [c6cefc40] [c9a6f9e4] ath10k_pci_probe+0x434/0x5bc [ath10k_pci]
[   42.979373] [c6cefc90] [c21f6a5c] local_pci_probe+0x34/0x58
[   42.984931] [c6cefca0] [c21f769c] pci_device_probe+0x84/0xa4
[   42.990577] [c6cefcd0] [c22256fc] driver_probe_device+0x17c/0x380
[   42.996653] [c6cefcf0] [c2225ccc] __driver_attach+0xa4/0xa8
[   43.002209] [c6cefd10] [c2223b10] bus_for_each_dev+0x80/0xbc
[   43.007851] [c6cefd40] [c2225384] driver_attach+0x24/0x34
[   43.013234] [c6cefd50] [c2224314] bus_add_driver+0x10c/0x27c
[   43.018877] [c6cefd70] [c22262e8] driver_register+0x6c/0x194
[   43.024519] [c6cefd90] [c21f7768] __pci_register_driver+0x3c/0x4c
[   43.030605] [c6cefda0] [c9a7602c] ath10k_pci_init+0x2c/0x80 [ath10k_pci]
[   43.037292] [c6cefdb0] [c2003bc0] do_one_initcall+0x118/0x1dc
[   43.043029] [c6cefe20] [c206af28] load_module+0xda8/0xec8
[   43.048414] [c6cefee0] [c206b324] SyS_init_module+0x118/0x158
[   43.054153] [c6ceff40] [c200f4d0] ret_from_syscall+0x0/0x38
[   43.059712] --- Exception: c01 at 0xff20a8c
[   43.059712]     LR = 0x10010a20
[   43.066991] Instruction dump:
[   43.085425] ---[ end trace 3eb4529c14633098 ]---
[   43.090019]
[   44.081557] Kernel panic - not syncing: Fatal exception
[   44.086762] Rebooting in 180 seconds..

Rgds,
Zack.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
