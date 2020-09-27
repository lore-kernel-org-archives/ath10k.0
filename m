Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.lysator.liu.se ([130.236.254.3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMdzd-0002Sl-69
 for ath10k@lists.infradead.org; Sun, 27 Sep 2020 21:14:02 +0000
Received: from mail.lysator.liu.se (localhost [127.0.0.1])
 by mail.lysator.liu.se (Postfix) with ESMTP id D50BE4000E
 for <ath10k@lists.infradead.org>; Sun, 27 Sep 2020 23:13:51 +0200 (CEST)
Received: from sara.hytechdrive.se (h-170-152-149.A163.priv.bahnhof.se
 [81.170.152.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.lysator.liu.se (Postfix) with ESMTPSA id E5ED24000E
 for <ath10k@lists.infradead.org>; Sun, 27 Sep 2020 23:13:50 +0200 (CEST)
Date: Sun, 27 Sep 2020 23:13:50 +0200 (CEST)
From: =?UTF-8?Q?Peter_=C3=85strand?= <astrand@lysator.liu.se>
Subject: Re: Meshed WiFi with QCA9377 (USB/SDIO)
In-Reply-To: <alpine.LRH.2.23.451.2009211638410.6177@sara.hytechdrive.se>
Message-ID: <alpine.LRH.2.23.451.2009272112560.13564@sara.hytechdrive.se>
References: <alpine.LRH.2.23.451.2009141438290.19926@sara.hytechdrive.se>
 <alpine.LRH.2.23.451.2009180928250.29354@sara.hytechdrive.se>
 <alpine.LRH.2.23.451.2009211638410.6177@sara.hytechdrive.se>
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


More RED bean testing:


> With 5.9.0-rc5-wt-ath+ (master) and firmware and board file generated from 
> https://github.com/8devices/qcacld-2.0/tree/CNSS.LEA.NRT_3.0/firmware_bin/sdio, 
> the firmware crashes as below:

I have changed hardware now, from:

Dell E6430 (O2 Micro, Inc. OZ600FJ0/OZ900FJ0/OZ600FJS SD/MMC Card Reader Controller (rev 05))

to

Dell Latitude 7480 (Realtek Semiconductor Co., Ltd. RTS525A PCI Express Card Reader (rev 01))

This solves the issue:

mmc0: Internal clock never stabilised.

But instead, with the latest "master", I get:

[ 1567.242177] mmc0: cannot verify signal voltage switch
[ 1567.355730] mmc0: queuing unknown CIS tuple 0x01 (3 bytes)
[ 1567.371590] mmc0: queuing unknown CIS tuple 0x1a (5 bytes)
[ 1567.378627] mmc0: queuing unknown CIS tuple 0x1b (8 bytes)
[ 1567.380043] mmc0: queuing unknown CIS tuple 0x14 (0 bytes)
[ 1567.387628] mmc0: queuing unknown CIS tuple 0x80 (1 bytes)
[ 1567.387693] mmc0: queuing unknown CIS tuple 0x81 (1 bytes)
[ 1567.387757] mmc0: queuing unknown CIS tuple 0x82 (1 bytes)
[ 1567.387781] mmc0: new ultra high speed SDR104 SDIO card at address 0001
[ 1570.470544] ath10k_sdio mmc0:0001:1: bmi communication timeout
[ 1570.470546] ath10k_sdio mmc0:0001:1: unable to read from device
[ 1570.470547] ath10k_sdio mmc0:0001:1: could not get target info (-110)


Wrt firmware, we actually have 4 different versions to choose between, any 
recommendation?

1)
Source: https://github.com/8devices/qcacld-2.0/tree/caf-wlan/LNX.LEH.4.2.2.2/firmware/sdio
Version: LNX.LEH.4.2.2.2
Date in binary: Dec  9 2015

2)
Source: https://github.com/kvalo/ath10k-firmware/tree/master/QCA9377/hw1.0/untested
Version: WLAN.TF.1.1.1-00061-QCATFSWPZ-1
Date in binary: Jan 11 2017

3)
Source: https://developer.qualcomm.com/hardware/qca9377-x/tools
Version: LEA.3.0_QDN_r3000017.1
Date in binary: Jul 18 2018

4)
Source: https://github.com/8devices/qcacld-2.0/tree/CNSS.LEA.NRT_3.0/firmware_bin/sdio
Version: CNSS.LEA.NRT_3.0
Date in binary: Nov  7 2018


The kvalo/ath10k one looks promising, but comes without board file. Are 
there dependencies between the firmware versions and the board files, or 
can we just grab a board file from github.com/8devices and use that one 
with the firmware from kvalo/ath10k-firmware?


Br,
Peter

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
