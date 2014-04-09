Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ve0-x233.google.com ([2607:f8b0:400c:c01::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXiva-0006uf-G0
 for ath10k@lists.infradead.org; Wed, 09 Apr 2014 03:11:55 +0000
Received: by mail-ve0-f179.google.com with SMTP id db12so1555659veb.38
 for <ath10k@lists.infradead.org>; Tue, 08 Apr 2014 20:11:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5343B89E.2090407@dhc.com.cn>
References: <5343B89E.2090407@dhc.com.cn>
Date: Wed, 9 Apr 2014 11:11:32 +0800
Message-ID: <CAEFj984QK4+-P39YUEvZekNk-TViYwDTR1QweZvWUkHF2wtoCw@mail.gmail.com>
Subject: Re: For Help: problems with tx bitrate in ath10k
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
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
To: wangdc <wangdc@dhc.com.cn>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Need firmware change to get proper Tx rate as pointed out by Kalle
Valo. So no support for the time being.

http://lists.infradead.org/pipermail/ath10k/2014-March/001587.html

----
Chun-Yeow

On Tue, Apr 8, 2014 at 4:51 PM, wangdc <wangdc@dhc.com.cn> wrote:
> Hi,all
>
> I used the backports-3.13.2-1 to drive a 11ac card(WLE900VX) on the ubuntu
> 12.04 LTS(64bit) (3.8.0-35-generic).
> The card seemed to be working well when i connected it to a broadcom AC APs
> and the card could also send or receive data normally.
> But when using command 'iw dev wlan0 station dump' to check the actual Rx
> and Tx rate, i couldn't get the tx bitrate correctly.
>
> root@ubuntu:~$ iw dev wlan2 station dump
> Station 10:48:b1:e8:17:a6 (on wlan2)
>     inactive time:    28680 ms
>     rx bytes:    903704
>     rx packets:    6747
>     tx bytes:    20731
>     tx packets:    163
>     tx retries:    1969
>     tx failed:    0
>     signal:      -36 dBm
>     signal avg:    -36 dBm
>     tx bitrate:     MCS 32 40Mhz short GI
>     authorized:    yes
>     authenticated:    yes
>     preamble:    long
>     WMM/WME:    yes
>     MFP:        no
>     TDLS peer:        no
>
> And sometimes the tx bitrate was 3693.3 MBit/s, 65.0 MBit/s, 6.5Mbit/s etc.
>
> The start log as following.
>
> root@ubuntu:~$ dmesg | grep ath
> [    0.800424] MODSIGN: Loaded cert 'Magrathea: Glacier signing key:
> c77318d5b035f7cbfa665f640863f8bc32a3fa33'
> [   10.539694] ath10k_pci 0000:04:00.0: BAR 0: assigned [mem
> 0xf0400000-0xf05fffff 64bit]
> [   10.886386] ath10k: MSI-X didn't succeed (1), trying MSI
> [   10.886454] ath10k_pci 0000:04:00.0: irq 44 for MSI/MSI-X
> [   10.886492] ath10k: MSI interrupt handling
> [   10.921722] ath10k: Hardware name qca988x hw2.0 version 0x4100016c
> [   12.246510] ath10k: UART prints disabled
> [   12.250960] ath10k: firmware 10.1.467.2-1 booted
> [   12.260459] ath10k: htt target version 2.1
> [   12.261559] ath: EEPROM regdomain: 0x0
> [   12.261561] ath: EEPROM indicates default country code should be used
> [   12.261562] ath: doing EEPROM country->regdmn map search
> [   12.261563] ath: country maps to regdmn code: 0x3a
> [   12.261565] ath: Country alpha2 being used: US
> [   12.261566] ath: Regpair used: 0x3a
> [   18.767377] ath10k: MSI-X didn't succeed (1), trying MSI
> [   18.767451] ath10k_pci 0000:04:00.0: irq 44 for MSI/MSI-X
> [   18.767496] ath10k: MSI interrupt handling
> [   19.700523] ath10k: UART prints disabled
> [   19.705037] ath10k: firmware 10.1.467.2-1 booted
> [   19.714921] ath10k: htt target version 2.1
> ...
>
> root@ubuntu:~$ dmesg
> [  121.846056] ------------[ cut here ]------------
> [  121.846090] WARNING: at /home/backports/net/wireless/util.c:1066
> cfg80211_calculate_bitrate+0x18e/0x210 [cfg80211]()
> [  121.846093] Hardware name: 23066RC
> [  121.846094] Modules linked in: ip_vs(F) nf_conntrack(F) libcrc32c(F)
> bnep(F) rfcomm(F) parport_pc(F) ppdev(F) arc4(F) coretemp(F)
> snd_hda_codec_hdmi(F) snd_hda_codec_realtek(F) ath10k_pci(OF)
> ath10k_core(OF) uvcvideo(F) nfsd(F) snd_hda_intel(F) kvm(F) snd_hda_codec(F)
> ath(OF) videobuf2_core(F) nfs_acl(F) videodev(F) auth_rpcgss(F) i915(F)
> nfs(F) videobuf2_vmalloc(F) snd_hwdep(F) btusb(F) snd_pcm(F) mac80211(OF)
> videobuf2_memops(F) joydev(F) fscache(F) bluetooth(F) ghash_clmulni_intel(F)
> thinkpad_acpi(F) lockd(F) snd_seq_midi(F) cryptd(F) drm_kms_helper(F)
> binfmt_misc(F) snd_rawmidi(F) drm(F) snd_seq_midi_event(F) cfg80211(OF)
> sunrpc(F) snd_seq(F) psmouse(F) snd_timer(F) snd_seq_device(F) mei(F) snd(F)
> microcode(F) serio_raw(F) mac_hid(F) i2c_algo_bit(F) snd_page_alloc(F)
> compat(OF) soundcore(F) lpc_ich(F) nvram(F) wmi(F) video(F) lp(F) parport(F)
> sdhci_pci(F) sdhci(F) e1000e(F)
> [  121.846157] Pid: 1050, comm: NetworkManager Tainted: GF O
> 3.8.0-35-generic #52~precise1-Ubuntu
> [  121.846159] Call Trace:
> [  121.846171]  [<ffffffff81059b6f>] warn_slowpath_common+0x7f/0xc0
> [  121.846177]  [<ffffffff81059bca>] warn_slowpath_null+0x1a/0x20
> [  121.846193]  [<ffffffffa019c8de>] cfg80211_calculate_bitrate+0x18e/0x210
> [cfg80211]
> [  121.846212]  [<ffffffffa01a99a7>] nl80211_put_sta_rate+0x57/0x2a0
> [cfg80211]
> [  121.846229]  [<ffffffffa01ac0e1>]
> nl80211_send_station.isra.63+0x4a1/0x870 [cfg80211]
> [  121.846246]  [<ffffffffa01ac98c>] nl80211_get_station+0x22c/0x290
> [cfg80211]
> [  121.846254]  [<ffffffff8160f6dd>] genl_rcv_msg+0x22d/0x2b0
> [  121.846260]  [<ffffffff815d830b>] ? __alloc_skb+0x8b/0x2a0
> [  121.846264]  [<ffffffff8160f4b0>] ? genl_rcv+0x40/0x40
> [  121.846270]  [<ffffffff8160ee89>] netlink_rcv_skb+0xa9/0xd0
> [  121.846274]  [<ffffffff8160f495>] genl_rcv+0x25/0x40
> [  121.846279]  [<ffffffff8160e7d1>] netlink_unicast+0x1b1/0x230
> [  121.846285]  [<ffffffff8160eb4e>] netlink_sendmsg+0x2fe/0x3b0
> [  121.846290]  [<ffffffff815cb282>] sock_sendmsg+0xd2/0xf0
> [  121.846296]  [<ffffffff815cdb8a>] ? move_addr_to_kernel+0x5a/0xa0
> [  121.846300]  [<ffffffff815da406>] ? verify_iovec+0x56/0xd0
> [  121.846305]  [<ffffffff815cd09c>] ___sys_sendmsg+0x3ac/0x3c0
> [  121.846311]  [<ffffffff811aea86>] ? pollwake+0x66/0x70
> [  121.846316]  [<ffffffff81092050>] ? try_to_wake_up+0x200/0x200
> [  121.846323]  [<ffffffff816f53e5>] ? _raw_spin_lock_irq+0x15/0x20
> [  121.846327]  [<ffffffff81092050>] ? try_to_wake_up+0x200/0x200
> [  121.846332]  [<ffffffff815ceba9>] __sys_sendmsg+0x49/0x90
> [  121.846337]  [<ffffffff815cec09>] sys_sendmsg+0x19/0x20
> [  121.846343]  [<ffffffff816fdf5d>] system_call_fastpath+0x1a/0x1f
> [  121.846346] ---[ end trace fc50900f4228222f ]---
>
> About the reason of the warning info above,
> when debugging the code, rate->flags was 0x0 and the rate->mcs value was
> more than 32 in the function of cfg80211_calculate_bitrate,
> but i didn't know why i got a wrong rate value.
>
> /home/backports/net/wireless/util.c
> u32 cfg80211_calculate_bitrate(struct rate_info *rate)
> {
>     int modulation, streams, bitrate;
>
>     if (!(rate->flags & RATE_INFO_FLAGS_MCS) &&
>         !(rate->flags & RATE_INFO_FLAGS_VHT_MCS))
>         return rate->legacy;
>     if (rate->flags & RATE_INFO_FLAGS_60G)
>         return cfg80211_calculate_bitrate_60g(rate);
>     if (rate->flags & RATE_INFO_FLAGS_VHT_MCS)
>         return cfg80211_calculate_bitrate_vht(rate);
>
>     /* the formula below does only work for MCS values smaller than 32 */
>     if (WARN_ON_ONCE(rate->mcs >= 32))
>         return 0;
>
> I tried other version of the firmware and backports, the test results were
> as following:
> a)The problem repeated when i tried firmware-2.bin_999.999.0.636.
> b)The tx bitrate was fixed to 6MBit/s  and there was no warning info in the
> boot log  when i adopted the latest development
> releases(backports-20140221).
>
> Is there anybody meets the same problem? If so, please give me some
> suggestion on getting Tx rate properly.
>
> Thanks.
> Rex
>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
