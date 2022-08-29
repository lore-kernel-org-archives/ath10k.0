Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C668ECAAD5
	for <ath10k@archiver.kernel.org>; Mon, 29 Aug 2022 16:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=eItqaLwT9YlUbBxoNaRgNkLzjZtZ3B00Aody5OAtO7U=; b=YLg
	G2YVNIoOJKqaK3HUzf4QT4NMsoXieBclzrK8dFdm52gu/P483soNvm8yynjdNUXUrr51jbRn98Wb7
	xzK9iPJSkCiAkS1r7X/7IsMLO3PUZsu9tHga2EsslDCwROOaUyn3TIHxUNCxwqsVNALlpES98Q4IL
	mjwmD4SHUA7ASHt8p+Lsj5Aje3dTW/tEDnMFhuYw6HFeimpGgsNixVUwN3u8hK8WzdoU9wMMt/Rz/
	uOo4piB9vwbePZ+FaVMU9/8IiEgXQxaut0yr98Jf982MIQpUOkzg+oTNWcKPW2gZVW5ovndvz0BdM
	0yZY5xs83qPQNIC1LcJxlzOaBIhj8Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oShnv-00BpEm-9s; Mon, 29 Aug 2022 16:40:03 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oShXX-00BiIm-0W
	for ath10k@lists.infradead.org; Mon, 29 Aug 2022 16:23:13 +0000
Received: by mail-pf1-x431.google.com with SMTP id 76so8690983pfy.3
        for <ath10k@lists.infradead.org>; Mon, 29 Aug 2022 09:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc;
        bh=3SCNEcDNgnrohMkdAq743V83WbQbBqWlKAdpj6UGbZs=;
        b=CAVNSEzBrGmNtRQpPhLHj1fGhFF3J91tvQU2YdogNTUm5zK7r6n4wAXxSWG/IsE/eE
         ygzceKSy/e5wVddzR83lNXsxlZdwMvgwAHh0QzC6o1YCu+g2YTkYdTtKQt0+LUbUUVAk
         LSVpBJOT7oquq9ceB2qIkPhtC+Iuxan/rkE3K5AscDuinkj3uVod/FOm/coAy9sGfCOh
         9SMHI0klUquygLxY96MwnMNgbPDS1UutlbMtachgqVnpBv90xDhgbIQVFEOlXcOJPhw5
         uFfpbsKX2UDXdQYe8rM0RvPO27xNO4aEt9H0h+/xBSZesqe660xTkICanH7U47Tr5ex8
         bVJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc;
        bh=3SCNEcDNgnrohMkdAq743V83WbQbBqWlKAdpj6UGbZs=;
        b=7BWlNuhNzDyWdOl5IEEoi+dDkjMg51RoH03d2Q7FHNM+z8ufh6A+BLBu1a6dX8e2VW
         m6Q6eMtqWX6aUKNuXCeTgRfr5qBA7BIHLEedF+gV1BpCrOTg0CQ97w85mYeo/yP22uLd
         sBvS2CninZuk5oMucn3U8gEey1bE5MvMJ9bmh2FHF1hhJBYl0WmQCaw+tMmTTYQZIlDn
         Fv9VRAwbqgc9qMd/26eGqN+H4SWkQFyqxm40fLq0cLyAVhLjdMuAezLGk/HHXAAVWS0a
         HQixKXfcXA7xAPCdEu6037IiPMv6RKqsjkXM+Pyd22IpKEHLJESX8a9oA8O0i+2gf/He
         HXDA==
X-Gm-Message-State: ACgBeo19iOTfDO88SVt/6xwDk/QUWuRxuXXaDpO9cL3RDvH0iYJgAtV+
	xltWseSOmU3kAU7wMY6RkhinaMuVx1UXV3DUUOn9G7h7GzM=
X-Google-Smtp-Source: AA6agR7zoPmZON0qMMtYwI+fE2ed0ABjaq83BPH5zD4VmaMOMDx/CzJ3Fuczs5mF/aq2VGyNh6ghVeWHJRHfez80hLM=
X-Received: by 2002:a63:220a:0:b0:42a:59ee:d5d with SMTP id
 i10-20020a63220a000000b0042a59ee0d5dmr14792604pgi.293.1661790182985; Mon, 29
 Aug 2022 09:23:02 -0700 (PDT)
MIME-Version: 1.0
From: Anthony Needles <needles.anthony@gmail.com>
Date: Mon, 29 Aug 2022 09:22:52 -0700
Message-ID: <CAPSyTrfq079NXpiqDSEErUT9ZNWuxkLnZuYa6oEwRRSAufWujg@mail.gmail.com>
Subject: QCA9377 ath10k SDIO issues
To: ath10k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_092307_202803_482146D6 
X-CRM114-Status: GOOD (  13.96  )
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

