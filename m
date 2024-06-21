Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFDAEC27C4F
	for <ath10k@archiver.kernel.org>; Fri, 21 Jun 2024 08:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VSI2yyzGMEOl1jMHYavqX3CDfQJ/NSUivwxmCx+KJx8=; b=pnTFIFIHENYUsi9Yj9GQtAC2/1
	zgRYCuT75vbrt2rVXewafHHQvSGrt1ZAjjkuswnvi5tqkGtocwsMOOtV6YHQp75wiOlImv9+S+7Ql
	KuJsg10/IG4HXd5h1U+stnIce4T1XSPHXYcLZWvuKJcycoR/+FI4zPy2H6CVykuth9SV5aJBR7keP
	ehkrSh9dIreurDd40FAEFYSrx/HzVY56N0ewbmifgxfIhbgPupDQLIb6+shjeGPSZuOmglJ7fP+GP
	jt5wT9qpB2JcLBR8JwYF7+TvWoftowGrpNh2pczuziQmuifnKPAcdzhduydd9LbNtRVhVz1GkG0/S
	YfwpXdwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKZGT-00000008Fqq-1uxp;
	Fri, 21 Jun 2024 08:04:57 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKZGP-00000008Fpr-2LX9
	for ath10k@lists.infradead.org;
	Fri, 21 Jun 2024 08:04:55 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-57d07f07a27so1807024a12.3
        for <ath10k@lists.infradead.org>; Fri, 21 Jun 2024 01:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citymesh.com; s=google; t=1718957091; x=1719561891; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VSI2yyzGMEOl1jMHYavqX3CDfQJ/NSUivwxmCx+KJx8=;
        b=PjIT5N0OsOOBFQJrIIjFkHQbNjRuyenFFhwR6gA17vcbtx5e9DVXdz3MZUb2pch9Rp
         hgGFenzn/pyGB8lm7TjmYiVe7ZS9CehRhtPSAWfqoKcNt8GVa0490xlYh3BY29IOp3TM
         yUJa54M/Z8RQuc7h/u5MHH1ZxS/qkJyTKquaIRUXmr83OIU/sqvgC6yjSOmZ1Ip+tp00
         GAWSmFfLVJn1fawaQpm3Ybfa5EjJkyJqTU1Ubp/HcHme1LdDochPLCTXauGWyI6X5WvV
         PC3Wr2ty+w02dAF91NCMyzGB5LUKmG7+hAivQIxBPAebFIOYoYWz2XhXDTFfICKBFpmU
         M+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718957091; x=1719561891;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VSI2yyzGMEOl1jMHYavqX3CDfQJ/NSUivwxmCx+KJx8=;
        b=ITYSzOKQiYPJIxP17uOQBGTrFTByXMkSG8AjUym/twv0vius49eU6aIlde5ajA+DIh
         8NHQTNaiYO/JM4JQz2bKt3anNmW0YURiC+J7XxIXxzEqN6KG2nw2OIc7qdF+LFYIZ/RR
         6unr9LbMxbD8/i06DRJ13j7t2NauybJOwBLedsUSdRVnqgDy7zEMpz/5BKbMIybAoBLm
         PQjdm7rT9kpwIsue4KbtY0nzP4qBB7PsAa9PL/oj8QqJ8ayr6SWjszp3LRzPPqeVgaso
         vJcxQmxdv0Vhkq2T/Rdjfe1ueKpEtwQKSQeC07VNiAjzFhpfRVLkasbAMaQEMn1VQkU2
         8XkA==
X-Gm-Message-State: AOJu0YzUahW0GMqH4XbwDsODjSLrrXKXhTk7eL1Xc9O7CN3VY92CdIIN
	VpbyiHfZHrLQbNeuddYIlyTb9HRIf1pIJZALBaOBvNU63Tdxm8Q18ZWR8iDQ+noQSehWLEimE6c
	wLIyIKPmGvopxusW42A6EcXXNZkLDJzR7eL1V7F0Jn1/WRgZ0xVfR0NoX
X-Google-Smtp-Source: AGHT+IGshKwjY9oBCtZcrPdff4kHU6jfIiZLHyEkWf6cdQquSNCDmq3QVIi/T+ktjNL9qTv6o80T1ekMKXRWV/F1Sco=
X-Received: by 2002:a05:6402:1289:b0:57d:10db:488e with SMTP id
 4fb4d7f45d1cf-57d10db4895mr4240104a12.30.1718957090675; Fri, 21 Jun 2024
 01:04:50 -0700 (PDT)
