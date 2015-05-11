Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout.gmx.net ([212.227.15.15])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YrnAi-00081V-ME
 for ath10k@lists.infradead.org; Mon, 11 May 2015 12:51:01 +0000
Received: from [192.168.0.21] ([80.206.126.150]) by mail.gmx.com (mrgmx003)
 with ESMTPSA (Nemesis) id 0M4WNA-1Z8F9608eC-00ykom for
 <ath10k@lists.infradead.org>; Mon, 11 May 2015 14:50:36 +0200
Message-ID: <5550A5A4.8080908@gmx.com>
Date: Mon, 11 May 2015 14:50:44 +0200
From: Gabriele Martino <g.martino@gmx.com>
MIME-Version: 1.0
Subject: ath10k: freeze after disconnection on killer1525
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi,
I'm using a Killer 1525 with hw2.1 firmware, and sometimes it stop working.
I can get it working again disconnecting and reconnecting, but sometimes
on disconnection it freezes for a long time:

[ 2740.035190] dmar: DRHD: handling fault status reg 2
[ 2740.035195] dmar: DMAR:[DMA Read] Request device [03:00.0] fault addr
ffbeb000
               DMAR:[fault reason 06] PTE Read access is not
set                                               
[ 2797.979143] wlp3s0: deauthenticating from 64:31:50:e9:1c:71 by local
choice (Reason: 3=DEAUTH_LEAVING)
[ 2800.979030] ath10k_pci 0000:03:00.0: failed to set PS Mode 0 for vdev
0: -11
[ 2800.979034] ath10k_pci 0000:03:00.0: failed to setup powersave: -11
[ 2800.979035] ath10k_pci 0000:03:00.0: failed to setup ps on vdev 0: -11
[ 2805.979025] ath10k_pci 0000:03:00.0: failed to flush transmit queue
(skip 0 ar-state 1): 0
[ 2808.979072] ath10k_pci 0000:03:00.0: failed to install key for vdev 0
peer 64:31:50:e9:1c:71: -11
[ 2808.979078] wlp3s0: failed to remove key (0, 64:31:50:e9:1c:71) from
hardware (-11)
[ 2811.979110] ath10k_pci 0000:03:00.0: failed to delete peer
64:31:50:e9:1c:71 for vdev 0: -11
[ 2811.979116] ------------[ cut here ]------------
[ 2811.979121] WARNING: CPU: 4 PID: 1084 at net/mac80211/sta_info.c:911
__sta_info_destroy_part2+0x1b3/0x210()
[ 2811.979122] Modules linked in: bbswitch(O) joydev uvcvideo
videobuf2_vmalloc videobuf2_memops videobuf2_core rtsx_pci_sdmmc
mmc_core rtsx_pci_ms memstick x86_pkg_temp_thermal intel_powerclamp
iTCO_wdt iTCO_vendor_support dell_wmi sparse_keymap kvm_intel kvm
snd_hda_codec_hdmi snd_hda_codec_ca0132 ath3k btusb crct10dif_pclmul
crc32_pclmul btbcm crc32c_intel btintel bluetooth ghash_clmulni_intel
snd_soc_rt5640 aesni_intel ath10k_pci snd_hda_intel regmap_i2c
snd_soc_rl6231 snd_soc_core ath10k_core aes_x86_64 glue_helper lrw
ablk_helper snd_hda_controller alx snd_hda_codec rtsx_pci mdio cryptd
hid_generic ath psmouse snd_hwdep microcode ehci_pci snd_hda_core
snd_compress lpc_ich serio_raw efivars ehci_hcd shpchp mfd_core snd_pcm
int3403_thermal wmi int3402_thermal i2c_designware_platform
int340x_thermal_zone
[ 2811.979154]  i2c_designware_core spi_pxa2xx_platform int3400_thermal
evdev acpi_thermal_rel acpi_pad vboxnetflt(O) vboxnetadp(O) vboxdrv(O)
snd_seq_oss snd_seq_midi_event snd_seq snd_seq_device snd_timer snd
uinput ftdi_sio usbserial coretemp tun efivarfs
[ 2811.979165] CPU: 4 PID: 1084 Comm: wpa_supplicant Tainted: G       
W  O    4.1.0-rc1-wl-ath+ #5
[ 2811.979167] Hardware name: Alienware Alienware 15/Alienware 15, BIOS
A03 03/26/2015
[ 2811.979168]  0000000000000000 ffffffff819b8725 ffffffff8167e953
0000000000000000
[ 2811.979170]  ffffffff81046437 ffff8804150c9000 ffff8804181906a0
ffff880418df27c0
[ 2811.979172]  0000000000000001 0000000000000000 ffffffff8163c543
0000000000000000
[ 2811.979174] Call Trace:
[ 2811.979178]  [<ffffffff8167e953>] ? dump_stack+0x47/0x67
[ 2811.979181]  [<ffffffff81046437>] ? warn_slowpath_common+0x77/0xb0
[ 2811.979183]  [<ffffffff8163c543>] ? __sta_info_destroy_part2+0x1b3/0x210
[ 2811.979186]  [<ffffffff8163c7f5>] ? __sta_info_flush+0xe5/0x180
[ 2811.979189]  [<ffffffff8166b785>] ? ieee80211_set_disassoc+0xb5/0x3a0
[ 2811.979191]  [<ffffffff8167012f>] ? ieee80211_mgd_deauth+0xef/0x210
[ 2811.979194]  [<ffffffff8162d089>] ? cfg80211_mlme_deauth+0x69/0x80
[ 2811.979198]  [<ffffffff816176a1>] ? nl80211_deauthenticate+0xd1/0x110
[ 2811.979200]  [<ffffffff815557b3>] ? genl_family_rcv_msg+0x193/0x360
[ 2811.979202]  [<ffffffff81555980>] ? genl_family_rcv_msg+0x360/0x360
[ 2811.979203]  [<ffffffff815559f9>] ? genl_rcv_msg+0x79/0xc0
[ 2811.979205]  [<ffffffff81554fe8>] ? netlink_rcv_skb+0xa8/0xd0
[ 2811.979206]  [<ffffffff8155560f>] ? genl_rcv+0x1f/0x30
[ 2811.979210]  [<ffffffff815547a2>] ? netlink_unicast+0x102/0x180
[ 2811.979212]  [<ffffffff81554d16>] ? netlink_sendmsg+0x4f6/0x610
[ 2811.979216]  [<ffffffff8151a42d>] ? ___sys_sendmsg+0x2ad/0x2d0
[ 2811.979218]  [<ffffffff81050c02>] ? recalc_sigpending+0x12/0x50
[ 2811.979220]  [<ffffffff810515c8>] ? __set_task_blocked+0x28/0x70
[ 2811.979222]  [<ffffffff810539fe>] ? get_signal+0x56e/0x670
[ 2811.979224]  [<ffffffff81053c80>] ? __set_current_blocked+0x30/0x50
[ 2811.979226]  [<ffffffff8100e478>] ? __restore_xstate_sig+0x88/0x620
[ 2811.979228]  [<ffffffff810024d8>] ? do_signal+0x168/0xb40
[ 2811.979230]  [<ffffffff8151ac69>] ? __sys_sendmsg+0x39/0x70
[ 2811.979233]  [<ffffffff81685e1b>] ? system_call_fastpath+0x16/0x6e
[ 2811.979234] ---[ end trace ed7bc926bf7504f8 ]---
[ 2814.979033] ath10k_pci 0000:03:00.0: failed to recalculate rts/cts
prot for vdev 0: -11
[ 2817.979043] ath10k_pci 0000:03:00.0: failed to set protection mode 0
on vdev 0: -11
[ 2820.979041] ath10k_pci 0000:03:00.0: failed to set erp slot for vdev
0: -11
[ 2823.979104] ath10k_pci 0000:03:00.0: failed to set preamble for vdev
0: -11
[ 2826.979041] ath10k_pci 0000:03:00.0: faield to down vdev 0: -11
[ 2829.979079] ath10k_pci 0000:03:00.0: failed to submit vdev param txbf
0x0: -11
[ 2829.979083] ath10k_pci 0000:03:00.0: failed to recalc txbf for vdev
0: -11
[ 2832.979081] ath10k_pci 0000:03:00.0: failed to set vdev wmm params on
vdev 0: -11
[ 2835.979026] ath10k_pci 0000:03:00.0: failed to set vdev wmm params on
vdev 0: -11
[ 2838.979028] ath10k_pci 0000:03:00.0: failed to set vdev wmm params on
vdev 0: -11
[ 2841.979026] ath10k_pci 0000:03:00.0: failed to set vdev wmm params on
vdev 0: -11
[ 2844.979100] ath10k_pci 0000:03:00.0: failed to stop WMI vdev 0: -11
[ 2844.979104] ath10k_pci 0000:03:00.0: failed to stop vdev 0: -11
[ 2847.979109] ath10k_pci 0000:03:00.0: failed to put down monitor vdev
1: -11
[ 2850.979052] ath10k_pci 0000:03:00.0: failed to to request monitor
vdev 1 stop: -11
[ 2855.979104] ath10k_pci 0000:03:00.0: failed to synchronize monitor
vdev 1 stop: -110
[ 2855.979108] ath10k_pci 0000:03:00.0: failed to stop monitor vdev: -110
[ 2860.979031] ath10k_pci 0000:03:00.0: failed to flush transmit queue
(skip 0 ar-state 1): 0
[ 2860.980380] cfg80211: Calling CRDA to update world regulatory domain
[ 2863.983076] ath10k_pci 0000:03:00.0: failed to update channel list: -11
[ 2866.983032] ath10k_pci 0000:03:00.0: failed to set pdev regdomain: -11
[ 2866.983037] cfg80211: World regulatory domain updated:

When it freezes, I can't use any command like ifconfig, iwconfig,
ethtool (they sit there until the freeze ends, ctrl+c is useless).
I can't even rmmod the ath10k_pci. After about a minute, it works again
and the freezed commands are executed.

Regards,
Gabriele


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
