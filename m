Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx1.mailbox.org ([2001:67c:2050:104:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i9ygD-0005qa-N9
 for ath10k@lists.infradead.org; Mon, 16 Sep 2019 21:37:08 +0000
Subject: Re: [PATCH] ath10k: Check if station exists before forwarding tx
 airtime report
References: <20190818190920.22813-1-hauke@hauke-m.de>
From: Hauke Mehrtens <hauke@hauke-m.de>
Message-ID: <768b757b-7896-9dd0-3fc9-c1a7532333d9@hauke-m.de>
Date: Mon, 16 Sep 2019 23:36:53 +0200
MIME-Version: 1.0
In-Reply-To: <20190818190920.22813-1-hauke@hauke-m.de>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============9154489172440669007=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: kvalo@codeaurora.org
Cc: mpubbise@codeaurora.org, hannu.nyman@iki.fi, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============9154489172440669007==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="z0lKSHxyTcj1NO7mcakd6yX5eBoGCajkP"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--z0lKSHxyTcj1NO7mcakd6yX5eBoGCajkP
Content-Type: multipart/mixed; boundary="IYyUJQXknpPaiz7LN2mDKesfI03LucIOH";
 protected-headers="v1"
From: Hauke Mehrtens <hauke@hauke-m.de>
To: kvalo@codeaurora.org
Cc: hannu.nyman@iki.fi, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, mpubbise@codeaurora.org
Message-ID: <768b757b-7896-9dd0-3fc9-c1a7532333d9@hauke-m.de>
Subject: Re: [PATCH] ath10k: Check if station exists before forwarding tx
 airtime report
References: <20190818190920.22813-1-hauke@hauke-m.de>
In-Reply-To: <20190818190920.22813-1-hauke@hauke-m.de>

--IYyUJQXknpPaiz7LN2mDKesfI03LucIOH
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 8/18/19 9:09 PM, Hauke Mehrtens wrote:
> It looks like the FW on QCA9984 already reports the tx airtimes before
> the station is added to the peer entry. The peer entry is created in
> ath10k_peer_map_event() just with the vdev_id and the ethaddr, but
> not with a station entry, this is added later in ath10k_peer_create() i=
n
> callbacks from mac80211.
>=20
> When there is no sta added to the peer entry, this function fails
> because it calls ieee80211_sta_register_airtime() with NULL.
>=20
> This was reported in OpenWrt some time ago:
> https://bugs.openwrt.org/index.php?do=3Ddetails&task_id=3D2414
>=20
> This commit should fix this crash:
> [   75.991714] Unable to handle kernel paging request at virtual addres=
s fffff9e8
> [   75.991756] pgd =3D c0204000
> [   75.997955] [fffff9e8] *pgd=3D5fdfd861, *pte=3D00000000, *ppte=3D000=
00000
> [   76.000537] Internal error: Oops: 37 [#1] SMP ARM
> [   76.006686] Modules linked in: pppoe ppp_async ath10k_pci ath10k_cor=
e ath pptp pppox ppp_mppe ppp_generic mac80211 iptable_nat ipt_REJECT ipt=
_MASQUERADE cfg80211 xt_time xt_tcpudp xt_tcpmss xt_statistic xt_state xt=
_recent xt_nat xt_multiport xt_mark xt_mac xt_limit xt_length xt_hl xt_he=
lper xt_esp xt_ecn xt_dscp xt_conntrack xt_connmark xt_connlimit xt_connb=
ytes xt_comment xt_TCPMSS xt_REDIRECT xt_LOG xt_HL xt_FLOWOFFLOAD xt_DSCP=
 xt_CT xt_CLASSIFY usbserial slhc nf_reject_ipv4 nf_nat_redirect nf_nat_m=
asquerade_ipv4 nf_conntrack_ipv4 nf_nat_ipv4 nf_log_ipv4 nf_flow_table_hw=
 nf_flow_table nf_defrag_ipv4 nf_conntrack_rtcache nf_conntrack_netlink i=
ptable_raw iptable_mangle iptable_filter ipt_ah ipt_ECN ip_tables crc_cci=
tt compat chaoskey fuse sch_cake sch_tbf sch_ingress sch_htb sch_hfsc em_=
u32 cls_u32
> [   76.059974]  cls_tcindex cls_route cls_matchall cls_fw cls_flow cls_=
basic act_skbedit act_mirred ledtrig_usbport xt_set ip_set_list_set ip_se=
t_hash_netportnet ip_set_hash_netport ip_set_hash_netnet ip_set_hash_neti=
face ip_set_hash_net ip_set_hash_mac ip_set_hash_ipportnet ip_set_hash_ip=
portip ip_set_hash_ipport ip_set_hash_ipmark ip_set_hash_ip ip_set_bitmap=
_port ip_set_bitmap_ipmac ip_set_bitmap_ip ip_set nfnetlink ip6table_nat =
nf_conntrack_ipv6 nf_defrag_ipv6 nf_nat_ipv6 ip6t_NPT ip6t_MASQUERADE nf_=
nat_masquerade_ipv6 nf_nat nf_conntrack nf_log_ipv6 nf_log_common ip6tabl=
e_mangle ip6table_filter ip6_tables ip6t_REJECT x_tables nf_reject_ipv6 m=
sdos ip_gre gre ifb sit tunnel4 ip_tunnel tun vfat fat hfsplus cifs nls_u=
tf8 nls_iso8859_15 nls_iso8859_1 nls_cp850 nls_cp437 nls_cp1250 sha1_gene=
ric md5 md4
> [   76.130634]  usb_storage leds_gpio xhci_plat_hcd xhci_pci xhci_hcd d=
wc3 dwc3_of_simple ohci_platform ohci_hcd phy_qcom_dwc3 ahci ehci_platfor=
m sd_mod ahci_platform libahci_platform libahci libata scsi_mod ehci_hcd =
gpio_button_hotplug ext4 mbcache jbd2 exfat crc32c_generic
> [   76.154772] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 4.14.132 #0
> [   76.177001] Hardware name: Generic DT based system
> [   76.182990] task: c0b06d80 task.stack: c0b00000
> [   76.187832] PC is at ieee80211_sta_register_airtime+0x24/0x148 [mac8=
0211]
> [   76.192211] LR is at ath10k_htt_t2h_msg_handler+0x678/0x10f4 [ath10k=
_core]
> [   76.199052] pc : [<bf75bfac>]    lr : [<bf83e8b0>]    psr: a0000113
> [   76.205820] sp : c0b01d54  ip : 00000002  fp : bf869c0c
> [   76.211981] r10: 0000003c  r9 : dbdca138  r8 : 00060002
> [   76.217192] r7 : 00000000  r6 : dabe1150  r5 : 00000000  r4 : dbdc95=
c0
> [   76.222401] r3 : 00000000  r2 : 00060002  r1 : 00000000  r0 : 000000=
00
> [   76.229003] Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Seg=
ment none
> [   76.235509] Control: 10c5787d  Table: 5c94006a  DAC: 00000051
> [   76.242716] Process swapper/0 (pid: 0, stack limit =3D 0xc0b00210)
> [   76.248446] Stack: (0xc0b01d54 to 0xc0b02000)
> [   76.254532] 1d40:                                              dbdc9=
5c0 00000000 dabe1150
> [   76.258808] 1d60: 00000001 dabe1150 dbdca138 0000003c bf869c0c bf83e=
8b0 00000002 c0314b10
> [   76.266969] 1d80: dbdc9c70 00000001 00000001 dabe114c 00010000 00000=
000 dbdcd724 bf88f3d8
> [   76.275126] 1da0: c0310d28 db393c00 dbdc95c0 00000000 c0b01dd0 c07fb=
4c4 dbdcd724 00000001
> [   76.283286] 1dc0: 00000022 bf88b09c db393c00 00000022 c0b01dd0 c0b01=
dd0 00000000 dbdcc5c0
> [   76.291445] 1de0: bf88f04c dbdcd654 dbdcd71c dbdc95c0 00000014 dbdcd=
724 dbdcc5c0 00000005
> [   76.299605] 1e00: 0004b400 bf85c360 00000000 bf87101c c0b01e24 00000=
006 00000000 dbdc95c0
> [   76.307764] 1e20: 00000001 00000040 0000012c c0b01e80 1cf51000 bf85c=
448 dbdcd440 dbdc95c0
> [   76.315925] 1e40: dbdca440 ffffa880 00000040 bf88cb68 dbdcd440 00000=
001 00000040 ffffa880
> [   76.324084] 1e60: c0b02d00 c06d72e0 dd990080 c0a3f080 c0b255dc c0b04=
7e4 c090afac c090e80c
> [   76.332244] 1e80: c0b01e80 c0b01e80 c0b01e88 c0b01e88 dd4cc200 00000=
000 00000003 c0b0208c
> [   76.340405] 1ea0: c0b02080 40000003 ffffe000 00000100 c0b02080 c0301=
5c8 00000000 00000001
> [   76.348564] 1ec0: dd408000 c0a38210 c0b2c7c0 0000000a ffffa880 c0b02=
d00 c07fb764 00200102
> [   76.356723] 1ee0: dd4cc268 c0a3e414 00000000 00000000 00000001 dd408=
000 de803000 00000000
> [   76.364883] 1f00: 00000000 c03247cc c0a3e414 c0368f1c c0b03f60 c0b15=
3cc de80200c de802000
> [   76.373042] 1f20: c0b01f48 c0301488 c0308630 60000013 ffffffff c0b01=
f7c 00000000 c0b00000
> [   76.381204] 1f40: 00000000 c030c08c 00000001 00000000 00000000 c0315=
180 ffffe000 c0b03cc0
> [   76.389363] 1f60: c0b03c70 00000000 00000000 c0a2da28 00000000 00000=
000 c0b01f90 c0b01f98
> [   76.397522] 1f80: c030862c c0308630 60000013 ffffffff 00000051 00000=
000 ffffe000 c035dd18
> [   76.405681] 1fa0: 000000bf c0b03c40 00000000 c0b2c000 dddfce80 c035e=
060 c0b2c040 c0a00cf4
> [   76.413842] 1fc0: ffffffff ffffffff 00000000 c0a0067c c0a2da28 00000=
000 00000000 c0b2c1d4
> [   76.422001] 1fe0: c0b03c5c c0a2da24 c0b07ee0 4220406a 512f04d0 42208=
07c 00000000 00000000
> [   76.430335] [<bf75bfac>] (ieee80211_sta_register_airtime [mac80211])=
 from [<00000002>] (0x2)
> [   76.438314] Code: e1cd81f0 e1a08002 e1cda1f8 e58de020 (e5102618)
> [   76.446965] ---[ end trace 227a38ade964d642 ]---
>=20
> Fixes: bb31b7cb106c ("ath10k: report tx airtime provided by fw")
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> ---

What is the status of this patch? It fixes a problem multiple OpenWrt
user complained about.

Hauke

>  drivers/net/wireless/ath/ath10k/htt_rx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wir=
eless/ath/ath10k/htt_rx.c
> index 83a7fb68fd24..7f3ec7fa5a44 100644
> --- a/drivers/net/wireless/ath/ath10k/htt_rx.c
> +++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
> @@ -2639,7 +2639,7 @@ static void ath10k_htt_rx_tx_compl_ind(struct ath=
10k *ar,
>  		spin_lock_bh(&ar->data_lock);
> =20
>  		peer =3D ath10k_peer_find_by_id(ar, peer_id);
> -		if (!peer) {
> +		if (!peer || !peer->sta) {
>  			spin_unlock_bh(&ar->data_lock);
>  			rcu_read_unlock();
>  			continue;
>=20



--IYyUJQXknpPaiz7LN2mDKesfI03LucIOH--

--z0lKSHxyTcj1NO7mcakd6yX5eBoGCajkP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEyz0/uAcd+JwXmwtD8bdnhZyy68cFAl2AAHUACgkQ8bdnhZyy
68d+Ygf/SDPYQ0z7KvZure77DT5jqehpTBUb0GiVcYpwynMetp6FnAUsvHmag8BQ
XciBMO76Is4UK49mnpwbSlS6AvPkjXcG+ql7miGPyC247cg6MBIgBBb/xoMRegbV
5DzAw1UkkdzEzg1zHHOwxXIzojo6CU0xMRcwlSWrvvUcNViNSYe9q4tvL9wLV/28
MjOs6eA+b7uZh1zz0pM2MkG0Cm7YQ4yDzsdxi6dAo/djJavPY5PihDN9mDxF545w
9AN9LS2cwxrKN/rjBIT7IXn2i8GU6oP9aF4N+5FuWG99++kEifiY9SjpVN24pcOC
OoAWRriItr3+hf5QfrNb8S7XmLXfyQ==
=+ejs
-----END PGP SIGNATURE-----

--z0lKSHxyTcj1NO7mcakd6yX5eBoGCajkP--


--===============9154489172440669007==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============9154489172440669007==--
