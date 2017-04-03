Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi0-x233.google.com ([2607:f8b0:4003:c06::233])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cv72r-0001QV-D6
 for ath10k@lists.infradead.org; Mon, 03 Apr 2017 18:49:43 +0000
Received: by mail-oi0-x233.google.com with SMTP id b187so137185037oif.0
 for <ath10k@lists.infradead.org>; Mon, 03 Apr 2017 11:49:20 -0700 (PDT)
MIME-Version: 1.0
From: Chris Price <chris.price@dejero.com>
Date: Mon, 3 Apr 2017 14:49:19 -0400
Message-ID: <CALJ2kaHk--2A5hj2Kp-GHUiojU5CyDqGKaREjQ6RDRZkepS8xg@mail.gmail.com>
Subject: Kernel panic on ACS
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

I am running a stock install of Debian stretch (kernel 4.9.0). I
installed the ath10k backports built from the linux-stable repo at
hash bc49a7831b11. I was using a vanilla 4.11 RC kernel and getting
the same panic, but was having issues with kexec so couldn't collect
diagnostics.

This occurs when I try to start hostapd with the following configuration.
interface=wlp2s0
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

My current hostapd version is 2.4, but I've seen the same panic using 2.6.

The tail of dmesg is as follows.
[   87.718676] BUG: unable to handle kernel NULL pointer dereference
at 0000000000000020
[   87.719700] IP: [<ffffffffb30df99d>] skb_release_data+0x8d/0x110
[   87.720747] PGD 0
[   87.720758]
[   87.721795] Oops: 0000 [#1] SMP
[   87.722811] Modules linked in: ath10k_pci(OE) ath10k_core(OE)
ath(OE) mac80211(OE) cfg80211(OE) ctr ccm arc4 joydev hid_generic
btusb btrtl usbhid intel_rapl x86_pkg_temp_thermal intel_powerclamp
coretemp kvm_intel kvm compat(OE) irqbypass crct10dif_pclmul
crc32_pclmul ghash_clmulni_intel intel_cstate ppdev evdev intel_uncore
intel_rapl_perf pcspkr iTCO_wdt iTCO_vendor_support shpchp sg mei_me
i915 mei wmi hci_uart btbcm btqca btintel bluetooth drm_kms_helper
parport_pc intel_lpss_acpi intel_lpss battery parport video rfkill drm
mfd_core acpi_pad button tpm_tis tpm_tis_core tpm acpi_als kfifo_buf
industrialio ip_tables x_tables autofs4 ext4 crc16 jbd2 crc32c_generic
fscrypto ecb mbcache sd_mod crc32c_intel aesni_intel aes_x86_64
glue_helper lrw gf128mul ablk_helper cryptd igb e1000e ahci libahci
[   87.728233]  xhci_pci xhci_hcd libata i2c_i801 i2c_smbus usbcore
scsi_mod i2c_algo_bit dca ptp pps_core usb_common fan thermal i2c_hid
hid fjes [last unloaded: cfg80211]
[   87.729999] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G           OE
4.9.0-1-amd64 #1 Debian 4.9.2-2
[   87.730891] Hardware name:    /MX110HD, BIOS MX110HD (71471) BIOS
V1.00 05/20/2016
[   87.731771] task: ffffffffb380e500 task.stack: ffffffffb3800000
[   87.732632] RIP: 0010:[<ffffffffb30df99d>]  [<ffffffffb30df99d>]
skb_release_data+0x8d/0x110
[   87.733521] RSP: 0018:ffff97326ec03de0  EFLAGS: 00010206
[   87.734408] RAX: 0000000000000030 RBX: 0000000000000000 RCX: 000000000000027f
[   87.735297] RDX: ffff9732610922e0 RSI: ffff973260e2e500 RDI: ffff973260e2e500
[   87.736190] RBP: ffff973260e2e500 R08: ffffffffffffffff R09: ffff97326ef8b000
[   87.737076] R10: 0000000000000142 R11: 0000000000000053 R12: 0000000000000000
[   87.737980] R13: ffff973261c2d440 R14: ffff973261098820 R15: 0000000000000000
[   87.738876] FS:  0000000000000000(0000) GS:ffff97326ec00000(0000)
knlGS:0000000000000000
[   87.739764] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   87.740622] CR2: 0000000000000020 CR3: 000000003ca07000 CR4: 00000000002406f0
[   87.741489] Stack:
[   87.742359]  ffff97326ec03e28 ffff973260e2e500 ffff973261098820
0000000000035030
[   87.743244]  ffffffffb30dfef7 ffff97326ec03e28 ffff973261091dc0
ffffffffc093c73e
[   87.744130]  ffff973260e2e500 ffff97326ec03e28 ffff97326ec03e28
ffff973200000000
[   87.745009] Call Trace:
[   87.745881]  <IRQ>
[   87.745891]  [<ffffffffb30dfef7>] ? consume_skb+0x27/0x80
[   87.746792]  [<ffffffffc093c73e>] ? ath10k_pci_htc_tx_cb+0xbe/0xf0
[ath10k_pci]
[   87.747701]  [<ffffffffc0940ec4>] ?
ath10k_ce_per_engine_service+0x84/0xb0 [ath10k_pci]
[   87.748624]  [<ffffffffc0940f60>] ?
ath10k_ce_per_engine_service_any+0x70/0x90 [ath10k_pci]
[   87.749544]  [<ffffffffc093ec7a>] ? ath10k_pci_napi_poll+0x3a/0xf0
[ath10k_pci]
[   87.750445]  [<ffffffffb30f4a50>] ? net_rx_action+0x240/0x370
[   87.751343]  [<ffffffffb31fc755>] ? __do_softirq+0x105/0x290
[   87.752239]  [<ffffffffb2c7ce8e>] ? irq_exit+0xae/0xb0
[   87.753128]  [<ffffffffb31fc4af>] ? do_IRQ+0x4f/0xd0
[   87.754019]  [<ffffffffb31fa5c2>] ? common_interrupt+0x82/0x82
[   87.754905]  <EOI>
[   87.754915]  [<ffffffffb30bf6ca>] ? cpuidle_enter_state+0x11a/0x2b0
[   87.755831]  [<ffffffffb2cb9454>] ? cpu_startup_entry+0x154/0x240
[   87.756754]  [<ffffffffb3937f57>] ? start_kernel+0x443/0x463
[   87.757676]  [<ffffffffb3937120>] ? early_idt_handler_array+0x120/0x120
[   87.758612]  [<ffffffffb3937408>] ? x86_64_start_kernel+0x14c/0x170
[   87.759513] Code: 03 48 c1 e8 37 83 e0 07 83 f8 04 74 49 41 0f b6
45 00 41 83 c4 01 44 39 e0 7e 51 49 63 c4 48 83 c0 03 48 c1 e0 04 49
8b 5c 05 00 <48> 8b 43 20 48 8d 50 ff a8 01 48 0f 45 da f0 ff 4b 1c 75
bf 48
[   87.761542] RIP  [<ffffffffb30df99d>] skb_release_data+0x8d/0x110
[   87.762491]  RSP <ffff97326ec03de0>
[   87.763424] CR2: 0000000000000020

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