MIME-Version: 1.0
From: Koen Vandeputte <koen.vandeputte@citymesh.com>
Date: Fri, 21 Jun 2024 10:04:39 +0200
Message-ID: <CAPh3n83zb1PwFBFijJKChBqY95zzpYh=2iPf8tmh=YTS6e3xPw@mail.gmail.com>
Subject: ieee80211.h virtual_map splat
To: ath10k@lists.infradead.org, 
	linux-wireless <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_010453_633620_1A0975A7 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hi all,

Within OpenWRT, we switched to kernel 6.6 some time ago.

During testing on a WiFi WDS setup (ath10k), I noticed an old standing
bug which now prints a lot more data due to the kernel upgrade:

- All WDS stations are connected
- The splat occurs
- All WDS station seem to go in timeout and disconnect
- The behavior is fixed after a reboot

Yes, we use ath10k-ct over here, but this part of the code is
identical to upstream ath10k.

The main issue:

memcpy: detected field-spanning write (size 64) of single field
"tim->virtual_map" at
../ath10k-ct-smallbuffers/ath10k-ct-2024.03.02~eb3f488a/ath10k-6.7/wmi.c:4043
(size 1)


looks like virtual_map is defined as  "u8 virtual_map[1]", triggering
that error within "include/linux/ieee80211.h"

/**
 * struct ieee80211_tim_ie - Traffic Indication Map information element
 * @dtim_count: DTIM Count
 * @dtim_period: DTIM Period
 * @bitmap_ctrl: Bitmap Control
 * @virtual_map: Partial Virtual Bitmap
 *
 * This structure represents the payload of the "TIM element" as
 * described in IEEE Std 802.11-2020 section 9.4.2.5.
 */
struct ieee80211_tim_ie {
        u8 dtim_count;
        u8 dtim_period;
        u8 bitmap_ctrl;
        /* variable size: 1 - 251 bytes */
        u8 virtual_map[1];
} __packed;


According to this page, defining it this way is actually deprecated:
https://www.kernel.org/doc/html/latest/process/deprecated.html

What is the correct way to fix this?
Converting it to "u8 virtual_map[];"  ?


Thanks!



full splat log:

[   37.027955] br-wan: port 11(wlan1.sta10) entered disabled state
[   37.032802] ath10k_ahb a800000.wifi wlan1.sta10: entered allmulticast mode
[   37.038987] ath10k_ahb a800000.wifi wlan1.sta10: entered promiscuous mode
[   37.046430] br-wan: port 11(wlan1.sta10) entered blocking state
[   37.052492] br-wan: port 11(wlan1.sta10) entered forwarding state
[   37.218833] br-wan: port 12(wlan1.sta11) entered blocking state
[   37.218965] br-wan: port 12(wlan1.sta11) entered disabled state
[   37.223718] ath10k_ahb a800000.wifi wlan1.sta11: entered allmulticast mode
[   37.230047] ath10k_ahb a800000.wifi wlan1.sta11: entered promiscuous mode
[   37.237405] br-wan: port 12(wlan1.sta11) entered blocking state
[   37.243485] br-wan: port 12(wlan1.sta11) entered forwarding state
[   39.966722] br-wan: port 13(wlan1.sta7) entered blocking state
[   39.966835] br-wan: port 13(wlan1.sta7) entered disabled state
[   39.971752] ath10k_ahb a800000.wifi wlan1.sta7: entered allmulticast mode
[   39.977727] ath10k_ahb a800000.wifi wlan1.sta7: entered promiscuous mode
[   39.985296] br-wan: port 13(wlan1.sta7) entered blocking state
[   39.991074] br-wan: port 13(wlan1.sta7) entered forwarding state
[   40.578110] ath10k_ahb a800000.wifi: mac flush vdev 0 drop 0 queues
0x1 ar->paused: 0x0  arvif->paused: 0x0
[   43.478613] br-wan: port 14(wlan1.sta12) entered blocking state
[   43.478746] br-wan: port 14(wlan1.sta12) entered disabled state
[   43.483502] ath10k_ahb a800000.wifi wlan1.sta12: entered allmulticast mode
[   43.489811] ath10k_ahb a800000.wifi wlan1.sta12: entered promiscuous mode
[   43.497315] br-wan: port 14(wlan1.sta12) entered blocking state
[   43.503246] br-wan: port 14(wlan1.sta12) entered forwarding state
[   51.425993] br-wan: port 15(wlan1.sta13) entered blocking state
[   51.426108] br-wan: port 15(wlan1.sta13) entered disabled state
[   51.430959] ath10k_ahb a800000.wifi wlan1.sta13: entered allmulticast mode
[   51.437137] ath10k_ahb a800000.wifi wlan1.sta13: entered promiscuous mode
[   51.444841] br-wan: port 15(wlan1.sta13) entered blocking state
[   51.450608] br-wan: port 15(wlan1.sta13) entered forwarding state
[  378.987163] ath10k_ahb a800000.wifi: wmi: fixing invalid VHT TX
rate code 0xff
[ 2799.429749] ath10k_ahb a800000.wifi: Invalid VHT mcs 15 peer stats
[29009.581820] ------------[ cut here ]------------
[29009.581898] WARNING: CPU: 0 PID: 0 at
../ath10k-ct-smallbuffers/ath10k-ct-2024.03.02~eb3f488a/ath10k-6.7/wmi.c:4043
ath10k_wmi_event_host_swba+0x7c4/0x824 [ath10k_core]
[29009.585574] memcpy: detected field-spanning write (size 64) of
single field "tim->virtual_map" at
../ath10k-ct-smallbuffers/ath10k-ct-2024.03.02~eb3f488a/ath10k-6.7/wmi.c:4043
(size 1)
[29009.600608] Modules linked in: nft_fib_inet nf_flow_table_inet
iptable_nat ath10k_pci(O) ath10k_core(O) ath(O) xt_state xt_nat
xt_conntrack xt_REDIRECT xt_MASQUERADE xt_FLOWOFFLOAD wireguard
nft_reject_ipv6 nft_reject_ipv4 nft_reject_inet nft_reject nft_redir
nft_quota nft_numgen nft_nat nft_masq nft_log nft_limit nft_hash
nft_flow_offload nft_fib_ipv6 nft_fib_ipv4 nft_fib nft_ct nft_compat
nft_chain_nat nf_tables nf_nat nf_flow_table nf_conntrack mac80211(O)
libchacha20poly1305 iptable_mangle iptable_filter ipt_REJECT ip_tables
curve25519_neon cfg80211(O) xt_time xt_tcpudp xt_multiport xt_mark
xt_mac xt_limit xt_comment xt_TCPMSS xt_LOG x_tables poly1305_arm
nfnetlink nf_reject_ipv6 nf_reject_ipv4 nf_log_syslog nf_defrag_ipv6
nf_defrag_ipv4 mbt(O) libcurve25519_generic libcrc32c hwmon compat(O)
chacha_neon ip_gre gre dummy ip6_udp_tunnel udp_tunnel ip_tunnel tun
dns_resolver sha512_arm ghash_arm_ce cmac leds_gpio xhci_plat_hcd
xhci_pci xhci_hcd dwc3 dwc3_qcom gpio_button_hotplug(O) crc32c_generic
[29009.683039] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G           O
   6.6.32 #0
