Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk0-x22b.google.com ([2607:f8b0:400d:c09::22b])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dSacJ-0007Jj-F6
 for ath10k@lists.infradead.org; Wed, 05 Jul 2017 03:04:41 +0000
Received: by mail-qk0-x22b.google.com with SMTP id v143so95756353qkb.0
 for <ath10k@lists.infradead.org>; Tue, 04 Jul 2017 20:04:17 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?5a2Z5bu65biM?= <ycsunjane@gmail.com>
Date: Wed, 5 Jul 2017 11:04:15 +0800
Message-ID: <CABWe71z=f1C=nyQ25V=Cd5ozgoG4ALNVJky6ev3PCV_0xDYNoA@mail.gmail.com>
Subject: ath10k: switch channel NULL segment fault
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

execute wifi command in lede ap mode. Kernel panic.

lede commit :
e209988a17d3ef67c75c8e337df7dc44675264af


[ 3076.601038] ------------[ cut here ]------------
[ 3076.605899] WARNING: CPU: 0 PID: 13777 at
compat-wireless-2017-01-31/net/mac80211/ieee80211_i.h:1011
sta_info_alloc+0x33c/0x3e0 [mac80211]()
[ 3076.618695] Modules linked in: pppoe ppp_async ath9k pppox
ppp_generic nf_conntrack_ipv6 iptable_nat ipt_REJECT ipt_MASQUERADE
ath9k_common xt_time xt_tcpudp xt_state xt_nat xt_multiport xt_mark
xt_mac xt_limit xt_conntrack xt_comment xt_TCPMSS xt_REDIRECT xt_LOG
slhc nf_reject_ipv4 nf_nat_redirect nf_nat_masquerade_ipv4
nf_conntrack_ipv4 nf_nat_ipv4 nf_nat nf_log_ipv4 nf_defrag_ipv6
nf_defrag_ipv4 nf_conntrack_rtcache nf_conntrack iptable_mangle
iptable_filter ip_tables crc_ccitt ath9k_hw ath10k_pci ath10k_core ath
mac80211 cfg80211 compat ip6t_REJECT nf_reject_ipv6 nf_log_ipv6
nf_log_common ip6table_mangle ip6table_filter ip6_tables x_tables
usb_storage ehci_platform sd_mod scsi_mod ehci_hcd gpio_button_hotplug
usbcore nls_base usb_common
[ 3076.685790] CPU: 0 PID: 13777 Comm: hostapd Not tainted 4.4.61 #0
[ 3076.691968] Stack : 803d1784 00000000 00000001 80430000 8645b4d4
8041cd43 803b2dc4 000035d1
      8049375c 024000c0 00000000 77180d8c 00000000 800a7610 803b84b8 80420000
      00000003 024000c0 803b68c4 872abae4 00000000 800a558c 00000000 00000000
      00000001 801f4c00 00000000 00000000 00000000 00000000 00000000 00000000
      00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
      ...
