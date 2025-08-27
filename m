Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3487CA0EFF
	for <ath10k@archiver.kernel.org>; Wed, 27 Aug 2025 09:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m7NXqtxuDhqZAxCxLTvgRjQGIB3yqYsDbec/cnWVk2c=; b=1Kbq66T3NS/sc79jrqw7jZZmkg
	7fs/t90OJYlfiAB+cAnWmita6NUVgDLhPZH8IkcYv5dikqcZwDGtY22p5iFmN9Mvic6E9GpXriyBt
	aIHikEKL3HoeMX2GEq9dYVEE+gD7c7CIoc3FkU6XoueNxGpfsF8G8A0WLk4/M6D9k5joCsg0nQwqp
	ul+SNnu9lFnZ4cuklALDMM4sHCKVXp5yhnpT5fuB//W/mM7bcUMvxeW7zbJpn0dhGsG0yVPw8azry
	unVVgBG0z06q7v04+WVyl3ImvyvaAew9AX5OOLfG+VV9PB4sRdyvnU4JygjufWjdIzplZh0/F/MHF
	WTXP+91Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urC2c-0000000Elji-1OeV;
	Wed, 27 Aug 2025 09:02:02 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urC2Z-0000000Elis-2cH9
	for ath10k@lists.infradead.org;
	Wed, 27 Aug 2025 09:02:01 +0000
Received: from [192.168.2.202] (p5b13a549.dip0.t-ipconnect.de [91.19.165.73])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id A622660288271;
	Wed, 27 Aug 2025 11:01:42 +0200 (CEST)
Message-ID: <52be19a8-2ae5-4a8e-bcdc-4ff646def208@molgen.mpg.de>
Date: Wed, 27 Aug 2025 11:01:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jeff Johnson <jjohnson@kernel.org>,
 Baochen Qiang <quic_bqiang@quicinc.com>
Cc: =?UTF-8?Q?Andrea_Pierr=C3=A9?= <andrea_pierre@brown.edu>,
 James Prestwood <prestwoj@gmail.com>, linux-wireless@vger.kernel.org,
 ath10k@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>
From: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: qca6174: wmi command 90124 timeout, restarting hardware/failed to
 receive initialized event from target: 00000000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_020159_952433_40CB5E15 
X-CRM114-Status: UNSURE (   5.93  )
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

Dear Linux folks,


Yesterday, on my Intel Kaby Lake laptop Dell XPS 13 9360, the Wi-Fi 
stopped working again. Looking at the logs, the driver claimed, that the 
reset/recovery was successful, but – although NetworkManager showed an 
established Wi-Fi connection – it didn’t work. I worked around it by 
disabling Wi-Fi over the function keys (rfkill), and enabling it again. 
Then it started working. This time no firmware crash was recorded 
beforehand.

