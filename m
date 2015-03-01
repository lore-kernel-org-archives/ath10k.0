Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qg0-f50.google.com ([209.85.192.50])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YS0Fx-0005bg-Rh
 for ath10k@lists.infradead.org; Sun, 01 Mar 2015 09:33:51 +0000
Received: by mail-qg0-f50.google.com with SMTP id e89so20606550qgf.9
 for <ath10k@lists.infradead.org>; Sun, 01 Mar 2015 01:33:27 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <54EB7596.5010103@candelatech.com>
References: <CAFZrTr7=jCHWHv2DsHZ_KP7zf_ve8LEkhZXxoPqwWLQZdSM+YQ@mail.gmail.com>
 <54EB7596.5010103@candelatech.com>
Date: Sun, 1 Mar 2015 10:33:26 +0100
Message-ID: <CAFZrTr45G3PQdi2qkkASN4rDAwW5tdTdeopwFGvG6s-hx-Ffhw@mail.gmail.com>
Subject: Re: Firmware (firmware-2-ct-non-commercial-full-13.bin) and
 ath10k_pci crash
From: Jeremias Blendin <jeremias@blendin.org>
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
To: Ben Greear <greearb@candelatech.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Dear Ben,

thanks for the hint. Unfortunately I am not able to create Ubuntu
packages from your kernel tree (using this howto:
https://wiki.ubuntu.com/KernelTeam/GitKernelBuild).
I will investigate and see if I can make it work, hopefully next week.

Best

Jeremias

2015-02-23 19:46 GMT+01:00 Ben Greear <greearb@candelatech.com>:
> On 02/23/2015 10:39 AM, Jeremias Blendin wrote:
>> Hi,
>>
>> after setting up ath10k with hostapd I only get a few minutes in
>> working state before the system crashes -- every time.
>> I tried different firmwares, they all seem to crash. I updated to a
>> newer kernel, which delays the crash a little bit. I have already seen
>> that other people with Intel Atom processors (which mine uses) had
>> trouble, however I am not sure if both are based on the same error
>> message.
>>
>> Any hints are appreciated. I currently use the system only for setting
>> up wifi, so I could run tests if required.
>
> For this crash, the firmware crash dump cannot be read over the normal
> management channel.  If you can build & boot my 3.17.8 kernel, then it should
> be able to dump the firmware crash directly over some registers.
>
> git clone git://dmz2.candelatech.com/linux-3.17.dev.y
>
>
> I don't have a good test case to test this particular way of reading
> registers, so I'm quite interested if your system can read the crash that
> way or not...
>
> That said, your system looks quite sickly in all kinds of interesting ways,
> so not sure I'll be able to actually fix the problem (and not sure the problem
> is entirely in firmware).
>
> Thanks,
> Ben
>
>>
>> Thanks!
>>
>> Jeremias
>>
>> [   10.878947] ath10k_pci 0000:04:00.0: irq 71 for MSI/MSI-X
>> [   10.878975] ath10k_pci 0000:04:00.0: pci irq msi interrupts 1
>> irq_mode 0 reset_mode 0
>> [   10.886324] [drm] Initialized ast 0.1.0 20120228 for 0000:02:00.0 on minor 0
>> [   10.982253] gpio_ich: GPIO from 452 to 511 on gpio_ich
>> [   11.293051] ath10k_pci 0000:04:00.0: Direct firmware load for
>> ath10k/QCA988X/hw2.0/firmware-3.bin failed with error -2
>> [   11.293062] ath10k_pci 0000:04:00.0: could not fetch firmware file
>> 'ath10k/QCA988X/hw2.0/firmware-3.bin': -2
>> [   11.388022] ath10k_pci 0000:04:00.0: Unknown FW IE: 5
>> [   12.167178] cfg80211: World regulatory domain updated:
>> [   12.167184] cfg80211:  DFS Master region: unset
>> [   12.167187] cfg80211:   (start_freq - end_freq @ bandwidth),
>> (max_antenna_gain, max_eirp), (dfs_cac_time)
>> [   12.167191] cfg80211:   (2402000 KHz - 2472000 KHz @ 40000 KHz),
>> (N/A, 2000 mBm), (N/A)
>> [   12.167194] cfg80211:   (2457000 KHz - 2482000 KHz @ 40000 KHz),
>> (N/A, 2000 mBm), (N/A)
>> [   12.167196] cfg80211:   (2474000 KHz - 2494000 KHz @ 20000 KHz),
>> (N/A, 2000 mBm), (N/A)
>> [   12.167200] cfg80211:   (5170000 KHz - 5250000 KHz @ 80000 KHz,
>> 160000 KHz AUTO), (N/A, 2000 mBm), (N/A)
>> [   12.167203] cfg80211:   (5250000 KHz - 5330000 KHz @ 80000 KHz,
>> 160000 KHz AUTO), (N/A, 2000 mBm), (0 s)
>> [   12.167206] cfg80211:   (5490000 KHz - 5730000 KHz @ 160000 KHz),
>> (N/A, 2000 mBm), (0 s)
>> [   12.167209] cfg80211:   (5735000 KHz - 5835000 KHz @ 80000 KHz),
>> (N/A, 2000 mBm), (N/A)
>> [   12.167212] cfg80211:   (57240000 KHz - 63720000 KHz @ 2160000
>> KHz), (N/A, 0 mBm), (N/A)
>> [   12.288053] ath10k_pci 0000:04:00.0: qca988x hw2.0 (0x4100016c,
>> 0x043202ff) fw 10.1.467-ct-swc-full-013-b5b14a api 2 htt 2.1
>> [   12.288061] ath10k_pci 0000:04:00.0: debug 0 debugfs 1 tracing 1
>> dfs 1 testmode 0
>> [   12.736467] gre: GRE over IPv4 demultiplexor driver
>> [   12.738829] geneve: Geneve driver
>> [   12.742795] openvswitch: Open vSwitch switching datapath
>> [   12.831819] ath: EEPROM regdomain: 0x0
>> [   12.831825] ath: EEPROM indicates default country code should be used
>> [   12.831827] ath: doing EEPROM country->regdmn map search
>> [   12.831830] ath: country maps to regdmn code: 0x3a
>> [   12.831832] ath: Country alpha2 being used: US
>> [   12.831834] ath: Regpair used: 0x3a
>> [   12.841372] ath10k_pci 0000:04:00.0 wlan1: renamed from wlan0
>> [   12.872071] cfg80211: Calling CRDA for country: US
>> [   12.876122] cfg80211: Regulatory domain changed to country: US
>> [   12.876128] cfg80211:  DFS Master region: FCC
>> [   12.876130] cfg80211:   (start_freq - end_freq @ bandwidth),
>> (max_antenna_gain, max_eirp), (dfs_cac_time)
>> [   12.876134] cfg80211:   (2402000 KHz - 2472000 KHz @ 40000 KHz),
>> (N/A, 3000 mBm), (N/A)
>> [   12.876138] cfg80211:   (5170000 KHz - 5250000 KHz @ 80000 KHz,
>> 160000 KHz AUTO), (N/A, 1700 mBm), (N/A)
>> [   12.876141] cfg80211:   (5250000 KHz - 5330000 KHz @ 80000 KHz,
>> 160000 KHz AUTO), (N/A, 2300 mBm), (0 s)
>> [   12.876144] cfg80211:   (5490000 KHz - 5600000 KHz @ 80000 KHz),
>> (N/A, 2300 mBm), (0 s)
>> [   12.876147] cfg80211:   (5650000 KHz - 5710000 KHz @ 40000 KHz),
>> (N/A, 2300 mBm), (0 s)
>> [   12.876150] cfg80211:   (5735000 KHz - 5835000 KHz @ 80000 KHz),
>> (N/A, 3000 mBm), (N/A)
>> [   12.876152] cfg80211:   (57240000 KHz - 63720000 KHz @ 2160000
>> KHz), (N/A, 4000 mBm), (N/A)
>> [   13.264639] device ovs-system entered promiscuous mode
>> [   13.264958] openvswitch: netlink: Unknown key attribute (type=62, max=21).
>> [   13.368557] device switch0 entered promiscuous mode
>> [   13.368861] device eth0 entered promiscuous mode
>> [   13.424537] device eth2 entered promiscuous mode
>> [   13.456449] device eth1 entered promiscuous mode
>> [   13.456827] device eth3 entered promiscuous mode
>> [   13.457111] device wlan1 entered promiscuous mode
>> [  199.764984] IPv6: ADDRCONF(NETDEV_UP): wlan1: link is not ready
>> [  199.774812] cfg80211: Calling CRDA for country: DE
>> [  199.778184] ath: EEPROM regdomain: 0x8114
>> [  199.778189] ath: EEPROM indicates we should expect a country code
>> [  199.778191] ath: doing EEPROM country->regdmn map search
>> [  199.778193] ath: country maps to regdmn code: 0x37
>> [  199.778195] ath: Country alpha2 being used: DE
>> [  199.778197] ath: Regpair used: 0x37
>> [  199.778202] ath: regdomain 0x8114 dynamically updated by user
>> [  199.778353] cfg80211: Regulatory domain changed to country: DE
>> [  199.778365] cfg80211:  DFS Master region: ETSI
>> [  199.778368] cfg80211:   (start_freq - end_freq @ bandwidth),
>> (max_antenna_gain, max_eirp), (dfs_cac_time)
>> [  199.778371] cfg80211:   (2400000 KHz - 2483500 KHz @ 40000 KHz),
>> (N/A, 2000 mBm), (N/A)
>> [  199.778375] cfg80211:   (5150000 KHz - 5250000 KHz @ 80000 KHz,
>> 200000 KHz AUTO), (N/A, 2000 mBm), (N/A)
>> [  199.778378] cfg80211:   (5250000 KHz - 5350000 KHz @ 80000 KHz,
>> 200000 KHz AUTO), (N/A, 2000 mBm), (0 s)
>> [  199.778381] cfg80211:   (5470000 KHz - 5725000 KHz @ 160000 KHz),
>> (N/A, 2698 mBm), (0 s)
>> [  199.778384] cfg80211:   (57000000 KHz - 66000000 KHz @ 2160000
>> KHz), (N/A, 4000 mBm), (N/A)
>> [  215.573311] ath10k_pci 0000:04:00.0: failed to process fft report: -22
>> [  276.663828] IPv6: ADDRCONF(NETDEV_CHANGE): wlan1: link becomes ready
>> [  300.325107] ath10k_pci 0000:04:00.0: failed to process fft report: -22
>> [  385.175914] ath10k_pci 0000:04:00.0: failed to process fft report: -22
>> [  385.250692] ath10k_pci 0000:04:00.0: failed to process fft report: -22
>> [  385.574338] ath10k_pci 0000:04:00.0: failed to process fft report: -22
>> [  399.813164] ath10k_pci 0000:04:00.0: failed to process fft report: -22
>> [  776.727867] ath10k_pci 0000:04:00.0: failed to process fft report: -22
>> [  808.768675] ath10k_pci 0000:04:00.0: firmware crashed! (uuid
>> c8faf69c-5e05-4c3b-8890-c53e92446d76)
>> [  808.768844] ath10k_pci 0000:04:00.0: qca988x hw2.0 (0x4100016c,
>> 0x043202ff) fw 10.1.467-ct-swc-full-013-b5b14a api 2 htt 2.1
>> [  808.768852] ath10k_pci 0000:04:00.0: debug 0 debugfs 1 tracing 1
>> dfs 1 testmode 0
>> [  808.780798] ath10k_pci 0000:04:00.0: failed to read diag value at
>> 0xdf300804: -16
>> [  808.780807] ath10k_pci 0000:04:00.0: failed to get memcpy hi
>> address for firmware address 4: -16
>> [  808.780813] ath10k_pci 0000:04:00.0: failed to read firmware dump area: -16
>> [  809.053517] ieee80211 phy0: Hardware restart was requested
>> [  812.055332] ath10k_pci 0000:04:00.0: failed to to request monitor
>> vdev 1 stop: -11
>> [  817.059234] ath10k_pci 0000:04:00.0: failed to synchronise monitor
>> vdev 1: -110
>> [  817.059244] ath10k_pci 0000:04:00.0: failed to stop monitor vdev: -110
>> [  817.887936] ath10k_pci 0000:04:00.0: failed to read diag value at
>> 0xdf3008f8: -16
>> [  817.887948] ath10k_pci 0000:04:00.0: Failed to get pcie state addr: -16
>> [  817.888059] ath10k_pci 0000:04:00.0: failed to setup init config: -16
>> [  818.160092] ath10k_pci 0000:04:00.0: failed to warm reset (attempt
>> 1 out of 3): -16
>> [  818.444369] ath10k_pci 0000:04:00.0: failed to read diag value at
>> 0xdf3008f8: -16
>> [  818.444381] ath10k_pci 0000:04:00.0: Failed to get pcie state addr: -16
>> [  818.444493] ath10k_pci 0000:04:00.0: failed to setup init config: -16
>> [  818.716525] ath10k_pci 0000:04:00.0: failed to warm reset (attempt
>> 2 out of 3): -16
>> [  819.000806] ath10k_pci 0000:04:00.0: failed to read diag value at
>> 0xdf3008f8: -16
>> [  819.000817] ath10k_pci 0000:04:00.0: Failed to get pcie state addr: -16
>> [  819.000927] ath10k_pci 0000:04:00.0: failed to setup init config: -16
>> [  819.272962] ath10k_pci 0000:04:00.0: failed to warm reset (attempt
>> 3 out of 3): -16
>> [  819.272971] ath10k_pci 0000:04:00.0: failed to power up target
>> using warm reset: -16
>> [  819.272978] ath10k_pci 0000:04:00.0: trying cold reset
>> [  822.379338] ath10k_pci 0000:04:00.0: failed to read device
>> register, device is gone
>> [  822.379468] ath10k_pci 0000:04:00.0: failed to wait for target to init: -5
>> [  822.379602] sched: RT throttling activated
>> [  822.651612] ath10k_pci 0000:04:00.0: failed to power up target
>> using cold reset too (-5)
>> [  822.651747] ath10k_pci 0000:04:00.0: Could not init hif: -5
>> [  822.651836] ------------[ cut here ]------------
>> [  822.651884] WARNING: CPU: 1 PID: 69 at
>> /home/xxx/install/linux-3.18.0/net/mac80211/util.c:1686
>> ieee80211_reconfig+0x4d1/0x1500 [mac80211]()
>> [  822.651888] Hardware became unavailable during restart.
>> [  822.651892] Modules linked in: ctr ccm arc4 openvswitch geneve gre
>> vxlan ip6_udp_tunnel udp_tunnel libcrc32c nls_iso8859_1 gpio_ich
>> coretemp kvm_intel kvm crct10dif_pclmul crc32_pclmul
>> ghash_clmulni_intel aesni_intel aes_x86_64 lrw gf128mul glue_helper
>> ablk_helper cryptd lpc_ich ast ttm joydev drm_kms_helper drm
>> ath10k_pci syscopyarea ath10k_core sysfillrect sysimgblt ath mac80211
>> 8250_fintek ipmi_si cfg80211 ipmi_msghandler i2c_ismt mac_hid shpchp
>> btrfs xor raid6_pq uas usb_storage hid_generic usbhid hid igb
>> i2c_algo_bit dca ahci ptp libahci pps_core
>> [  822.651982] CPU: 1 PID: 69 Comm: kworker/1:1 Not tainted
>> 3.18.0-13-generic #14
>> [  822.651986] Hardware name: Supermicro A1SAi/A1SRi, BIOS 1.0c 02/27/2014
>> [  822.652011] Workqueue: events ieee80211_restart_work [mac80211]
>> [  822.652016]  0000000000000009 ffff880465447cb8 ffffffff817aa898
>> 0000000000000007
>> [  822.652024]  ffff880465447d08 ffff880465447cf8 ffffffff81074921
>> ffff880465447d38
>> [  822.652032]  00000000fffffffb ffff8804678e4680 ffff88047fc93240
>> ffff88047fc97600
>> [  822.652039] Call Trace:
>> [  822.652052]  [<ffffffff817aa898>] dump_stack+0x46/0x58
>> [  822.652061]  [<ffffffff81074921>] warn_slowpath_common+0x81/0xa0
>> [  822.652069]  [<ffffffff81074986>] warn_slowpath_fmt+0x46/0x50
>> [  822.652085]  [<ffffffffc04f5dbb>] ? ath10k_start+0x8b/0x250 [ath10k_core]
>> [  822.652120]  [<ffffffffc04789b1>] ieee80211_reconfig+0x4d1/0x1500 [mac80211]
>> [  822.652147]  [<ffffffffc04491c2>] ieee80211_restart_work+0x42/0x80 [mac80211]
>> [  822.652156]  [<ffffffff8108e669>] process_one_work+0x159/0x460
>> [  822.652163]  [<ffffffff8108ee83>] worker_thread+0x53/0x5a0
>> [  822.652171]  [<ffffffff8108ee30>] ? idle_worker_timeout+0x110/0x110
>> [  822.652179]  [<ffffffff81094029>] kthread+0xc9/0xe0
>> [  822.652187]  [<ffffffff81093f60>] ? kthread_create_on_node+0x1c0/0x1c0
>> [  822.652195]  [<ffffffff817b203c>] ret_from_fork+0x7c/0xb0
>> [  822.652203]  [<ffffffff81093f60>] ? kthread_create_on_node+0x1c0/0x1c0
>> [  822.652208] ---[ end trace a0c5b4c53beabf24 ]---
>> [  822.652238] ------------[ cut here ]------------
>> [  822.652270] WARNING: CPU: 1 PID: 69 at
>> /home/xxx/install/linux-3.18.0/net/mac80211/driver-ops.h:12
>> ___ieee80211_stop_rx_ba_session+0x279/0x280 [mac80211]()
>> [  822.652274] wlan1:  Failed check-sdata-in-driver check, flags: 0x2
>> [  822.652278] Modules linked in: ctr ccm arc4 openvswitch geneve gre
>> vxlan ip6_udp_tunnel udp_tunnel libcrc32c nls_iso8859_1 gpio_ich
>> coretemp kvm_intel kvm crct10dif_pclmul crc32_pclmul
>> ghash_clmulni_intel aesni_intel aes_x86_64 lrw gf128mul glue_helper
>> ablk_helper cryptd lpc_ich ast ttm joydev drm_kms_helper drm
>> ath10k_pci syscopyarea ath10k_core sysfillrect sysimgblt ath mac80211
>> 8250_fintek ipmi_si cfg80211 ipmi_msghandler i2c_ismt mac_hid shpchp
>> btrfs xor raid6_pq uas usb_storage hid_generic usbhid hid igb
>> i2c_algo_bit dca ahci ptp libahci pps_core
>> [  822.652362] CPU: 1 PID: 69 Comm: kworker/1:1 Tainted: G        W
>>   3.18.0-13-generic #14
>> [  822.652366] Hardware name: Supermicro A1SAi/A1SRi, BIOS 1.0c 02/27/2014
>> [  822.652390] Workqueue: events ieee80211_restart_work [mac80211]
>> [  822.652395]  0000000000000009 ffff8804654477d8 ffffffff817aa898
>> 0000000000000007
>> [  822.652403]  ffff880465447828 ffff880465447818 ffffffff81074921
>> ffff8804654477f8
>> [  822.652410]  ffff8804678e4680 ffff880465da28c0 ffff88046485c000
>> ffff88046485c340
>> [  822.652418] Call Trace:
>> [  822.652427]  [<ffffffff817aa898>] dump_stack+0x46/0x58
>> [  822.652435]  [<ffffffff81074921>] warn_slowpath_common+0x81/0xa0
>> [  822.652442]  [<ffffffff81074986>] warn_slowpath_fmt+0x46/0x50
>> [  822.652474]  [<ffffffffc0457ec9>]
>> ___ieee80211_stop_rx_ba_session+0x279/0x280 [mac80211]
>> [  822.652504]  [<ffffffffc0457f1f>]
>> __ieee80211_stop_rx_ba_session+0x4f/0x70 [mac80211]
>> [  822.652534]  [<ffffffffc045560c>]
>> ieee80211_sta_tear_down_BA_sessions+0x5c/0x70 [mac80211]
>> [  822.652561]  [<ffffffffc044c3e8>]
>> __sta_info_destroy_part1+0x48/0x200 [mac80211]
>>
>>
>> uname -a
>> Linux kyushu 3.18.0-13-generic #14 SMP Sun Feb 22 22:34:19 CET 2015
>> x86_64 x86_64 x86_64 GNU/Linux
>>
>>
>> cat /proc/cpuinfo
>> processor : 0
>> vendor_id : GenuineIntel
>> cpu family : 6
>> model : 77
>> model name : Intel(R) Atom(TM) CPU  C2558  @ 2.40GHz
>> stepping : 8
>> microcode : 0x121
>> cpu MHz : 1200.000
>> cache size : 1024 KB
>> physical id : 0
>> siblings : 4
>> core id : 0
>> cpu cores : 4
>> apicid : 0
>> initial apicid : 0
>> fpu : yes
>> fpu_exception : yes
>> cpuid level : 11
>> wp : yes
>> flags : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
>> pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx
>> rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology
>> nonstop_tsc aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2
>> ssse3 cx16 xtpr pdcm sse4_1 sse4_2 movbe popcnt tsc_deadline_timer aes
>> rdrand lahf_lm 3dnowprefetch arat epb dtherm tpr_shadow vnmi
>> flexpriority ept vpid tsc_adjust smep erms
>> bugs :
>> bogomips : 4799.58
>> clflush size : 64
>> cache_alignment : 64
>> address sizes : 36 bits physical, 48 bits virtual
>> power management:
>>
>> _______________________________________________
>> ath10k mailing list
>> ath10k@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/ath10k
>>
>
>
> --
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
