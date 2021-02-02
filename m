Return-Path: <SRS0=CwSx=HE=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66A08C433DB
	for <ath10k@archiver.kernel.org>; Tue,  2 Feb 2021 16:32:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AD2564F74
	for <ath10k@archiver.kernel.org>; Tue,  2 Feb 2021 16:32:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AD2564F74
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5QCKHjn+WrR6IdTUjFrUH4cLnRHK6KKjke9tOu2LM2o=; b=pmdIWo9SJpUQEq8iedj4VNdzJM
	iomXnwgcUFxMk5FmTMncchLCptJM07GQHgIERKLtf8QrudoiQHg39ol/oho8WoaiRlH3PE++zPL12
	Jg3sZgcq5M1awkmryUSxYbl00C4n8R7XE9r78epVD6lQe3dJq14AZO0Z/RVetk+hfJsH6pNBo6tSV
	MTTRUOL5TXCA2YlhCDIq/BgpZM0nBtJZQz0lMx/WnHl8DIcx29lxE5dx811wtoSloMaTSWfxkZr9U
	55viz1XIQAClHScmNvPnxeP2ncGdV64+SfVRqWoIT/ihRFqSwqfa9FAKrd8fMs0LPjdxeiQ5o4EMe
	QG9Y4o6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6ybN-0005Le-Tn; Tue, 02 Feb 2021 16:32:29 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6ybK-0005Jv-DL
 for ath10k@lists.infradead.org; Tue, 02 Feb 2021 16:32:27 +0000
Received: by mail-qk1-x72b.google.com with SMTP id 19so20364080qkh.3
 for <ath10k@lists.infradead.org>; Tue, 02 Feb 2021 08:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=WBI+c5Cl6n9SF5INzk66SS3FTjIuqxLVOLMc2A5gW3w=;
 b=dcW9l2llUCPy3uEI53l6pGKdRqf0LUXgF7hbaOnvEu0ip8a+DcAdYsekVGeBW1d/H0
 EZpNEwY0jBYW62TMgHtAU54KZZkEbhBSVjgDm2iBgzwr18QT/Qz14Ktvm1zSi4mgaWRE
 BKQjtsPR1bhrZdWwS5DaCYQOdTrEZ7uqUJm66oi4gf/ajR9cs1dvkFsduhTC4bPGQ7m+
 K2ZZB5k0Oy/fM53zmV1xTIxI4IS3ssvTYjCrdbvuH5COWHyxtudV4qLxRgibNY66kdIx
 W58jEfPzmF8zAaGzpsCHhJ8ddiRUIM0AR+AbNDNQMdse8Q/MQaeDvRifAar5XIOHkgH9
 VO6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=WBI+c5Cl6n9SF5INzk66SS3FTjIuqxLVOLMc2A5gW3w=;
 b=CILrhDw0tH+50sjezD6wjWm7eKKwgMVHPv/NJ/IPLSepn9rT4wAusrdzFGuSS8EFpx
 j5nDWR3l5TeCGvjhRAPrjDG0tEu1b5ZiM6lvzIRCdujVzWVVxhBiqaYM8MeWYyq1nXKG
 rL284zqRhczo1JQzAbTCRmRyBAvmZ2wI8zu6kKoL6TIu052p0X4w20fdUJQRIOmenxkI
 GV4qQqpO21MJMRg0CV+CR3lyddc5bI9SC2sp3wjJcF+xsDlHmnF0RarZtGx9kFfPl8qi
 0KxnW4FxFuKbHLtdcMmbCuJMtJ5LgR7vAVy1S1KdyUJHlX+Yt0mvPWGxWbCMQ0Z9vMwo
 YV3g==
X-Gm-Message-State: AOAM532pz7XmVuT5mh90WeS5OZQ7+5fumfeS1ob30yWQ/71MOSLPxX/3
 Vm43tgJp7TbtcXSJjOcocjJ+tocAK7Xsm1I8HFhQjR3OD0g=
