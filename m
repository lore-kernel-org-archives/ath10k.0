Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk0-x231.google.com ([2607:f8b0:400d:c09::231])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eHabx-0004ab-UO
 for ath10k@lists.infradead.org; Wed, 22 Nov 2017 19:23:08 +0000
Received: by mail-qk0-x231.google.com with SMTP id p19so18184883qke.2
 for <ath10k@lists.infradead.org>; Wed, 22 Nov 2017 11:22:45 -0800 (PST)
MIME-Version: 1.0
From: Konstantin Bogomolov <konstantin.bogomolov@dejero.com>
Date: Wed, 22 Nov 2017 14:22:43 -0500
Message-ID: <CAGT1WQM6uiP6GHW9ukNUPf+JcZckENz514gg0DiR7CCO=5K+Fg@mail.gmail.com>
Subject: Kernel panic hosting 5Ghz AP
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

Hi everyone,

I have an issue where I get a kernel panic upon hosting the following
AP with hostapd version 2.4 :

# cat hostapd1.conf
interface=hotspot0
driver=nl80211
hw_mode=a
channel=0
ieee80211d=1
country_code=CA
ieee80211ac=1
ssid=test5
auth_algs=1
wpa=2
wpa_key_mgmt=WPA-PSK
rsn_pairwise=CCMP
wpa_passphrase=testtest

I am using a stock Debian Stretch 4.9 kernel, with the latest ath10k
firmware. The card I am using is:

02:00.0 Network controller: Qualcomm Atheros QCA6174 802.11ac Wireless
Network Adapter (rev 32)
    Subsystem: AzureWave QCA6174 802.11ac Wireless Network Adapter
    Flags: bus master, fast devsel, latency 0, IRQ 326
    Memory at df000000 (64-bit, non-prefetchable) [size=2M]
    Capabilities: [40] Power Management version 3
    Capabilities: [50] MSI: Enable+ Count=1/8 Maskable+ 64bit-
    Capabilities: [70] Express Endpoint, MSI 00
    Capabilities: [100] Advanced Error Reporting
    Capabilities: [148] Virtual Channel
    Capabilities: [168] Device Serial Number 00-00-00-00-00-00-00-00
    Capabilities: [178] Latency Tolerance Reporting
    Capabilities: [180] L1 PM Substates
    Kernel driver in use: ath10k_pci
    Kernel modules: ath10k_pci


I get the following dmesg logs from the panic:

[   84.211731] IPv6: ADDRCONF(NETDEV_UP): hotspot0: link is not ready
[   84.212359] BUG: unable to handle kernel NULL pointer dereference
at 0000000000000020
[   84.212410] IP: [<ffffffffaa8ed9ed>] skb_release_data+0x8d/0x110
[   84.212443] PGD 0
[   84.212453]
[   84.212466] Oops: 0000 [#1] SMP
[   84.212482] Modules linked in: ctr ccm arc4 hid_logitech_hidpp
joydev hid_logitech_dj btusb btrtl appletalk ax25 ipx p8023 p8022
psnap llc cpufreq_conservative cpufreq_powersave cpufreq_userspace
snd_hda_codec_hdmi intel_rapl x86_pkg_temp_thermal intel_powerclamp
coretemp snd_hda_codec_realtek kvm_intel evdev kvm
snd_hda_codec_generic irqbypass crct10dif_pclmul crc32_pclmul
ghash_clmulni_intel intel_cstate intel_uncore intel_rapl_perf
snd_hda_intel snd_hda_codec snd_hda_core pcspkr snd_hwdep ath10k_pci
snd_pcm ath10k_core snd_timer ath mac80211 snd soundcore cfg80211 i915
iTCO_wdt iTCO_vendor_support sg drm_kms_helper drm mei_me shpchp mei
wmi hci_uart btbcm btqca btintel bluetooth battery intel_lpss_acpi
video rfkill intel_lpss mfd_core acpi_pad acpi_als kfifo_buf button
industrialio parport_pc
[   84.212986]  ppdev lp parport ip_tables x_tables autofs4
hid_generic usbhid ext4 crc16 jbd2 crc32c_generic fscrypto ecb mbcache
sd_mod crc32c_intel aesni_intel aes_x86_64 glue_helper lrw gf128mul
ablk_helper cryptd e1000e ahci i2c_i801 i2c_smbus igb i2c_algo_bit dca
ptp pps_core libahci libata scsi_mod xhci_pci xhci_hcd usbcore
usb_common fan thermal i2c_hid hid
[   84.213231] CPU: 1 PID: 324 Comm: dbus-daemon Not tainted
4.9.0-4-amd64 #1 Debian 4.9.51-1
[   84.213266] Hardware name:    /MX110HD, BIOS MX110HD (71471) BIOS
V1.01DL1 10/27/2016
[   84.213300] task: ffff9c0d20b1a1c0 task.stack: ffffaf2e013e0000
[   84.213326] RIP: 0010:[<ffffffffaa8ed9ed>]  [<ffffffffaa8ed9ed>]
skb_release_data+0x8d/0x110
[   84.213366] RSP: 0000:ffff9c0d2ed03de0  EFLAGS: 00010206
[   84.213390] RAX: 0000000000000030 RBX: 0000000000000000 RCX: 0000000000005b6a
[   84.213421] RDX: ffff9c0d22411a20 RSI: ffff9c0d230b5000 RDI: ffff9c0d230b5000
[   84.213452] RBP: ffff9c0d230b5000 R08: 0000000000005b6a R09: ffff9c0d2efcd000
[   84.213482] R10: 000000009f5e7ced R11: 000000000000000f R12: 0000000000000000
[   84.213513] R13: ffff9c0d22aa7540 R14: ffff9c0d22417d70 R15: 0000000000000000
[   84.213544] FS:  00007f3e5880e8c0(0000) GS:ffff9c0d2ed00000(0000)
knlGS:0000000000000000
[   84.213579] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   84.213605] CR2: 0000000000000020 CR3: 00000002626cf000 CR4: 00000000002406e0
[   84.213635] Stack:
[   84.213647]  ffff9c0d2ed03e28 ffff9c0d230b5000 ffff9c0d22417d70
0000000000035030
[   84.213689]  ffffffffaa8edfd7 ffff9c0d2ed03e28 ffff9c0d22411520
ffffffffc09ad60e
[   84.213737]  ffff9c0d230b5000 ffff9c0d2ed03e28 ffff9c0d2ed03e28
0000000000000000
[   84.213780] Call Trace:
[   84.213815]  <IRQ>
[   84.213827]  [<ffffffffaa8edfd7>] ? consume_skb+0x27/0x80
[   84.213857]  [<ffffffffc09ad60e>] ? ath10k_pci_htc_tx_cb+0xbe/0xf0
[ath10k_pci]
[   84.213891]  [<ffffffffc09b1a34>] ?
ath10k_ce_per_engine_service+0x84/0xb0 [ath10k_pci]
[   84.213927]  [<ffffffffc09b1ad0>] ?
ath10k_ce_per_engine_service_any+0x70/0x90 [ath10k_pci]
[   84.213964]  [<ffffffffc09af9ca>] ? ath10k_pci_napi_poll+0x3a/0xf0
[ath10k_pci]
[   84.213997]  [<ffffffffaa902c30>] ? net_rx_action+0x240/0x370
[   84.214025]  [<ffffffffaaa0b0d5>] ? __do_softirq+0x105/0x290
[   84.214052]  [<ffffffffaa47cf8e>] ? irq_exit+0xae/0xb0
[   84.214076]  [<ffffffffaaa0ae2f>] ? do_IRQ+0x4f/0xd0
[   84.214101]  [<ffffffffaaa08f42>] ? common_interrupt+0x82/0x82
[   84.214127]  <EOI>
[   84.214138] Code:
[   84.214151] 03 48 c1 e8 37 83 e0 07 83 f8 04 74 49 41 0f b6 45 00
41 83 c4 01 44 39 e0 7e 51 49 63 c4 48 83 c0 03 48 c1 e0 04 49 8b 5c
05 00 <48> 8b 43 20 48 8d 50 ff a8 01 48 0f 45 da f0 ff 4b 1c 75 bf 48
[   84.214390] RIP  [<ffffffffaa8ed9ed>] skb_release_data+0x8d/0x110
[   84.214421]  RSP <ffff9c0d2ed03de0>
[   84.214438] CR2: 0000000000000020