Hi all,

I am trying to get the Silex SC-SDCAC Wi-Fi SD card, which has a
QCA9377-3, working on my system. This is on an i.MX 8ULP dev board,
which exposes SDIO/MMC connections over an M.2 connector. Between the
Wi-Fi module and the dev board is an M.2 to SDIO adaptor, which just
passes through the SDIO CLK/CMD/DATA pins, GND, and VCC. My Linux
kernel version is 5.15.53. I am using the ath10k driver as it should
support driving the QCA9377 over SDIO. The Linux development is being
done with Yocto.

The MMC bus can detect the QCA9377 and the ath10k starts
initialization. However, there seems to be an issue with the firmware
and/or board files. I am using linux-firmware 20220509 from
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git.
Specifically, I am installing board.bin, board-2.bin,
firmware-sdio-5.bin, and notice_ath10k_firmware-sdio-5.txt from
ath10k/QCA9377/hw1.0 to /lib/firmware/ath10k/QCA9377/hw1.0/ on my
target rootfs.

As seen at the bottom of this post, the MMC bus can find the SDIO card
just fine. I verified that the firmware version is as expected, but
then it fails to fetch the board data from board-2.bin. Is there a
lack of this board in the upstream for this board file? There then
seems to be a bunch of timeout/busy errors when attempting to drive
the QCA9377. I think this could be a card firmware issue but may not
be.

Please let me know if you need any more info from me.

-Anthony

