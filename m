Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17377C7EE2F
	for <ath10k@archiver.kernel.org>; Mon, 12 Jun 2023 19:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OFiT/Jy5ITVcnvPedA+ahJhJCJhrzFuy6JqlG5h7kxc=; b=GZ0kNsOyQvBvwG
	i/r9VHhz9A7slRxTAYk3kZbVHIwEtuoo4EVfDKqO5a8RH2MJUVMaNX1sZ53aqsdk3ZjbT9wEkGo+U
	ghHkfkfkdEGSxLFjPwIHbwiKfe/XpFIC64EYVnOZRH95BuQ/NOcFcyktOcRb5LXTwSGYBR0bfU5G7
	m9TQcVvVj2A6VTbxt4hrjYJz3DfFYsly1WCbubjo67QHuq/1Hd4XhAPOXIzLKWa4pO1Ee6ws7vsUG
	oFsRaoQ2UdsfCO7JG6R0Ftl7h2vSljsMDkbnaM8iIsqgq8ADp4ON/Fj8bJ/51KfFfA/8JgzbNXAHB
	lc3Xf+xnK9wgN08+H6oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8nhf-005CWA-2n;
	Mon, 12 Jun 2023 19:59:51 +0000
Received: from softboy.mntmn.com ([91.250.115.15])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8nhb-005CV1-3C
	for ath10k@lists.infradead.org;
	Mon, 12 Jun 2023 19:59:50 +0000
From: "Lukas F. Hartmann" <lukas@mntre.com>
DKIM-Filter: OpenDKIM Filter v2.11.0 softboy.mntmn.com B31E27200CF
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mntre.com;
	s=mntremail; t=1686599980;
	bh=8LdXHujUNdHvKLMGbwCTCL0YzRZ2fkhkiKNTlUO6vT4=;
	h=From:To:Cc:Subject:Date:From;
	b=P0xlq3QGMlealkh63wGL865JSgXggd243UmxhDqxgDzfSbFJy+r2TADzSE+L5IawO
	 eBMzJhcI5OamIqWzVHsZv5uqVBQOYdk3xtV8vFb9LCVqTYbPi+POg64iH27uqGlkeM
	 grfhlUkLzBqmB2/CCVmwad8C065WKSH9Okv1Z+Ay2njbTLvDRUBj62gd8a0VPJGGQ2
	 MFIdPUDvy1iI5Lh0aYWN12BHdXcyKIKfZn4lVeorBQp4OUm69AsV/K8mPf0ssVbGCY
	 BXwXMvahrVVGYbr2bBoRdrV/Q0OyAtpOiKW4fuamJc1U7uAzQjNcC84rBxYPdLmFY5
	 MFqBF7TqBGavw==
To: ath10k@lists.infradead.org
Cc: gary.bisson@boundarydevices.com
Subject: Problems with QCA9377 SDIO on NXP i.MX8MPlus SOM
Date: Mon, 12 Jun 2023 21:59:36 +0200
Message-ID: <875y7swixj.fsf@mntre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_125948_199947_2FFC64A2 
X-CRM114-Status: GOOD (  11.19  )
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

I'm trying to get the QCA9377 SDIO module on Boundary Devices'
i.MX8MPlus SOM working with the ath10k mainline driver (from Linux git
tip). Currently it can scan and see some APs and authenticate, but not
associate (timeout). Several months ago I thought this was an SDIO
signalling issue with the SoC, but I'm not sure anymore, because I fixed
up the qcacld driver for the current Linux kernel and it works fine on
the same system (i.e. I can rmmod ath10k_sdio and insmod wlan.ko and it
works).

I wonder if it is some kind of firmware/driver mismatch. I pasted the
relevant dmesg output after my signature below.

