Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C738C5478C
	for <ath10k@archiver.kernel.org>; Thu, 29 Feb 2024 03:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aDBeo5KOAag8etMRgpJjNtP4AJ+GAhFzqgLgl8T5BF8=; b=LQ0vDek5AswtmIWx8XL8/OpbzV
	Ef6IoID2jv0bID2yypJgxH9PzIl6yAcKqUzzxUvOjWfMdByKvWo40zwrGQyaRoCX3C6rFdI2gsmBa
	lmjDPqLh/A0KOUdLc6LmygqiiHNc7CmmufPc4dGRWj5c7wj2kMljEQsvp7R16wIxOjBL1qVpooV2B
	A00/yc8RARbSpnsMnoaw4lCoX9iO2NbFt2hwJNaZrft6+F1gtFS/yzzP8ve6HU5V7k5t4NtKCfXLM
	Zc1r2yhRGAR0A1j4FF5GWf7cg6UehDPuWjKv+MaAWhI8d3x8xxFH2iJy6m5jpGsaqZnDGwuAt9kqw
	9IjNMcgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfX4l-0000000Bt8i-2XbV;
	Thu, 29 Feb 2024 03:27:15 +0000
Received: from mail.kaechele.ca ([2607:5300:60:7a38::25:1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfX4g-0000000Bt6G-2mqE
	for ath10k@lists.infradead.org;
	Thu, 29 Feb 2024 03:27:12 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 27025C005F
	for <ath10k@lists.infradead.org>; Wed, 28 Feb 2024 22:33:00 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaechele.ca; s=201907;
	t=1709177583; h=from:subject:date:message-id:to:mime-version:
	 content-transfer-encoding; bh=aDBeo5KOAag8etMRgpJjNtP4AJ+GAhFzqgLgl8T5BF8=;
	b=ma6ZoIsDEZFuzY6U3cN2s5HEgqbpJlRDgQhPwVngIm9D71r6SgGylZ6UmVFpcOZ0yt/4af
	u6icUZvUMaiWDwsO1LP3Hy30xFtXvOrsgd4FsTRimEXS4DgXIF5kO4EapZ71bf8f6lYFtg
	Ikua5jNWTmYuRXOunOqsc1+oXeSDXJw=
From: Felix Kaechele <felix@kaechele.ca>
To: ath10k@lists.infradead.org
Subject: [RFC PATCH 0/1] Adding support for QCA9379 hw1.0 SDIO
Date: Wed, 28 Feb 2024 22:26:59 -0500
Message-ID: <20240229032700.414415-1-felix@kaechele.ca>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_192711_014653_DEFAFD81 
X-CRM114-Status: GOOD (  13.87  )
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

I'm looking to add support for the QCA9379 chipset to ath10k, specifically for
the SDIO bus version.

The vendor driver treats QCA9379 chips the same as QCA9377 chips:
https://git.codelinaro.org/clo/external-wlan/qcacld-2.0/-/commit/6258d7865b4d336daca097f42ca6f963e96e6f34

Device used for testing: Lenovo ThinkSmart View (CD-18781Y) containing a
LITE-ON WCBN3510A (QCA9379-3) SDIO 3.0 module.

The firmware and boardfile used for testing was pulled from the Android build
running on the device I am using.
The version string is taken from the board's /modem/verinfo/ver_info.txt and
should correspond to the BSP the vendor originally used. I cannot fully verify
if the firmware binaries do in fact match files of that version string from the
BSP though.
Maybe someone from QCA can provide the latest version of a WLAN.NPL firmware to
ath10k-firmware, as my understanding is that firmwares from unofficial sources
are not accepted into ath10k-firmware. If that's a possibility, official
Bluetooth firmware binaries would also be appreciated.

Probing the card is not entirely error free, but it does work relatively
reliably nonetheless.
This could have to do with the MSM8953/APQ8053 SoC possibly still having
a few bugs in the mainline kernel and/or my device tree for the device
not being entirely correct or complete yet.

[    0.488529] mmc1: SDHCI controller on 7864900.mmc [7864900.mmc] using ADMA 64-bit
[    0.539510] mmc1: queuing unknown CIS tuple 0x01 [d9 01 ff] (3 bytes)
[    0.550181] mmc1: queuing unknown CIS tuple 0x1a [01 01 00 02 07] (5 bytes)
[    0.554923] mmc1: queuing unknown CIS tuple 0x1b [c1 41 30 30 ff ff 32 00] (8 bytes)
[    0.555726] mmc1: queuing unknown CIS tuple 0x14 [] (0 bytes)
...
[    0.578882] mmc1: new ultra high speed SDR104 SDIO card at address 0001
...
[   12.054476] ath10k_sdio mmc1:0001:1: qca9379 hw1.0 sdio target 0x05040000 chip_id 0x00000000 sub 0000:0000
[   12.054491] ath10k_sdio mmc1:0001:1: kconfig debug 0 debugfs 1 tracing 0 dfs 0 testmode 0
[   12.054714] ath10k_sdio mmc1:0001:1: firmware ver WLAN.NPL.1.6-00163-QCANPLSWPZ-1 api 5 features ignore-otp crc32 bf84ab04
...
[   12.210930] ath10k_sdio mmc1:0001:1: board_file api 1 bmi_id N/A crc32 05c45515
...
[   13.928030] ath10k_sdio mmc1:0001:1: failed to read from address 0x874: -110
[   13.928061] ath10k_sdio mmc1:0001:1: failed to read from mbox window data address: -110
[   13.928069] ath10k_sdio mmc1:0001:1: failed to read calibration data: -110
[   13.928387] ath10k_sdio mmc1:0001:1: failed to read from address 0x868: -110
[   13.928401] ath10k_sdio mmc1:0001:1: failed to read fifo/chip control register: -110
[   13.928601] ath10k_sdio mmc1:0001:1: failed to write to address 0x1c7ec: -110
[   13.928613] ath10k_sdio mmc1:0001:1: failed to write skb to 0x1c7ec asynchronously: -110
[   13.928861] ath10k_sdio mmc1:0001:1: failed to write to address 0x1c7e8: -110
[   13.928873] ath10k_sdio mmc1:0001:1: failed to write skb to 0x1c7e8 asynchronously: -110
[   13.929121] ath10k_sdio mmc1:0001:1: failed to read from address 0x868: -110
[   15.031702] mmc1: queuing unknown CIS tuple 0x01 [d9 01 ff] (3 bytes)
[   15.040231] mmc1: queuing unknown CIS tuple 0x1a [01 01 00 02 07] (5 bytes)
[   15.043409] mmc1: queuing unknown CIS tuple 0x1b [c1 41 30 30 ff ff 32 00] (8 bytes)
[   15.044337] mmc1: queuing unknown CIS tuple 0x14 [] (0 bytes)
[   15.053241] ath: EEPROM regdomain: 0x0
[   15.053265] ath: EEPROM indicates default country code should be used
[   15.053268] ath: doing EEPROM country->regdmn map search
[   15.053272] ath: country maps to regdmn code: 0x3a
[   15.053275] ath: Country alpha2 being used: US
[   15.053278] ath: Regpair used: 0x3a
[   16.463580] zram: Added device: zram0
[   18.013824] mmc1: queuing unknown CIS tuple 0x01 [d9 01 ff] (3 bytes)
[   18.024488] mmc1: queuing unknown CIS tuple 0x1a [01 01 00 02 07] (5 bytes)
[   18.029188] mmc1: queuing unknown CIS tuple 0x1b [c1 41 30 30 ff ff 32 00] (8 bytes)
[   18.029983] mmc1: queuing unknown CIS tuple 0x14 [] (0 bytes)

iperf performance is looking decent:

TX speeds:
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.00  sec   206 MBytes   173 Mbits/sec    0             sender
[  5]   0.00-10.02  sec   204 MBytes   171 Mbits/sec                  receiver

RX speeds:
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.01  sec   227 MBytes   190 Mbits/sec  190             sender
[  5]   0.00-10.00  sec   224 MBytes   188 Mbits/sec                  receiver

However, the card does not roam cleanly:
[  815.580791] ath10k_warn: 36 callbacks suppressed
[  815.580819] ath10k_sdio mmc1:0001:1: failed to install key for vdev 0 peer 76:ac:b9:xx:xx:xx: -110
[  815.580852] wlan0: failed to set key (1, ff:ff:ff:ff:ff:ff) to hardware (-110)
[  815.582408] wlan0: deauthenticating from 76:ac:b9:xx:xx:xx by local choice (Reason: 1=UNSPECIFIED)
[  815.666295] ath10k_sdio mmc1:0001:1: Got RX ind from invalid peer: 50
[  815.666333] ath10k_sdio mmc1:0001:1: Got RX ind from invalid peer: 50

Possibly a firmware issue. I don't know.

I'd be grateful for any comments regarding this patch.

Regards,
Felix

Felix Kaechele (1):
  wifi: ath10k: add support for QCA9379 hw1.0 SDIO

 drivers/net/wireless/ath/ath10k/core.c      | 35 +++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/hw.h        | 11 +++++++
 drivers/net/wireless/ath/ath10k/pci.c       |  2 ++
 drivers/net/wireless/ath/ath10k/sdio.c      |  5 ++-
 drivers/net/wireless/ath/ath10k/targaddrs.h |  3 ++
 include/linux/mmc/sdio_ids.h                |  1 +
 6 files changed, 56 insertions(+), 1 deletion(-)

-- 
2.44.0


