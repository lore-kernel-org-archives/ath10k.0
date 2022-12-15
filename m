Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 433E3C4332F
	for <ath10k@archiver.kernel.org>; Thu, 15 Dec 2022 03:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+semYagnYT4xYHyFJvMujbt+zTbmwhzvfwrjFiehAhM=; b=bqx14RqT6mhjvq
	M+xNjvp+NPtVjFQC9JfD3LMQ/qtqD9w/Mvf0PUerxbL9KbIZ6U9hkkVWyaSfo6+5VI8rs34dppj5d
	n8qbAx+Ai6u4KFu6M+lCk0sAmfe1djCVWOCc3leXxhxsLF2LCuZh1mRvbRCsNy48Gb6QOZxKNcTbe
	qpa3wIeixY7ABIb9QNvzF7pgCGa890Fn7zFPx9I1trL1k98eU0EthLW2YRUaFO4gFlzxR2eQwo97K
	zZ2BtmmR4OrbwbUWWxCgrOBin4wZNbedGE9p42ksZA+yGczpCaHSV21CcgAe8Vm5mTr4Xgse68QrJ
	j6JRQOTH4Ta6+UG4cgDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5ebK-005sWR-PP; Thu, 15 Dec 2022 03:08:02 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5ebF-005sTw-SM
	for ath10k@lists.infradead.org; Thu, 15 Dec 2022 03:08:01 +0000
Received: by mail-pl1-x62b.google.com with SMTP id s7so5465642plk.5
        for <ath10k@lists.infradead.org>; Wed, 14 Dec 2022 19:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=P08lro6pXIgZsnHXJ63EgbqX1MMlMBaBu2T+ZdHNZPY=;
        b=GQiBResFsCJfduxUE0McRnVeqtF179oFIJJNAkdSqxucc90r1pqT4ZvGOfT6EJmCXl
         UN4fjrFcHTTvxYNIqM0wzqj30pJlRCISKBNviY3HlFBTy+tVFI5jLBicEGjk+IgxM5Mg
         IYe6weoPJKkmlJh7KJYyXhW1VME3WO6JnnQIWCXKD6oosWS/StwlcbdXwHRVTUzTvwZz
         kKF5XPhsPpVQV0910M3VvGU8DXdcelTEMAaDp9nwdozt1z7AuS1X5S57aKgrapAFheAx
         KeZMhf4fiO4QX8+SMgK8WMyS31P8SnuAVGQxMCmhQJaDbH/qYzKVURlNsdNyxnrxQNut
         +ZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P08lro6pXIgZsnHXJ63EgbqX1MMlMBaBu2T+ZdHNZPY=;
        b=BakiKEXpjCPTDJC0BGfE9UtovZiMkfEV2MF8GMMWr5uys0wJCFwbIa6nkJvoRU47S/
         sNk2y451JecPLtNhbtV0/tT/91pSj2FQHfJjMrIpR+IopEL13Y5q5Wnrpxss+NvtrZkG
         DvDdV650LS9sXzW8ijFZ8HjOqz4CBtnpeXBSTtI+hk7qFl6ZnSGtgdF2Ewq9YDXWIiVL
         ZKF4MTbl5Oi07ImnDKB+nbsJiYubDMdIdrPe3oxTvfOJnKRfHClPwWyQ2eOim8BrvAaR
         rpyec6+f2TMOAIOdJDADNjYegBWw96ReIRCXifikqwjfwKD1a5y/DABWtgrVTsvVg7p9
         zGiw==
X-Gm-Message-State: AFqh2krUQUmvpKV2ATWA7ojkvw9pWCQJXHNFtbYU7jGIu6mKhr/Ex6Gg
	JWqI3HTQ3U2GB8WQe+ZNYursX7epFTwp985Zbwk=
X-Google-Smtp-Source: AMrXdXsqrivS4bqA10GBvBi0S0zFAMuspTaV3cP8v24vZ/ExJPvTLWwW1Or4/LPd7mbc6g6UTaID0OkuQxqL5p4T+d4=
X-Received: by 2002:a17:90a:8506:b0:219:720c:29cb with SMTP id
 l6-20020a17090a850600b00219720c29cbmr64481pjn.76.1671073676496; Wed, 14 Dec
 2022 19:07:56 -0800 (PST)
MIME-Version: 1.0
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 15 Dec 2022 00:07:38 -0300
Message-ID: <CAOMZO5AW4JUEFiaFgr8PvC5x3a5VWA4Ut8cXYYAme5-scgBV6Q@mail.gmail.com>
Subject: ath10k: IRQ timeout after AP-STA-POLL-OK
To: kvalo@kernel.org
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org, 
	Bough Chen <haibo.chen@nxp.com>, Kevin Groeneveld <KGroeneveld@lenbrook.com>, 
	Jakub Kicinski <kuba@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_190757_977572_13C7B289 