```
[    0.000000] Linux version 6.17.0-rc3 
(build@bohemianrhapsody.molgen.mpg.de) (gcc (Debian 14.3.0-5) 14.3.0, 
GNU ld (GNU Binutils for Debian) 2.45) #122 SMP PREEMPT_DYNAMIC Mon Aug 
25 08:27:23 CEST 2025
[…]
[   46.308531] ath10k_pci 0000:3a:00.0: qca6174 hw3.2 target 0x05030000 
chip_id 0x00340aff sub 1a56:1535
[   46.308538] ath10k_pci 0000:3a:00.0: kconfig debug 0 debugfs 0 
tracing 0 dfs 0 testmode 0
[   46.308637] ath10k_pci 0000:3a:00.0: firmware ver 
WLAN.RM.4.4.1-00309- api 6 features wowlan,ignore-otp,mfp crc32 0793bcf2
[   46.387972] ath10k_pci 0000:3a:00.0: board_file api 2 bmi_id N/A 
crc32 d2863f91
[…]
[33027.934900] wlp58s0: Limiting TX power to 20 (20 - 0) dBm as 
advertised by 1e:49:bc:44:95:52
[33312.525898] ath10k_pci 0000:3a:00.0: timed out waiting peer stats info
[33318.669751] ath10k_pci 0000:3a:00.0: timed out waiting peer stats info
[33324.561674] ath10k_pci 0000:3a:00.0: wmi command 90124 timeout, 
restarting hardware
[33324.561705] ath10k_pci 0000:3a:00.0: could not request peer stats 
info: -11
[33327.600837] ath10k_pci 0000:3a:00.0: failed to receive initialized 
event from target: 00000000
[33330.616356] ath10k_pci 0000:3a:00.0: failed to receive initialized 
event from target: 00000000
[33330.616370] ath10k_pci 0000:3a:00.0: failed to wait for target init: -110
[33330.618779] ieee80211 phy0: Hardware restart was requested
[33330.618923] ath10k_pci 0000:3a:00.0: failed to start hw scan: -108
[33330.942314] ath10k_pci 0000:3a:00.0: device successfully recovered
[33441.598552] wlp58s0: deauthenticating from 1e:49:bc:44:95:52 by local 
choice (Reason: 3=DEAUTH_LEAVING)

Aug 26 17:56:26 abreu wpa_supplicant[683]: rfkill: WLAN soft blocked
Aug 26 17:56:26 abreu wpa_supplicant[683]: rfkill: WLAN soft blocked

[33448.628415] wlp58s0: authenticate with 1e:49:bc:44:95:52 (local 
address=9c:b6:d0:d1:6a:b1)
[33448.628425] wlp58s0: send auth to 1e:49:bc:44:95:52 (try 1/3)
[33448.744099] wlp58s0: authenticate with 1e:49:bc:44:95:52 (local 
address=9c:b6:d0:d1:6a:b1)
[33448.744108] wlp58s0: send auth to 1e:49:bc:44:95:52 (try 1/3)
[33448.783610] wlp58s0: authenticated
[33448.787382] wlp58s0: associate with 1e:49:bc:44:95:52 (try 1/3)
[33448.793745] wlp58s0: RX AssocResp from 1e:49:bc:44:95:52 
(capab=0x1431 status=0 aid=132)
[33448.797057] wlp58s0: associated
[33448.982505] wlp58s0: Limiting TX power to 20 (20 - 0) dBm as 
advertised by 1e:49:bc:44:95:52
```

Looking through the logs since November 26th, 2024, this has happened in 
the past. Sometimes without the error `failed to receive initialized 
event from target`.

```
Mär 20 07:52:48 abreu kernel: Linux version 
6.14.0-rc7-00074-ga7f2e10ecd8f (build@bohemianrhapsody.molgen.mpg.de) 
(gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44) 
#110 SMP PREEMPT_DYNAMIC Thu Mar 20 00:43:24 CET 2025
[…]
Mär 21 10:12:04 abreu kernel: ath10k_pci 0000:3a:00.0: timed out waiting 
peer stats info
Mär 21 10:12:10 abreu kernel: ath10k_pci 0000:3a:00.0: timed out waiting 
peer stats info
Mär 21 10:12:16 abreu kernel: ath10k_pci 0000:3a:00.0: wmi command 90124 
timeout, restarting hardware
Mär 21 10:12:16 abreu kernel: ath10k_pci 0000:3a:00.0: could not request 
peer stats info: -11
Mär 21 10:12:19 abreu kernel: ath10k_pci 0000:3a:00.0: failed to receive 
initialized event from target: 00000000
Mär 21 10:12:22 abreu kernel: ath10k_pci 0000:3a:00.0: failed to receive 
initialized event from target: 00000000
Mär 21 10:12:22 abreu kernel: ath10k_pci 0000:3a:00.0: failed to wait 
for target init: -110
Mär 21 10:12:22 abreu kernel: ieee80211 phy0: Hardware restart was requested
Mär 21 10:12:23 abreu kernel: ath10k_pci 0000:3a:00.0: device 
successfully recovered
Mär 21 10:12:23 abreu kernel: wlp58s0: deauthenticated from 
5c:b1:2e:5f:19:00 (Reason: 7=CLASS3_FRAME_FROM_NONASSOC_STA)
```

