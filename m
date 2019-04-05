Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from [208.74.158.174] (helo=mail3.candelatech.com)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCPk5-000173-FJ
 for ath10k@lists.infradead.org; Fri, 05 Apr 2019 14:22:55 +0000
Subject: Re: Kernel crash in skb_put caused by ath10k_htt_t2h_msg_handler
References: <20190405092457.GE41661@meh.true.cz>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <13451ca6-d102-0d19-7cb9-450b04c5f06f@candelatech.com>
Date: Fri, 5 Apr 2019 07:22:51 -0700
MIME-Version: 1.0
In-Reply-To: <20190405092457.GE41661@meh.true.cz>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: =?UTF-8?Q?Petr_=c5=a0tetiar?= <ynezz@true.cz>, ath10k@lists.infradead.org



On 04/05/2019 02:24 AM, Petr =8Atetiar wrote:
> Hi,
>
> I've just hit following crash on my TP Link Archer C7 v5 with QCA9880,
> running latest OpenWrt with 4.14.109 (4.19.23-1 backports) and qca988x-ct
> firmware:

Hello,

Can you use gdb to print out the lines of code around that crash site in t2=
h_msg_handler?  If
I can figure out which message caused it I can add debugging and/or protect=
ive code.

Thanks,
Ben

>
>  skbuff: skb_over_panic: text:87622780 len:360 put:360 head:  (null) data=
:  (null) tail:0x168 end:0x0 dev:<NULL>
>  Kernel bug detected[#1]:
>  CPU: 0 PID: 0 Comm: swapper Not tainted 4.14.109 #0
>  task: 804e5490 task.stack: 804e0000
>  $ 0   : 00000000 00000001 0000006f 00000000
>  $ 4   : 804ea7d8 804ea7d8 804f1a50 000085c8
>  $ 8   : 00000000 00000000 00000007 00000000
>  $12   : 000001c1 efec8fad 000001c0 00000000
>  $16   : 00000000 87551bf8 87263054 00000416
>  $20   : 875514e0 87c07dc0 87551bf8 00000000
>  $24   : 00000002 80279994
>  $28   : 804e0000 87c07d40 8765d994 802f4bd0
>  Hi    : 00000000
>  Lo    : ec4e4000
>  epc   : 802f4bd0 skb_panic+0x58/0x5c
>  ra    : 802f4bd0 skb_panic+0x58/0x5c
>  Status: 1100dc03 KERNEL EXL IE
>  Cause : 00800024 (ExcCode 09)
>  PrId  : 00019750 (MIPS 74Kc)
>  Modules linked in: ath9k ath9k_common ath9k_hw ath10k_pci ath10k_core at=
h mac80211 iptable_nat iptable_mangle iptable_filter ipt_REJECT ipt_MASQUER=
ADE ip_tables cfg80211 xt_time xt_tcpudp xt_state xt_nat xt_multiport xt_ma=
rk xt_mac xt_limit xt_conntrack xt_comment xt_TCPMSS xt_REDIRECT xt_LOG xt_=
FLOWOFFLOAD xt_CT x_tables nf_reject_ipv4 nf_nat_redirect nf_nat_masquerade=
_ipv4 nf_conntrack_ipv4 nf_nat_ipv4 nf_nat nf_log_ipv4 nf_log_common nf_flo=
w_table_hw nf_flow_table nf_defrag_ipv4 nf_conntrack_rtcache nf_conntrack c=
ompat ledtrig_usbport tun ehci_platform ehci_hcd gpio_button_hotplug usbcor=
e nls_base usb_common
>  Process swapper (pid: 0, threadinfo=3D804e0000, task=3D804e5490, tls=3D0=
0000000)
>  Stack : 80501cc0 8041f040 87622780 00000168 00000168 00000000 00000000 0=
0000168
>          00000000 804b209c 00001770 802f4c60 87490000 87649118 804fcbf4 0=
0000900
>          01080020 87622780 00000900 875514e0 875578c4 804e0000 00000000 0=
0000000
>          fffffffb 87c07dc4 87551cdc 804e0000 875514e0 804e0000 00000000 0=
0000004
>          87263054 87263054 00000001 00000034 87465180 8755777c 87465b40 8=
7660000
>          ...
>  Call Trace:
>  [<802f4bd0>] skb_panic+0x58/0x5c
>  [<802f4c60>] skb_put+0x48/0x54
>  [<87622780>] ath10k_htt_t2h_msg_handler+0x27e0/0x31dc [ath10k_core]
>  [<8764901c>] ath10k_ce_rx_update_write_idx+0x9c/0xc4 [ath10k_core]
>  Code: 00602825  0c02ce18  248433d4 <000c000d> 8c8200ac  8c88005c  8c8700=
a8  00451023  01054021
>
>  ---[ end trace 6b934e1b587e6bcd ]---
>  Kernel panic - not syncing: Fatal exception in interrupt
>  Rebooting in 3 seconds..
>
> I've looked at the git log till 5.1-rc3 for htt_rx.c and ce.c, but couldn=
't
> find anything possibly related to this issue, so I'm wondering if this is=
 known
> and already fixed bug. Thanks for any pointers!
>
> -- ynezz
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
>

-- =

Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
