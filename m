Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YUfvt-0003lZ-28
 for ath10k@lists.infradead.org; Sun, 08 Mar 2015 18:28:10 +0000
Message-ID: <54FC94A2.5090106@candelatech.com>
Date: Sun, 08 Mar 2015 11:27:46 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: ath10k + INTEL_IDLE aka. cstates == firmware crash
References: <54EB264D.5040805@sophos.com>
 <CAFZrTr6wwDQ5hOQm7WJ6bBZVBJ9Wbaasu6jGAZjDKBRnEgOp4g@mail.gmail.com>
In-Reply-To: <CAFZrTr6wwDQ5hOQm7WJ6bBZVBJ9Wbaasu6jGAZjDKBRnEgOp4g@mail.gmail.com>
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
To: Jeremias Blendin <jeremias@blendin.org>, Fabian Wittenberg <Fabian.Wittenberg@sophos.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

There is no particular crash here, but maybe the WMI transport
is hung.  Possibly my firmware & kernel will help with that, or at least
help recover the system quicker by asserting in the firmware
if WMI is truly hung.

Thanks,
Ben


On 03/08/2015 06:45 AM, Jeremias Blendin wrote:
> Hi,
>
> a small update on the issue. It seems I experience the same issue as
> Fabian, on a similar Intel Atom system. I have not yet added the fix
> for the issue proposed on this list.
> However, I also experience the issue with CONFIG_INTEL_IDLE disabled
> and a single CPU
> core enabled, using maxcpus=1. Still, it takes much, much longer for
> the error to occur.
>
> Here is the crash info (unfortunately I haven't had the time yet to
> install the candela kernel,
> which might report more details):
>
> [160447.707659] ath10k_pci 0000:04:00.0: SWBA overrun on vdev 0
> [160447.810144] ath10k_pci 0000:04:00.0: SWBA overrun on vdev 0
> [160447.912619] ath10k_pci 0000:04:00.0: SWBA overrun on vdev 0
> [160449.822016] wlan1: failed to remove key (0, xx:xx:xx:xx:xx:xx)
> from hardware (-11)
> [160449.822148] ------------[ cut here ]------------
> [160449.822170] WARNING: CPU: 0 PID: 2195 at
> /home/xxx/install/linux-3.18.0/net/mac80211/sta_info.c:886
> __sta_info_destroy_part2+0x136/0x2b0 [mac80211]()
> [160449.822173] Modules linked in: ctr ccm arc4 openvswitch geneve gre
> vxlan ip6_udp_tunnel udp_tunnel libcrc32c gpio_ich coretemp kvm_intel
> ath10k_pci ath10k_core kvm ath crct10dif_pclmul crc32_pclmul
> ghash_clmulni_intel mac80211 aesni_intel aes_x86_64 lrw gf128mul
> glue_helper ablk_helper cryptd ast lpc_ich ttm drm_kms_helper drm
> syscopyarea joydev nls_iso8859_1 cfg80211 sysfillrect sysimgblt
> ipmi_si 8250_fintek ipmi_msghandler mac_hid i2c_ismt shpchp btrfs xor
> raid6_pq uas usb_storage hid_generic usbhid hid igb i2c_algo_bit ahci
> libahci dca ptp pps_core
> [160449.822221] CPU: 0 PID: 2195 Comm: hostapd Not tainted 3.18.0-13-generic #14
> [160449.822223] Hardware name: Supermicro A1SAi/A1SRi, BIOS 1.0c 02/27/2014
> [160449.822225]  0000000000000009 ffff880468a73908 ffffffff817aa408
> 0000000000000007
> [160449.822230]  0000000000000000 ffff880468a73948 ffffffff81074921
> 0000000368a73958
> [160449.822233]  ffff88044d9cc800 ffff880467b14680 ffff8804672608c0
> ffff880467260000
> [160449.822237] Call Trace:
> [160449.822246]  [<ffffffff817aa408>] dump_stack+0x46/0x58
> [160449.822251]  [<ffffffff81074921>] warn_slowpath_common+0x81/0xa0
> [160449.822255]  [<ffffffff810749fa>] warn_slowpath_null+0x1a/0x20
> [160449.822268]  [<ffffffffc055b5e6>]
> __sta_info_destroy_part2+0x136/0x2b0 [mac80211]
> [160449.822282]  [<ffffffffc055b78a>] __sta_info_destroy+0x2a/0x40 [mac80211]
> [160449.822296]  [<ffffffffc055b838>]
> sta_info_destroy_addr_bss+0x38/0x60 [mac80211]
> [160449.822313]  [<ffffffffc057076d>] ieee80211_del_station+0x1d/0x30 [mac80211]
> [160449.822330]  [<ffffffffc040b6dc>] nl80211_del_station+0x7c/0x130 [cfg80211]
> [160449.822336]  [<ffffffff816d762a>] genl_family_rcv_msg+0x19a/0x390
> [160449.822341]  [<ffffffff816d7820>] ? genl_family_rcv_msg+0x390/0x390
> [160449.822345]  [<ffffffff816d7899>] genl_rcv_msg+0x79/0xc0
> [160449.822348]  [<ffffffff816d6ee9>] netlink_rcv_skb+0xb9/0xe0
> [160449.822352]  [<ffffffff816d747c>] genl_rcv+0x2c/0x40
> [160449.822355]  [<ffffffff816d6621>] netlink_unicast+0x111/0x1b0
> [160449.822359]  [<ffffffff816d69ca>] netlink_sendmsg+0x30a/0x650
> [160449.822364]  [<ffffffff8135ba71>] ? aa_sk_perm.isra.4+0x71/0x170
> [160449.822369]  [<ffffffff8168b4e3>] sock_sendmsg+0x93/0xd0
> [160449.822374]  [<ffffffff8108c046>] ? __queue_work+0x136/0x330
> [160449.822378]  [<ffffffff8168b1be>] ? move_addr_to_kernel.part.20+0x1e/0x70
> [160449.822382]  [<ffffffff8168c0f1>] ? move_addr_to_kernel+0x21/0x30
> [160449.822386]  [<ffffffff81699ea7>] ? verify_iovec+0x47/0xd0
> [160449.822390]  [<ffffffff8168b980>] ___sys_sendmsg+0x410/0x420
> [160449.822395]  [<ffffffff8120e3cc>] ? destroy_inode+0x3c/0x70
> [160449.822399]  [<ffffffff8120e51f>] ? evict+0x11f/0x1b0
> [160449.822403]  [<ffffffff812091df>] ? dentry_free+0x5f/0xb0
> [160449.822407]  [<ffffffff81209b65>] ? __dentry_kill+0x155/0x200
> [160449.822411]  [<ffffffff81209d90>] ? dput+0x180/0x1c0
> [160449.822415]  [<ffffffff81213114>] ? mntput+0x24/0x40
> [160449.822420]  [<ffffffff811f39f0>] ? __fput+0x190/0x240
> [160449.822424]  [<ffffffff8168c7d2>] __sys_sendmsg+0x42/0x80
> [160449.822427]  [<ffffffff8168c822>] SyS_sendmsg+0x12/0x20
> [160449.822432]  [<ffffffff817b1c6d>] system_call_fastpath+0x16/0x1b
> [160449.822435] ---[ end trace b1009dc2519db816 ]---
> [160452.114371] ath10k_warn: 45 callbacks suppressed
> [160452.114384] ath10k_pci 0000:04:00.0: SWBA overrun on vdev 0
> ....
> [208686.051467] ath10k_pci 0000:04:00.0: failed to delete peer
> xx:xx:xx:xx:xx:xx for vdev 0: -110
> ....
> and finally:
> [388206.713817] ath10k_pci 0000:04:00.0: number of peers exceeded:
> peers number 127 (max peers 127)
>
> 2015-02-23 14:08 GMT+01:00 Fabian Wittenberg <Fabian.Wittenberg@sophos.com>:
>> Hi@all,
>>
>> we are using the brand new QCA988x chipset based on mini-PCIe cards in our newest wifi enabled firewall appliance and we have had
>> a lot of problems to get it running (Intel Rangeley platform; Intel(R) Atom(TM) CPU  C2558  @ 2.40GHz).
>> The card crashed after some minutes using ath10k-driver (backports-3.19-rc1). Older versions are affected as well.
>> At least down to 3.12.20. I did intensive debugging and found out, that there
>> are major issues as soon as Intels processor cstates are used. This
>> option is called "CONFIG_INTEL_IDLE" in kernel config. This seems to be
>> a very heavy issue as it even can lead to low memory corruption and
>> kernel freezes. Low memory corruption doesn't occure always; just sometimes. This makes it hard to debug.
>> Also you need a multi processor system to trigger the issue.
>> If you set kernel parameter "maxcpus=1" the error doesn't occure even if you enable CONFIG_INTEL_IDLE.
>> Kernel output looks like this if the card stops working:
>>
>>
>> [ 3715.145865] ath10k: failed to install key for vdev 2 peer 00:1a:8c:0a:b5:01: -11
>>
>> [ 3715.145876] wifi1: failed to remove key (1, ff:ff:ff:ff:ff:ff) from hardware (-11)
>>
>> [ 3718.148226] ath10k: failed to install key for vdev 2 peer 00:1a:8c:0a:b5:01: -11
>>
>> [ 3718.148236] wifi1: failed to set key (1, ff:ff:ff:ff:ff:ff) to hardware (-11)
>>
>> [ 3723.152167] ath10k: failed to install key for vdev 0 peer 00:1a:8c:0a:34:01: -11
>>
>> [ 3723.152178] wifi0: failed to remove key (1, ff:ff:ff:ff:ff:ff) from hardware (-11)
>>
>> [ 3723.152185] ath10k: failed to transmit management frame via WMI: -11
>>
>> [ 3726.154524] ath10k: failed to install key for vdev 0 peer 00:1a:8c:0a:34:01: -11
>>
>> [ 3726.154535] wifi0: failed to set key (1, ff:ff:ff:ff:ff:ff) to hardware (-11)
>>
>> [ 3729.156884] ath10k: failed to install key for vdev 0 peer 00:0e:8e:ae:5c:1c: -11
>>
>> [ 3729.156890] ath10k: failed to transmit management frame via WMI: -11
>>
>> [ 3729.156904] wifi0: failed to remove key (0, 00:0e:8e:ae:5c:1c) from hardware (-11)
>>
>> [ 3732.159255] ath10k: failed to remove peer wep key 0: -11
>>
>> [ 3732.159265] ath10k: failed to clear all peer wep keys for vdev 0: -11
>>
>> [ 3732.159273] ath10k: failed to disassociate station: 00:0e:8e:ae:5c:1c vdev 0: -11
>>
>> [ 3732.159278] ------------[ cut here ]------------
>>
>> [ 3732.159317] WARNING: CPU: 1 PID: 5813 at
>> /usr/src/packages/BUILD/kernel-smp-3.12.20/modules-3.12.20/backports/net/mac80211/sta_info.c:885
>>   __sta_info_destroy_part2+0x4f/0xde [mac80211]()
>>
>> [ 3732.159322] Modules linked in: sr_mod cdrom xt_multidev xt_connmark
>> xt_REDIRECT ipt_MASQUERADE xt_policy xt_set xt_multiport xt_addrtype
>> ip_set_hash_ip nf_nat_pptp nf_nat_proto_gre nf_nat_irc nf_nat_ftp
>> nf_conntrack_pptp nf_conntrack_proto_gre nf_conntrack_irc
>> nf_conntrack_ftp ctr aesni_intel ablk_helper cryptd lrw aes_i586 xts
>> gf128mul aes_generic ebtable_filter ebtables bridge stp llc af_packet
>> redv2_netlink(O) ip6table_ips ip6table_mangle ip6table_nat nf_nat_ipv6
>> iptable_ips iptable_mangle iptable_nat nf_nat_ipv4 nf_nat xt_NFLOG
>> xt_condition(O) xt_tcpudp xt_logmark xt_confirmed xt_owner ip6t_REJECT
>> ipt_REJECT xt_state ip_set red2(O) ip_scheduler red nfnetlink_log
>> nf_conntrack_ipv6 nf_defrag_ipv6 ip6table_filter ip6table_raw
>> nf_conntrack_ipv4 nf_defrag_ipv4 xt_conntrack iptable_filter iptable_raw
>>   xt_CT nf_conntrack_netlink nfnetlink nf_conntrack ip6_tables ip_tables
>> x_tables ipv6 loop arc4 ath10k_pci(O) ath10k_core(O) mac80211(O) ath(O)
>> cfg80211(O) ehci_pci evdev igb(O) rfkill sg ehci_hcd rtc_cmos pcspkr
>> acpi_cpufreq i2c_i801 i2c_ismt button compat(O) dca sd_mod processor
>> thermal_sys hwmon edd ahci libahci libata scsi_mod hid_generic usbhid
>>
>>
>> Sometimes but not allways there is the message "firmware crashed!" in dmesg but it doesn't matter which error message it actually is:
>> The behavior is allways the same. The card stops working until reboot. Unloading/reloading of ath10k_pci, ath10k_core, ath doesn't help in this case.
>> The basic problems of all error messages I saw by now is a broken link between the cards firmware and the ath10k-driver.
>> Depending on the point in time this "connection loss" happens the error messages are a little bit different,
>> as they are strongly connected to the current state of the driver while it is trying to talk to the cards firmware via WMI.
>>
>> If you try to reproduce you have to wait between 3 and 60 Minutes to see the crash. You can increase the likelyhood for crashing by increasing
>> the number of wifi traffic on foreign networks at the same channel.
>> I testet with four laptops that are connected to four QCA988x cards (AP-mode). This takes around 3-10 minutes to get it reproduced.
>>
>> If you need more information I'm at your disposal.
>>
>> Regards,
>> Fabian Wittenberg
>>
>>
>>
>> _______________________________________________
>> ath10k mailing list
>> ath10k@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/ath10k
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
>


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
