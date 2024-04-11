Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C50C4345F
	for <ath10k@archiver.kernel.org>; Thu, 11 Apr 2024 20:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:Subject:To:From:Date:MIME-Version:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n1aTZ9ChP7D/7U+t9S4tnnxLeFFxdc6F+Z6et3o17Rg=; b=zSe3nQxZZ6edKJinuM5tOAtnPs
	wVJhoIKh6KMIqkLfnp0sPiFu35uABZn/AK3R3eUv9bdqaFeCZmbkMlOLI8bRGI3XIxEJwSIte0pxu
	FNE6+yIESerwP+e40SfUSuVBAVijpUM75qlP9kfeXXv+X+6Qo8fzwsSXR7omgmh05IyGDCYvZ2D56
	75AG4Z7jjRBzBnTyiX7AioddqNHtN9WIQJ03PokP8IKhQf8Dm8xEuDgvjU25Usjd9uhJUg9f1Dy3L
	9P0Gco2mX+AlRkrxrofFyLL3rlrMgLcXXU2HYzmlW42BfSPatfZTvvDEU/ekJ32UzKijeVZ1eZvmg
	vj8sB/GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv0rE-0000000E0WQ-10VB;
	Thu, 11 Apr 2024 20:17:16 +0000
Received: from mail.netcube.li ([173.249.15.149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv0r9-0000000E0VA-1lBF
	for ath10k@lists.infradead.org;
	Thu, 11 Apr 2024 20:17:12 +0000
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=n1aTZ9ChP7D/7U+t9S4tnnxLeFFxdc6F+Z6et3o17Rg=;
	b=VlJvMAxdZFd4CWOZ9ZSJMmWZUjE0pjWd64zZQezkLcOl8wgcWNxEEfJGVcs35je0nk/8PSw+XdMfr6l6n/8YenL1AQgoMQtehknOFj+OItyxIJOvrkk5iH5VStjA9gKc5OSqJ9czfUZFTQtjdiu/zuQTD6/sC6ndJpks8btZHpE=
Received: from webmail.netcube.li (WIN-IJ7TS3MJ5LT [127.0.0.1])
	by mail.netcube.li with ESMTPA
	; Thu, 11 Apr 2024 22:17:02 +0200
MIME-Version: 1.0
Date: Thu, 11 Apr 2024 22:17:01 +0200
From: Lukas Schmid <lukas.schmid@netcube.li>
To: ath10k@lists.infradead.org
Subject: Issue with ATH10K driver on sunxi platform using sdio
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <c6d50711d4970747aae8e088e5f7c99e@netcube.li>
X-Sender: lukas.schmid@netcube.li
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_131711_879838_8ECC0233 
X-CRM114-Status: UNSURE (   6.58  )
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

Hi,

I am trying to use an QCA9377-3 based module on a custom board based 
around an Allwinner V3s SoC.

The modules are loaded correctly, the module is detected and scanning 
for networks works. However when trying to connect to a network, I get 
the following message about an unaligned scatterlist.

----------------------------------------------------------------------------------

[   52.006548] mmc1: new high speed SDIO card at address 0001
[   52.084936] ath10k_sdio mmc1:0001:1: qca9377 hw1.1 sdio target 
0x05020001 chip_id 0x00000000 sub 0000:0000
[   52.084996] ath10k_sdio mmc1:0001:1: kconfig debug 0 debugfs 0 
tracing 0 dfs 0 testmode 0
[   52.088478] ath10k_sdio mmc1:0001:1: firmware ver 
WLAN.TF.1.1.1-00061-QCATFSWPZ-1 api 5 features ignore-otp crc32 7746e551
[   52.258959] ath10k_sdio mmc1:0001:1: failed to fetch board data for 
bus=sdio,vendor=0271,device=0701,subsystem-vendor=0000,subsystem-device=0000 
from ath10k/QCA9377/hw1.0/board-2.bin
[   52.307328] ath10k_sdio mmc1:0001:1: board_file api 1 bmi_id N/A 
crc32 544289f7
[   56.217772] ath10k_sdio mmc1:0001:1: htt-ver 3.32 wmi-op 4 htt-op 3 
cal otp max-sta 32 raw 0 hwcrypto 1
[   56.217995] sunxi-mmc 1c10000.mmc: unaligned scatterlist: os 4c0 
length 11
[   56.218020] sunxi-mmc 1c10000.mmc: map DMA failed
[   56.218035] ath10k_sdio mmc1:0001:1: failed to write to address 
0x12ff5: -22
[   56.218051] ath10k_sdio mmc1:0001:1: failed to write skb to 0x12ff5 
asynchronously: -22
[   56.270321] mmc1: queuing unknown CIS tuple 0x01 [d9 01 ff] (3 bytes)
[   56.277541] mmc1: queuing unknown CIS tuple 0x1a [01 01 00 02 07] (5 
bytes)
[   56.280698] mmc1: queuing unknown CIS tuple 0x1b [c1 41 30 30 ff ff 
32 00] (8 bytes)
[   56.281344] mmc1: queuing unknown CIS tuple 0x14 [] (0 bytes)
[   56.282522] ath: EEPROM regdomain: 0x0
[   56.282542] ath: EEPROM indicates default country code should be used
[   56.282550] ath: doing EEPROM country->regdmn map search
[   56.282559] ath: country maps to regdmn code: 0x3a
[   56.282568] ath: Country alpha2 being used: US
[   56.282576] ath: Regpair used: 0x3a
[   60.308005] sunxi-mmc 1c10000.mmc: unaligned scatterlist: os b80 
length 11
[   60.308061] sunxi-mmc 1c10000.mmc: map DMA failed
[   60.308078] ath10k_sdio mmc1:0001:1: failed to write to address 
0x12ff5: -22
[   60.308096] ath10k_sdio mmc1:0001:1: failed to write skb to 0x12ff5 
asynchronously: -22

----------------------------------------------------------------------------------

Has anyone maybe got an idea as to how this could be fixed?

The kernel running on the board is Linux Mainline 6.8.2

Best regards,
Lukas Schmid