```
Jun 05 08:46:30 abreu kernel: Linux version 6.15.0-11980-g16b70698aa3a 
(build@bohemianrhapsody.molgen.mpg.de) (gcc (Debian 14.2.0-19) 14.2.0, 
GNU ld (GNU Binutils for Debian) 2.44) #62 SMP PREEMPT_DYNAMIC Wed Jun 
4 23:51:52 CEST 2025
[…]
Jun 05 12:31:50 abreu kernel: ath10k_pci 0000:3a:00.0: timed out waiting 
peer stats info
Jun 05 12:31:56 abreu kernel: ath10k_pci 0000:3a:00.0: timed out waiting 
peer stats info
Jun 05 12:32:02 abreu kernel: ath10k_pci 0000:3a:00.0: wmi command 90124 
timeout, restarting hardware
Jun 05 12:32:02 abreu kernel: ath10k_pci 0000:3a:00.0: could not request 
peer stats info: -11
Jun 05 12:32:05 abreu kernel: ath10k_pci 0000:3a:00.0: failed to receive 
initialized event from target: 00000000
Jun 05 12:32:08 abreu kernel: ath10k_pci 0000:3a:00.0: failed to receive 
initialized event from target: 00000000
Jun 05 12:32:08 abreu kernel: ath10k_pci 0000:3a:00.0: failed to wait 
for target init: -110
Jun 05 12:32:08 abreu kernel: ieee80211 phy0: Hardware restart was requested
Jun 05 12:32:08 abreu kernel: ath10k_pci 0000:3a:00.0: device 
successfully recovered
```

```
Jun 30 15:19:54 abreu kernel: Linux version 
6.16.0-rc4-00004-g30643e084e03 (build@bohemianrhapsody.molgen.mpg.de) 
(gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44) 
#82 SMP PREEMPT_DYNAMIC Mon Jun 30 11:01:16 CEST 2025
[…]
Jun 30 15:31:48 abreu kernel: ath10k_pci 0000:3a:00.0: timed out waiting 
peer stats info
Jun 30 15:31:54 abreu kernel: ath10k_pci 0000:3a:00.0: timed out waiting 
peer stats info
Jun 30 15:32:00 abreu kernel: ath10k_pci 0000:3a:00.0: wmi command 90124 
timeout, restarting hardware
Jun 30 15:32:00 abreu kernel: ath10k_pci 0000:3a:00.0: could not request 
peer stats info: -11
Jun 30 15:32:00 abreu kernel: ieee80211 phy0: Hardware restart was requested
Jun 30 15:32:00 abreu kernel: ath10k_pci 0000:3a:00.0: device 
successfully recovered
```

```
Aug 14 06:36:18 abreu kernel: Linux version 
6.17.0-rc1-00016-g8742b2d8935f (build@bohemianrhapsody.molgen.mpg.de) 
(gcc (Debian 14.3.0-5) 14.3.0, GNU ld (GNU Binutils for Debian) 2.45) 
#112 SMP PREEMPT_DYNAMIC Wed Aug 13 14:29:07 CEST 2025
[…]
Aug 15 13:59:05 abreu kernel: ath10k_pci 0000:3a:00.0: timed out waiting 
peer stats info
Aug 15 13:59:11 abreu kernel: ath10k_pci 0000:3a:00.0: timed out waiting 
peer stats info
Aug 15 13:59:17 abreu kernel: ath10k_pci 0000:3a:00.0: wmi command 90124 
timeout, restarting hardware
Aug 15 13:59:17 abreu kernel: ath10k_pci 0000:3a:00.0: could not request 
peer stats info: -11
Aug 15 13:59:17 abreu kernel: ieee80211 phy0: Hardware restart was requested
Aug 15 13:59:18 abreu kernel: ath10k_pci 0000:3a:00.0: device 
successfully recovered
Aug 15 13:59:29 abreu kernel: wlp58s0: deauthenticated from 
98:9d:5d:4b:e4:40 (Reason: 7=CLASS3_FRAME_FROM_NONASSOC_STA)
```

James, Andrea (added because of report in 2024 [1]), do you see these 
things in your logs? Should you use systemd-journald you could run 
`journalctl -g 'failed to receive initialized event from target:'.`

Jeff, Baochen, is Qualcomm aware of such issues? Do I need to run the 
driver always in full debug mode to get you more information for debugging?


Kind regards,

Paul


[1]: 
https://lore.kernel.org/all/4ade6459-bfe3-4180-8586-9e4d7b8e5825@brown.edu/