And here's a backtrace from the kernel core dump of it:

crash> bt
PID: 324    TASK: ffff9c0d20b1a1c0  CPU: 1   COMMAND: "dbus-daemon"
 #0 [ffff9c0d2ed03b80] machine_kexec at ffffffffaa451f28
 #1 [ffff9c0d2ed03bd8] __crash_kexec at ffffffffaa503789
 #2 [ffff9c0d2ed03c98] crash_kexec at ffffffffaa5038a8
 #3 [ffff9c0d2ed03cb0] oops_end at ffffffffaa4289e3
 #4 [ffff9c0d2ed03cd0] no_context at ffffffffaa45f451
 #5 [ffff9c0d2ed03d30] page_fault at ffffffffaaa09998
    [exception RIP: skb_release_data+141]
    RIP: ffffffffaa8ed9ed  RSP: ffff9c0d2ed03de0  RFLAGS: 00010206
    RAX: 0000000000000030  RBX: 0000000000000000  RCX: 0000000000005b6a
    RDX: ffff9c0d22411a20  RSI: ffff9c0d230b5000  RDI: ffff9c0d230b5000
    RBP: ffff9c0d230b5000   R8: 0000000000005b6a   R9: ffff9c0d2efcd000
    R10: 000000009f5e7ced  R11: 000000000000000f  R12: 0000000000000000
    R13: ffff9c0d22aa7540  R14: ffff9c0d22417d70  R15: 0000000000000000
    ORIG_RAX: ffffffffffffffff  CS: 0010  SS: 0000
 #6 [ffff9c0d2ed03e00] consume_skb at ffffffffaa8edfd7
 #7 [ffff9c0d2ed03e18] ath10k_pci_htc_tx_cb at ffffffffc09ad60e [ath10k_pci]
 #8 [ffff9c0d2ed03e60] ath10k_ce_per_engine_service at
ffffffffc09b1a34 [ath10k_pci]
 #9 [ffff9c0d2ed03e90] ath10k_ce_per_engine_service_any at
ffffffffc09b1ad0 [ath10k_pci]
#10 [ffff9c0d2ed03eb8] ath10k_pci_napi_poll at ffffffffc09af9ca [ath10k_pci]
#11 [ffff9c0d2ed03ee0] net_rx_action at ffffffffaa902c30
#12 [ffff9c0d2ed03f50] __softirqentry_text_start at ffffffffaaa0b0d5
#13 [ffff9c0d2ed03fb8] irq_exit at ffffffffaa47cf8e
--- <IRQ stack> ---
bt: cannot transition from IRQ stack to current process stack:
        IRQ stack pointer: ffff9c0d2ed03b80
    process stack pointer: ffffffffaa47cf66
       current stack base: ffffaf2e013e0000

I've shared the full dmesg logs and core dump if anyone wants to see
those (https://drive.google.com/file/d/1L7zga3XtlYPfWnmoq1T4R5EHtl5Lq3Fb/view).
Thanks in advance for the help!

Konstantin

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
