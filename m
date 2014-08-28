Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XMtfu-0003m0-5h
 for ath10k@lists.infradead.org; Thu, 28 Aug 2014 06:59:15 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: BUG when doing rmmod
Date: Thu, 28 Aug 2014 09:58:45 +0300
Message-ID: <87ha0xuml6.fsf@kamboji.qca.qualcomm.com>
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

Hi,

while I was testing testmode patches I noticed ath10k was crashing
during rmmod. Further investigation showed that I actually see the crash
also without testmode patches (using commit 346c16654356) . I just need
to reload ath10k modules in sequence, usually 10-15 times is enough to
reprocuce the crash.

I also tested with "ath10k: re-enable interrupts properly in hw
recovery" but it doesn't seem to make any difference.

[  118.520582] cfg80211: Calling CRDA to update world regulatory domain
[  118.554828] cfg80211: World regulatory domain updated:
[  118.554897] cfg80211:  DFS Master region: unset
[  118.554951] cfg80211:   (start_freq - end_freq @ bandwidth), (max_antenna_gain, max_eirp), (dfs_cac_time)
[  118.555064] cfg80211:   (2402000 KHz - 2472000 KHz @ 40000 KHz), (N/A, 2000 mBm), (N/A)
[  118.555122] cfg80211:   (2457000 KHz - 2482000 KHz @ 40000 KHz), (N/A, 2000 mBm), (N/A)
[  118.555178] cfg80211:   (2474000 KHz - 2494000 KHz @ 20000 KHz), (N/A, 2000 mBm), (N/A)
[  118.555235] cfg80211:   (5170000 KHz - 5250000 KHz @ 80000 KHz), (N/A, 2000 mBm), (N/A)
[  118.555294] cfg80211:   (5735000 KHz - 5835000 KHz @ 80000 KHz), (N/A, 2000 mBm), (N/A)
[  118.555629] cfg80211:   (57240000 KHz - 63720000 KHz @ 2160000 KHz), (N/A, 0 mBm), (N/A)
[  118.881727] ath10k_pci 0000:02:00.0: irq 49 for MSI/MSI-X
[  118.882042] ath10k_pci 0000:02:00.0: pci irq msi interrupts 1 irq_mode 0 reset_mode 0
[  120.335878] ath10k_pci 0000:02:00.0: qca988x hw2.0 (0x4100016c, 0x043202ff) fw 10.2-00082-4-2 api 3 htt 2.1
[  120.335946] ath10k_pci 0000:02:00.0: debug 1 debugfs 1 tracing 1 dfs 1
[  120.856049] ath: EEPROM regdomain: 0x0
[  120.856115] ath: EEPROM indicates default country code should be used
[  120.856163] ath: doing EEPROM country->regdmn map search
[  120.856212] ath: country maps to regdmn code: 0x3a
[  120.856260] ath: Country alpha2 being used: US
[  120.856307] ath: Regpair used: 0x3a
[  120.872948] cfg80211: Calling CRDA for country: US
[  120.901453] cfg80211: Regulatory domain changed to country: US
[  120.901531] cfg80211:  DFS Master region: FCC
[  120.901594] cfg80211:   (start_freq - end_freq @ bandwidth), (max_antenna_gain, max_eirp), (dfs_cac_time)
[  120.901708] cfg80211:   (2402000 KHz - 2472000 KHz @ 40000 KHz), (N/A, 3000 mBm), (N/A)
[  120.901765] cfg80211:   (5170000 KHz - 5250000 KHz @ 80000 KHz), (N/A, 1700 mBm), (N/A)
[  120.901824] cfg80211:   (5250000 KHz - 5330000 KHz @ 80000 KHz), (N/A, 2300 mBm), (0 s)
[  120.901943] cfg80211:   (5735000 KHz - 5835000 KHz @ 80000 KHz), (N/A, 3000 mBm), (N/A)
[  120.902006] cfg80211:   (57240000 KHz - 63720000 KHz @ 2160000 KHz), (N/A, 4000 mBm), (N/A)
[  121.136426] cfg80211: Calling CRDA to update world regulatory domain
[  121.173459] cfg80211: World regulatory domain updated:
[  121.173528] cfg80211:  DFS Master region: unset
[  121.173582] cfg80211:   (start_freq - end_freq @ bandwidth), (max_antenna_gain, max_eirp), (dfs_cac_time)
[  121.173696] cfg80211:   (2402000 KHz - 2472000 KHz @ 40000 KHz), (N/A, 2000 mBm), (N/A)
[  121.173753] cfg80211:   (2457000 KHz - 2482000 KHz @ 40000 KHz), (N/A, 2000 mBm), (N/A)
[  121.173810] cfg80211:   (2474000 KHz - 2494000 KHz @ 20000 KHz), (N/A, 2000 mBm), (N/A)
[  121.173868] cfg80211:   (5170000 KHz - 5250000 KHz @ 80000 KHz), (N/A, 2000 mBm), (N/A)
[  121.173971] cfg80211:   (5735000 KHz - 5835000 KHz @ 80000 KHz), (N/A, 2000 mBm), (N/A)
[  121.174028] cfg80211:   (57240000 KHz - 63720000 KHz @ 2160000 KHz), (N/A, 0 mBm), (N/A)
[  121.512350] ath10k_pci 0000:02:00.0: irq 49 for MSI/MSI-X
[  121.512717] ath10k_pci 0000:02:00.0: pci irq msi interrupts 1 irq_mode 0 reset_mode 0
[  122.962504] ath10k_pci 0000:02:00.0: qca988x hw2.0 (0x4100016c, 0x043202ff) fw 10.2-00082-4-2 api 3 htt 2.1
[  122.962569] ath10k_pci 0000:02:00.0: debug 1 debugfs 1 tracing 1 dfs 1
[  123.481643] ath: EEPROM regdomain: 0x0
[  123.481703] ath: EEPROM indicates default country code should be used
[  123.481752] ath: doing EEPROM country->regdmn map search
[  123.481801] ath: country maps to regdmn code: 0x3a
[  123.481848] ath: Country alpha2 being used: US
[  123.481896] ath: Regpair used: 0x3a
[  123.500142] cfg80211: Calling CRDA for country: US
[  123.527647] cfg80211: Regulatory domain changed to country: US
[  123.527711] cfg80211:  DFS Master region: FCC
[  123.527761] cfg80211:   (start_freq - end_freq @ bandwidth), (max_antenna_gain, max_eirp), (dfs_cac_time)
[  123.527867] cfg80211:   (2402000 KHz - 2472000 KHz @ 40000 KHz), (N/A, 3000 mBm), (N/A)
[  123.527920] cfg80211:   (5170000 KHz - 5250000 KHz @ 80000 KHz), (N/A, 1700 mBm), (N/A)
[  123.527974] cfg80211:   (5250000 KHz - 5330000 KHz @ 80000 KHz), (N/A, 2300 mBm), (0 s)
[  123.528026] cfg80211:   (5735000 KHz - 5835000 KHz @ 80000 KHz), (N/A, 3000 mBm), (N/A)
[  123.528080] cfg80211:   (57240000 KHz - 63720000 KHz @ 2160000 KHz), (N/A, 4000 mBm), (N/A)
[  123.547470] BUG: unable to handle kernel paging request at fe589030
[  123.547745] IP: [<c1316fb0>] ioread32+0x30/0x40
[  123.547924] *pde = 2d670067 *pte = 00000000 
[  123.548170] Oops: 0000 [#1] SMP DEBUG_PAGEALLOC
[  123.548500] Modules linked in: ath10k_pci(-) ath10k_core ath mac80211 cfg80211 [last unloaded: cfg80211]
[  123.549121] CPU: 0 PID: 3631 Comm: rmmod Not tainted 3.16.0-wl-ath+ #570
[  123.549261] Hardware name: Hewlett-Packard HP ProBook 6540b/1722, BIOS 68CDD Ver. F.04 01/27/2010
[  123.549409] task: ef762d40 ti: ed4a6000 task.ti: ed4a6000
[  123.549522] EIP: 0060:[<c1316fb0>] EFLAGS: 00010292 CPU: 0
[  123.549640] EIP is at ioread32+0x30/0x40
[  123.549749] EAX: fe589030 EBX: ecadd7e0 ECX: 00000002 EDX: ef7632e0
[  123.549871] ESI: 00000000 EDI: ecadf208 EBP: f441bf84 ESP: f441bf84
[  123.549994]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[  123.550110] CR0: 8005003b CR2: fe589030 CR3: 2c7c3000 CR4: 000007d0
[  123.550232] Stack:
[  123.550321]  f441bf90 fe576c1b ecadf204 f441bfa4 c1053fbe ef762d40 00000006 c1b35218
[  123.551049]  f441bff8 c10534f1 00000000 00000000 00000000 00000000 00000000 00000000
[  123.551755]  00406100 01000000 ed4a7fec fffd4e33 0000000a 00000000 00000005 00000030
[  123.552499] Call Trace:
[  123.554957]  [<fe576c1b>] ath10k_pci_tasklet+0x1b/0x60 [ath10k_pci]
[  123.557436]  [<c1053fbe>] tasklet_action+0x9e/0xb0
[  123.559874]  [<c10534f1>] __do_softirq+0xf1/0x3f0
[  123.562277]  [<c1053400>] ? ftrace_raw_event_irq_handler_entry+0xa0/0xa0
[  123.564720]  [<c1004999>] do_softirq_own_stack+0x29/0x40
[  123.567096]  <IRQ> 
[  123.567170]  [<c1053a76>] irq_exit+0x86/0xb0
[  123.571765]  [<c1809d38>] smp_apic_timer_interrupt+0x38/0x50
[  123.574132]  [<c18095ce>] apic_timer_interrupt+0x32/0x38
[  123.576372]  [<c17fe175>] ? __slab_alloc.constprop.68+0x393/0x39f
[  123.578427]  [<c137d3e1>] ? acpi_ut_create_generic_state+0x2b/0x35
[  123.580549]  [<c137d3e1>] ? acpi_ut_create_generic_state+0x2b/0x35
[  123.582572]  [<c10a010c>] ? __lock_is_held+0x3c/0x50
[  123.584579]  [<c136ab78>] ? acpi_ex_read_data_from_field+0x148/0x164
[  123.586637]  [<c117fd5e>] kmem_cache_alloc+0x26e/0x290
[  123.588700]  [<c136e342>] ? acpi_ex_resolve_node_to_value+0x19a/0x224
[  123.590804]  [<c13648bd>] ? acpi_ds_create_operand+0x118/0x1e9
[  123.592946]  [<c117f2b8>] ? kfree+0x138/0x2a0
[  123.595085]  [<c137d3e1>] ? acpi_ut_create_generic_state+0x2b/0x35
[  123.597236]  [<c137d3e1>] acpi_ut_create_generic_state+0x2b/0x35
[  123.599392]  [<c1365dc9>] acpi_ds_result_push+0x6e/0x145
[  123.601570]  [<c1364b11>] acpi_ds_evaluate_name_path+0xcc/0xdf
[  123.603723]  [<c1364e20>] acpi_ds_exec_end_op+0x8c/0x3a4
[  123.605787]  [<c1375bde>] acpi_ps_parse_loop+0x48e/0x4f4
[  123.607844]  [<c13765c2>] acpi_ps_parse_aml+0x87/0x241
[  123.609898]  [<c1376d33>] acpi_ps_execute_method+0x1a3/0x238
[  123.611925]  [<c1371c88>] acpi_ns_evaluate+0x1c0/0x23d
[  123.613946]  [<c137b64a>] ? acpi_ut_evaluate_object+0x42/0x180
[  123.615981]  [<c137b663>] acpi_ut_evaluate_object+0x5b/0x180
[  123.618009]  [<c10a0438>] ? lock_release_holdtime.part.7+0xa8/0x110
[  123.620046]  [<c13780b0>] acpi_rs_get_prt_method_data+0x24/0x46
[  123.621990]  [<c13783c3>] acpi_get_irq_routing_table+0x48/0x4c
[  123.623882]  [<c135fcb2>] acpi_pci_irq_find_prt_entry+0x5e/0x222
[  123.625776]  [<c18085d7>] ? _raw_spin_unlock_irqrestore+0x57/0x60
[  123.627714]  [<c10a6114>] ? trace_hardirqs_on_caller+0xf4/0x1c0
[  123.629644]  [<c135fe98>] acpi_pci_irq_lookup+0x22/0x149
[  123.631569]  [<c10a61eb>] ? trace_hardirqs_on+0xb/0x10
[  123.633579]  [<c136010a>] acpi_pci_irq_disable+0x19/0x47
[  123.635461]  [<c1671edd>] pcibios_disable_device+0x1d/0x30
[  123.637445]  [<c132d522>] do_pci_disable_device+0x52/0x60
[  123.639439]  [<c132d57f>] pci_disable_device+0x4f/0xb0
[  123.641406]  [<c132a961>] ? __pci_set_master+0x51/0x80
[  123.643338]  [<fe5740b3>] ath10k_pci_release+0x33/0x40 [ath10k_pci]
[  123.645289]  [<fe575d4b>] ath10k_pci_remove+0x7b/0x90 [ath10k_pci]
[  123.647174]  [<c132f5b8>] pci_device_remove+0x28/0x50
[  123.649056]  [<c146cbee>] __device_release_driver+0x4e/0xb0
[  123.650911]  [<c146d437>] driver_detach+0x97/0xa0
[  123.652734]  [<c146caa0>] bus_remove_driver+0x40/0x80
[  123.654525]  [<c146ddaa>] driver_unregister+0x2a/0x60
[  123.656344]  [<c10a61eb>] ? trace_hardirqs_on+0xb/0x10
[  123.658208]  [<c132f6c8>] pci_unregister_driver+0x18/0x70
[  123.660049]  [<c104de2e>] ? put_online_cpus+0x5e/0x80
[  123.661838]  [<fe5787f1>] ath10k_pci_exit+0xd/0xf [ath10k_pci]
[  123.663589]  [<c10d652c>] SyS_delete_module+0xfc/0x170
[  123.665320]  [<c116a8a6>] ? vm_munmap+0x46/0x60
[  123.667041]  [<c1808cc7>] ? sysenter_exit+0xf/0x16
[  123.668765]  [<c10a6114>] ? trace_hardirqs_on_caller+0xf4/0x1c0
[  123.670474]  [<c116a8a6>] ? vm_munmap+0x46/0x60
[  123.672251]  [<c1808c98>] sysenter_do_call+0x12/0x12
[  123.673995] Code: 00 89 e5 77 26 3d 00 00 01 00 76 07 0f b7 d0 ed 5d c3 90 ba 05 6c a7 c1 e8 4e fe ff ff b8 ff ff ff ff 5d c3 8d b4 26 00 00 00 00 <8b> 00 5d c3 8d b6 00 00 00 00 8d bf 00 00 00 00 55 3d ff ff 03
[  123.681781] EIP: [<c1316fb0>] ioread32+0x30/0x40 SS:ESP 0068:f441bf84
[  123.683941] CR2: 00000000fe589030
[  123.697603] ---[ end trace c9ca9a9d889d7de4 ]---
[  123.697660] Kernel panic - not syncing: Fatal exception in interrupt
[  123.699796] Kernel Offset: 0x0 from 0xc1000000 (relocation range: 0xc0000000-0xf7ffdfff)
[  123.701676] drm_kms_helper: panic occurred, switching back to text console
[  123.706525] Rebooting in 10 seconds..
[  133.730793] ACPI MEMORY or I/O RESET_REG.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