[ 3076.728330] Call Trace:
[ 3076.730823] [<80071e5c>] show_stack+0x50/0x84
[ 3076.735258] [<80081c0c>] warn_slowpath_common+0xa0/0xd0
[ 3076.740560] [<80081cc4>] warn_slowpath_null+0x18/0x24
[ 3076.745775] [<87584e80>] sta_info_alloc+0x33c/0x3e0 [mac80211]
[ 3076.751769] [<8759f1cc>] ieee80211_channel_switch+0x13b8/0x1524 [mac80211]
[ 3076.758804]
[ 3076.760321] ---[ end trace 872d9dfffb08d56c ]---
[ 3076.765044] CPU 0 Unable to handle kernel paging request at virtual
address 00000014, epc == 87584e98, ra == 87584e80
[ 3076.775809] Oops[#1]:
[ 3076.778118] CPU: 0 PID: 13777 Comm: hostapd Tainted: G        W
  4.4.61 #0
[ 3076.785525] task: 8645b250 ti: 872aa000 task.ti: 872aa000
[ 3076.790994] $ 0   : 00000000 00000001 00000000 00000001
[ 3076.796327] $ 4   : 00000200 00000000 8041be70 801f4c70
[ 3076.801659] $ 8   : 0000002d 66666662 30386435 3663205d
[ 3076.806993] $12   : 00000000 ac000000 00000000 03bd0000
[ 3076.812326] $16   : 86945000 87520160 87520b40 8691c420
[ 3076.817658] $20   : 024080c0 024000c0 00000000 77180d8c
[ 3076.822991] $24   : 00000003 801f4148
[ 3076.828324] $28   : 872aa000 872abb88 00000000 87584e80
[ 3076.833657] Hi    : 00000000
[ 3076.836579] Lo    : 67fa8000
[ 3076.839575] epc   : 87584e98 sta_info_alloc+0x354/0x3e0 [mac80211]
[ 3076.845880] ra    : 87584e80 sta_info_alloc+0x33c/0x3e0 [mac80211]
[ 3076.852146] Status: 1100dc03    KERNEL EXL IE
[ 3076.856415] Cause : 00800008 (ExcCode 02)
[ 3076.860479] BadVA : 00000014
[ 3076.863393] PrId  : 00019750 (MIPS 74Kc)
[ 3076.867369] Modules linked in: pppoe ppp_async ath9k pppox
ppp_generic nf_conntrack_ipv6 iptable_nat ipt_REJECT ipt_MASQUERADE
ath9k_common xt_time xt_tcpudp xt_state xt_nat xt_multiport xt_mark
xt_mac xt_limit xt_conntrack xt_comment xt_TCPMSS xt_REDIRECT xt_LOG
slhc nf_reject_ipv4 nf_nat_redirect nf_nat_masquerade_ipv4
nf_conntrack_ipv4 nf_nat_ipv4 nf_nat nf_log_ipv4 nf_defrag_ipv6
nf_defrag_ipv4 nf_conntrack_rtcache nf_conntrack iptable_mangle
iptable_filter ip_tables crc_ccitt ath9k_hw ath10k_pci ath10k_core ath
mac80211 cfg80211 compat ip6t_REJECT nf_reject_ipv6 nf_log_ipv6
nf_log_common ip6table_mangle ip6table_filter ip6_tables x_tables
usb_storage ehci_platform sd_mod scsi_mod ehci_hcd gpio_button_hotplug
usbcore nls_base usb_common
[ 3076.934387] Process hostapd (pid: 13777, threadinfo=872aa000,
task=8645b250, tls=77187d48)
[ 3076.942759] Stack : 80117ecc 00000100 00000200 87125680 872e10a0
872abbf8 8691c000 8691c420
      87520b40 870dbb40 87426c00 00000000 77180d8c 8759f1cc 00000000 872abb1c
      80117ecc 00000100 00000200 87520000 8691c000 8688ec1c 872abc7c 874da844
      80117ecc 00000100 8691c420 87c47120 8688ec2c 00000000 000000a0 00000000
      00000002 00000000 00010000 00000000 00000000 00000000 00000000 00000000
      ...
[ 3076.979093] Call Trace:
[ 3076.981618] [<87584e98>] sta_info_alloc+0x354/0x3e0 [mac80211]
[ 3076.987609] [<8759f1cc>] ieee80211_channel_switch+0x13b8/0x1524 [mac80211]
[ 3076.994616]
[ 3076.996121]
Code: 02221021  24030001  8c420000 <94420014> 7c420880  10430008
00000000  24040003  10440006
[ 3077.006280] ---[ end trace 872d9dfffb08d56d ]---
[ 3077.015269] Fatal exception: panic in 5 seconds
[ 3082.024787] Kernel panic - not syncing: Fatal exception
[ 3082.033660] Rebooting in 3 seconds..

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