X-CRM114-Status: UNSURE (   8.58  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hi,

On an imx6dl-pico board with a QCA9377 connected via SDIO, we see very rarely
the following error:

mmc1: Timeout waiting for hardware interrupt.

which happens right after an AP-STA-POLL-OK event.

mmc1 is the eMMC port connected to the QCA9377. The QCA9377 operates in AP mode.

Since the error is difficult to reproduce, we found a way to accelerate its
occurrence and it consists of passing a short ap_max_inactivity value into the
hostapd conf file, such as ap_max_inactivity=3. This makes AP-STA-POLL-OK
happen more frequently.

The full kernel logs are shown below.

The mmc timeouts always happen right after an AP-STA-POLL-OK event and
AP-STA-POLL-OK always happens after the fifth connection/disconnection.

Originally the error was reported on a 5.10 kernel, but I have also reproduced
the issue on 6.1.

I appreciate it if anyone could provide any suggestions.

Thanks,

Fabio Estevam

# hostapd /etc/wifi.conf
Configuration file: /etc/wifi.conf
wlan0: interface state UNINITIALIZED->COUNTRY_UPDATE
Using interface wlan0 with hwaddr 00:1f:7b:31:xx:yy and ssid "thessid"
[   25.209268] IPv6: ADDRCONF(NETDEV_CHANGE): wlan0: link becomes ready
wlan0: interface state COUNTRY_UPDATE->ENABLED
wlan0: AP-ENABLED
wlan0: STA 1e:e3:0e:49:xx:yy IEEE 802.11: authenticated
wlan0: STA 1e:e3:0e:49:xx:yy IEEE 802.11: associated (aid 1)
wlan0: AP-STA-CONNECTED 1e:e3:0e:49:xx:yy
wlan0: STA 1e:e3:0e:49:xx:yy WPA: pairwise key handshake completed (RSN)
wlan0: AP-STA-DISCONNECTED 1e:e3:0e:49:xx:yy
wlan0: STA 1e:e3:0e:49:xx:yy IEEE 802.11: authenticated
wlan0: STA 1e:e3:0e:49:xx:yy IEEE 802.11: associated (aid 1)
wlan0: AP-STA-CONNECTED 1e:e3:0e:49:xx:yy
wlan0: STA 1e:e3:0e:49:xx:yy WPA: pairwise key handshake completed (RSN)
cfg80211: failed to load regulatory.db
wlan0: AP-STA-DISCONNECTED 1e:e3:0e:49:xx:yy
wlan0: STA 1e:e3:0e:49:xx:yy IEEE 802.11: authenticated
wlan0: STA 1e:e3:0e:49:xx:yy IEEE 802.11: associated (aid 1)
wlan0: AP-STA-CONNECTED 1e:e3:0e:49:xx:yy
wlan0: STA 1e:e3:0e:49:xx:yy WPA: pairwise key handshake completed (RSN)
wlan0: AP-STA-DISCONNECTED 1e:e3:0e:49:xx:yy
wlan0: STA 1e:e3:0e:49:xx:yy IEEE 802.11: authenticated
wlan0: STA 1e:e3:0e:49:xx:yy IEEE 802.11: associated (aid 1)
wlan0: AP-STA-CONNECTED 1e:e3:0e:49:xx:yy
wlan0: STA 1e:e3:0e:49:xx:yy WPA: pairwise key handshake completed (RSN)
wlan0: AP-STA-DISCONNECTED 1e:e3:0e:49:xx:yy
wlan0: STA 1e:e3:0e:49:xx:yy IEEE 802.11: authenticated
wlan0: STA 1e:e3:0e:49:xx:yy IEEE 802.11: associated (aid 1)
wlan0: AP-STA-CONNECTED 1e:e3:0e:49:xx:yy
wlan0: STA 1e:e3:0e:49:xx:yy WPA: pairwise key handshake completed (RSN)
wlan0: AP-STA-POLL-OK 1e:e3:0e:49:xx:yy
wlan0: AP-STA-DISCONNECTED 1e:e3:0e:49:xx:yy
wlan0: STA 1e:e3:0e:49:xx:yy IEEE 802.11: disassociated due to inactivity
 mmc1: Timeout waiting for hardware interrupt.
 mmc1: sdhci: ============ SDHCI REGISTER DUMP ===========
 mmc1: sdhci: Sys addr:  0x121e005c | Version:  0x00000002
 mmc1: sdhci: Blk size:  0x0000002c | Blk cnt:  0x00000001
 mmc1: sdhci: Argument:  0x1410002c | Trn mode: 0x00000013
 mmc1: sdhci: Present:   0x01d88a0a | Host ctl: 0x00000013
 mmc1: sdhci: Power:     0x00000002 | Blk gap:  0x00000080
 mmc1: sdhci: Wake-up:   0x00000008 | Clock:    0x0000003f
 mmc1: sdhci: Timeout:   0x0000008f | Int stat: 0x00000000
 mmc1: sdhci: Int enab:  0x107f100b | Sig enab: 0x107f100b
 mmc1: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000103
 mmc1: sdhci: Caps:      0x07eb0000 | Caps_1:   0x0000a000
 mmc1: sdhci: Cmd:       0x0000353a | Max curr: 0x00ffffff
 mmc1: sdhci: Resp[0]:   0x00001000 | Resp[1]:  0x00000000
 mmc1: sdhci: Resp[2]:   0x00000000 | Resp[3]:  0x00000000
 mmc1: sdhci: Host ctl2: 0x00000000
 mmc1: sdhci: ADMA Err:  0x00000007 | ADMA Ptr: 0x2c041200
 mmc1: sdhci-esdhc-imx: ========= ESDHC IMX DEBUG STATUS DUMP =========
 mmc1: sdhci-esdhc-imx: cmd debug status:  0x2100
 mmc1: sdhci-esdhc-imx: data debug status:  0x2200
 mmc1: sdhci-esdhc-imx: trans debug status:  0x2300
 mmc1: sdhci-esdhc-imx: dma debug status:  0x2402
 mmc1: sdhci-esdhc-imx: adma debug status:  0x25b4
 mmc1: sdhci-esdhc-imx: fifo debug status:  0x2610
 mmc1: sdhci-esdhc-imx: async fifo debug status:  0x2751
 mmc1: sdhci: ============================================
 ath10k_sdio mmc1:0001:1: failed to read from address 0x800: -110
 ath10k_sdio mmc1:0001:1: read int status fail, start recovery
wlan0: STA 1e:e3:0e:49:xx:yy IEEE 802.11: deauthenticated due to
inactivity (timer DEAUTH/REMOVE)
 ath10k_sdio mmc1:0001:1: sdio irq disable request timed out
 mmc1: Timeout waiting for hardware interrupt.
 mmc1: sdhci: ============ SDHCI REGISTER DUMP ===========
 mmc1: sdhci: Sys addr:  0x121e005c | Version:  0x00000002
 mmc1: sdhci: Blk size:  0x00000032 | Blk cnt:  0x00000001
 mmc1: sdhci: Argument:  0x965f9c32 | Trn mode: 0x00000003
 mmc1: sdhci: Present:   0x01f8858e | Host ctl: 0x00000013
 mmc1: sdhci: Power:     0x00000002 | Blk gap:  0x00000080
 mmc1: sdhci: Wake-up:   0x00000008 | Clock:    0x0000003f
 mmc1: sdhci: Timeout:   0x0000008f | Int stat: 0x00000000
 mmc1: sdhci: Int enab:  0x107f100b | Sig enab: 0x107f100b
 mmc1: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000103
 mmc1: sdhci: Caps:      0x07eb0000 | Caps_1:   0x0000a000
 mmc1: sdhci: Cmd:       0x0000353a | Max curr: 0x00ffffff
 mmc1: sdhci: Resp[0]:   0x00001000 | Resp[1]:  0x00000000
 mmc1: sdhci: Resp[2]:   0x00000000 | Resp[3]:  0x00000000
 mmc1: sdhci: Host ctl2: 0x00000000
 mmc1: sdhci: ADMA Err:  0x00000007 | ADMA Ptr: 0x2c041200
 mmc1: sdhci-esdhc-imx: ========= ESDHC IMX DEBUG STATUS DUMP =========
 mmc1: sdhci-esdhc-imx: cmd debug status:  0x2100
 mmc1: sdhci-esdhc-imx: data debug status:  0x2220
 mmc1: sdhci-esdhc-imx: trans debug status:  0x2328
 mmc1: sdhci-esdhc-imx: dma debug status:  0x2402
 mmc1: sdhci-esdhc-imx: adma debug status:  0x25b4
 mmc1: sdhci-esdhc-imx: fifo debug status:  0x2684
 mmc1: sdhci-esdhc-imx: async fifo debug status:  0x2750
 mmc1: sdhci: ============================================
 ath10k_sdio mmc1:0001:1: failed to write to address 0x12fce: -110
 ath10k_sdio mmc1:0001:1: failed to write skb to 0x12fce asynchronously: -110
 ath10k_sdio mmc1:0001:1: failed to process pending SDIO interrupts: -110
 ath10k_sdio mmc1:0001:1: failed to write to address 0x1c780: -110
 ath10k_sdio mmc1:0001:1: failed to write skb to 0x1c780 asynchronously: -110
 ath10k_sdio mmc1:0001:1: failed to write to address 0x828: -110
 ath10k_sdio mmc1:0001:1: failed to write skb to 0x828 asynchronously: -110
 ath10k_sdio mmc1:0001:1: failed to read from address 0x868: -110
 ath10k_sdio mmc1:0001:1: failed to read fifo/chip control register: -110
 ath10k_sdio mmc1:0001:1: failed to read from address 0x868: -110
 mmc1: queuing unknown CIS tuple 0x01 [d9 01 ff] (3 bytes)
 mmc1: queuing unknown CIS tuple 0x1a [01 01 00 02 07] (5 bytes)
 mmc1: queuing unknown CIS tuple 0x1b [c1 41 30 30 ff ff 32 00] (8 bytes)
 mmc1: queuing unknown CIS tuple 0x14 [] (0 bytes)
 ieee80211 phy0: Hardware restart was requested
 ------------[ cut here ]------------
 WARNING: CPU: 0 PID: 240 at net/mac80211/sta_info.c:1288
__sta_info_destroy_part2+0x13c/0x21c
 Modules linked in: ath10k_sdio ath10k_core ath coda_vpu v4l2_jpeg
imx_vdoa imx_sdma ov5645
 CPU: 0 PID: 240 Comm: hostapd Not tainted 6.1.0 #67
 Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
  unwind_backtrace from show_stack+0x10/0x14
  show_stack from dump_stack_lvl+0x58/0x70
  dump_stack_lvl from __warn+0xb4/0x24c
  __warn from warn_slowpath_fmt+0x5c/0xd8
  warn_slowpath_fmt from __sta_info_destroy_part2+0x13c/0x21c
  __sta_info_destroy_part2 from __sta_info_destroy+0x20/0x28
  __sta_info_destroy from sta_info_destroy_addr_bss+0x30/0x4c
  sta_info_destroy_addr_bss from nl80211_del_station+0x130/0x358
  nl80211_del_station from genl_rcv_msg+0x174/0x3ac
  genl_rcv_msg from netlink_rcv_skb+0xbc/0x120
  netlink_rcv_skb from genl_rcv+0x20/0x34
  genl_rcv from netlink_unicast+0x1a4/0x2c4
  netlink_unicast from netlink_sendmsg+0x1c4/0x444
  netlink_sendmsg from ____sys_sendmsg+0x184/0x254
  ____sys_sendmsg from ___sys_sendmsg+0x6c/0xa4
  ___sys_sendmsg from __sys_sendmsg+0x50/0x98
  __sys_sendmsg from ret_fast_syscall+0x0/0x1c
 Exception stack(0xe0de1fa8 to 0xe0de1ff0)
 1fa0:                   00d76bc0 00d6f830 00000005 becdbaec 00000000 00000000
 1fc0: 00d76bc0 00d6f830 b6cffc68 00000128 00000001 00000000 00000004 becdbb3c
 1fe0: b6cffe14 becdba90 b6ce6db4 b6c02428
 irq event stamp: 156791
 hardirqs last  enabled at (156803): [<c019970c>] __up_console_sem+0x50/0x60
 hardirqs last disabled at (156814): [<c01996f8>] __up_console_sem+0x3c/0x60
 softirqs last  enabled at (156790): [<c01017d0>] __do_softirq+0x2c0/0x624
 softirqs last disabled at (156779): [<c012fc14>] __irq_exit_rcu+0x138/0x17c
 ---[ end trace 0000000000000000 ]---
 ------------[ cut here ]------------
 WARNING: CPU: 0 PID: 240 at net/mac80211/sta_info.c:416
sta_info_free+0x9c/0x140
 Modules linked in: ath10k_sdio ath10k_core ath coda_vpu v4l2_jpeg
imx_vdoa imx_sdma ov5645
 CPU: 0 PID: 240 Comm: hostapd Tainted: G        W          6.1.0 #67
 Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
  unwind_backtrace from show_stack+0x10/0x14
  show_stack from dump_stack_lvl+0x58/0x70
  dump_stack_lvl from __warn+0xb4/0x24c
  __warn from warn_slowpath_fmt+0x5c/0xd8
  warn_slowpath_fmt from sta_info_free+0x9c/0x140
  sta_info_free from __sta_info_destroy+0x20/0x28
  __sta_info_destroy from sta_info_destroy_addr_bss+0x30/0x4c
  sta_info_destroy_addr_bss from nl80211_del_station+0x130/0x358
  nl80211_del_station from genl_rcv_msg+0x174/0x3ac
  genl_rcv_msg from netlink_rcv_skb+0xbc/0x120
  netlink_rcv_skb from genl_rcv+0x20/0x34
  genl_rcv from netlink_unicast+0x1a4/0x2c4
  netlink_unicast from netlink_sendmsg+0x1c4/0x444
  netlink_sendmsg from ____sys_sendmsg+0x184/0x254
  ____sys_sendmsg from ___sys_sendmsg+0x6c/0xa4
  ___sys_sendmsg from __sys_sendmsg+0x50/0x98
  __sys_sendmsg from ret_fast_syscall+0x0/0x1c
 Exception stack(0xe0de1fa8 to 0xe0de1ff0)
 1fa0:                   00d76bc0 00d6f830 00000005 becdbaec 00000000 00000000
 1fc0: 00d76bc0 00d6f830 b6cffc68 00000128 00000001 00000000 00000004 becdbb3c
 1fe0: b6cffe14 becdba90 b6ce6db4 b6c02428
 irq event stamp: 157365
 hardirqs last  enabled at (157377): [<c019970c>] __up_console_sem+0x50/0x60
 hardirqs last disabled at (157388): [<c01996f8>] __up_console_sem+0x3c/0x60
 softirqs last  enabled at (157364): [<c01017d0>] __do_softirq+0x2c0/0x624
 softirqs last disabled at (157353): [<c012fc14>] __irq_exit_rcu+0x138/0x17c
 ---[ end trace 0000000000000000 ]---
 ------------[ cut here ]------------
 WARNING: CPU: 0 PID: 240 at net/mac80211/sta_info.c:419
sta_info_free+0xd4/0x140
 sta_info_move_state() returned -2
 Modules linked in: ath10k_sdio ath10k_core ath coda_vpu v4l2_jpeg
imx_vdoa imx_sdma ov5645
 CPU: 0 PID: 240 Comm: hostapd Tainted: G        W          6.1.0 #67
 Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
  unwind_backtrace from show_stack+0x10/0x14
  show_stack from dump_stack_lvl+0x58/0x70
  dump_stack_lvl from __warn+0xb4/0x24c
  __warn from warn_slowpath_fmt+0x90/0xd8
  warn_slowpath_fmt from sta_info_free+0xd4/0x140
  sta_info_free from __sta_info_destroy+0x20/0x28
  __sta_info_destroy from sta_info_destroy_addr_bss+0x30/0x4c
  sta_info_destroy_addr_bss from nl80211_del_station+0x130/0x358
  nl80211_del_station from genl_rcv_msg+0x174/0x3ac
  genl_rcv_msg from netlink_rcv_skb+0xbc/0x120
  netlink_rcv_skb from genl_rcv+0x20/0x34
  genl_rcv from netlink_unicast+0x1a4/0x2c4
  netlink_unicast from netlink_sendmsg+0x1c4/0x444
  netlink_sendmsg from ____sys_sendmsg+0x184/0x254
  ____sys_sendmsg from ___sys_sendmsg+0x6c/0xa4
  ___sys_sendmsg from __sys_sendmsg+0x50/0x98
  __sys_sendmsg from ret_fast_syscall+0x0/0x1c
 Exception stack(0xe0de1fa8 to 0xe0de1ff0)
 1fa0:                   00d76bc0 00d6f830 00000005 becdbaec 00000000 00000000
 1fc0: 00d76bc0 00d6f830 b6cffc68 00000128 00000001 00000000 00000004 becdbb3c
 1fe0: b6cffe14 becdba90 b6ce6db4 b6c02428
 irq event stamp: 157585
 hardirqs last  enabled at (157595): [<c019970c>] __up_console_sem+0x50/0x60
 hardirqs last disabled at (157606): [<c01996f8>] __up_console_sem+0x3c/0x60
 softirqs last  enabled at (157498): [<c01017d0>] __do_softirq+0x2c0/0x624
 softirqs last disabled at (157463): [<c012fc14>] __irq_exit_rcu+0x138/0x17c
 ---[ end trace 0000000000000000 ]---
 mmc1: Timeout waiting for hardware interrupt.
 mmc1: sdhci: ============ SDHCI REGISTER DUMP ===========
 mmc1: sdhci: Sys addr:  0x12782240 | Version:  0x00000002
 mmc1: sdhci: Blk size:  0x00000004 | Blk cnt:  0x00000001
 mmc1: sdhci: Argument:  0x1410d004 | Trn mode: 0x00000013
 mmc1: sdhci: Present:   0x01f8820e | Host ctl: 0x00000013
 mmc1: sdhci: Power:     0x00000002 | Blk gap:  0x00000080
 mmc1: sdhci: Wake-up:   0x00000008 | Clock:    0x0000003f
 mmc1: sdhci: Timeout:   0x0000008f | Int stat: 0x00000000
 mmc1: sdhci: Int enab:  0x107f100b | Sig enab: 0x107f100b
 mmc1: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000103
 mmc1: sdhci: Caps:      0x07eb0000 | Caps_1:   0x0000a000
 mmc1: sdhci: Cmd:       0x0000353a | Max curr: 0x00ffffff
 mmc1: sdhci: Resp[0]:   0x00001200 | Resp[1]:  0x00000000
 mmc1: sdhci: Resp[2]:   0x00000000 | Resp[3]:  0x00000000
 mmc1: sdhci: Host ctl2: 0x00000000
 mmc1: sdhci: ADMA Err:  0x00000003 | ADMA Ptr: 0x2c041204
 mmc1: sdhci-esdhc-imx: ========= ESDHC IMX DEBUG STATUS DUMP =========
 mmc1: sdhci-esdhc-imx: cmd debug status:  0x2100
 mmc1: sdhci-esdhc-imx: data debug status:  0x22a0
 mmc1: sdhci-esdhc-imx: trans debug status:  0x23a0
 mmc1: sdhci-esdhc-imx: dma debug status:  0x2420
 mmc1: sdhci-esdhc-imx: adma debug status:  0x25b4
 mmc1: sdhci-esdhc-imx: fifo debug status:  0x2680
 mmc1: sdhci-esdhc-imx: async fifo debug status:  0x2750
 mmc1: sdhci: ============================================
 ath10k_warn: 7 callbacks suppressed
 ath10k_sdio mmc1:0001:1: failed to read from address 0x868: -110
 ath10k_sdio mmc1:0001:1: failed to read fifo/chip control register: -110
 mmc1: Timeout waiting for hardware interrupt.
 mmc1: sdhci: ============ SDHCI REGISTER DUMP ===========
 mmc1: sdhci: Sys addr:  0x12782240 | Version:  0x00000002
 mmc1: sdhci: Blk size:  0x00000004 | Blk cnt:  0x00000001
 mmc1: sdhci: Argument:  0x1410a004 | Trn mode: 0x00000013
 mmc1: sdhci: Present:   0x01f8820e | Host ctl: 0x00000013
 mmc1: sdhci: Power:     0x00000002 | Blk gap:  0x00000080
 mmc1: sdhci: Wake-up:   0x00000008 | Clock:    0x0000003f
 mmc1: sdhci: Timeout:   0x0000008f | Int stat: 0x00000000
 mmc1: sdhci: Int enab:  0x107f100b | Sig enab: 0x107f100b
 mmc1: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000103
 mmc1: sdhci: Caps:      0x07eb0000 | Caps_1:   0x0000a000
 mmc1: sdhci: Cmd:       0x0000353a | Max curr: 0x00ffffff
 mmc1: sdhci: Resp[0]:   0x00001000 | Resp[1]:  0x00000000
 mmc1: sdhci: Resp[2]:   0x00000000 | Resp[3]:  0x00000000
 mmc1: sdhci: Host ctl2: 0x00000000
 mmc1: sdhci: ADMA Err:  0x00000003 | ADMA Ptr: 0x2c041204
 mmc1: sdhci-esdhc-imx: ========= ESDHC IMX DEBUG STATUS DUMP =========
 mmc1: sdhci-esdhc-imx: cmd debug status:  0x2100
 mmc1: sdhci-esdhc-imx: data debug status:  0x22a0
 mmc1: sdhci-esdhc-imx: trans debug status:  0x23a2
 mmc1: sdhci-esdhc-imx: dma debug status:  0x2420
 mmc1: sdhci-esdhc-imx: adma debug status:  0x25b4
 mmc1: sdhci-esdhc-imx: fifo debug status:  0x2680
 mmc1: sdhci-esdhc-imx: async fifo debug status:  0x2750
 mmc1: sdhci: ============================================
 ath10k_sdio mmc1:0001:1: failed to read from address 0x850: -110
 ath10k_sdio mmc1:0001:1: unable to decrement the command credit count
register: -110
 ath10k_sdio mmc1:0001:1: Unable to read soc register from device: -110
 ath10k_sdio mmc1:0001:1: failed to read from address 0x850: -110
 ath10k_sdio mmc1:0001:1: unable to decrement the command credit count
register: -110
 ath10k_sdio mmc1:0001:1: unable to write to the device (-110)
 ath10k_sdio mmc1:0001:1: settings HTC version failed
 ath10k_sdio mmc1:0001:1: Could not init core: -22
 ath10k_sdio mmc1:0001:1: failed to read from address 0x868: -110
 ath10k_sdio mmc1:0001:1: failed to read fifo/chip control register: -110
 mmc1: queuing unknown CIS tuple 0x01 [d9 01 ff] (3 bytes)
 mmc1: queuing unknown CIS tuple 0x1a [01 01 00 02 07] (5 bytes)
 mmc1: queuing unknown CIS tuple 0x1b [c1 41 30 30 ff ff 32 00] (8 bytes)
 mmc1: queuing unknown CIS tuple 0x14 [] (0 bytes)
 ------------[ cut here ]------------
 WARNING: CPU: 0 PID: 35 at net/mac80211/util.c:2442
ieee80211_reconfig+0xc8/0x1a0c
 Hardware became unavailable during restart.
 Modules linked in: ath10k_sdio ath10k_core ath coda_vpu v4l2_jpeg
imx_vdoa imx_sdma ov5645
 CPU: 0 PID: 35 Comm: kworker/0:8 Tainted: G        W          6.1.0 #67
 Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
 Workqueue: events_freezable ieee80211_restart_work
  unwind_backtrace from show_stack+0x10/0x14
  show_stack from dump_stack_lvl+0x58/0x70
  dump_stack_lvl from __warn+0xb4/0x24c
  __warn from warn_slowpath_fmt+0x90/0xd8
  warn_slowpath_fmt from ieee80211_reconfig+0xc8/0x1a0c
  ieee80211_reconfig from ieee80211_restart_work+0xfc/0x160
  ieee80211_restart_work from process_one_work+0x288/0x734
  process_one_work from worker_thread+0x38/0x4d0
  worker_thread from kthread+0xe4/0x104
  kthread from ret_from_fork+0x14/0x28
 Exception stack(0xe0971fb0 to 0xe0971ff8)
 1fa0:                                     00000000 00000000 00000000 00000000
 1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
 irq event stamp: 16829
 hardirqs last  enabled at (16847): [<c019970c>] __up_console_sem+0x50/0x60
 hardirqs last disabled at (16858): [<c01996f8>] __up_console_sem+0x3c/0x60
 softirqs last  enabled at (16842): [<c01017d0>] __do_softirq+0x2c0/0x624
 softirqs last disabled at (16837): [<c012fc14>] __irq_exit_rcu+0x138/0x17c
 ---[ end trace 0000000000000000 ]---
 ------------[ cut here ]------------
 WARNING: CPU: 0 PID: 35 at net/mac80211/driver-ops.c:458
drv_set_key+0x23c/0x320
 wlan0: Failed check-sdata-in-driver check, flags: 0x0
 Modules linked in: ath10k_sdio ath10k_core ath coda_vpu v4l2_jpeg
imx_vdoa imx_sdma ov5645
 CPU: 0 PID: 35 Comm: kworker/0:8 Tainted: G        W          6.1.0 #67
 Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
 Workqueue: events_freezable ieee80211_restart_work
  unwind_backtrace from show_stack+0x10/0x14
  show_stack from dump_stack_lvl+0x58/0x70
  dump_stack_lvl from __warn+0xb4/0x24c
  __warn from warn_slowpath_fmt+0x90/0xd8
  warn_slowpath_fmt from drv_set_key+0x23c/0x320
  drv_set_key from ieee80211_key_disable_hw_accel+0xe8/0x134
  ieee80211_key_disable_hw_accel from ieee80211_key_replace+0x49c/0x904
  ieee80211_key_replace from ieee80211_free_keys_iface+0x64/0x98
  ieee80211_free_keys_iface from ieee80211_free_keys+0x60/0x264
  ieee80211_free_keys from ieee80211_stop_ap+0x1f0/0x65c
  ieee80211_stop_ap from ___cfg80211_stop_ap+0xc4/0x55c
  ___cfg80211_stop_ap from __cfg80211_stop_ap+0x3c/0x90
  __cfg80211_stop_ap from cfg80211_leave+0x28/0x34
  cfg80211_leave from cfg80211_netdev_notifier_call+0x2d0/0x7cc
  cfg80211_netdev_notifier_call from raw_notifier_call_chain+0x34/0x64
  raw_notifier_call_chain from __dev_close_many+0x54/0x12c
  __dev_close_many from dev_close_many+0x7c/0x118
  dev_close_many from dev_close+0x68/0x80
  dev_close from cfg80211_shutdown_all_interfaces+0x3c/0xfc
  cfg80211_shutdown_all_interfaces from ieee80211_restart_work+0x124/0x160
  ieee80211_restart_work from process_one_work+0x288/0x734
  process_one_work from worker_thread+0x38/0x4d0
  worker_thread from kthread+0xe4/0x104
  kthread from ret_from_fork+0x14/0x28
 Exception stack(0xe0971fb0 to 0xe0971ff8)
 1fa0:                                     00000000 00000000 00000000 00000000
 1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
 irq event stamp: 17111
 hardirqs last  enabled at (17121): [<c019970c>] __up_console_sem+0x50/0x60
 hardirqs last disabled at (17132): [<c01996f8>] __up_console_sem+0x3c/0x60
 softirqs last  enabled at (17110): [<c01017d0>] __do_softirq+0x2c0/0x624
 softirqs last disabled at (17091): [<c012fc14>] __irq_exit_rcu+0x138/0x17c
 ---[ end trace 0000000000000000 ]---
 wlan0: failed to remove key (1, ff:ff:ff:ff:ff:ff) from hardware (-5)
 ------------[ cut here ]------------
 WARNING: CPU: 0 PID: 35 at net/mac80211/main.c:287
ieee80211_link_info_change_notify+0xb0/0x104
 wlan0: Failed check-sdata-in-driver check, flags: 0x0
 Modules linked in: ath10k_sdio ath10k_core ath coda_vpu v4l2_jpeg
imx_vdoa imx_sdma ov5645
 CPU: 0 PID: 35 Comm: kworker/0:8 Tainted: G        W          6.1.0 #67
 Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
 Workqueue: events_freezable ieee80211_restart_work
  unwind_backtrace from show_stack+0x10/0x14
  show_stack from dump_stack_lvl+0x58/0x70
  dump_stack_lvl from __warn+0xb4/0x24c
  __warn from warn_slowpath_fmt+0x90/0xd8
  warn_slowpath_fmt from ieee80211_link_info_change_notify+0xb0/0x104
  ieee80211_link_info_change_notify from ieee80211_stop_ap+0x220/0x65c
  ieee80211_stop_ap from ___cfg80211_stop_ap+0xc4/0x55c
  ___cfg80211_stop_ap from __cfg80211_stop_ap+0x3c/0x90
  __cfg80211_stop_ap from cfg80211_leave+0x28/0x34
  cfg80211_leave from cfg80211_netdev_notifier_call+0x2d0/0x7cc
  cfg80211_netdev_notifier_call from raw_notifier_call_chain+0x34/0x64
  raw_notifier_call_chain from __dev_close_many+0x54/0x12c
  __dev_close_many from dev_close_many+0x7c/0x118
  dev_close_many from dev_close+0x68/0x80
  dev_close from cfg80211_shutdown_all_interfaces+0x3c/0xfc
  cfg80211_shutdown_all_interfaces from ieee80211_restart_work+0x124/0x160
  ieee80211_restart_work from process_one_work+0x288/0x734
  process_one_work from worker_thread+0x38/0x4d0
  worker_thread from kthread+0xe4/0x104
  kthread from ret_from_fork+0x14/0x28
 Exception stack(0xe0971fb0 to 0xe0971ff8)
 1fa0:                                     00000000 00000000 00000000 00000000
 1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
 irq event stamp: 17345
 hardirqs last  enabled at (17357): [<c019970c>] __up_console_sem+0x50/0x60
 hardirqs last disabled at (17368): [<c01996f8>] __up_console_sem+0x3c/0x60
 softirqs last  enabled at (17256): [<c01017d0>] __do_softirq+0x2c0/0x624
 softirqs last disabled at (17225): [<c012fc14>] __irq_exit_rcu+0x138/0x17c
 ---[ end trace 0000000000000000 ]---
 ------------[ cut here ]------------
 WARNING: CPU: 0 PID: 35 at net/mac80211/driver-ops.h:944
ieee80211_stop_ap+0x590/0x65c
 wlan0: Failed check-sdata-in-driver check, flags: 0x0
 Modules linked in: ath10k_sdio ath10k_core ath coda_vpu v4l2_jpeg
imx_vdoa imx_sdma ov5645
 CPU: 0 PID: 35 Comm: kworker/0:8 Tainted: G        W          6.1.0 #67
 Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
 Workqueue: events_freezable ieee80211_restart_work
  unwind_backtrace from show_stack+0x10/0x14
  show_stack from dump_stack_lvl+0x58/0x70
  dump_stack_lvl from __warn+0xb4/0x24c
  __warn from warn_slowpath_fmt+0x90/0xd8
  warn_slowpath_fmt from ieee80211_stop_ap+0x590/0x65c
  ieee80211_stop_ap from ___cfg80211_stop_ap+0xc4/0x55c
  ___cfg80211_stop_ap from __cfg80211_stop_ap+0x3c/0x90
  __cfg80211_stop_ap from cfg80211_leave+0x28/0x34
  cfg80211_leave from cfg80211_netdev_notifier_call+0x2d0/0x7cc
  cfg80211_netdev_notifier_call from raw_notifier_call_chain+0x34/0x64
  raw_notifier_call_chain from __dev_close_many+0x54/0x12c
  __dev_close_many from dev_close_many+0x7c/0x118
  dev_close_many from dev_close+0x68/0x80
  dev_close from cfg80211_shutdown_all_interfaces+0x3c/0xfc
  cfg80211_shutdown_all_interfaces from ieee80211_restart_work+0x124/0x160
  ieee80211_restart_work from process_one_work+0x288/0x734
  process_one_work from worker_thread+0x38/0x4d0
  worker_thread from kthread+0xe4/0x104
  kthread from ret_from_fork+0x14/0x28
 Exception stack(0xe0971fb0 to 0xe0971ff8)
 1fa0:                                     00000000 00000000 00000000 00000000
 1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
 irq event stamp: 17521
 hardirqs last  enabled at (17533): [<c019970c>] __up_console_sem+0x50/0x60
 hardirqs last disabled at (17544): [<c01996f8>] __up_console_sem+0x3c/0x60
 softirqs last  enabled at (17256): [<c01017d0>] __do_softirq+0x2c0/0x624
 softirqs last disabled at (17225): [<c012fc14>] __irq_exit_rcu+0x138/0x17c
 ---[ end trace 0000000000000000 ]---
 ------------[ cut here ]------------
 WARNING: CPU: 0 PID: 35 at net/mac80211/driver-ops.c:315
drv_unassign_vif_chanctx+0x250/0x370
 wlan0: Failed check-sdata-in-driver check, flags: 0x0
 Modules linked in: ath10k_sdio ath10k_core ath coda_vpu v4l2_jpeg
imx_vdoa imx_sdma ov5645
 CPU: 0 PID: 35 Comm: kworker/0:8 Tainted: G        W          6.1.0 #67
 Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
 Workqueue: events_freezable ieee80211_restart_work
  unwind_backtrace from show_stack+0x10/0x14
  show_stack from dump_stack_lvl+0x58/0x70
  dump_stack_lvl from __warn+0xb4/0x24c
  __warn from warn_slowpath_fmt+0x90/0xd8
  warn_slowpath_fmt from drv_unassign_vif_chanctx+0x250/0x370
  drv_unassign_vif_chanctx from ieee80211_assign_link_chanctx+0x60/0x220
  ieee80211_assign_link_chanctx from __ieee80211_link_release_channel+0x7c/0x188
  __ieee80211_link_release_channel from ieee80211_link_release_channel+0x48/0x98
  ieee80211_link_release_channel from ieee80211_stop_ap+0x308/0x65c
  ieee80211_stop_ap from ___cfg80211_stop_ap+0xc4/0x55c
  ___cfg80211_stop_ap from __cfg80211_stop_ap+0x3c/0x90
  __cfg80211_stop_ap from cfg80211_leave+0x28/0x34
  cfg80211_leave from cfg80211_netdev_notifier_call+0x2d0/0x7cc
  cfg80211_netdev_notifier_call from raw_notifier_call_chain+0x34/0x64
  raw_notifier_call_chain from __dev_close_many+0x54/0x12c
  __dev_close_many from dev_close_many+0x7c/0x118
  dev_close_many from dev_close+0x68/0x80
  dev_close from cfg80211_shutdown_all_interfaces+0x3c/0xfc
  cfg80211_shutdown_all_interfaces from ieee80211_restart_work+0x124/0x160
  ieee80211_restart_work from process_one_work+0x288/0x734
  process_one_work from worker_thread+0x38/0x4d0
  worker_thread from kthread+0xe4/0x104
  kthread from ret_from_fork+0x14/0x28
 Exception stack(0xe0971fb0 to 0xe0971ff8)
 1fa0:                                     00000000 00000000 00000000 00000000
 1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
 irq event stamp: 17737
 hardirqs last  enabled at (17749): [<c019970c>] __up_console_sem+0x50/0x60
 hardirqs last disabled at (17760): [<c01996f8>] __up_console_sem+0x3c/0x60
 softirqs last  enabled at (17638): [<c01017d0>] __do_softirq+0x2c0/0x624
 softirqs last disabled at (17601): [<c012fc14>] __irq_exit_rcu+0x138/0x17c
 ---[ end trace 0000000000000000 ]---
 ------------[ cut here ]------------
 WARNING: CPU: 0 PID: 35 at net/mac80211/driver-ops.h:156
ieee80211_vif_cfg_change_notify+0x1ec/0x334
 wlan0: Failed check-sdata-in-driver check, flags: 0x0
 Modules linked in: ath10k_sdio ath10k_core ath coda_vpu v4l2_jpeg
imx_vdoa imx_sdma ov5645
 CPU: 0 PID: 35 Comm: kworker/0:8 Tainted: G        W          6.1.0 #67
 Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
 Workqueue: events_freezable ieee80211_restart_work
  unwind_backtrace from show_stack+0x10/0x14
  show_stack from dump_stack_lvl+0x58/0x70
  dump_stack_lvl from __warn+0xb4/0x24c
  __warn from warn_slowpath_fmt+0x90/0xd8
  warn_slowpath_fmt from ieee80211_vif_cfg_change_notify+0x1ec/0x334
  ieee80211_vif_cfg_change_notify from ieee80211_assign_link_chanctx+0x1d4/0x220
  ieee80211_assign_link_chanctx from __ieee80211_link_release_channel+0x7c/0x188
  __ieee80211_link_release_channel from ieee80211_link_release_channel+0x48/0x98
  ieee80211_link_release_channel from ieee80211_stop_ap+0x308/0x65c
  ieee80211_stop_ap from ___cfg80211_stop_ap+0xc4/0x55c
  ___cfg80211_stop_ap from __cfg80211_stop_ap+0x3c/0x90
  __cfg80211_stop_ap from cfg80211_leave+0x28/0x34
  cfg80211_leave from cfg80211_netdev_notifier_call+0x2d0/0x7cc
  cfg80211_netdev_notifier_call from raw_notifier_call_chain+0x34/0x64
  raw_notifier_call_chain from __dev_close_many+0x54/0x12c
  __dev_close_many from dev_close_many+0x7c/0x118
  dev_close_many from dev_close+0x68/0x80
  dev_close from cfg80211_shutdown_all_interfaces+0x3c/0xfc
  cfg80211_shutdown_all_interfaces from ieee80211_restart_work+0x124/0x160
  ieee80211_restart_work from process_one_work+0x288/0x734
  process_one_work from worker_thread+0x38/0x4d0
  worker_thread from kthread+0xe4/0x104
  kthread from ret_from_fork+0x14/0x28
 Exception stack(0xe0971fb0 to 0xe0971ff8)
 1fa0:                                     00000000 00000000 00000000 00000000
 1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
 irq event stamp: 17957
 hardirqs last  enabled at (17967): [<c019970c>] __up_console_sem+0x50/0x60
 hardirqs last disabled at (17978): [<c01996f8>] __up_console_sem+0x3c/0x60
 softirqs last  enabled at (17858): [<c01017d0>] __do_softirq+0x2c0/0x624
 softirqs last disabled at (17817): [<c012fc14>] __irq_exit_rcu+0x138/0x17c
 ---[ end trace 0000000000000000 ]---
 ------------[ cut here ]------------
 WARNING: CPU: 0 PID: 35 at net/mac80211/driver-ops.h:872
ieee80211_del_chanctx+0x1fc/0x334
 Modules linked in: ath10k_sdio ath10k_core ath coda_vpu v4l2_jpeg
imx_vdoa imx_sdma ov5645
 CPU: 0 PID: 35 Comm: kworker/0:8 Tainted: G        W          6.1.0 #67
 Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
 Workqueue: events_freezable ieee80211_restart_work
  unwind_backtrace from show_stack+0x10/0x14
  show_stack from dump_stack_lvl+0x58/0x70
  dump_stack_lvl from __warn+0xb4/0x24c
  __warn from warn_slowpath_fmt+0x5c/0xd8
  warn_slowpath_fmt from ieee80211_del_chanctx+0x1fc/0x334
  ieee80211_del_chanctx from ieee80211_free_chanctx+0x50/0xd4
  ieee80211_free_chanctx from __ieee80211_link_release_channel+0xa8/0x188
  __ieee80211_link_release_channel from ieee80211_link_release_channel+0x48/0x98
  ieee80211_link_release_channel from ieee80211_stop_ap+0x308/0x65c
  ieee80211_stop_ap from ___cfg80211_stop_ap+0xc4/0x55c
  ___cfg80211_stop_ap from __cfg80211_stop_ap+0x3c/0x90
  __cfg80211_stop_ap from cfg80211_leave+0x28/0x34
  cfg80211_leave from cfg80211_netdev_notifier_call+0x2d0/0x7cc
  cfg80211_netdev_notifier_call from raw_notifier_call_chain+0x34/0x64
  raw_notifier_call_chain from __dev_close_many+0x54/0x12c
  __dev_close_many from dev_close_many+0x7c/0x118
  dev_close_many from dev_close+0x68/0x80
  dev_close from cfg80211_shutdown_all_interfaces+0x3c/0xfc
  cfg80211_shutdown_all_interfaces from ieee80211_restart_work+0x124/0x160
  ieee80211_restart_work from process_one_work+0x288/0x734
  process_one_work from worker_thread+0x38/0x4d0
  worker_thread from kthread+0xe4/0x104
  kthread from ret_from_fork+0x14/0x28
 Exception stack(0xe0971fb0 to 0xe0971ff8)
 1fa0:                                     00000000 00000000 00000000 00000000
 1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
 irq event stamp: 18153
 hardirqs last  enabled at (18163): [<c019970c>] __up_console_sem+0x50/0x60
 hardirqs last disabled at (18174): [<c01996f8>] __up_console_sem+0x3c/0x60
 softirqs last  enabled at (18152): [<c01017d0>] __do_softirq+0x2c0/0x624
 softirqs last disabled at (18141): [<c012fc14>] __irq_exit_rcu+0x138/0x17c
 ---[ end trace 0000000000000000 ]---
 ------------[ cut here ]------------
 WARNING: CPU: 0 PID: 35 at net/mac80211/driver-ops.c:98
drv_remove_interface+0x1c4/0x28c
 wlan0: Failed check-sdata-in-driver check, flags: 0x0
 Modules linked in: ath10k_sdio ath10k_core ath coda_vpu v4l2_jpeg
imx_vdoa imx_sdma ov5645
 CPU: 0 PID: 35 Comm: kworker/0:8 Tainted: G        W          6.1.0 #67
 Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
 Workqueue: events_freezable ieee80211_restart_work
  unwind_backtrace from show_stack+0x10/0x14
  show_stack from dump_stack_lvl+0x58/0x70
  dump_stack_lvl from __warn+0xb4/0x24c
  __warn from warn_slowpath_fmt+0x90/0xd8
  warn_slowpath_fmt from drv_remove_interface+0x1c4/0x28c
  drv_remove_interface from ieee80211_do_stop+0x5e8/0x8b4
  ieee80211_do_stop from ieee80211_stop+0x44/0x14c
  ieee80211_stop from __dev_close_many+0xa4/0x12c
  __dev_close_many from dev_close_many+0x7c/0x118
  dev_close_many from dev_close+0x68/0x80
  dev_close from cfg80211_shutdown_all_interfaces+0x3c/0xfc
  cfg80211_shutdown_all_interfaces from ieee80211_restart_work+0x124/0x160
  ieee80211_restart_work from process_one_work+0x288/0x734
  process_one_work from worker_thread+0x38/0x4d0
  worker_thread from kthread+0xe4/0x104
  kthread from ret_from_fork+0x14/0x28
 Exception stack(0xe0971fb0 to 0xe0971ff8)
 1fa0:                                     00000000 00000000 00000000 00000000
 1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
 irq event stamp: 18525
 hardirqs last  enabled at (18537): [<c019970c>] __up_console_sem+0x50/0x60
 hardirqs last disabled at (18548): [<c01996f8>] __up_console_sem+0x3c/0x60
 softirqs last  enabled at (18524): [<c01017d0>] __do_softirq+0x2c0/0x624
 softirqs last disabled at (18505): [<c012fc14>] __irq_exit_rcu+0x138/0x17c
 ---[ end trace 0000000000000000 ]---
 ------------[ cut here ]------------
 WARNING: CPU: 0 PID: 35 at net/mac80211/driver-ops.c:37
ieee80211_do_stop+0x6e8/0x8b4
 Modules linked in: ath10k_sdio ath10k_core ath coda_vpu v4l2_jpeg
imx_vdoa imx_sdma ov5645
 CPU: 0 PID: 35 Comm: kworker/0:8 Tainted: G        W          6.1.0 #67
 Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
 Workqueue: events_freezable ieee80211_restart_work
  unwind_backtrace from show_stack+0x10/0x14
  show_stack from dump_stack_lvl+0x58/0x70
  dump_stack_lvl from __warn+0xb4/0x24c
  __warn from warn_slowpath_fmt+0x5c/0xd8
  warn_slowpath_fmt from ieee80211_do_stop+0x6e8/0x8b4
  ieee80211_do_stop from ieee80211_stop+0x44/0x14c
  ieee80211_stop from __dev_close_many+0xa4/0x12c
  __dev_close_many from dev_close_many+0x7c/0x118
  dev_close_many from dev_close+0x68/0x80
  dev_close from cfg80211_shutdown_all_interfaces+0x3c/0xfc
  cfg80211_shutdown_all_interfaces from ieee80211_restart_work+0x124/0x160
  ieee80211_restart_work from process_one_work+0x288/0x734
  process_one_work from worker_thread+0x38/0x4d0
  worker_thread from kthread+0xe4/0x104
  kthread from ret_from_fork+0x14/0x28
 Exception stack(0xe0971fb0 to 0xe0971ff8)
 1fa0:                                     00000000 00000000 00000000 00000000
 1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
 irq event stamp: 18743
 hardirqs last  enabled at (18755): [<c019970c>] __up_console_sem+0x50/0x60
 hardirqs last disabled at (18766): [<c01996f8>] __up_console_sem+0x3c/0x60
 softirqs last  enabled at (18654): [<c01017d0>] __do_softirq+0x2c0/0x624
 softirqs last disabled at (18615): [<c012fc14>] __irq_exit_rcu+0x138/0x17c
 ---[ end trace 0000000000000000 ]---
Failed to set beacon parameters
wlan0: INTERFACE-DISABLED

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
