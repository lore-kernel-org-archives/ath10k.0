Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.lysator.liu.se ([130.236.254.3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kI6Qk-0000wR-GF
 for ath10k@lists.infradead.org; Tue, 15 Sep 2020 08:35:18 +0000
Received: from mail.lysator.liu.se (localhost [127.0.0.1])
 by mail.lysator.liu.se (Postfix) with ESMTP id 458A640035
 for <ath10k@lists.infradead.org>; Tue, 15 Sep 2020 10:35:07 +0200 (CEST)
Received: from sara.hytechdrive.se (h-170-152-149.A163.priv.bahnhof.se
 [81.170.152.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.lysator.liu.se (Postfix) with ESMTPSA id 7D65840035
 for <ath10k@lists.infradead.org>; Tue, 15 Sep 2020 10:35:06 +0200 (CEST)
Date: Tue, 15 Sep 2020 10:35:06 +0200 (CEST)
From: =?UTF-8?Q?Peter_=C3=85strand?= <astrand@lysator.liu.se>
Subject: Re: Meshed WiFi with QCA9377 (USB/SDIO)
In-Reply-To: <alpine.LRH.2.23.451.2009141438290.19926@sara.hytechdrive.se>
Message-ID: <alpine.LRH.2.23.451.2009150957420.8223@sara.hytechdrive.se>
References: <alpine.LRH.2.23.451.2009141438290.19926@sara.hytechdrive.se>
MIME-Version: 1.0
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
To: ath10k@lists.infradead.org

> Hi. We are designing an IOT system from scratch and want to select a WiFi 
> module that works well with 80211s. ath9k is apparently tried and tested, but 
> mostly covers older modules which are no longer available. We are evaluating 
> ath10k and in particular QCA9377. Does that sound like a good choice, or do 
> you have any other recommendations?
>
>
> For the final board, we are planning to use QCA9377-3 (SDIO). As I understand 
> it, this should work with Linux 5.7 and later? We will test using 
> https://wireless.murata.com/type-1pj.html soon.

I have tested with 1PJ now, even using kernel 5.8.9. "iw list" shows a lot 
of information, but "wlan0" is down and it is not possible to bring it up:

[   48.954598] mmc0: Internal clock never stabilised.
[   48.954604] mmc0: sdhci: ============ SDHCI REGISTER DUMP ===========
[   48.954618] mmc0: sdhci: Sys addr:  0x00000000 | Version:  0x0000c001
[   48.954631] mmc0: sdhci: Blk size:  0x00000000 | Blk cnt:  0x00000000
[   48.954643] mmc0: sdhci: Argument:  0x00000000 | Trn mode: 0x00000000
[   48.954656] mmc0: sdhci: Present:   0x01f70000 | Host ctl: 0x00000000
[   48.954668] mmc0: sdhci: Power:     0x0000000f | Blk gap:  0x00000000
[   48.954680] mmc0: sdhci: Wake-up:   0x00000000 | Clock:    0x00001003
[   48.954691] mmc0: sdhci: Timeout:   0x00000000 | Int stat: 0x00000000
[   48.954704] mmc0: sdhci: Int enab:  0x00ff0083 | Sig enab: 0x00ff0083
[   48.954716] mmc0: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000000
[   48.954729] mmc0: sdhci: Caps:      0x21e608b2 | Caps_1:   0x00002077
[   48.954741] mmc0: sdhci: Cmd:       0x00000000 | Max curr: 0x00000064
[   48.954753] mmc0: sdhci: Resp[0]:   0x00000000 | Resp[1]:  0x00000000
[   48.954764] mmc0: sdhci: Resp[2]:   0x00000000 | Resp[3]:  0x00000000
[   48.954771] mmc0: sdhci: Host ctl2: 0x00000000
[   48.954773] mmc0: sdhci: ============================================

Then:

[   49.054418] mmc0: queuing unknown CIS tuple 0x80 (1 bytes)
[   49.054553] mmc0: queuing unknown CIS tuple 0x81 (1 bytes)
[   49.054686] mmc0: queuing unknown CIS tuple 0x82 (1 bytes)
[   49.054731] mmc0: new high speed SDIO card at address 0001
[   49.126083] ath10k_sdio mmc0:0001:1: qca9377 hw1.1 sdio target 0x05020001 chip_id 0x00000000 sub 0000:0000
[   49.126087] ath10k_sdio mmc0:0001:1: kconfig debug 0 debugfs 0 tracing 0 dfs 0 testmode 0
[   49.127074] ath10k_sdio mmc0:0001:1: firmware ver WLAN.TF.1.1.1-00061-QCATFSWPZ-1 api 5 features ignore-otp crc32 7746e551
[   49.273737] ath10k_sdio mmc0:0001:1: failed to fetch board data for bus=sdio,vendor=0271,device=0701,subsystem-vendor=0000,subsystem-device=0000 from ath10k/QCA9377/hw1.0/board-2.bin
[   49.274018] ath10k_sdio mmc0:0001:1: board_file api 1 bmi_id N/A crc32 544289f7
[   50.385004] ath10k_sdio mmc0:0001:1: htt-ver 3.32 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
[   51.393850] ath10k_sdio mmc0:0001:1: suspend timed out - target pause event never came
[   54.561851] ath10k_sdio mmc0:0001:1: sdio irq disable request timed out

And more errors:

[   60.450124] ath10k_sdio mmc0:0001:1: failed to write to address 0x12ff5: -110
[   60.450146] ath10k_sdio mmc0:0001:1: failed to write skb to 0x12ff5 asynchronously: -110
[   60.450440] ath10k_sdio mmc0:0001:1: failed to write to address 0x1c7e8: -110
[   60.450459] ath10k_sdio mmc0:0001:1: failed to write skb to 0x1c7e8 asynchronously: -110
[   60.451043] ath10k_sdio mmc0:0001:1: failed to write to address 0x828: -110
[   60.451058] ath10k_sdio mmc0:0001:1: failed to write skb to 0x828 asynchronously: -110
[   60.451205] ath10k_sdio mmc0:0001:1: failed to read from address 0x868: -110
[   60.451210] ath10k_sdio mmc0:0001:1: failed to read fifo/chip control register: -110
[   60.451388] ath10k_sdio mmc0:0001:1: failed to read from address 0x868: -110
[   60.451393] ath10k_sdio mmc0:0001:1: failed to read fifo/chip control register: -110

And:

[   60.584617] ath: EEPROM regdomain sanitized
[   60.584618] ath: EEPROM regdomain: 0x64
[   60.584619] ath: EEPROM indicates we should expect a direct regpair map
[   60.584622] ath: Country alpha2 being used: 00
[   60.584624] ath: Regpair used: 0x64
[   61.977071] ath10k_sdio mmc0:0001:1: settings HTC version failed
[   61.977080] ath10k_sdio mmc0:0001:1: Could not init core: -22

Any ideas?


I have used firmware from 
https://github.com/kvalo/ath10k-firmware/tree/master/QCA9377/hw1.0/untested

I have also been provided with these files (which I suppose are designed 
for qcacld):

1PJ-bdwlan30-20190527.bin
rampatch_tlv_tf_1.1.tlv
silicon_QDART-1PJ_20190527.bin

Does that help?

Best regards,
Peter Astrand

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