This is after I tried to build my own board-2.bin including bdwlan30.bin
from qcacld-2.0-CNSS.LEA.NRT_3.0 (source:
https://github.com/8devices/qcacld-2.0/tree/CNSS.LEA.NRT_3.0/firmware_bin/sdio).
It gets picked up but doesn't seem to make a difference. I also tried
assembling my own firmware-5-sdio.bin from qwlan30.bin and otp30.bin but
this triggers a firmware crash (with register dump) when loading
ath10k_sdio.ko.

The qcacld driver works with that firmware, though.

Any pointers on how to debug this are most appreciated.

Best
Lukas
-- 
Lukas F. Hartmann, CEO
MNT Research GmbH
https://mntre.com
--

root@reform:~# cat /sys/kernel/debug/mmc1/ios 
clock:		50000000 Hz
actual clock:	50000000 Hz
vdd:		21 (3.3 ~ 3.4 V)
bus mode:	2 (push-pull)
chip select:	0 (don't care)
power mode:	2 (on)
bus width:	2 (4 bits)
timing spec:	7 (sd uhs DDR50)
signal voltage:	1 (1.80 V)
driver type:	0 (driver type B)

output from qcacld in dmesg:

[ 5482.570652] wlan: loading driver v4.5.25.57
[ 5482.575281] hifDeviceInserted: Dumping clocks (50000000,200000000)
[ 5482.770932] ol_download_firmware: chip_id:0x5020001 board_id:0x0
[ 5482.777325] ar6k_wlan mmc1:0001:1: Direct firmware load for bdwlan30.b00 failed with error -2
[ 5482.785885] __ol_transfer_bin_file: Failed to get bdwlan30.b00:-2
[ 5482.791995] __ol_transfer_bin_file: Trying to load default bdwlan30.bin
[ 5482.798961] Board extended Data download address: 0x0
[ 5482.817983] __ol_transfer_bin_file: Loading setup file qsetup30.bin
[ 5482.824316] ar6k_wlan mmc1:0001:1: Direct firmware load for qsetup30.bin failed with error -2
[ 5482.832858] __ol_transfer_bin_file: Failed to get qsetup30.bin:-2
[ 5483.273017] ar6k_wlan mmc1:0001:1: Direct firmware load for wlan/wlan_mac.bin failed with error -2
[ 5483.282584] target uses HTT version 3.58; host uses 3.28
[ 5483.287906] *** Warning: host/target HTT versions are different, though compatible!
[ 5483.295848] Host SW:4.5.25.57, FW:0.0.0.26, HW:QCA93x7_REV1_1
[ 5483.302792] ENTER sme_set_btc_coex_dutycycle = 30
[ 5483.302811] ENTER sme_set_btc_coex_dutycycle =30
[ 5483.308765] ath_hif_sdio: HIF (Atheros/multi-bss)
[ 5483.318575] wlan: driver loaded in 748000

output from ath10k_sdio in dmesg:

[ 4541.308975] ath10k_sdio mmc1:0001:1: qca9377 hw1.1 sdio target 0x05020001 chip_id 0x00000000 sub 0000:0000
[ 4541.318711] ath10k_sdio mmc1:0001:1: kconfig debug 1 debugfs 1 tracing 0 dfs 0 testmode 0
[ 4541.327201] ath10k_sdio mmc1:0001:1: firmware ver WLAN.TF.1.1.1-00061-QCATFSWPZ-1 api 5 features ignore-otp crc32 7746e551
[ 4541.483782] ath10k_sdio mmc1:0001:1: board_file api 2 bmi_id N/A crc32 0708e68d
[ 4542.590752] ath10k_sdio mmc1:0001:1: htt-ver 3.32 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
[ 4542.590822] ath10k_sdio mmc1:0001:1: failed to write to address 0x12ff5: -84
[ 4542.607255] ath10k_sdio mmc1:0001:1: failed to write skb to 0x12ff5 asynchronously: -84
[ 4542.763766] mmc1: queuing unknown CIS tuple 0x01 [d9 01 ff] (3 bytes)
[ 4542.778083] mmc1: queuing unknown CIS tuple 0x1a [01 01 00 02 07] (5 bytes)
[ 4542.788463] mmc1: queuing unknown CIS tuple 0x1b [c1 41 30 30 ff ff 32 00] (8 bytes)
[ 4542.796938] mmc1: queuing unknown CIS tuple 0x14 [] (0 bytes)
[ 4542.804476] ath: EEPROM regdomain: 0x0
[ 4542.804481] ath: EEPROM indicates default country code should be used
[ 4542.804484] ath: doing EEPROM country->regdmn map search
[ 4542.804487] ath: country maps to regdmn code: 0x3a
[ 4542.804490] ath: Country alpha2 being used: US
[ 4542.804493] ath: Regpair used: 0x3a
[ 4544.003032] ath10k_sdio mmc1:0001:1: failed to write to address 0x12ff5: -84
[ 4544.010191] ath10k_sdio mmc1:0001:1: failed to write skb to 0x12ff5 asynchronously: -84
[ 4544.231838] mmc1: queuing unknown CIS tuple 0x01 [d9 01 ff] (3 bytes)
[ 4544.246204] mmc1: queuing unknown CIS tuple 0x1a [01 01 00 02 07] (5 bytes)
[ 4544.256610] mmc1: queuing unknown CIS tuple 0x1b [c1 41 30 30 ff ff 32 00] (8 bytes)
[ 4544.265092] mmc1: queuing unknown CIS tuple 0x14 [] (0 bytes)
[ 4545.426883] ath10k_sdio mmc1:0001:1: failed to write to address 0x12ff5: -84
[ 4545.434040] ath10k_sdio mmc1:0001:1: failed to write skb to 0x12ff5 asynchronously: -84
[ 4567.496221] wlan0: authenticate with 48:5d:35:8d:55:12
[ 4567.534325] wlan0: send auth to 48:5d:35:8d:55:12 (try 1/3)
[ 4567.627347] wlan0: authenticate with 48:5d:35:8d:55:12
[ 4567.632620] wlan0: send auth to 48:5d:35:8d:55:12 (try 1/3)
[ 4567.667287] wlan0: authenticated
[ 4567.674326] wlan0: associate with 48:5d:35:8d:55:12 (try 1/3)
[ 4567.680220] ath10k_sdio mmc1:0001:1: failed to write to address 0x12efd: -84
[ 4567.687294] ath10k_sdio mmc1:0001:1: failed to write skb to 0x12efd asynchronously: -84
[ 4568.806313] wlan0: associate with 48:5d:35:8d:55:12 (try 2/3)
[ 4568.812548] ath10k_sdio mmc1:0001:1: failed to write to address 0x12efd: -84
[ 4568.819730] ath10k_sdio mmc1:0001:1: failed to write skb to 0x12efd asynchronously: -84
[ 4569.830306] wlan0: associate with 48:5d:35:8d:55:12 (try 3/3)
[ 4569.836513] ath10k_sdio mmc1:0001:1: failed to write to address 0x12efd: -84
[ 4569.843668] ath10k_sdio mmc1:0001:1: failed to write skb to 0x12efd asynchronously: -84
[ 4570.822310] wlan0: association with 48:5d:35:8d:55:12 timed out
[ 4575.974307] ath10k_sdio mmc1:0001:1: failed to flush transmit queue (skip 0 ar-state 1): 0
[ 4581.094297] ath10k_sdio mmc1:0001:1: failed to flush transmit queue (skip 0 ar-state 1): 0
[ 4581.443674] wlan0: authenticate with 48:5d:35:8d:55:11
[ 4581.448877] wlan0: 80 MHz not supported, disabling VHT
[ 4581.502006] wlan0: send auth to 48:5d:35:8d:55:11 (try 1/3)
[ 4581.607963] wlan0: authenticate with 48:5d:35:8d:55:11
[ 4581.613157] wlan0: send auth to 48:5d:35:8d:55:11 (try 1/3)
[ 4581.640901] wlan0: authenticated
[ 4581.646306] wlan0: associate with 48:5d:35:8d:55:11 (try 1/3)
[ 4581.652315] ath10k_sdio mmc1:0001:1: failed to write to address 0x12f3d: -84
[ 4581.659408] ath10k_sdio mmc1:0001:1: failed to write skb to 0x12f3d asynchronously: -84
[ 4582.790278] wlan0: associate with 48:5d:35:8d:55:11 (try 2/3)
[ 4582.796375] ath10k_sdio mmc1:0001:1: failed to write to address 0x12f3d: -84
[ 4582.803528] ath10k_sdio mmc1:0001:1: failed to write skb to 0x12f3d asynchronously: -84
[ 4583.814279] wlan0: associate with 48:5d:35:8d:55:11 (try 3/3)
[ 4583.821362] ath10k_sdio mmc1:0001:1: failed to write to address 0x12f3d: -84
[ 4583.831060] ath10k_sdio mmc1:0001:1: failed to write skb to 0x12f3d asynchronously: -84
[ 4584.838284] wlan0: association with 48:5d:35:8d:55:11 timed out
[ 4590.054286] ath10k_sdio mmc1:0001:1: failed to flush transmit queue (skip 0 ar-state 1): 0
[ 4595.174331] ath10k_sdio mmc1:0001:1: failed to flush transmit queue (skip 0 ar-state 1): 0
[ 4597.950346] wlan0: authenticate with 48:5d:35:8d:55:12
[ 4597.988680] wlan0: send auth to 48:5d:35:8d:55:12 (try 1/3)
[ 4598.076586] wlan0: authenticate with 48:5d:35:8d:55:12
[ 4598.081867] wlan0: send auth to 48:5d:35:8d:55:12 (try 1/3)
[ 4598.109777] wlan0: authenticated
[ 4598.114288] wlan0: associate with 48:5d:35:8d:55:12 (try 1/3)
[ 4598.120331] ath10k_sdio mmc1:0001:1: failed to write to address 0x12efd: -84
[ 4598.127455] ath10k_sdio mmc1:0001:1: failed to write skb to 0x12efd asynchronously: -84
[ 4598.822274] wlan0: associate with 48:5d:35:8d:55:12 (try 2/3)
[ 4598.828390] ath10k_sdio mmc1:0001:1: failed to write to address 0x12efd: -84
[ 4598.835547] ath10k_sdio mmc1:0001:1: failed to write skb to 0x12efd asynchronously: -84
[ 4599.814254] wlan0: associate with 48:5d:35:8d:55:12 (try 3/3)
[ 4599.820427] ath10k_sdio mmc1:0001:1: failed to write to address 0x12efd: -84
[ 4599.827654] ath10k_sdio mmc1:0001:1: failed to write skb to 0x12efd asynchronously: -84
[ 4600.814891] wlan0: association with 48:5d:35:8d:55:12 timed out

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
