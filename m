Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZrBHU-0007uY-1F
 for ath10k@lists.infradead.org; Tue, 27 Oct 2015 20:55:44 +0000
Received: from [192.168.100.149] (firewall.candelatech.com [50.251.239.81])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 2876940A959
 for <ath10k@lists.infradead.org>; Tue, 27 Oct 2015 13:55:23 -0700 (PDT)
From: Ben Greear <greearb@candelatech.com>
Subject: Crash in hacked 'ath' tree on module removal.
Message-ID: <562FE4BA.30106@candelatech.com>
Date: Tue, 27 Oct 2015 13:55:22 -0700
MIME-Version: 1.0
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

I've added all my normal set of kernel patches and I'm running non-stock
firmware for QCA99X NIC.  So, feel free to ignore, but I don't think I've
messed with anything that could cause this.

On module removal, I see this splat:

[ 4480.895505] ath10k_pci 0000:05:00.0: could not request stats (type 1 ret -95)
[ 4480.895509] ath10k_pci 0000:05:00.0: failed to get fw stats for ethtool: -95
[ 4480.908775] ath10k_pci 0000:05:00.0: could not request stats (type 1 ret -95)
[ 4480.908778] ath10k_pci 0000:05:00.0: failed to get fw stats for ethtool: -95
[ 4480.912267] ath10k_pci 0000:05:00.0: mac vdev 0 delete (remove interface)
[ 4480.912271] ath10k_pci 0000:05:00.0: WMI vdev delete id 0
[ 4483.915642] ath10k_pci 0000:05:00.0: failed to delete WMI vdev 0: -11
[ 4483.915697] ath10k_pci 0000:05:00.0: wmi disable pktlog
[ 4489.922496] ath10k_pci 0000:05:00.0: could not suspend target (-11)
[ 4489.922512] ath10k_pci 0000:05:00.0: boot hif stop
[ 4489.922586] ath10k_pci 0000:05:00.0: boot qca99x0 chip reset
[ 4489.922587] ath10k_pci 0000:05:00.0: boot cold reset
[ 4489.964540] ath10k_pci 0000:05:00.0: boot cold reset complete
[ 4489.964548] ath10k_pci 0000:05:00.0: boot waiting target to initialise
[ 4489.964564] ath10k_pci 0000:05:00.0: boot target indicator 2
[ 4489.964570] ath10k_pci 0000:05:00.0: boot target initialised
[ 4489.964572] ath10k_pci 0000:05:00.0: boot qca99x0 chip reset complete (cold)
[ 4489.965967] ath10k_pci 0000:05:00.0: boot hif power down
[ 4489.982117] BUG: unable to handle kernel NULL pointer dereference at 000000000000035c
[ 4489.988889] IP: [<ffffffffa0d5939d>] ath10k_pci_free_irq+0x38/0x50 [ath10k_pci]
[ 4489.995094] PGD cbeb1067 PUD c6453067 PMD 0
[ 4489.998294] Oops: 0000 [#1] PREEMPT SMP
[ 4490.001167] Modules linked in: nf_conntrack_netlink nf_conntrack nfnetlink nf_defrag_ipv4 8021q garp mrp stp llc bnep bluetooth fuse macvlan pktgen 
rpcsec_gss_krb5 nfsv4 nfs fscache coretemp hwmon intel_rapl ath10k_pci(-) ath10k_core ath mac80211 snd_hda_codec_hdmi iosf_mbi iTCO_wdt iTCO_vendor_support 
x86_pkg_temp_thermal intel_powerclamp kvm_intel snd_hda_codec_realtek kvm joydev snd_hda_codec_generic cfg80211 snd_hda_intel microcode pcspkr serio_raw 
i2c_i801 snd_hda_codec snd_hda_core snd_hwdep snd_seq snd_seq_device lpc_ich snd_pcm snd_timer snd shpchp soundcore 8250_fintek nfsd auth_rpcgss nfs_acl lockd 
grace sunrpc ata_generic pata_acpi i915 e1000e i2c_algo_bit ptp pps_core drm_kms_helper drm i2c_core fjes video ipv6 [last unloaded: ath9k_hw]
[ 4490.069708] CPU: 1 PID: 17257 Comm: rmmod Tainted: G        W       4.3.0-rc6-wl-ath+ #28
[ 4490.077172] Hardware name: To be filled by O.E.M. To be filled by O.E.M./HURONRIVER, BIOS 4.6.5 05/02/2012
[ 4490.086161] task: ffff8800d4ba9cc0 ti: ffff8800c65e4000 task.ti: ffff8800c65e4000
[ 4490.093010] RIP: 0010:[<ffffffffa0d5939d>]  [<ffffffffa0d5939d>] ath10k_pci_free_irq+0x38/0x50 [ath10k_pci]
[ 4490.102186] RSP: 0018:ffff8800c65e7de0  EFLAGS: 00010297
[ 4490.106932] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 000000007fffffff
[ 4490.113530] RDX: 0000000000000000 RSI: ffff880213789c40 RDI: ffff880213789c40
[ 4490.120151] RBP: ffff8800c65e7df8 R08: 0000000000000000 R09: 0000000000000000
[ 4490.126804] R10: ffff8800c65e7e48 R11: 0000000000080001 R12: ffff880213789c40
[ 4490.133471] R13: 0000000000000001 R14: 0000000000000000 R15: 00000000020dd250
[ 4490.140156] FS:  00007f29e68b2740(0000) GS:ffff88021ea80000(0000) knlGS:0000000000000000
[ 4490.147831] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 4490.153184] CR2: 000000000000035c CR3: 00000000c6451000 CR4: 00000000000406e0
[ 4490.159958] Stack:
[ 4490.161607]  ffff880213789c40 ffff880215132000 ffffffffa0d5f4a0 ffff8800c65e7e10
[ 4490.168749]  ffffffffa0d59a92 ffff880215132098 ffff8800c65e7e38 ffffffff81374298
[ 4490.175911]  ffff880215132098 ffffffffa0d5f508 ffff8802151320f8 ffff8800c65e7e58
[ 4490.183094] Call Trace:
[ 4490.185277]  [<ffffffffa0d59a92>] ath10k_pci_remove+0x35/0x70 [ath10k_pci]
[ 4490.191934]  [<ffffffff81374298>] pci_device_remove+0x34/0x8e
[ 4490.197475]  [<ffffffff8144ac39>] __device_release_driver+0x93/0x107
[ 4490.203651]  [<ffffffff8144ad6d>] driver_detach+0x85/0xab
[ 4490.208882]  [<ffffffff8144a052>] bus_remove_driver+0x8e/0xab
[ 4490.214470]  [<ffffffff8144b364>] driver_unregister+0x3f/0x42
[ 4490.220069]  [<ffffffff81373b32>] pci_unregister_driver+0x23/0x7c
[ 4490.226034]  [<ffffffffa0d5da6f>] ath10k_pci_exit+0x10/0x12 [ath10k_pci]
[ 4490.232632]  [<ffffffff81146268>] SyS_delete_module+0x124/0x1c0
[ 4490.238465]  [<ffffffff81003909>] ? syscall_return_slowpath+0xc8/0x10b
[ 4490.244931]  [<ffffffff816892b6>] entry_SYSCALL_64_fastpath+0x16/0x75
[ 4490.251315] Code: 54 49 89 fc 53 31 db 41 83 bc 24 60 2b 00 00 00 44 89 e8 41 0f 4f 84 24 60 2b 00 00 39 c3 7d 1c 49 8b 84 24 38 2b 00 00 4c 89 e6 <8b> b8 5c 
03 00 00 01 df ff c3 e8 e4 d6 3c e0 eb cb 5b 41 5c 41
[ 4490.272502] RIP  [<ffffffffa0d5939d>] ath10k_pci_free_irq+0x38/0x50 [ath10k_pci]
[ 4490.280052]  RSP <ffff8800c65e7de0>
[ 4490.283689] CR2: 000000000000035c
[ 4490.296196] ---[ end trace ff6e1b7ef7fa8afc ]---

(gdb) l *(ath10k_pci_free_irq+0x38)
0x3c1 is in ath10k_pci_free_irq (/home/greearb/git/linux.ath/drivers/net/wireless/ath/ath10k/pci.c:3042).
3037		int i;
3038	
3039		/* There's at least one interrupt irregardless whether its legacy INTR
3040		 * or MSI or MSI-X */
3041		for (i = 0; i < max(1, ar_pci->num_msi_intrs); i++)
3042			free_irq(ar_pci->pdev->irq + i, ar);
3043	}
3044	
3045	static void ath10k_pci_init_irq_tasklets(struct ath10k *ar)
3046	{
(gdb)


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