[29009.705243] Hardware name: Generic DT based system
[29009.712626]  unwind_backtrace from show_stack+0x10/0x14
[29009.717217]  show_stack from dump_stack_lvl+0x40/0x4c
[29009.722337]  dump_stack_lvl from __warn+0x94/0xbc
[29009.727546]  __warn from warn_slowpath_fmt+0xf8/0x15c
[29009.732233]  warn_slowpath_fmt from
ath10k_wmi_event_host_swba+0x7c4/0x824 [ath10k_core]
[29009.737309]  ath10k_wmi_event_host_swba [ath10k_core] from
ath10k_wmi_10_4_op_rx+0x444/0x6a4 [ath10k_core]
[29009.745437]  ath10k_wmi_10_4_op_rx [ath10k_core] from
ath10k_htc_rx_completion_handler+0xa8/0x210 [ath10k_core]
[29009.754899]  ath10k_htc_rx_completion_handler [ath10k_core] from
ath10k_pci_fw_dump_work+0xf28/0xf94 [ath10k_pci]
[29009.764894]  ath10k_pci_fw_dump_work [ath10k_pci] from
ath10k_ce_per_engine_service+0x64/0x84 [ath10k_core]
[29009.775299]  ath10k_ce_per_engine_service [ath10k_core] from
ath10k_ce_per_engine_service_any+0x74/0x194 [ath10k_core]
[29009.784848]  ath10k_ce_per_engine_service_any [ath10k_core] from
ath10k_pci_napi_poll+0x44/0x138 [ath10k_pci]
[29009.795611]  ath10k_pci_napi_poll [ath10k_pci] from
__napi_poll.constprop.0+0x2c/0x180
[29009.805589]  __napi_poll.constprop.0 from net_rx_action+0x140/0x2e8
[29009.813400]  net_rx_action from __do_softirq+0x100/0x270
[29009.819561]  __do_softirq from irq_exit+0x88/0xb4
[29009.825117]  irq_exit from call_with_stack+0x18/0x20
[29009.829715]  call_with_stack from __irq_svc+0x80/0x98
[29009.834751] Exception stack(0xc0d01f28 to 0xc0d01f70)
[29009.839706] 1f20:                   00000003 00000001 1d2e2e44
40000000 00000000 c0d04f68
[29009.844745] 1f40: c0d084c0 c0d04fa0 00000000 00000000 c0d04f08
00000000 0000001f c0d01f78
[29009.852898] 1f60: c09deaf8 c09df260 60000013 ffffffff
[29009.861055]  __irq_svc from default_idle_call+0x2c/0x30
[29009.866089]  default_idle_call from do_idle+0x1d8/0x228
[29009.871124]  do_idle from cpu_startup_entry+0x28/0x2c
[29009.876328]  cpu_startup_entry from kernel_init+0x0/0x12c
[29009.881537]  kernel_init from arch_post_acpi_subsys_init+0x0/0x8
[29009.886973] ---[ end trace 0000000000000000 ]---
[29083.868479] ath10k_ahb a800000.wifi: mac flush vdev 0 drop 0 queues
0x1 ar->paused: 0x0  arvif->paused: 0x0
[29084.022948] ath10k_ahb a800000.wifi: htt tx: fixing invalid VHT TX
rate code 0xff
[29140.323342] ath10k_ahb a800000.wifi wlan1.sta13: left allmulticast mode
[29140.323438] ath10k_ahb a800000.wifi wlan1.sta13: left promiscuous mode
[29140.329056] br-wan: port 15(wlan1.sta13) entered disabled state
[29140.578367] ath10k_ahb a800000.wifi: mac flush vdev 0 drop 0 queues
0x1 ar->paused: 0x0  arvif->paused: 0x0
[29391.197449] ath10k_ahb a800000.wifi wlan1.sta5: left allmulticast mode
[29391.197545] ath10k_ahb a800000.wifi wlan1.sta5: left promiscuous mode
[29391.203174] br-wan: port 7(wlan1.sta5) entered disabled state
[29391.458355] ath10k_ahb a800000.wifi: mac flush vdev 0 drop 0 queues
0x1 ar->paused: 0x0  arvif->paused: 0x0
[29393.265876] ath10k_ahb a800000.wifi wlan1.sta1: left allmulticast mode
[29393.265971] ath10k_ahb a800000.wifi wlan1.sta1: left promiscuous mode
[29393.271627] br-wan: port 3(wlan1.sta1) entered disabled state
[29393.498365] ath10k_ahb a800000.wifi: mac flush vdev 0 drop 0 queues
0x1 ar->paused: 0x0  arvif->paused: 0x0
[29398.364359] ath10k_ahb a800000.wifi wlan1.sta6: left allmulticast mode
[29398.364453] ath10k_ahb a800000.wifi wlan1.sta6: left promiscuous mode
[29398.370110] br-wan: port 8(wlan1.sta6) entered disabled state
[29398.608363] ath10k_ahb a800000.wifi: mac flush vdev 0 drop 0 queues
0x1 ar->paused: 0x0  arvif->paused: 0x0
[29398.623885] ath10k_ahb a800000.wifi wlan1.sta12: left allmulticast mode
[29398.623983] ath10k_ahb a800000.wifi wlan1.sta12: left promiscuous mode
[29398.629566] br-wan: port 14(wlan1.sta12) entered disabled state
[29398.858363] ath10k_ahb a800000.wifi: mac flush vdev 0 drop 0 queues
0x1 ar->paused: 0x0  arvif->paused: 0x0
[29398.872599] ath10k_ahb a800000.wifi wlan1.sta11: left allmulticast mode
[29398.872693] ath10k_ahb a800000.wifi wlan1.sta11: left promiscuous mode
[29398.878220] br-wan: port 12(wlan1.sta11) entered disabled state
[29399.138369] ath10k_ahb a800000.wifi: mac flush vdev 0 drop 0 queues
0x1 ar->paused: 0x0  arvif->paused: 0x0
[29399.151185] ath10k_ahb a800000.wifi wlan1.sta9: left allmulticast mode

