Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vk0-f42.google.com ([209.85.213.42])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cXfP3-00011I-Ss
 for ath10k@lists.infradead.org; Sun, 29 Jan 2017 02:39:43 +0000
Received: by mail-vk0-f42.google.com with SMTP id k127so197598614vke.0
 for <ath10k@lists.infradead.org>; Sat, 28 Jan 2017 18:39:20 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87y3xw4ieo.fsf@kamboji.qca.qualcomm.com>
References: <CAMVG2ssLQ897kVVE2jZrqsDm2XFmq7snoOG649FgGEogVjWX7g@mail.gmail.com>
 <87y3xw4ieo.fsf@kamboji.qca.qualcomm.com>
From: Daniel J Blueman <daniel@quora.org>
Date: Sun, 29 Jan 2017 10:38:19 +0800
Message-ID: <CAMVG2stRGR-rUAXABRaJjgD-816J5s2Jug0cB_sgfjnTjDWobg@mail.gmail.com>
Subject: Re: Incomplete scan results after rf(un)kill
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 27 January 2017 at 23:44, Valo, Kalle <kvalo@qca.qualcomm.com> wrote:
> Daniel J Blueman <daniel@quora.org> writes:
>
>> On 4.9.5 and previous, I've noticed that 20% of the time after
>> rfunkilling, AP scan results would often have only 1-2 out of the
>> previous 10 APs, and the situation would persist until removing and
>> reinserting the ath10k_pci module.
>>
>> This is on my Dell XPS 13 9360 (Kaby Lake) with current BIOS 1.2.3 on
>> Ubuntu (ElementaryOS) 16.04 with updates.
>>
>> Could this have any relation to the missing firmware [1]?
>>
>> What state can I capture to help diagnose this?
>
> Do you see any pattern what APs are visible when the bug happens? For
> example, are those 1-2 APs always the same one? And are they ones with
> strongest signal strength or maybe related to certain channels?
>
> After the bug happens how does the device work otherwise? Have you
> tested performance (iperf) or signal strength? Is there any packet loss
> etc?

Many thanks for following up Kalle! Interestingly, I do see the same
subset of APs (but not the strongest) in the Networkmanager GUI,
however when I scan from the CLI, nothing:

# nmcli dev wifi
*  SSID  MODE  CHAN  RATE  SIGNAL  BARS  SECURITY
#

The issue also occurs when coming out of suspend. I didn't check dmesg
other times, but this may or may not be related:

[  204.454815] WARNING: CPU: 3 PID: 0 at
/home/kernel/COD/linux/net/core/dev.c:5161 net_rx_action+0x26e/0x380
[  204.454818] Modules linked in: rfcomm ccm xt_CHECKSUM
ipt_MASQUERADE nf_nat_masquerade_ipv4 iptable_nat nf_nat_ipv4 bridge
stp llc ebtable_filter ebtables bnep binfmt_misc f2fs arc4
nls_iso8859_1 hid_multitouch snd_hda_codec_hdmi dell_led
snd_hda_codec_realtek snd_hda_codec_generic snd_soc_skl
snd_soc_skl_ipc snd_soc_sst_ipc snd_soc_sst_dsp snd_hda_ext_core
snd_soc_sst_match snd_soc_core snd_compress ac97_bus snd_pcm_dmaengine
dell_laptop dell_wmi dell_smbios snd_hda_intel snd_hda_codec
i2c_designware_platform i2c_designware_core dcdbas snd_hda_core
snd_hwdep snd_pcm snd_seq_midi intel_rapl x86_pkg_temp_thermal
snd_seq_midi_event intel_powerclamp coretemp snd_rawmidi
crct10dif_pclmul crc32_pclmul ghash_clmulni_intel snd_seq uvcvideo
aesni_intel ath10k_pci videobuf2_vmalloc ath10k_core videobuf2_memops
[  204.454847]  videobuf2_v4l2 aes_x86_64 ath lrw snd_seq_device
glue_helper ablk_helper mac80211 input_leds cryptd snd_timer
videobuf2_core joydev videodev serio_raw media snd cfg80211
rtsx_pci_ms memstick soundcore btusb btrtl hci_uart btbcm btqca
soc_button_array btintel intel_vbtn bluetooth int3400_thermal acpi_pad
acpi_thermal_rel intel_lpss_acpi intel_hid int3403_thermal
sparse_keymap mac_hid idma64 acpi_als virt_dma
processor_thermal_device int340x_thermal_zone mei_me kfifo_buf
industrialio intel_pch_thermal mei intel_lpss_pci shpchp
intel_soc_dts_iosf intel_lpss kvm_intel kvm irqbypass ipt_REJECT
nf_reject_ipv4 xt_DSCP iptable_mangle xt_limit xt_tcpudp xt_addrtype
nf_conntrack_ipv4 nf_defrag_ipv4 xt_conntrack ip6_tables
nf_conntrack_netbios_ns nf_conntrack_broadcast nf_nat_ftp sch_fq_codel
nf_nat
[  204.454883]  nf_conntrack_ftp tcp_bbr nf_conntrack iptable_filter
parport_pc ip_tables x_tables ppdev lp parport autofs4 mmc_block
rtsx_pci_sdmmc i915 psmouse i2c_algo_bit nvme drm_kms_helper nvme_core
syscopyarea sysfillrect rtsx_pci sysimgblt fb_sys_fops drm i2c_hid wmi
hid pinctrl_sunrisepoint video pinctrl_intel fjes
[  204.454904] CPU: 3 PID: 0 Comm: swapper/3 Tainted: G     U
4.9.6-040906-generic #201701260330
[  204.454906] Hardware name: Dell Inc. XPS 13 9360/0T3FTF, BIOS 1.3.2
01/18/2017
[  204.454908]  ffff911b3e583e68 ffffffff81c1bf92 0000000000000000
0000000000000000
[  204.454910]  ffff911b3e583ea8 ffffffff81883e7b 0000142900000040
ffff911b2f687c80
[  204.454913]  0000000000000040 0000000000000000 000000000000012c
0000000000000047
[  204.454916] Call Trace:
[  204.454917]  <IRQ>
[  204.454922]  [<ffffffff81c1bf92>] dump_stack+0x63/0x81
[  204.454925]  [<ffffffff81883e7b>] __warn+0xcb/0xf0
[  204.454927]  [<ffffffff81883fad>] warn_slowpath_null+0x1d/0x20
[  204.454928]  [<ffffffff81f73eae>] net_rx_action+0x26e/0x380
[  204.454933]  [<ffffffffc06f3e24>] ?
ath10k_pci_interrupt_handler+0x74/0xd0 [ath10k_pci]
[  204.454935]  [<ffffffff82094654>] __do_softirq+0x104/0x28c
[  204.454937]  [<ffffffff8188a336>] irq_exit+0xb6/0xc0
[  204.454938]  [<ffffffff820943a4>] do_IRQ+0x54/0xd0
[  204.454940]  [<ffffffff82092482>] common_interrupt+0x82/0x82
[  204.454940]  <EOI>
[  204.454943]  [<ffffffff81f13dd2>] ? cpuidle_enter_state+0x122/0x2c0
[  204.454944]  [<ffffffff81f13fa7>] cpuidle_enter+0x17/0x20
[  204.454946]  [<ffffffff818c9f53>] call_cpuidle+0x23/0x40
[  204.454947]  [<ffffffff818ca1cb>] cpu_startup_entry+0x15b/0x240
[  204.454950]  [<ffffffff81851b74>] start_secondary+0x154/0x190

Daniel
-- 
Daniel J Blueman

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