X-Google-Smtp-Source: ABdhPJw/0zi+lktb7sC6K8TpM2x39uOVNUyQc0si25ReKXcCUGkKWSeeuL4tbGixmar+6d0TwRZLmqKStpDJSdUmjBI=
X-Received: by 2002:ae9:d8c1:: with SMTP id
 u184mr22757424qkf.116.1612283542435; 
 Tue, 02 Feb 2021 08:32:22 -0800 (PST)
MIME-Version: 1.0
From: nospam forme <nospamforme8675309@gmail.com>
Date: Tue, 2 Feb 2021 10:32:11 -0600
Message-ID: <CAPB66zAYzcqVb2BkTE_JJxiD6r+MeR_LVoW4BPdTBynyeoCFbA@mail.gmail.com>
Subject: bss channel survey timed out and then hardware became unavailable on
 IPQ40xx.
To: ath10k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_113226_490219_208BB077 
X-CRM114-Status: UNSURE (   6.79  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
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
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hi!

I have an IPQ40xx router that occasionally gets "bss channnel survey
timed out" and then "hardware became unavailable". Is there a way to
prevent this or recover?



Tue Jan 26 18:09:30 2021 kern.warn kernel: [ 241.438212] ath10k_ahb
a000000.wifi: bss channel survey timed out

Tue Jan 26 18:09:33 2021 kern.warn kernel: [ 244.478151] ath10k_ahb
a000000.wifi: wmi command 36892 timeout, restarting hardware

Tue Jan 26 18:09:33 2021 kern.warn kernel: [ 244.478202] ath10k_ahb
a000000.wifi: failed to set dtim period for vdev 0: -11

Tue Jan 26 18:09:33 2021 kern.warn kernel: [ 244.486990] ath10k_ahb
a000000.wifi: failed to recalculate rts/cts prot for vdev 0: -108

Tue Jan 26 18:09:33 2021 kern.warn kernel: [ 244.491977] ath10k_ahb
a000000.wifi: failed to set cts protection for vdev 0: -108

Tue Jan 26 18:09:33 2021 kern.warn kernel: [ 244.500212] ath10k_ahb
a000000.wifi: failed to set erp slot for vdev 0: -108

Tue Jan 26 18:09:33 2021 kern.warn kernel: [ 244.507547] ath10k_ahb
a000000.wifi: failed to set preamble for vdev 0: -108

Tue Jan 26 18:09:33 2021 kern.warn kernel: [ 244.514788] ath10k_ahb
a000000.wifi: failed to set mgmt tx rate -108

Tue Jan 26 18:09:33 2021 kern.warn kernel: [ 244.534106] ath10k_ahb
a000000.wifi: failed to read hi_board_data address: -16

Tue Jan 26 18:09:33 2021 kern.info kernel: [ 244.538921] ieee80211
phy0: Hardware restart was requested

Tue Jan 26 18:09:33 2021 kern.warn kernel: [ 244.540296] ath10k_ahb
a000000.wifi: failed to send pdev bss chan info request

Tue Jan 26 18:09:33 2021 kern.err kernel: [ 244.548191] ath10k_ahb
a000000.wifi: failed to halt axi bus: 0

Tue Jan 26 18:09:34 2021 kern.err kernel: [ 244.721641] ath10k_ahb
a000000.wifi: Failed to get pcie state addr: -16

Tue Jan 26 18:09:34 2021 kern.err kernel: [ 244.721684] ath10k_ahb
a000000.wifi: failed to setup init config: -16

Tue Jan 26 18:09:34 2021 kern.err kernel: [ 244.727209] ath10k_ahb
a000000.wifi: Could not init hif: -16

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 244.733692] ------------[
cut here ]------------

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 244.739576] WARNING: CPU:
0 PID: 3 at backports-4.19.137-1/net/mac80211/util.c:2046
ieee80211_reconfig+0x98/0xb64 [mac80211]

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 244.744002] Hardware
became unavailable during restart.

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 244.755225] Modules
linked in: pppoe ppp_async ath10k_pci ath10k_core ath pppox
ppp_generic nf_conntrack_ipv6 mac80211 iptable_nat ipt_REJECT
ipt_MASQUERADE ebtable_nat ebtable_filter ebtable_broute cp210x ch341
cfg80211 xt_time xt_tcpudp xt_state xt_nat xt_multiport xt_mark xt_mac
xt_limit xt_conntrack xt_comment xt_TCPMSS xt_REDIRECT xt_LOG
xt_FLOWOFFLOAD wireguard usbserial usbnet slhc nf_reject_ipv4
nf_nat_redirect nf_nat_masquerade_ipv4 nf_conntrack_ipv4 nf_nat_ipv4
nf_nat nf_log_ipv4 nf_flow_table_hw nf_flow_table nf_defrag_ipv6
nf_defrag_ipv4 nf_conntrack_rtcache nf_conntrack_netlink nf_conntrack
macvlan iptable_mangle iptable_filter ip_tables ebtables ebt_vlan
ebt_stp ebt_redirect ebt_pkttype ebt_mark_m ebt_mark ebt_limit ebt_ip6
ebt_among ebt_802_3 crc_ccitt compat cdc_acm sch_tbf sch_ingress

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 244.809148] sch_htb
sch_hfsc em_u32 cls_u32 cls_tcindex cls_route cls_matchall cls_fw
cls_flow cls_basic act_skbedit act_mirred xt_set ip_set_list_set
ip_set_hash_netportnet ip_set_hash_netport ip_set_hash_netnet
ip_set_hash_netiface ip_set_hash_net ip_set_hash_mac
ip_set_hash_ipportnet ip_set_hash_ipportip ip_set_hash_ipport
ip_set_hash_ipmark ip_set_hash_ip ip_set_bitmap_port
ip_set_bitmap_ipmac ip_set_bitmap_ip ip_set nfnetlink nf_log_ipv6
nf_log_common ip6table_mangle ip6table_filter ip6_tables ip6t_REJECT
x_tables nf_reject_ipv6 ip6_udp_tunnel udp_tunnel ip6_tunnel tunnel6
tun leds_gpio xhci_plat_hcd xhci_pci xhci_hcd dwc3 dwc3_of_simple
ehci_platform ehci_hcd gpio_button_hotplug mii

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 244.870014] CPU: 0 PID: 3
Comm: kworker/0:0 Not tainted 4.14.200 #0

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 244.892172] Hardware
name: Generic DT based system

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 244.898472] Workqueue:
events_freezable ieee80211_restart_work [mac80211]

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 244.903220] [<c030e3a8>]
(unwind_backtrace) from [<c030a8a0>] (show_stack+0x10/0x14)

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 244.910071] [<c030a8a0>]
(show_stack) from [<c0721494>] (dump_stack+0x94/0xa8)

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 244.917876] [<c0721494>]
(dump_stack) from [<c031dc58>] (__warn+0xe4/0x100)

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 244.924905] [<c031dc58>]
(__warn) from [<c031dcac>] (warn_slowpath_fmt+0x38/0x48)

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 244.931867] [<c031dcac>]
(warn_slowpath_fmt) from [<bf4b9f24>] (ieee80211_reconfig+0x98/0xb64
[mac80211])

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 244.939620] [<bf4b9f24>]
(ieee80211_reconfig [mac80211]) from [<bf4897f0>]
(ieee80211_restart_work+0xa8/0xb4 [mac80211])

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 244.949038] [<bf4897f0>]
(ieee80211_restart_work [mac80211]) from [<c0333640>]
(process_one_work+0x280/0x410)

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 244.959900] [<c0333640>]
(process_one_work) from [<c0333b00>] (worker_thread+0x330/0x560)

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 244.969704] [<c0333b00>]
(worker_thread) from [<c0338fc0>] (kthread+0x134/0x13c)

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 244.977861] [<c0338fc0>]
(kthread) from [<c0307568>] (ret_from_fork+0x14/0x2c)

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 244.985442] ---[ end
trace fb0fc35d89e4ff3d ]---

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 244.992409] ------------[
cut here ]------------

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 244.997253] WARNING: CPU:
0 PID: 3 at backports-4.19.137-1/net/mac80211/driver-ops.h:19
drv_ampdu_action+0x4c/0x1e8 [mac80211]

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 245.001767] group-ap2:
Failed check-sdata-in-driver check, flags: 0x9

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 245.012952] Modules
linked in: pppoe ppp_async ath10k_pci ath10k_core ath pppox
ppp_generic nf_conntrack_ipv6 mac80211 iptable_nat ipt_REJECT
ipt_MASQUERADE ebtable_nat ebtable_filter ebtable_broute cp210x ch341
cfg80211 xt_time xt_tcpudp xt_state xt_nat xt_multiport xt_mark xt_mac
xt_limit xt_conntrack xt_comment xt_TCPMSS xt_REDIRECT xt_LOG
xt_FLOWOFFLOAD wireguard usbserial usbnet slhc nf_reject_ipv4
nf_nat_redirect nf_nat_masquerade_ipv4 nf_conntrack_ipv4 nf_nat_ipv4
nf_nat nf_log_ipv4 nf_flow_table_hw nf_flow_table nf_defrag_ipv6
nf_defrag_ipv4 nf_conntrack_rtcache nf_conntrack_netlink nf_conntrack
macvlan iptable_mangle iptable_filter ip_tables ebtables ebt_vlan
ebt_stp ebt_redirect ebt_pkttype ebt_mark_m ebt_mark ebt_limit ebt_ip6
ebt_among ebt_802_3 crc_ccitt compat cdc_acm sch_tbf sch_ingress

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 245.068370] sch_htb
sch_hfsc em_u32 cls_u32 cls_tcindex cls_route cls_matchall cls_fw
cls_flow cls_basic act_skbedit act_mirred xt_set ip_set_list_set
ip_set_hash_netportnet ip_set_hash_netport ip_set_hash_netnet
ip_set_hash_netiface ip_set_hash_net ip_set_hash_mac
ip_set_hash_ipportnet ip_set_hash_ipportip ip_set_hash_ipport
ip_set_hash_ipmark ip_set_hash_ip ip_set_bitmap_port
ip_set_bitmap_ipmac ip_set_bitmap_ip ip_set nfnetlink nf_log_ipv6
nf_log_common ip6table_mangle ip6table_filter ip6_tables ip6t_REJECT
x_tables nf_reject_ipv6 ip6_udp_tunnel udp_tunnel ip6_tunnel tunnel6
tun leds_gpio xhci_plat_hcd xhci_pci xhci_hcd dwc3 dwc3_of_simple
ehci_platform ehci_hcd gpio_button_hotplug mii

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 245.129211] CPU: 0 PID: 3
Comm: kworker/0:0 Tainted: G W 4.14.200 #0

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 245.151377] Hardware
name: Generic DT based system

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 245.159057] Workqueue:
events_freezable ieee80211_restart_work [mac80211]

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 245.163640] [<c030e3a8>]
(unwind_backtrace) from [<c030a8a0>] (show_stack+0x10/0x14)

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 245.170487] [<c030a8a0>]
(show_stack) from [<c0721494>] (dump_stack+0x94/0xa8)

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 245.178296] [<c0721494>]
(dump_stack) from [<c031dc58>] (__warn+0xe4/0x100)

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 245.185327] [<c031dc58>]
(__warn) from [<c031dcac>] (warn_slowpath_fmt+0x38/0x48)

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 245.192293] [<c031dcac>]
(warn_slowpath_fmt) from [<bf48c75c>] (drv_ampdu_action+0x4c/0x1e8
[mac80211])

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 245.199977] [<bf48c75c>]
(drv_ampdu_action [mac80211]) from [<bf497e7c>]
(___ieee80211_stop_rx_ba_session+0x90/0x138 [mac80211])

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 245.209183] [<bf497e7c>]
(___ieee80211_stop_rx_ba_session [mac80211]) from [<bf49640c>]
(ieee80211_sta_tear_down_BA_sessions+0x50/0xfc [mac80211])

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 245.220995] [<bf49640c>]
(ieee80211_sta_tear_down_BA_sessions [mac80211]) from [<bf48dad0>]
(ieee80211_send_eosp_nullfunc+0x620/0x9a0 [mac80211])

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 245.234018] [<bf48dad0>]
(ieee80211_send_eosp_nullfunc [mac80211]) from [<bf49055c>]
(__sta_info_flush+0xb8/0x158 [mac80211])

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 245.247041] [<bf49055c>]
(__sta_info_flush [mac80211]) from [<bf4a4af8>]
(ieee80211_stop_ap+0xe4/0x1f8 [mac80211])

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 245.258327] [<bf4a4af8>]
(ieee80211_stop_ap [mac80211]) from [<bf429dac>]
(__cfg80211_stop_ap+0x4c/0xd8 [cfg80211])

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 245.268572] [<bf429dac>]
(__cfg80211_stop_ap [cfg80211]) from [<bf402d98>]
(cfg80211_leave+0x24/0x30 [cfg80211])

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 245.278837] [<bf402d98>]
(cfg80211_leave [cfg80211]) from [<bf402fb8>]
(cfg80211_netdev_notifier_call+0x214/0x534 [cfg80211])

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 245.289214] [<bf402fb8>]
(cfg80211_netdev_notifier_call [cfg80211]) from [<c0339c30>]
(notifier_call_chain+0x2c/0x6c)

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 245.300349] [<c0339c30>]
(notifier_call_chain) from [<c0339dac>]
(raw_notifier_call_chain+0x18/0x20)

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 245.310938] [<c0339dac>]
(raw_notifier_call_chain) from [<c06277b0>]
(__dev_close_many+0x44/0xc8)

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 245.320140] [<c06277b0>]
(__dev_close_many) from [<c0627894>] (dev_close_many+0x60/0xdc)

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 245.328902] [<c0627894>]
(dev_close_many) from [<c06298b4>] (dev_close+0x34/0x48)

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 245.337136] [<c06298b4>]
(dev_close) from [<bf4028fc>]
(cfg80211_shutdown_all_interfaces+0x58/0xa8 [cfg80211])

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 245.344631] [<bf4028fc>]
(cfg80211_shutdown_all_interfaces [cfg80211]) from [<bf4ba61c>]
(ieee80211_reconfig+0x790/0xb64 [mac80211])

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 245.354494] [<bf4ba61c>]
(ieee80211_reconfig [mac80211]) from [<bf4897f0>]
(ieee80211_restart_work+0xa8/0xb4 [mac80211])

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 245.366483] [<bf4897f0>]
(ieee80211_restart_work [mac80211]) from [<c0333640>]
(process_one_work+0x280/0x410)

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 245.377258] [<c0333640>]
(process_one_work) from [<c0333b00>] (worker_thread+0x330/0x560)

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 245.387062] [<c0333b00>]
(worker_thread) from [<c0338fc0>] (kthread+0x134/0x13c)

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 245.395221] [<c0338fc0>]
(kthread) from [<c0307568>] (ret_from_fork+0x14/0x2c)

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 245.402846] ---[ end
trace fb0fc35d89e4ff3e ]---

Tue Jan 26 18:09:34 2021 kern.info kernel: [ 245.409750] group-ap2: HW
problem - can not stop rx aggregation for 06:ef:c0:01:33:6b tid 0

Tue Jan 26 18:09:34 2021 kern.warn kernel: [ 245.414504] ------------[
cut here ]------------

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