[   21.725795] ath10k_sdio mmc2:0001:1: qca9377 hw1.1 sdio target
0x05020001 chip_id 0x00000000 sub 0000:0000
[   21.725840] ath10k_sdio mmc2:0001:1: kconfig debug 1 debugfs 1
tracing 0 dfs 0 testmode 1
[   21.729588] ath10k_sdio mmc2:0001:1: firmware ver
WLAN.TF.1.1.1-00061-QCATFSWPZ-1 api 5 features ignore-otp crc32
7746e551
[   21.899276] ath10k_sdio mmc2:0001:1: failed to fetch board data for
bus=sdio,vendor=0271,device=0701,subsystem-vendor=0000,subsystem-device=0000
from ath10k/QCA9377/hw1.0/board-2.bin
[   21.960660] ath10k_sdio mmc2:0001:1: board_file api 1 bmi_id N/A
crc32 544289f7
[   23.215972] ath10k_sdio mmc2:0001:1: htt-ver 3.32 wmi-op 4 htt-op 3
cal otp max-sta 32 raw 0 hwcrypto 1
[   33.318367] mmc2: Timeout waiting for hardware interrupt.
[   33.323811] mmc2: sdhci: ============ SDHCI REGISTER DUMP ===========
[   33.330260] mmc2: sdhci: Sys addr:  0x85ade000 | Version:  0x00000002
[   33.336711] mmc2: sdhci: Blk size:  0x00000100 | Blk cnt:  0x0000001f
[   33.343164] mmc2: sdhci: Argument:  0x1c10e81f | Trn mode: 0x00000033
[   33.349617] mmc2: sdhci: Present:   0x01f8820e | Host ctl: 0x00000013
[   33.356068] mmc2: sdhci: Power:     0x00000002 | Blk gap:  0x00000080
[   33.362522] mmc2: sdhci: Wake-up:   0x00000008 | Clock:    0x0000007f
[   33.368975] mmc2: sdhci: Timeout:   0x0000008f | Int stat: 0x00000000
[   33.375427] mmc2: sdhci: Int enab:  0x117f110b | Sig enab: 0x117f110b
[   33.381879] mmc2: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000502
[   33.388331] mmc2: sdhci: Caps:      0x07eb0000 | Caps_1:   0x0000b407
[   33.394784] mmc2: sdhci: Cmd:       0x0000353a | Max curr: 0x00ffffff
[   33.401240] mmc2: sdhci: Resp[0]:   0x00001000 | Resp[1]:  0x00000000
[   33.407692] mmc2: sdhci: Resp[2]:   0x00000000 | Resp[3]:
0x00000000
[   33.414148] mmc2: sdhci: Host ctl2: 0x00000088
[   33.418603] mmc2: sdhci: ADMA Err:  0x00000003 | ADMA Ptr: 0x84711204
[   33.425057] mmc2: sdhci-esdhc-imx: ========= ESDHC IMX DEBUG STATUS
DUMP =========
[   33.432643] mmc2: sdhci-esdhc-imx: cmd debug status:  0x2100
[   33.438315] mmc2: sdhci-esdhc-imx: data debug status:  0x22a0
[   33.444074] mmc2: sdhci-esdhc-imx: trans debug status:  0x23a0
[   33.449920] mmc2: sdhci-esdhc-imx: dma debug status:  0x2400
[   33.455592] mmc2: sdhci-esdhc-imx: adma debug status:  0x25b4
[   33.461350] mmc2: sdhci-esdhc-imx: fifo debug status:  0x2680
[   33.467109] mmc2: sdhci-esdhc-imx: async fifo debug status:  0x2750
[   33.473392] mmc2: sdhci: ============================================
[   33.490586] ath10k_sdio mmc2:0001:1: failed to read from address 0x874: -110
[   33.490654] ath10k_sdio mmc2:0001:1: failed to read from mbox
window data address: -110
[   33.490672] ath10k_sdio mmc2:0001:1: failed to read calibration data: -110
[   33.490808] ath10k_sdio mmc2:0001:1: failed to write to address 0x12fd0: -110
[   33.490828] ath10k_sdio mmc2:0001:1: failed to write skb to 0x12fd0
asynchronously: -110
[   33.490904] ath10k_sdio mmc2:0001:1: failed to write to address 0x12ff5: -110
[   33.490920] ath10k_sdio mmc2:0001:1: failed to write skb to 0x12ff5
asynchronously: -110
[   33.490981] ath10k_sdio mmc2:0001:1: failed to write to address 0x1c7ec: -110
[   33.490997] ath10k_sdio mmc2:0001:1: failed to write skb to 0x1c7ec
asynchronously: -110
[   33.491059] ath10k_sdio mmc2:0001:1: failed to write to address 0x1c7ec: -110
[   34.594110] mmc2: queuing unknown CIS tuple 0x01 [d9 01 ff] (3 bytes)
[   34.602418] mmc2: queuing unknown CIS tuple 0x1a [01 01 00 02 07] (5 bytes)
[   34.606014] mmc2: queuing unknown CIS tuple 0x1b [c1 41 30 30 ff ff
32 00] (8 bytes)
[   34.606760] mmc2: queuing unknown CIS tuple 0x14 [] (0 bytes)
[   34.607336] ath: EEPROM regdomain: 0x0
[   34.607346] ath: EEPROM indicates default country code should be used
[   34.607352] ath: doing EEPROM country->regdmn map search
[   34.607359] ath: country maps to regdmn code: 0x3a
[   34.607366] ath: Country alpha2 being used: US
[   34.607371] ath: Regpair used: 0x3a
[   44.838361] mmc2: Timeout waiting for hardware interrupt.
[   44.843807] mmc2: sdhci: ============ SDHCI REGISTER DUMP ===========
[   44.850255] mmc2: sdhci: Sys addr:  0x8a3f8c84 | Version:  0x00000002
[   44.856708] mmc2: sdhci: Blk size:  0x00000004 | Blk cnt:  0x00000001
[   44.863159] mmc2: sdhci: Argument:  0x94105004 | Trn mode: 0x00000003
[   44.869612] mmc2: sdhci: Present:   0x01e8800e | Host ctl: 0x00000013
[   44.876062] mmc2: sdhci: Power:     0x00000002 | Blk gap:  0x00000080
[   44.882513] mmc2: sdhci: Wake-up:   0x00000008 | Clock:    0x0000007f
[   44.888967] mmc2: sdhci: Timeout:   0x0000008f | Int stat: 0x00000000
[   44.895417] mmc2: sdhci: Int enab:  0x117f100b | Sig enab: 0x117f100b
[   44.901869] mmc2: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000502
[   44.908321] mmc2: sdhci: Caps:      0x07eb0000 | Caps_1:   0x0000b407
[   44.914776] mmc2: sdhci: Cmd:       0x0000353a | Max curr: 0x00ffffff
[   44.921228] mmc2: sdhci: Resp[0]:   0x00001000 | Resp[1]:  0x00000000
[   44.927679] mmc2: sdhci: Resp[2]:   0x00000000 | Resp[3]:  0x00000000
[   44.934131] mmc2: sdhci: Host ctl2: 0x00000000
[   44.938584] mmc2: sdhci: ADMA Err:  0x00000000 | ADMA Ptr: 0x84711208
[   44.945037] mmc2: sdhci-esdhc-imx: ========= ESDHC IMX DEBUG STATUS
DUMP =========
[   44.952620] mmc2: sdhci-esdhc-imx: cmd debug status:  0x2100
[   44.958291] mmc2: sdhci-esdhc-imx: data debug status:  0x2260
[   44.964050] mmc2: sdhci-esdhc-imx: trans debug status:  0x2360
[   44.969895] mmc2: sdhci-esdhc-imx: dma debug status:  0x2400
[   44.975564] mmc2: sdhci-esdhc-imx: adma debug status:  0x2510
[   44.981323] mmc2: sdhci-esdhc-imx: fifo debug status:  0x2680
[   44.987082] mmc2: sdhci-esdhc-imx: async fifo debug status:  0x2750
[   44.993363] mmc2: sdhci: ============================================
[   45.000199] ath10k_warn: 14 callbacks suppressed
[   45.000222] ath10k_sdio mmc2:0001:1: failed to write to address 0x828: -110
[   45.000251] ath10k_sdio mmc2:0001:1: unable to disable sdio interrupts: -110
[   45.000266] ath10k_sdio mmc2:0001:1: Could not init hif: -110
[   45.644544] ath10k_sdio mmc2:0001:1: failed to read from address 0x850: -16
[   45.644590] ath10k_sdio mmc2:0001:1: unable to decrement the
command credit count register: -16
[   45.644603] ath10k_sdio mmc2:0001:1: Unable to read soc register
from device: -16
[   46.275640] ath10k_sdio mmc2:0001:1: failed to read from address 0x850: -16
[   46.275686] ath10k_sdio mmc2:0001:1: unable to decrement the
command credit count register: -16
[   46.275699] ath10k_sdio mmc2:0001:1: unable to write to the device (-16)
[   46.275712] ath10k_sdio mmc2:0001:1: settings HTC version failed
[   46.281785] ath10k_sdio mmc2:0001:1: Could not init core: -22
[   46.918870] ath10k_sdio mmc2:0001:1: failed to read from address 0x868: -16
[   46.918912] ath10k_sdio mmc2:0001:1: failed to read fifo/chip
control register: -16
[   48.932147] ath10k_sdio mmc2:0001:1: settings HTC version failed
[   48.938267] ath10k_sdio mmc2:0001:1: Could not init core: -22
[   50.206548] ath10k_warn: 9 callbacks suppressed
[   50.206579] ath10k_sdio mmc2:0001:1: unable to disable sdio function: -16
[   50.843208] ath10k_sdio mmc2:0001:1: failed to read from address 0x850: -16
[   50.843255] ath10k_sdio mmc2:0001:1: unable to decrement the
command credit count register: -16
[   50.843268] ath10k_sdio mmc2:0001:1: Unable to read soc register
from device: -16
[   51.473781] ath10k_sdio mmc2:0001:1: failed to read from address 0x850: -16
[   51.473828] ath10k_sdio mmc2:0001:1: unable to decrement the
command credit count register: -16
[   51.473842] ath10k_sdio mmc2:0001:1: unable to write to the device (-16)
[   51.473854] ath10k_sdio mmc2:0001:1: settings HTC version failed
[   51.479930] ath10k_sdio mmc2:0001:1: Could not init core: -22
[   52.117194] ath10k_sdio mmc2:0001:1: failed to read from address 0x868: -16
[   52.117236] ath10k_sdio mmc2:0001:1: failed to read fifo/chip
control register: -16
[   52.748390] ath10k_sdio mmc2:0001:1: unable to disable sdio function: -16
[   63.713567] ath10k_sdio mmc2:0001:1: failed to read from address 0x850: -16
[   63.713615] ath10k_sdio mmc2:0001:1: unable to decrement the
command credit count register: -16
[   63.713629] ath10k_sdio mmc2:0001:1: Unable to read soc register
from device: -16
[   64.344710] ath10k_sdio mmc2:0001:1: failed to read from address 0x850: -16
[   64.344761] ath10k_sdio mmc2:0001:1: unable to decrement the
command credit count register: -16
[   64.344774] ath10k_sdio mmc2:0001:1: unable to write to the device (-16)
[   64.344788] ath10k_sdio mmc2:0001:1: settings HTC version failed
[   64.350878] ath10k_sdio mmc2:0001:1: Could not init core: -22
[   64.987185] ath10k_sdio mmc2:0001:1: failed to read from address 0x868: -16
[   64.987228] ath10k_sdio mmc2:0001:1: failed to read fifo/chip
control register: -16
[   65.617225] ath10k_sdio mmc2:0001:1: unable to disable sdio function: -16

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
