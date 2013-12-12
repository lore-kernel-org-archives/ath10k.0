Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp2.dhosting.pl ([195.88.50.26])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vr7lu-0007c7-Pq
 for ath10k@lists.infradead.org; Thu, 12 Dec 2013 15:01:52 +0000
Message-ID: <52A9CFB3.6090603@elnovel.com>
Date: Thu, 12 Dec 2013 16:01:07 +0100
From: Tomasz Tajmajer <tt@elnovel.com>
MIME-Version: 1.0
Subject: Re: [BUG] QWLE900V5-18 - cannot achievie 3 spatial streams link
References: <52A1FC69.7080901@elnovel.com>	<CALhHN=qPRgc-FaKbazdAmmxvi+YXxoFOp2Ax=x0iDp0LXknjHA@mail.gmail.com>	<874n6i1jk7.fsf@kamboji.qca.qualcomm.com>	<52A5955E.2060106@elnovel.com>	<CA+BoTQk95VmU=e1cLOtzcX8Y_j6YjFFw1STOT=r7NSHTd2vuJA@mail.gmail.com>	<52A5A98A.3000102@elnovel.com>	<52A5B33D.7010006@elnovel.com>	<52A85844.3080009@elnovel.com>	<CALhHN=oBnJG61UPQ9PYHAJd9cRAOBabYwVs=nKUTRCLaEy9YfA@mail.gmail.com>
 <CALhHN=qT=5H9qc8oqB_sZARzJvCoQ7wTwY09nB9HsyJTXx0ZEg@mail.gmail.com>
 <52A9A10D.9000901@elnovel.com>
In-Reply-To: <52A9A10D.9000901@elnovel.com>
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
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org


On 12.12.2013 12:42, Tomasz Tajmajer wrote:
>
> On 11.12.2013 20:51, Janusz Dziedzic wrote:
>>> Seems from driver we configure everything correctly. Rate Control is
>>> in FW - so FW will decide what NSS/MCS to use. Here we see our devices
>>> works fine with 3x3.
>>>
>>> BTW.
>>> You can try to use fixed_rate setting. You will have to apply some
>>> patches from mac80211-next/group:
>>>
>>> Kernel:
>>> 1) nl80211: don't clear bitrate_mask twice
>>> 2) nl80211: back to default bitrate_mask correctly
>>> 3) nl80211/cfg80211: bitrate_mask, rename mcs to ht_mcs
>>> 4) nl80211: add VHT support for set_bitrate_mask
>>> 5) ath10k: add set_bitrate_mask callback - this I will send in few 
>>> minutes
>>>
>>> iw:
>>> 1) iw: add VHT MCS/NSS set support to set bitrates
>>>
>>> After that just run ap and: iw wlanX set bitrates legacy-5 ht-mcs-5
>>> vht-mcs-5 3:0
>>>
>>> You should send frames from AP with NSS=3, MCS=0
>>>
>> BTW Do you have same problem with HT, or only with VHT?
>>
>> BR
>> Janusz
>>
>
> For HT 3x3 MIMO is working fine. The issue occurs only for VHT.
>
> Thank you for your suggestions, I'll apply the patches and try to 
> force 3 spatial streams manually. Hope it will work.
>
> BTW: Which firmware and driver versions you were using in your tests ?
>
> BR
> TomaszT
>
>
>
BTW: I get this trace very often on both AP and STA:

[  870.512817] ------------[ cut here ]------------
[  870.512835] WARNING: at 
/.../backports-20131129/net/wireless/util.c:1066 
cfg80211_calculate_bitrate+0x178/0x1e0 [cfg80211]()
[  870.512836] Hardware name: MS-7850
[  870.512837] Modules linked in: nls_iso8859_1(F) pci_stub(F) 
vboxpci(OF) vboxnetadp(OF) vboxnetflt(OF) vboxdrv(OF) nvidia(POF) 
arc4(F) coretemp(F) kvm_intel(F) snd_hda_codec_hdmi(F) kvm(F) 
aesni_intel(F) ablk_helper(F) cryptd(F) lrw(F) aes_i586(F) 
snd_hda_codec_realtek(F) snd_hda_intel(F) joydev(F) bnep(F) rfcomm(F) 
snd_hda_codec(F) bluetooth(F) xts(F) ath10k_pci(OF) gf128mul(F) 
ath10k_core(OF) snd_hwdep(F) snd_pcm(F) snd_seq_midi(F) snd_rawmidi(F) 
ath(OF) snd_seq_midi_event(F) snd_seq(F) snd_timer(F) snd_seq_device(F) 
mac80211(OF) snd(F) soundcore(F) cfg80211(OF) psmouse(F) serio_raw(F) 
microcode(F) snd_page_alloc(F) compat(OF) mxm_wmi(F) mac_hid(F) mei(F) 
shpchp(F) wmi(F) video(F) lpc_ich(F) parport_pc(F) ppdev(F) lp(F) 
parport(F) usb_storage(F) raid10(F) raid456(F) async_pq(F) async_xor(F) 
xor(F) async_memcpy(F) async_raid6_recov(F) hid_generic(F) usbhid(F) 
hid(F) ahci(F) libahci(F) r8169(F) raid6_pq(F) async_tx(F) raid1(F) 
raid0(F) multipath(F) linear(F)
[  870.512870] Pid: 22186, comm: hostapd Tainted: PF          O 
3.8.0-33-generic #48~precise1-Ubuntu
[  870.512872] Call Trace:
[  870.512877]  [<c104b8f2>] warn_slowpath_common+0x72/0xa0
[  870.512883]  [<f889c288>] ? cfg80211_calculate_bitrate+0x178/0x1e0 
[cfg80211]
[  870.512889]  [<f889c288>] ? cfg80211_calculate_bitrate+0x178/0x1e0 
[cfg80211]
[  870.512891]  [<c104b942>] warn_slowpath_null+0x22/0x30
[  870.512897]  [<f889c288>] cfg80211_calculate_bitrate+0x178/0x1e0 
[cfg80211]
[  870.512904]  [<f88a93e7>] nl80211_put_sta_rate+0x47/0x290 [cfg80211]
[  870.512908]  [<c1308742>] ? nla_put+0x32/0x50
[  870.512915]  [<f88a9a8f>] nl80211_send_station.isra.62+0x45f/0x810 
[cfg80211]
[  870.512921]  [<f88aa264>] nl80211_get_station+0x1a4/0x270 [cfg80211]
[  870.512928]  [<f88a4430>] ? __cfg80211_rdev_from_attrs+0x190/0x190 
[cfg80211]
[  870.512931]  [<c1563c6c>] genl_rcv_msg+0x1fc/0x270
[  870.512936]  [<c15350cb>] ? __alloc_skb+0x6b/0x260
[  870.512938]  [<c1563a70>] ? genl_rcv+0x30/0x30
[  870.512939]  [<c15634de>] netlink_rcv_skb+0x8e/0xb0
[  870.512941]  [<c1563a5c>] genl_rcv+0x1c/0x30
[  870.512943]  [<c1562e97>] netlink_unicast+0x177/0x1f0
[  870.512944]  [<c1563138>] netlink_sendmsg+0x228/0x390
[  870.512947]  [<c152acf1>] sock_sendmsg+0xd1/0xf0
[  870.512950]  [<c12f9432>] ? _copy_from_user+0x42/0x60
[  870.512952]  [<c1536bf4>] ? verify_iovec+0x44/0xb0
[  870.512954]  [<c152bfc2>] ___sys_sendmsg+0x262/0x270
[  870.512956]  [<c107e7a0>] ? default_wake_function+0x10/0x20
[  870.512958]  [<c1075da7>] ? __wake_up_common+0x47/0x70
[  870.512961]  [<c1152667>] ? kmem_cache_alloc+0x77/0x140
[  870.512963]  [<c10774b5>] ? __wake_up+0x45/0x60
[  870.512965]  [<c162dc6d>] ? _raw_spin_lock+0xd/0x10
[  870.512967]  [<c152a128>] ? sock_destroy_inode+0x28/0x30
[  870.512969]  [<c152a128>] ? sock_destroy_inode+0x28/0x30
[  870.512971]  [<c152a128>] ? sock_destroy_inode+0x28/0x30
[  870.512973]  [<c117b951>] ? destroy_inode+0x31/0x50
[  870.512975]  [<c117ba61>] ? evict+0xf1/0x170
[  870.512977]  [<c117c1bf>] ? iput_final+0xaf/0x130
[  870.512979]  [<c1176f88>] ? __d_free+0x38/0x60
[  870.512981]  [<c1176f88>] ? __d_free+0x38/0x60
[  870.512983]  [<c152ce8e>] __sys_sendmsg+0x3e/0x70
[  870.512985]  [<c152d588>] sys_socketcall+0x278/0x2d0
[  870.512988]  [<c1165c3d>] ? ____fput+0xd/0x10
[  870.512990]  [<c1069fd6>] ? task_work_run+0xb6/0xd0
[  870.512993]  [<c1012217>] ? do_notify_resume+0x97/0xa0
[  870.512995]  [<c163538d>] sysenter_do_call+0x12/0x28
[  870.512997]  [<c1620000>] ? ext3_orphan_cleanup.isra.85+0x145/0x27e
[  870.512998] ---[ end trace c9ccbf9458ea0b81 ]---




