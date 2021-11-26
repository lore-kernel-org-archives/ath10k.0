Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED5AC433EF
	for <ath10k@archiver.kernel.org>; Fri, 26 Nov 2021 15:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UE8UKQWJCLFfBn8NcskQEUlesqOYhavKaOp48nOYVTA=; b=VEl/woTSWOvZbd
	YTLpQjTK4dGf2iAmtXrjKQTZnkvFtpk8FWYlJtszYmmj1Z4MLpAKOQGfeqy5exucGwwyNINyWDvcy
	kChZONHqJlGx122NChlsa6nLoGNZ+aIfUMRUclWE4r3T7EdeaaG+UdvHDBvXCt9T22R1jaclP1FPd
	aq3RE/QpEbYDI0a5KmyjADZmSWN5nqXfO/S6m2ZpCWSljqxAyRTO+9mqUPFJe+H8o86e8UmqrKnzS
	qLnjibXul7gxzAGMOhpzosjuzLILXwuaNpFp++JshP38s4WI+EmfNi2mwJ6dvnk4nxRME7CJNYSyF
	MGbsOZmazTzbTh+H0Ubw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqd50-00Avr8-Pr; Fri, 26 Nov 2021 15:24:02 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqd4v-00Avnu-0d
 for ath10k@lists.infradead.org; Fri, 26 Nov 2021 15:24:01 +0000
