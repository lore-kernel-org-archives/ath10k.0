Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YPwL7-0000YN-Gj
 for ath10k@lists.infradead.org; Mon, 23 Feb 2015 16:58:38 +0000
Message-ID: <54EB5C27.3090409@candelatech.com>
Date: Mon, 23 Feb 2015 08:58:15 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: ath10k + INTEL_IDLE aka. cstates == firmware crash
References: <54EB264D.5040805@sophos.com>
In-Reply-To: <54EB264D.5040805@sophos.com>
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
To: Fabian Wittenberg <Fabian.Wittenberg@sophos.com>
Cc: ath10k@lists.infradead.org

On 02/23/2015 05:08 AM, Fabian Wittenberg wrote:
> Hi@all,
> 
> we are using the brand new QCA988x chipset based on mini-PCIe cards in our newest wifi enabled firewall appliance and we have had
> a lot of problems to get it running (Intel Rangeley platform; Intel(R) Atom(TM) CPU  C2558  @ 2.40GHz).
> The card crashed after some minutes using ath10k-driver (backports-3.19-rc1). Older versions are affected as well.
> At least down to 3.12.20. I did intensive debugging and found out, that there
> are major issues as soon as Intels processor cstates are used. This
> option is called "CONFIG_INTEL_IDLE" in kernel config. This seems to be
> a very heavy issue as it even can lead to low memory corruption and
> kernel freezes. Low memory corruption doesn't occure always; just sometimes. This makes it hard to debug.
> Also you need a multi processor system to trigger the issue.
> If you set kernel parameter "maxcpus=1" the error doesn't occure even if you enable CONFIG_INTEL_IDLE.
> Kernel output looks like this if the card stops working:

If you want, try using my CT firmware.  If you can crash it, send me the kernel
stack dump and I'll try to see if I can figure out what is crashing.

We do see WMI hangs in some cases (probably due to stuck WMI mgt frames).  If you want to
patch your driver with my patches, then my firmware might give some extra
debug info if/when it crashes.

http://www.candelatech.com/ath10k.php

We have also seen at least one case where the firmware/NIC reported the equivalent
of DMA engine errors and shortly after the host dereferenced a null pointer.  I have
not been able to get debug info to figure out the stack dump for that yet, however.

Thanks,
Ben

> 
> 
> [ 3715.145865] ath10k: failed to install key for vdev 2 peer 00:1a:8c:0a:b5:01: -11
> 
> [ 3715.145876] wifi1: failed to remove key (1, ff:ff:ff:ff:ff:ff) from hardware (-11)
> 
> [ 3718.148226] ath10k: failed to install key for vdev 2 peer 00:1a:8c:0a:b5:01: -11
> 
> [ 3718.148236] wifi1: failed to set key (1, ff:ff:ff:ff:ff:ff) to hardware (-11)
> 
> [ 3723.152167] ath10k: failed to install key for vdev 0 peer 00:1a:8c:0a:34:01: -11
> 
> [ 3723.152178] wifi0: failed to remove key (1, ff:ff:ff:ff:ff:ff) from hardware (-11)
> 
> [ 3723.152185] ath10k: failed to transmit management frame via WMI: -11
> 
> [ 3726.154524] ath10k: failed to install key for vdev 0 peer 00:1a:8c:0a:34:01: -11
> 
> [ 3726.154535] wifi0: failed to set key (1, ff:ff:ff:ff:ff:ff) to hardware (-11)
> 
> [ 3729.156884] ath10k: failed to install key for vdev 0 peer 00:0e:8e:ae:5c:1c: -11
> 
> [ 3729.156890] ath10k: failed to transmit management frame via WMI: -11
> 
> [ 3729.156904] wifi0: failed to remove key (0, 00:0e:8e:ae:5c:1c) from hardware (-11)
> 
> [ 3732.159255] ath10k: failed to remove peer wep key 0: -11
> 
> [ 3732.159265] ath10k: failed to clear all peer wep keys for vdev 0: -11
> 
> [ 3732.159273] ath10k: failed to disassociate station: 00:0e:8e:ae:5c:1c vdev 0: -11
> 
> [ 3732.159278] ------------[ cut here ]------------
> 
> [ 3732.159317] WARNING: CPU: 1 PID: 5813 at 
> /usr/src/packages/BUILD/kernel-smp-3.12.20/modules-3.12.20/backports/net/mac80211/sta_info.c:885
>  __sta_info_destroy_part2+0x4f/0xde [mac80211]()
> 
> [ 3732.159322] Modules linked in: sr_mod cdrom xt_multidev xt_connmark 
> xt_REDIRECT ipt_MASQUERADE xt_policy xt_set xt_multiport xt_addrtype 
> ip_set_hash_ip nf_nat_pptp nf_nat_proto_gre nf_nat_irc nf_nat_ftp 
> nf_conntrack_pptp nf_conntrack_proto_gre nf_conntrack_irc 
> nf_conntrack_ftp ctr aesni_intel ablk_helper cryptd lrw aes_i586 xts 
> gf128mul aes_generic ebtable_filter ebtables bridge stp llc af_packet 
> redv2_netlink(O) ip6table_ips ip6table_mangle ip6table_nat nf_nat_ipv6 
> iptable_ips iptable_mangle iptable_nat nf_nat_ipv4 nf_nat xt_NFLOG 
> xt_condition(O) xt_tcpudp xt_logmark xt_confirmed xt_owner ip6t_REJECT 
> ipt_REJECT xt_state ip_set red2(O) ip_scheduler red nfnetlink_log 
> nf_conntrack_ipv6 nf_defrag_ipv6 ip6table_filter ip6table_raw 
> nf_conntrack_ipv4 nf_defrag_ipv4 xt_conntrack iptable_filter iptable_raw
>  xt_CT nf_conntrack_netlink nfnetlink nf_conntrack ip6_tables ip_tables 
> x_tables ipv6 loop arc4 ath10k_pci(O) ath10k_core(O) mac80211(O) ath(O) 
> cfg80211(O) ehci_pci evdev igb(O) rfkill sg ehci_hcd rtc_cmos pcspkr 
> acpi_cpufreq i2c_i801 i2c_ismt button compat(O) dca sd_mod processor 
> thermal_sys hwmon edd ahci libahci libata scsi_mod hid_generic usbhid
> 
> 
> Sometimes but not allways there is the message "firmware crashed!" in dmesg but it doesn't matter which error message it actually is:
> The behavior is allways the same. The card stops working until reboot. Unloading/reloading of ath10k_pci, ath10k_core, ath doesn't help in this case.
> The basic problems of all error messages I saw by now is a broken link between the cards firmware and the ath10k-driver.
> Depending on the point in time this "connection loss" happens the error messages are a little bit different,
> as they are strongly connected to the current state of the driver while it is trying to talk to the cards firmware via WMI.
> 
> If you try to reproduce you have to wait between 3 and 60 Minutes to see the crash. You can increase the likelyhood for crashing by increasing
> the number of wifi traffic on foreign networks at the same channel.
> I testet with four laptops that are connected to four QCA988x cards (AP-mode). This takes around 3-10 minutes to get it reproduced.
> 
> If you need more information I'm at your disposal.
> 
> Regards,
> Fabian Wittenberg
> 
> 
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