[  121.786233] ------------[ cut here ]------------
[  121.786277] WARNING: at 
/.../backports-20131129/net/wireless/util.c:1066 
cfg80211_calculate_bitrate+0x178/0x1e0 [cfg80211]()
[  121.786282] Hardware name: MXG061
[  121.786286] Modules linked in: arc4(F) nvidia(POF) ath10k_pci(OF) 
ath10k_core(OF) ath(OF) snd_hda_codec_idt(F) snd_hda_intel(F) 
snd_hda_codec(F) mac80211(OF) r852(F) coretemp(F) gpio_ich(F) 
sm_common(F) joydev(F) bnep(F) snd_hwdep(F) kvm_intel(F) snd_pcm(F) 
cfg80211(OF) nand(F) snd_seq_midi(F) kvm(F) mtd(F) snd_rawmidi(F) 
nand_ids(F) rfcomm(F) snd_seq_midi_event(F) snd_seq(F) nand_bch(F) 
snd_timer(F) bluetooth(F) lpc_ich(F) r592(F) bch(F) snd_seq_device(F) 
psmouse(F) snd(F) compat(OF) soundcore(F) nand_ecc(F) dell_laptop(F) 
dell_wmi(F) memstick(F) serio_raw(F) snd_page_alloc(F) dcdbas(F) 
sparse_keymap(F) microcode(F) wmi(F) mac_hid(F) video(F) parport_pc(F) 
ppdev(F) lp(F) parport(F) raid10(F) raid456(F) async_pq(F) async_xor(F) 
xor(F) async_memcpy(F) async_raid6_recov(F) firewire_ohci(F) 
firewire_core(F) crc_itu_t(F) sdhci_pci(F) sdhci(F) tg3(F) ptp(F) 
pps_core(F) raid6_pq(F) async_tx(F) raid1(F) raid0(F) multipath(F) linear(F)
[  121.786430] Pid: 2395, comm: iwconfig Tainted: PF          O 
3.8.0-31-generic #46~precise1-Ubuntu
[  121.786434] Call Trace:
[  121.786449]  [<c104b8b2>] warn_slowpath_common+0x72/0xa0
[  121.786480]  [<f8fcc288>] ? cfg80211_calculate_bitrate+0x178/0x1e0 
[cfg80211]
[  121.786511]  [<f8fcc288>] ? cfg80211_calculate_bitrate+0x178/0x1e0 
[cfg80211]
[  121.786519]  [<c104b902>] warn_slowpath_null+0x22/0x30
[  121.786550]  [<f8fcc288>] cfg80211_calculate_bitrate+0x178/0x1e0 
[cfg80211]
[  121.786590]  [<f900e313>] cfg80211_wext_giwrate+0xc3/0x1a0 [cfg80211]
[  121.786629]  [<f901127d>] ? cfg80211_mgd_wext_giwap+0x4d/0x90 [cfg80211]
[  121.786639]  [<c15fe77d>] ioctl_standard_call+0x5d/0xe0
[  121.786648]  [<c15fe941>] wireless_process_ioctl.constprop.4+0x141/0x1a0
[  121.786685]  [<f900e250>] ? cfg80211_wext_giwtxpower+0x150/0x150 
[cfg80211]
[  121.786693]  [<c15fe9fb>] wext_handle_ioctl+0x5b/0xd0
[  121.786702]  [<c1541dde>] dev_ioctl+0xbe/0x290
[  121.786712]  [<c152b4cb>] sock_ioctl+0x1ab/0x290
[  121.786721]  [<c152b320>] ? move_addr_to_user+0xb0/0xb0
[  121.786729]  [<c117422f>] do_vfs_ioctl+0x7f/0x2f0
[  121.786739]  [<c13ac290>] ? tty_write_lock+0x50/0x50
[  121.786746]  [<c1174510>] sys_ioctl+0x70/0x80
[  121.786755]  [<c1634e4d>] sysenter_do_call+0x12/0x28
[  121.786760] ---[ end trace 3e19dfdb1f2646d7 ]---






_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