Received: (Authenticated sender: tbm@cyrius.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 1109A1C0019
 for <ath10k@lists.infradead.org>; Fri, 26 Nov 2021 15:23:49 +0000 (UTC)
Received: by jirafa.cyrius.com (Postfix, from userid 1000)
 id 9DFC71A0ACF; Fri, 26 Nov 2021 23:23:45 +0800 (PST)
Date: Fri, 26 Nov 2021 23:23:45 +0800
From: Martin Michlmayr <tbm@cyrius.com>
To: ath10k@lists.infradead.org
Subject: Firmware crash with QCA6174
Message-ID: <YaD8AQnUUCwFVdEp@jirafa.cyrius.com>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_072357_461147_51CD35C8 
X-CRM114-Status: UNSURE (   4.97  )
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

The firmware crashed on QCA6174 with WLAN.RM.4.4.1-00288.  My AP was acting
up before this happened.  A reset of the AP fixed it but later the firmware
on my laptop crashed.  I had to reboot to make it work again.

This is on an XPS 13 9380 with QCA6174.  Linux 5.15 (from Debian).

[281077.328329] ath10k_pci 0000:02:00.0: pci irq msi oper_irq_mode 2 irq_mode 0 reset_mode 0
[281077.613461] ath10k_pci 0000:02:00.0: firmware: failed to load ath10k/pre-cal-pci-0000:02:00.0.bin (-2)
[281077.613495] ath10k_pci 0000:02:00.0: firmware: failed to load ath10k/cal-pci-0000:02:00.0.bin (-2)
[281077.613997] ath10k_pci 0000:02:00.0: firmware: direct-loading firmware ath10k/QCA6174/hw3.0/firmware-6.bin
[281077.614010] ath10k_pci 0000:02:00.0: qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff sub 1a56:143a
[281077.614018] ath10k_pci 0000:02:00.0: kconfig debug 0 debugfs 0 tracing 0 dfs 0 testmode 0
[281077.615519] ath10k_pci 0000:02:00.0: firmware ver WLAN.RM.4.4.1-00288- api 6 features wowlan,ignore-otp,mfp crc32 bf907c7c
[281077.680786] ath10k_pci 0000:02:00.0: firmware: direct-loading firmware ath10k/QCA6174/hw3.0/board-2.bin
[281077.681141] ath10k_pci 0000:02:00.0: board_file api 2 bmi_id N/A crc32 e57aadc7
[281077.773870] ath10k_pci 0000:02:00.0: htt-ver 3.87 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
[281077.859518] ath: EEPROM regdomain: 0x6c
[281077.859526] ath: EEPROM indicates we should expect a direct regpair map
[281077.859530] ath: Country alpha2 being used: 00
[281077.859532] ath: Regpair used: 0x6c
[281077.865203] ath10k_pci 0000:02:00.0 wlp2s0: renamed from wlan0
[281098.299986] wlp2s0: authenticate with 14:13:46:cd:04:0e
[281098.356557] wlp2s0: send auth to 14:13:46:cd:04:0e (try 1/3)
[281098.638892] wlp2s0: send auth to 14:13:46:cd:04:0e (try 2/3)
[281098.733878] wlp2s0: send auth to 14:13:46:cd:04:0e (try 3/3)
[281098.875442] wlp2s0: authentication with 14:13:46:cd:04:0e timed out
[281103.849438] wlp2s0: authenticate with 14:13:46:cd:04:0e
[281103.905138] wlp2s0: send auth to 14:13:46:cd:04:0e (try 1/3)
[281104.476709] wlp2s0: send auth to 14:13:46:cd:04:0e (try 2/3)
[281104.810066] wlp2s0: send auth to 14:13:46:cd:04:0e (try 3/3)
[281105.169068] wlp2s0: aborting authentication with 14:13:46:cd:04:0e by local choice (Reason: 3=DEAUTH_LEAVING)
[281118.210507] wlp2s0: authenticate with 14:13:46:cd:04:0e
[281118.265249] wlp2s0: send auth to 14:13:46:cd:04:0e (try 1/3)
[281118.406896] wlp2s0: send auth to 14:13:46:cd:04:0e (try 2/3)
[281118.616262] wlp2s0: send auth to 14:13:46:cd:04:0e (try 3/3)
[281118.640578] wlp2s0: authentication with 14:13:46:cd:04:0e timed out
[281133.867122] wlp2s0: authenticate with 14:13:46:cd:04:0e
[281133.922203] wlp2s0: send auth to 14:13:46:cd:04:0e (try 1/3)
[281134.153858] wlp2s0: send auth to 14:13:46:cd:04:0e (try 2/3)
[281134.314297] wlp2s0: send auth to 14:13:46:cd:04:0e (try 3/3)
[281134.661775] wlp2s0: authentication with 14:13:46:cd:04:0e timed out
[281147.842614] wlp2s0: authenticate with 14:13:46:cd:04:0e
[281147.897722] wlp2s0: send auth to 14:13:46:cd:04:0e (try 1/3)
[281148.524876] wlp2s0: send auth to 14:13:46:cd:04:0e (try 2/3)
[281148.703820] wlp2s0: send auth to 14:13:46:cd:04:0e (try 3/3)
[281148.709195] wlp2s0: authentication with 14:13:46:cd:04:0e timed out
[281158.596336] wlp2s0: authenticate with 14:13:46:cd:04:0e
[281158.652075] wlp2s0: send auth to 14:13:46:cd:04:0e (try 1/3)
[281159.175642] wlp2s0: send auth to 14:13:46:cd:04:0e (try 2/3)
[281159.687204] wlp2s0: send auth to 14:13:46:cd:04:0e (try 3/3)
[281159.968565] wlp2s0: authentication with 14:13:46:cd:04:0e timed out
[281233.747531] wlp2s0: authenticate with 14:13:46:cd:04:0e
[281233.803482] wlp2s0: send auth to 14:13:46:cd:04:0e (try 1/3)
[281233.805188] wlp2s0: authenticated
[281233.807369] wlp2s0: associate with 14:13:46:cd:04:0e (try 1/3)
[281233.987348] wlp2s0: RX AssocResp from 14:13:46:cd:04:0e (capab=0x1411 status=0 aid=2)
[281233.990850] wlp2s0: associated
[281234.175872] IPv6: ADDRCONF(NETDEV_CHANGE): wlp2s0: link becomes ready
[281241.292218] wlp2s0: deauthenticated from 14:13:46:cd:04:0e (Reason: 15=4WAY_HANDSHAKE_TIMEOUT)
[281246.248916] wlp2s0: authenticate with 14:13:46:cd:04:0e
[281246.303695] wlp2s0: send auth to 14:13:46:cd:04:0e (try 1/3)
[281246.310355] wlp2s0: authenticated
[281246.311268] wlp2s0: associate with 14:13:46:cd:04:0e (try 1/3)
[281246.368682] wlp2s0: RX AssocResp from 14:13:46:cd:04:0e (capab=0x1411 status=0 aid=2)
[281246.371847] wlp2s0: associated
[281254.204650] ICMPv6: NA: 1c:bf:ce:45:cb:d0 advertised our address 2404:3c00:a0bf:f300::1 on wlp2s0!
[281609.299924] wlp2s0: deauthenticating from 14:13:46:cd:04:0e by local choice (Reason: 3=DEAUTH_LEAVING)
[281609.676660] ath10k_pci 0000:02:00.0: pci irq msi oper_irq_mode 2 irq_mode 0 reset_mode 0
[281609.955916] ath10k_pci 0000:02:00.0: firmware: failed to load ath10k/pre-cal-pci-0000:02:00.0.bin (-2)
[281609.955947] ath10k_pci 0000:02:00.0: firmware: failed to load ath10k/cal-pci-0000:02:00.0.bin (-2)
[281609.956476] ath10k_pci 0000:02:00.0: firmware: direct-loading firmware ath10k/QCA6174/hw3.0/firmware-6.bin
[281609.956488] ath10k_pci 0000:02:00.0: qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff sub 1a56:143a
[281609.956496] ath10k_pci 0000:02:00.0: kconfig debug 0 debugfs 0 tracing 0 dfs 0 testmode 0
[281609.957996] ath10k_pci 0000:02:00.0: firmware ver WLAN.RM.4.4.1-00288- api 6 features wowlan,ignore-otp,mfp crc32 bf907c7c
[281610.023508] ath10k_pci 0000:02:00.0: firmware: direct-loading firmware ath10k/QCA6174/hw3.0/board-2.bin
[281610.024340] ath10k_pci 0000:02:00.0: board_file api 2 bmi_id N/A crc32 e57aadc7
[281610.113494] ath10k_pci 0000:02:00.0: htt-ver 3.87 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
[281610.192292] ath: EEPROM regdomain: 0x6c
[281610.192296] ath: EEPROM indicates we should expect a direct regpair map
[281610.192297] ath: Country alpha2 being used: 00
[281610.192298] ath: Regpair used: 0x6c
[281610.195020] ath10k_pci 0000:02:00.0 wlp2s0: renamed from wlan0
[281620.704695] wlp2s0: authenticate with 14:13:46:cd:04:0e
[281620.759728] wlp2s0: send auth to 14:13:46:cd:04:0e (try 1/3)
[281620.763539] wlp2s0: authenticated
[281620.767309] wlp2s0: associate with 14:13:46:cd:04:0e (try 1/3)
[281620.802538] wlp2s0: RX AssocResp from 14:13:46:cd:04:0e (capab=0x1011 status=0 aid=2)
[281620.806202] wlp2s0: associated
[281621.191779] IPv6: ADDRCONF(NETDEV_CHANGE): wlp2s0: link becomes ready
[282079.078069] wlp2s0: deauthenticating from 14:13:46:cd:04:0e by local choice (Reason: 3=DEAUTH_LEAVING)
[282079.359548] ath10k_pci 0000:02:00.0: pci irq msi oper_irq_mode 2 irq_mode 0 reset_mode 0
[282079.639141] ath10k_pci 0000:02:00.0: firmware: failed to load ath10k/pre-cal-pci-0000:02:00.0.bin (-2)
[282079.639176] ath10k_pci 0000:02:00.0: firmware: failed to load ath10k/cal-pci-0000:02:00.0.bin (-2)
[282079.639721] ath10k_pci 0000:02:00.0: firmware: direct-loading firmware ath10k/QCA6174/hw3.0/firmware-6.bin
[282079.639733] ath10k_pci 0000:02:00.0: qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff sub 1a56:143a
[282079.639742] ath10k_pci 0000:02:00.0: kconfig debug 0 debugfs 0 tracing 0 dfs 0 testmode 0
[282079.641258] ath10k_pci 0000:02:00.0: firmware ver WLAN.RM.4.4.1-00288- api 6 features wowlan,ignore-otp,mfp crc32 bf907c7c
[282079.706404] ath10k_pci 0000:02:00.0: firmware: direct-loading firmware ath10k/QCA6174/hw3.0/board-2.bin
[282079.706762] ath10k_pci 0000:02:00.0: board_file api 2 bmi_id N/A crc32 e57aadc7
[282079.798756] ath10k_pci 0000:02:00.0: htt-ver 3.87 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
[282079.889387] ath: EEPROM regdomain: 0x6c
[282079.889393] ath: EEPROM indicates we should expect a direct regpair map
[282079.889396] ath: Country alpha2 being used: 00
[282079.889398] ath: Regpair used: 0x6c
[282079.893938] ath10k_pci 0000:02:00.0 wlp2s0: renamed from wlan0
[282090.395764] wlp2s0: authenticate with 14:13:46:cd:04:0e
[282090.452400] wlp2s0: send auth to 14:13:46:cd:04:0e (try 1/3)
[282090.454887] wlp2s0: authenticated
[282090.462384] wlp2s0: associate with 14:13:46:cd:04:0e (try 1/3)
[282090.560821] wlp2s0: RX AssocResp from 14:13:46:cd:04:0e (capab=0x1011 status=0 aid=2)
[282090.564525] wlp2s0: associated
[282092.202837] IPv6: ADDRCONF(NETDEV_CHANGE): wlp2s0: link becomes ready
[282384.479914] wlp2s0: deauthenticating from 14:13:46:cd:04:0e by local choice (Reason: 3=DEAUTH_LEAVING)
[282384.773329] ath10k_pci 0000:02:00.0: pci irq msi oper_irq_mode 2 irq_mode 0 reset_mode 0
[282385.047740] ath10k_pci 0000:02:00.0: firmware: failed to load ath10k/pre-cal-pci-0000:02:00.0.bin (-2)
[282385.047760] ath10k_pci 0000:02:00.0: firmware: failed to load ath10k/cal-pci-0000:02:00.0.bin (-2)
[282385.048159] ath10k_pci 0000:02:00.0: firmware: direct-loading firmware ath10k/QCA6174/hw3.0/firmware-6.bin
[282385.048165] ath10k_pci 0000:02:00.0: qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff sub 1a56:143a
[282385.048170] ath10k_pci 0000:02:00.0: kconfig debug 0 debugfs 0 tracing 0 dfs 0 testmode 0
[282385.048971] ath10k_pci 0000:02:00.0: firmware ver WLAN.RM.4.4.1-00288- api 6 features wowlan,ignore-otp,mfp crc32 bf907c7c
[282385.113919] ath10k_pci 0000:02:00.0: firmware: direct-loading firmware ath10k/QCA6174/hw3.0/board-2.bin
[282385.114259] ath10k_pci 0000:02:00.0: board_file api 2 bmi_id N/A crc32 e57aadc7
[282385.207048] ath10k_pci 0000:02:00.0: htt-ver 3.87 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
[282385.288483] ath: EEPROM regdomain: 0x6c
[282385.288487] ath: EEPROM indicates we should expect a direct regpair map
[282385.288489] ath: Country alpha2 being used: 00
[282385.288491] ath: Regpair used: 0x6c
[282385.292005] ath10k_pci 0000:02:00.0 wlp2s0: renamed from wlan0
[282385.931302] ath10k_pci 0000:02:00.0: firmware crashed! (guid 5b754274-67d8-4618-bdd1-5df33cdc0c63)
[282385.931315] ath10k_pci 0000:02:00.0: qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff sub 1a56:143a
[282385.931317] ath10k_pci 0000:02:00.0: kconfig debug 0 debugfs 0 tracing 0 dfs 0 testmode 0
[282385.931834] ath10k_pci 0000:02:00.0: firmware ver WLAN.RM.4.4.1-00288- api 6 features wowlan,ignore-otp,mfp crc32 bf907c7c
[282385.932187] ath10k_pci 0000:02:00.0: board_file api 2 bmi_id N/A crc32 e57aadc7
[282385.932189] ath10k_pci 0000:02:00.0: htt-ver 3.87 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
[282385.943485] ath10k_pci 0000:02:00.0: failed to get memcpy hi address for firmware address 4: -16
[282385.943487] ath10k_pci 0000:02:00.0: failed to read firmware dump area: -16
[282385.943489] ath10k_pci 0000:02:00.0: Copy Engine register dump:
[282385.943494] ath10k_pci 0000:02:00.0: [00]: 0x00034400 4294967295 4294967295 4294967295 4294967295
[282385.943500] ath10k_pci 0000:02:00.0: [01]: 0x00034800 4294967295 4294967295 4294967295 4294967295
[282385.943504] ath10k_pci 0000:02:00.0: [02]: 0x00034c00 4294967295 4294967295 4294967295 4294967295
[282385.943508] ath10k_pci 0000:02:00.0: [03]: 0x00035000 4294967295 4294967295 4294967295 4294967295
[282385.943513] ath10k_pci 0000:02:00.0: [04]: 0x00035400 4294967295 4294967295 4294967295 4294967295
[282385.943517] ath10k_pci 0000:02:00.0: [05]: 0x00035800 4294967295 4294967295 4294967295 4294967295
[282385.943522] ath10k_pci 0000:02:00.0: [06]: 0x00035c00 4294967295 4294967295 4294967295 4294967295
[282385.943526] ath10k_pci 0000:02:00.0: [07]: 0x00036000 4294967295 4294967295 4294967295 4294967295
[282386.931328] ath10k_pci 0000:02:00.0: failed to receive control response completion, polling..
[282386.962046] ath10k_pci 0000:02:00.0: failed to wake target for write32 of 0x0000001f at 0x00034430: -110
[282386.992605] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x00034444: -110
[282387.023916] ath10k_pci 0000:02:00.0: failed to wake target for write32 of 0x0000001f at 0x00034830: -110
[282387.055716] ath10k_pci 0000:02:00.0: failed to wake target for write32 of 0x0000001f at 0x00035430: -110
[282387.087534] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x00035444: -110
[282387.119361] ath10k_pci 0000:02:00.0: failed to wake target for write32 of 0x0000001f at 0x00034c30: -110
[282387.151176] ath10k_pci 0000:02:00.0: failed to wake target for write32 of 0x0000001f at 0x00035030: -110
[282387.182968] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x00035044: -110
[282388.367252] ath10k_pci 0000:02:00.0: ctl_resp never came in (-110)
[282388.367271] ath10k_pci 0000:02:00.0: failed to connect to HTC: -110
[282390.962906] ath10k_warn: 86 callbacks suppressed
[282390.962911] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003582c: -110
[282390.994728] ath10k_pci 0000:02:00.0: failed to wake target for write32 of 0xffffffe1 at 0x0003582c: -110
[282391.026551] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x00035c2c: -110
[282391.058251] ath10k_pci 0000:02:00.0: failed to wake target for write32 of 0xfffffffe at 0x00035c2c: -110
[282391.088778] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x00035c34: -110
[282391.120041] ath10k_pci 0000:02:00.0: failed to wake target for write32 of 0xfffff81f at 0x00035c34: -110
[282391.151868] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x00035c2c: -110
[282391.183671] ath10k_pci 0000:02:00.0: failed to wake target for write32 of 0xffffffe1 at 0x00035c2c: -110
[282391.215513] ath10k_pci 0000:02:00.0: failed to wake target for write32 of 0x00000000 at 0x0003a008: -110
[282391.247311] ath10k_pci 0000:02:00.0: failed to wake target for write32 of 0x0007fc00 at 0x0003a014: -110
[282395.977412] ath10k_warn: 147 callbacks suppressed
[282395.977416] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003a028: -110
[282396.009231] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003a028: -110
[282396.041038] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003a028: -110
[282396.072838] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003a028: -110
[282396.104633] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003a028: -110
[282396.136430] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003a028: -110
[282396.168225] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003a028: -110
[282396.199042] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003a028: -110
[282396.229883] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003a028: -110
[282396.261679] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003a028: -110
[282397.310748] ath10k_pci 0000:02:00.0: failed to read device register, device is gone
[282401.005236] ath10k_warn: 148 callbacks suppressed
[282401.005241] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003a028: -110
[282401.037043] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003a028: -110
[282401.067606] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003a028: -110
[282401.098598] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003a028: -110
[282401.130400] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003a028: -110
[282401.162201] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003a028: -110
[282401.193998] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003a028: -110
[282401.225805] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003a028: -110
[282401.257609] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003a028: -110
[282401.289416] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003a028: -110
[282403.227514] ath10k_pci 0000:02:00.0: failed to read device register, device is gone
[282403.228355] ath10k_pci 0000:02:00.0: Could not init core: -110
[282406.011236] ath10k_warn: 148 callbacks suppressed
[282406.011240] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003a028: -110
[282406.042787] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003a028: -110
[282406.073306] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003a028: -110
[282406.104398] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003a028: -110
[282406.136197] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003a028: -110
[282406.167658] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003a028: -110
[282406.198175] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003a028: -110
[282406.229515] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003a028: -110
[282406.261305] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003a028: -110
[282406.293103] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003a028: -110
[282406.547428] ath10k_pci 0000:02:00.0: failed to read device register, device is gone
[282406.642805] ath10k_pci 0000:02:00.0: failed to reset chip: -5
[282406.642809] ath10k_pci 0000:02:00.0: Could not init hif: -5
[282406.642845] ath10k_pci 0000:02:00.0: firmware crashed! (guid 99b0a9fd-cc30-437a-87b7-67635f6f3626)
[282406.642850] ath10k_pci 0000:02:00.0: qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff sub 1a56:143a
[282406.642852] ath10k_pci 0000:02:00.0: kconfig debug 0 debugfs 0 tracing 0 dfs 0 testmode 0
[282406.643294] ath10k_pci 0000:02:00.0: firmware ver WLAN.RM.4.4.1-00288- api 6 features wowlan,ignore-otp,mfp crc32 bf907c7c
[282406.643664] ath10k_pci 0000:02:00.0: board_file api 2 bmi_id N/A crc32 e57aadc7
[282406.643666] ath10k_pci 0000:02:00.0: htt-ver 3.87 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
[282410.198550] ath10k_pci 0000:02:00.0: failed to read device register, device is gone
[282410.389174] ath10k_pci 0000:02:00.0: failed to reset chip: -5
[282410.389179] ath10k_pci 0000:02:00.0: Could not init hif: -5
[282411.024035] ath10k_warn: 152 callbacks suppressed
[282411.024040] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x00036044: -110
[282411.055890] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x00036044: -110
[282411.087728] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x00036044: -110
[282411.119591] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x00036044: -110
[282411.151455] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x00036044: -110
[282411.183349] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x00036044: -110
[282411.215200] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x00036044: -110
[282411.247059] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x00036044: -110
[282411.278924] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x00036044: -110
[282411.310766] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x00036044: -110
[282414.999032] ath10k_pci 0000:02:00.0: failed to read firmware dump area: -16
[282414.999037] ath10k_pci 0000:02:00.0: Copy Engine register dump:
[282415.126162] ath10k_pci 0000:02:00.0: [00]: 0x00034400 4294967295 4294967295 4294967295 4294967295
[282415.253354] ath10k_pci 0000:02:00.0: [01]: 0x00034800 4294967295 4294967295 4294967295 4294967295
[282415.380522] ath10k_pci 0000:02:00.0: [02]: 0x00034c00 4294967295 4294967295 4294967295 4294967295
[282415.505751] ath10k_pci 0000:02:00.0: [03]: 0x00035000 4294967295 4294967295 4294967295 4294967295
[282415.632998] ath10k_pci 0000:02:00.0: [04]: 0x00035400 4294967295 4294967295 4294967295 4294967295
[282415.760304] ath10k_pci 0000:02:00.0: [05]: 0x00035800 4294967295 4294967295 4294967295 4294967295
[282415.887472] ath10k_pci 0000:02:00.0: [06]: 0x00035c00 4294967295 4294967295 4294967295 4294967295
[282416.014601] ath10k_pci 0000:02:00.0: [07]: 0x00036000 4294967295 4294967295 4294967295 4294967295
[282416.014664] ath10k_pci 0000:02:00.0: firmware crashed! (guid db227ac9-8350-483e-818f-7ffaedf990a3)
[282416.014667] ath10k_pci 0000:02:00.0: qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff sub 1a56:143a
[282416.014669] ath10k_pci 0000:02:00.0: kconfig debug 0 debugfs 0 tracing 0 dfs 0 testmode 0
[282416.015031] ath10k_pci 0000:02:00.0: firmware ver WLAN.RM.4.4.1-00288- api 6 features wowlan,ignore-otp,mfp crc32 bf907c7c
[282416.015376] ath10k_pci 0000:02:00.0: board_file api 2 bmi_id N/A crc32 e57aadc7
[282416.015377] ath10k_pci 0000:02:00.0: htt-ver 3.87 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
[282416.047171] ath10k_warn: 150 callbacks suppressed
[282416.047174] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003a000: -110
[282416.047179] ath10k_pci 0000:02:00.0: failed to get memcpy hi address for firmware address 4: -28
[282416.047180] ath10k_pci 0000:02:00.0: failed to read firmware dump area: -28
[282416.047182] ath10k_pci 0000:02:00.0: Copy Engine register dump:
[282416.078996] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003443c: -110
[282416.110814] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x00034444: -110
[282416.142606] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x00034440: -110
[282416.174396] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x00034448: -110
[282416.174400] ath10k_pci 0000:02:00.0: [00]: 0x00034400 4294967295 4294967295 4294967295 4294967295
[282416.206206] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003483c: -110
[282416.237997] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x00034844: -110
[282416.269804] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x00034840: -110
[282416.301588] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x00034848: -110
[282416.301592] ath10k_pci 0000:02:00.0: [01]: 0x00034800 4294967295 4294967295 4294967295 4294967295
[282416.428762] ath10k_pci 0000:02:00.0: [02]: 0x00034c00 4294967295 4294967295 4294967295 4294967295
[282416.555967] ath10k_pci 0000:02:00.0: [03]: 0x00035000 4294967295 4294967295 4294967295 4294967295
[282416.682694] ath10k_pci 0000:02:00.0: [04]: 0x00035400 4294967295 4294967295 4294967295 4294967295
[282416.809203] ath10k_pci 0000:02:00.0: [05]: 0x00035800 4294967295 4294967295 4294967295 4294967295
[282416.936349] ath10k_pci 0000:02:00.0: [06]: 0x00035c00 4294967295 4294967295 4294967295 4294967295
[282417.063519] ath10k_pci 0000:02:00.0: [07]: 0x00036000 4294967295 4294967295 4294967295 4294967295
[282419.806419] ath10k_pci 0000:02:00.0: can't change power state from D3cold to D0 (config space inaccessible)
[282419.838452] ath10k_pci 0000:02:00.0: failed to wake target for write32 of 0x00000000 at 0x00034400: -110
[282419.870289] ath10k_pci 0000:02:00.0: failed to wake target for write32 of 0x00000000 at 0x00034404: -110
[282419.902113] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x00034410: -110
[282419.933915] ath10k_pci 0000:02:00.0: failed to wake target for write32 of 0xffff0000 at 0x00034410: -110
[282419.965707] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003444c: -110
[282419.997501] ath10k_pci 0000:02:00.0: failed to wake target for write32 of 0xffff0000 at 0x0003444c: -110
[282420.029310] ath10k_pci 0000:02:00.0: failed to wake target for write32 of 0x00000000 at 0x00034408: -110
[282420.061113] ath10k_pci 0000:02:00.0: failed to wake target for write32 of 0x00000000 at 0x0003440c: -110
[282420.092915] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x00034450: -110
[282420.124728] ath10k_pci 0000:02:00.0: failed to wake target for write32 of 0xffff0000 at 0x00034450: -110
[282423.874886] ath10k_pci 0000:02:00.0: pci irq legacy oper_irq_mode 1 irq_mode 0 reset_mode 0
[282424.849434] ath10k_warn: 146 callbacks suppressed
[282424.849439] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003a028: -110
[282424.880033] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003a028: -110
[282424.911104] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003a028: -110
[282424.942908] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003a028: -110
[282424.974761] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003a028: -110
[282425.006560] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003a028: -110
[282425.038436] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003a028: -110
[282425.070359] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003a028: -110
[282425.102193] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003a028: -110
[282425.134018] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003a028: -110
[282427.197843] ath10k_pci 0000:02:00.0: failed to read device register, device is gone
[282427.197849] ath10k_pci 0000:02:00.0: failed to reset chip: -5
[282429.763489] ath10k_pci: probe of 0000:02:00.0 failed with error -5
[282546.782634] ath10k_pci 0000:02:00.0: can't change power state from D3cold to D0 (config space inaccessible)
[282546.814579] ath10k_pci 0000:02:00.0: failed to wake target for write32 of 0x00000000 at 0x00034400: -110
[282546.846383] ath10k_pci 0000:02:00.0: failed to wake target for write32 of 0x00000000 at 0x00034404: -110
[282546.878186] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x00034410: -110
[282546.909983] ath10k_pci 0000:02:00.0: failed to wake target for write32 of 0xffff0000 at 0x00034410: -110
[282546.941823] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003444c: -110
[282546.973658] ath10k_pci 0000:02:00.0: failed to wake target for write32 of 0xffff0000 at 0x0003444c: -110
[282547.005457] ath10k_pci 0000:02:00.0: failed to wake target for write32 of 0x00000000 at 0x00034408: -110
[282547.037255] ath10k_pci 0000:02:00.0: failed to wake target for write32 of 0x00000000 at 0x0003440c: -110
[282547.069057] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x00034450: -110
[282547.100856] ath10k_pci 0000:02:00.0: failed to wake target for write32 of 0xffff0000 at 0x00034450: -110
[282550.840974] ath10k_pci 0000:02:00.0: pci irq legacy oper_irq_mode 1 irq_mode 0 reset_mode 0
[282551.817581] ath10k_warn: 146 callbacks suppressed
[282551.817585] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003a028: -110
[282551.848309] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003a028: -110
[282551.879314] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003a028: -110
[282551.911170] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003a028: -110
[282551.943044] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003a028: -110
[282551.974907] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003a028: -110
[282552.006768] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003a028: -110
[282552.038657] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003a028: -110
[282552.070508] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003a028: -110
[282552.101393] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003a028: -110
[282554.165143] ath10k_pci 0000:02:00.0: failed to read device register, device is gone
[282554.165149] ath10k_pci 0000:02:00.0: failed to reset chip: -5
[282556.734014] ath10k_pci: probe of 0000:02:00.0 failed with error -5

-- 
Martin Michlmayr
https://www.cyrius.com/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
