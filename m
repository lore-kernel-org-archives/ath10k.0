Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yk0-x230.google.com ([2607:f8b0:4002:c07::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aMZTZ-0007nh-Q6
 for ath10k@lists.infradead.org; Fri, 22 Jan 2016 11:01:59 +0000
Received: by mail-yk0-x230.google.com with SMTP id s126so56939428ykf.2
 for <ath10k@lists.infradead.org>; Fri, 22 Jan 2016 03:01:37 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CANCHnQp5yF9O3Wo72-FJjDVYFouPj-YoXt+6RmLWTvYavomvMg@mail.gmail.com>
References: <CANCHnQoZJ2Oy7VdCCe-Lv=V0Z_yp86m2z4anG-G=QbZxi69suA@mail.gmail.com>
 <CANCHnQp5yF9O3Wo72-FJjDVYFouPj-YoXt+6RmLWTvYavomvMg@mail.gmail.com>
Date: Fri, 22 Jan 2016 12:01:36 +0100
Message-ID: <CANCHnQryCaT9-qVfVrGO8Y8=cK_4pxbBArtfRQewp_gYA7hMHQ@mail.gmail.com>
Subject: Re: Mesh on ath10k drops all packets
From: Jeroen Roovers <jeroen.roovers@airfi.aero>
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

Maybe related?

Jan 22 11:59:33 wim kernel: IPv6: ADDRCONF(NETDEV_CHANGE): wlan0: link
becomes ready
Jan 22 11:59:33 wim kernel: wlan0: Allocated STA 40:e2:30:cb:9a:11
Jan 22 11:59:33 wim kernel: wlan0: moving STA 40:e2:30:cb:9a:11 to state 2
Jan 22 11:59:33 wim kernel: wlan0: moving STA 40:e2:30:cb:9a:11 to state 3
Jan 22 11:59:33 wim kernel: wlan0: moving STA 40:e2:30:cb:9a:11 to state 2
Jan 22 11:59:33 wim kernel: wlan0: moving STA 40:e2:30:cb:9a:11 to state 1
Jan 22 11:59:33 wim kernel: wlan0: Inserted STA 40:e2:30:cb:9a:11
Jan 22 11:59:34 wim kernel: wlan0: STA 40:e2:30:cb:9a:11 : offset was
invalid, t_offset=3224576486
Jan 22 11:59:35 wim kernel: wlan0: STA 40:e2:30:cb:9a:11 :
t_offset=3225600384, t_offset_setpoint=3224576466,
t_clockdrift=-1023918
Jan 22 11:59:35 wim kernel: wlan0: STA 40:e2:30:cb:9a:11 :
t_clockdrift=-1023918 too large, setpoint reset
Jan 22 11:59:36 wim kernel: wlan0: TBTT : max clockdrift=0; too small to adjust
Jan 22 11:59:36 wim kernel: wlan0: moving STA 40:e2:30:cb:9a:11 to state 2
Jan 22 11:59:36 wim kernel: wlan0: moving STA 40:e2:30:cb:9a:11 to state 3
Jan 22 11:59:36 wim kernel: ------------[ cut here ]------------
Jan 22 11:59:36 wim kernel: WARNING: CPU: 2 PID: 9145 at
drivers/net/wireless/ath/ath10k/mac.c:250
ath10k_install_peer_wep_keys+0x40/0x175 [ath10k_core]()
Jan 22 11:59:36 wim kernel: Modules linked in: ath10k_pci ath10k_core
ath mac80211 cfg80211 sha256_generic drbg ctr ccm usb_storage nfsd
w83627ehf hwmon_vid bn
ep bluetooth snd_mixer_oss arc4 hid_kensington usbhid
snd_hda_codec_realtek snd_hda_codec_generic kvm_amd snd_hda_codec_hdmi
snd_hda_intel snd_hda_codec snd_hw
dep kvm snd_hda_core irqbypass k10temp snd_pcm ohci_pci ohci_hcd
rfkill rtc_cmos wmi ehci_pci ehci_hcd usbcore usb_common snd_timer snd
soundcore [last unloade
d: nvidia]
Jan 22 11:59:36 wim kernel: CPU: 2 PID: 9145 Comm: wpa_supplicant
Tainted: P        W  O    4.4.0-gentoo-JeR #6
Jan 22 11:59:36 wim kernel: Hardware name: To Be Filled By O.E.M. To
Be Filled By O.E.M./870iCafe R2.0, BIOS P1.30 08/26/2011
Jan 22 11:59:36 wim kernel: 0000000080000001 ffffffffad275327
0000000000000000 ffffffffad0414da
Jan 22 11:59:36 wim kernel: ffffffffc0e9dc78 00000000ffffffea
ffff8803be063460 ffff8803be063330
Jan 22 11:59:36 wim kernel: ffff8803fbee77f0 ffffffffc0e9dc78
0000000000000000 ffff88011a9ad4e0
Jan 22 11:59:36 wim kernel: Call Trace:
Jan 22 11:59:36 wim kernel: [<ffffffffad275327>] ? dump_stack+0x4a/0x74
Jan 22 11:59:36 wim kernel: [<ffffffffad0414da>] ?
warn_slowpath_common+0x99/0xae
Jan 22 11:59:36 wim kernel: [<ffffffffc0e9dc78>] ?
ath10k_install_peer_wep_keys+0x40/0x175 [ath10k_core]
Jan 22 11:59:36 wim kernel: [<ffffffffc0e9dc78>] ?
ath10k_install_peer_wep_keys+0x40/0x175 [ath10k_core]
Jan 22 11:59:36 wim kernel: [<ffffffffc0ea2c3f>] ?
ath10k_station_assoc+0x277/0x2c8 [ath10k_core]
Jan 22 11:59:36 wim kernel: [<ffffffffc0ea2f14>] ?
ath10k_sta_state+0x284/0x6c5 [ath10k_core]
Jan 22 11:59:36 wim kernel: [<ffffffffc0e150fa>] ?
drv_sta_state+0x88/0x239 [mac80211]
Jan 22 11:59:36 wim kernel: [<ffffffffc0e17b9c>] ?
sta_info_move_state+0xfb/0x1fb [mac80211]
Jan 22 11:59:36 wim kernel: [<ffffffffc0e2a8b7>] ?
sta_apply_auth_flags.isra.24+0x97/0x13d [mac80211]
Jan 22 11:59:36 wim kernel: [<ffffffffc0e2c130>] ?
ieee80211_change_station+0x1b8/0x2a1 [mac80211]
Jan 22 11:59:36 wim kernel: [<ffffffffc021527b>] ?
nl80211_set_station+0x238/0x2a0 [cfg80211]
Jan 22 11:59:36 wim kernel: [<ffffffffad4ae217>] ?
genl_family_rcv_msg+0x24a/0x29c
Jan 22 11:59:36 wim kernel: [<ffffffffad4ae2a8>] ? genl_rcv_msg+0x3f/0x58
Jan 22 11:59:36 wim kernel: [<ffffffffad4ae269>] ?
genl_family_rcv_msg+0x29c/0x29c
Jan 22 11:59:36 wim kernel: [<ffffffffad4ada06>] ? netlink_rcv_skb+0x44/0x87
Jan 22 11:59:36 wim kernel: [<ffffffffad4adfc0>] ? genl_rcv+0x24/0x31
Jan 22 11:59:36 wim kernel: [<ffffffffad4ad3d3>] ? netlink_unicast+0xc4/0x137
Jan 22 11:59:36 wim kernel: [<ffffffffad4ad8b0>] ? netlink_sendmsg+0x46a/0x481
Jan 22 11:59:36 wim kernel: [<ffffffffad11fb00>] ? SyS_pwrite64+0x5d/0x84
Jan 22 11:59:36 wim kernel: [<ffffffffad47633d>] ? sock_sendmsg_nosec+0xe/0x18
Jan 22 11:59:36 wim kernel: [<ffffffffad476d94>] ? ___sys_sendmsg+0x1b6/0x245
Jan 22 11:59:36 wim kernel: [<ffffffffad0605df>] ? preempt_count_add+0x73/0x85
Jan 22 11:59:36 wim kernel: [<ffffffffad557117>] ?
_raw_spin_unlock_irqrestore+0x14/0x25
Jan 22 11:59:36 wim kernel: [<ffffffffad2b4486>] ? n_tty_write+0x3e6/0x401
Jan 22 11:59:36 wim kernel: [<ffffffffad06de63>] ? __wake_up+0x38/0x49
Jan 22 11:59:36 wim kernel: [<ffffffffad2b8fee>] ? ldsem_up_read+0x15/0x29
Jan 22 11:59:36 wim kernel: [<ffffffffad2b40a0>] ? n_tty_kick_worker+0xad/0xad
Jan 22 11:59:36 wim kernel: [<ffffffffad11eaf0>] ? __vfs_write+0x21/0xa7
Jan 22 11:59:36 wim kernel: [<ffffffffad0fbd2b>] ?
vma_gap_callbacks_propagate+0x16/0x2c
Jan 22 11:59:36 wim kernel: [<ffffffffad4770de>] ? __sys_sendmsg+0x3e/0x5c
Jan 22 11:59:36 wim kernel: [<ffffffffad4770de>] ? __sys_sendmsg+0x3e/0x5c
Jan 22 11:59:36 wim kernel: [<ffffffffad55759b>] ?
entry_SYSCALL_64_fastpath+0x16/0x6e
Jan 22 11:59:36 wim kernel: ---[ end trace a22904699e4ab84b ]---
Jan 22 11:59:36 wim kernel: ath10k_pci 0000:02:00.0: failed to install
peer wep keys for vdev 0: -22
Jan 22 11:59:36 wim kernel: ath10k_pci 0000:02:00.0: failed to
associate station 40:e2:30:cb:9a:11 for vdev 0: -22
Jan 22 11:59:36 wim kernel: wlan0: local STA operates in mode 1 with
40:e2:30:cb:9a:11
Jan 22 11:59:36 wim kernel: wlan0: announcing peer-specific power mode
to 40:e2:30:cb:9a:11
Jan 22 11:59:36 wim kernel: wlan0: dropped data frame to not
associated station 40:e2:30:cb:9a:11
Jan 22 11:59:36 wim kernel: wlan0: setting non-peer PM to user value
Jan 22 11:59:36 wim kernel: wlan0: STA 40:e2:30:cb:9a:11 : offset was
invalid, t_offset=3226624384
Jan 22 11:59:37 wim kernel: wlan0: TBTT : max clockdrift=0; too small to adjust
Jan 22 11:59:37 wim kernel: wlan0: STA 40:e2:30:cb:9a:11 :
t_offset=3227648385, t_offset_setpoint=3226624364,
t_clockdrift=-1024021
Jan 22 11:59:37 wim kernel: wlan0: STA 40:e2:30:cb:9a:11 :
t_clockdrift=-1024021 too large, setpoint reset
Jan 22 11:59:38 wim kernel: wlan0: TBTT : max clockdrift=0; too small to adjust

On 22 January 2016 at 11:55, Jeroen Roovers <jeroen.roovers@airfi.aero> wrote:
> wpa_supplicant config looks like this:
>
> user_mpm=1
> update_config=1
>
> network={
>         mode=5
>         ssid="_"
>         frequency=2412
>         proto=RSN
>         key_mgmt=SAE
>         pairwise=CCMP
>         group=CCMP
>         psk="..."
> }
>
> On 22 January 2016 at 11:38, Jeroen Roovers <jeroen.roovers@airfi.aero> wrote:
>> Jan 22 11:34:21 wim kernel: wlan0: TBTT : max clockdrift=0; too small to adjust
>> Jan 22 11:34:22 wim kernel: wlan0: STA 40:e2:30:cb:9a:11 : offset was
>> invalid, t_offset=1712128384
>> Jan 22 11:34:22 wim kernel: wlan0: TBTT : max clockdrift=0; too small to adjust
>> Jan 22 11:34:23 wim kernel: wlan0: STA 40:e2:30:cb:9a:11 : is adjusting TBTT
>> Jan 22 11:34:23 wim kernel: wlan0: TBTT : max clockdrift=0; too small to adjust
>> Jan 22 11:34:24 wim kernel: wlan0: STA 40:e2:30:cb:9a:11 : offset was
>> invalid, t_offset=1714176384
>> Jan 22 11:34:24 wim kernel: wlan0: TBTT : max clockdrift=0; too small to adjust
>> Jan 22 11:34:25 wim kernel: wlan0: STA 40:e2:30:cb:9a:11 :
>> t_offset=1715200384, t_offset_setpoint=1714176364,
>> t_clockdrift=-1024020
>> Jan 22 11:34:25 wim kernel: wlan0: STA 40:e2:30:cb:9a:11 :
>> t_clockdrift=-1024020 too large, setpoint reset
>> Jan 22 11:34:25 wim kernel: wlan0: TBTT : max clockdrift=0; too small to adjust
>> Jan 22 11:34:26 wim kernel: wlan0: STA 40:e2:30:cb:9a:11 : is adjusting TBTT
>> Jan 22 11:34:26 wim kernel: wlan0: TBTT : max clockdrift=0; too small to adjust
>> Jan 22 11:34:27 wim kernel: wlan0: STA 40:e2:30:cb:9a:11 : offset was
>> invalid, t_offset=1717248384
>> Jan 22 11:34:27 wim kernel: wlan0: TBTT : max clockdrift=0; too small to adjust
>> Jan 22 11:34:28 wim kernel: wlan0: STA 40:e2:30:cb:9a:11 :
>> t_offset=1718272384, t_offset_setpoint=1717248364,
>> t_clockdrift=-1024020
>> Jan 22 11:34:28 wim kernel: wlan0: STA 40:e2:30:cb:9a:11 :
>> t_clockdrift=-1024020 too large, setpoint reset
>> Jan 22 11:34:28 wim kernel: wlan0: TBTT : max clockdrift=0; too small to adjust
>> Jan 22 11:34:29 wim kernel: wlan0: STA 40:e2:30:cb:9a:11 : offset was
>> invalid, t_offset=1719296384
>>
>> I seem to be able to get an RSN mesh going using wpa_supplicant, but
>> the ath10k sees only its own packets in tcpdump while the ath9k on the
>> other side sees everything.
>>
>> Kernel is 4.4.0. Firmware is 10.2.4.70.17-2.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
