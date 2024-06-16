Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 579CCC27C53
	for <ath10k@archiver.kernel.org>; Sun, 16 Jun 2024 13:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/0wZfPI4oPePZLNgKpifruFZHJZT8e4jpsh4Ca8qO94=; b=bwHG5sG7O7hUgs9odwYhz0xZ6y
	SiOtFzFjjR3sJQURDXqdUFVIApGWHgs2hoqCz6QAdC5ZAUqrdjP7tKjSj0dkzHRKkoCMc+F3TLKIE
	DTjGZH8Fy9N9oepuAMAcYIYCuvLfWBj8hDCkr0T2UTyUgQ3MFNy6o8oRs2UWBUOiOhp8KMzCOc7P1
	OCUeizmYxrwoQ7zr2l5LPx4Q8dIKriJao6QX3AdB78ipze7LlWpDA5uglbAN5xbfhxl/puLNJfQQP
	BcW+nGrUoObvuW29byLb3EPY/3lZc8G85QfK75+0xuPCqHVf677GKATx8GmeXAR74ca+SfRD5HcbA
	CU2xj2wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIpf4-00000007ZVl-0Tb8;
	Sun, 16 Jun 2024 13:11:10 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIpez-00000007ZUj-1i7F
	for ath10k@lists.infradead.org;
	Sun, 16 Jun 2024 13:11:08 +0000
Received: from [172.16.184.163] (i68973E31.versanet.de [104.151.62.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 743FC61E5FE01;
	Sun, 16 Jun 2024 15:10:34 +0200 (CEST)
Message-ID: <fba24cd3-4a1e-4072-8585-8402272788ff@molgen.mpg.de>
Date: Sun, 16 Jun 2024 15:10:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>
From: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: invalid vht params rate 1920 100kbps nss 2 mcs 9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_061105_620411_C80C6297 
X-CRM114-Status: UNSURE (   3.03  )
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


Linux 6.10-rc3 (commit a3e18a540541) logged the warning below when 
connecting to a public WiFi:

     ath10k_pci 0000:3a:00.0: invalid vht params rate 1920 100kbps nss 2 
mcs 9


Kind regards,

Paul


```
Jun 16 11:38:15 abreu kernel: Linux version 
6.10.0-rc3-00174-ga3e18a540541 (build@bohemianrhapsody.molgen.mpg.de) 
(gcc (Debian 13.2.0-25) 13.2.0, GNU ld (GNU Binutils for Debian) 2.42) 
#196 SMP PREEMPT_DYNAMIC Sun Jun 16 06:02:29 CEST 2024
[…]
Jun 16 11:38:15 abreu kernel: DMI: Dell Inc. XPS 13 9360/0596KF, BIOS 
2.21.0 06/02/2022
[…]
Jun 16 11:38:33 abreu kernel: ath10k_pci 0000:3a:00.0: enabling device 
(0000 -> 0002)
Jun 16 11:38:33 abreu kernel: ath10k_pci 0000:3a:00.0: pci irq msi 
oper_irq_mode 2 irq_mode 0 reset_mode 0
Jun 16 11:38:34 abreu kernel: ath10k_pci 0000:3a:00.0: qca6174 hw3.2 
target 0x05030000 chip_id 0x00340aff sub 1a56:1535
Jun 16 11:38:34 abreu kernel: ath10k_pci 0000:3a:00.0: kconfig debug 0 
debugfs 0 tracing 0 dfs 0 testmode 0
Jun 16 11:38:34 abreu kernel: ath10k_pci 0000:3a:00.0: firmware ver 
WLAN.RM.4.4.1-00288- api 6 features wowlan,ignore-otp,mfp crc32 bf907c7c
Jun 16 11:38:34 abreu kernel: ath10k_pci 0000:3a:00.0: board_file api 2 
bmi_id N/A crc32 d2863f91
Jun 16 11:38:34 abreu kernel: ath10k_pci 0000:3a:00.0: htt-ver 3.87 
wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
Jun 16 11:38:34 abreu kernel: ath: EEPROM regdomain: 0x6c
Jun 16 11:38:34 abreu kernel: ath: EEPROM indicates we should expect a 
direct regpair map
Jun 16 11:38:34 abreu kernel: ath: Country alpha2 being used: 00
Jun 16 11:38:34 abreu kernel: ath: Regpair used: 0x6c
[…]
Jun 16 11:39:20 abreu kernel: wlp58s0: authenticate with 
70:18:a7:0e:f7:cb (local address=9c:b6:d0:d1:6a:b1)
Jun 16 11:39:20 abreu kernel: wlp58s0: send auth to 70:18:a7:0e:f7:cb 
(try 1/3)
Jun 16 11:39:20 abreu kernel: wlp58s0: send auth to 70:18:a7:0e:f7:cb 
(try 2/3)
Jun 16 11:39:20 abreu kernel: wlp58s0: send auth to 70:18:a7:0e:f7:cb 
(try 3/3)
Jun 16 11:39:20 abreu kernel: wlp58s0: authentication with 
70:18:a7:0e:f7:cb timed out
Jun 16 11:39:22 abreu kernel: wlp58s0: authenticate with 
4c:bc:48:39:16:ab (local address=9c:b6:d0:d1:6a:b1)
Jun 16 11:39:22 abreu kernel: wlp58s0: send auth to 4c:bc:48:39:16:ab 
(try 1/3)
Jun 16 11:39:22 abreu kernel: wlp58s0: send auth to 4c:bc:48:39:16:ab 
(try 2/3)
Jun 16 11:39:22 abreu kernel: wlp58s0: send auth to 4c:bc:48:39:16:ab 
(try 3/3)
Jun 16 11:39:22 abreu kernel: wlp58s0: authentication with 
4c:bc:48:39:16:ab timed out
Jun 16 11:39:24 abreu kernel: wlp58s0: authenticate with 
4c:bc:48:38:d8:4b (local address=9c:b6:d0:d1:6a:b1)
Jun 16 11:39:24 abreu kernel: wlp58s0: send auth to 4c:bc:48:38:d8:4b 
(try 1/3)
Jun 16 11:39:24 abreu kernel: wlp58s0: authenticated
Jun 16 11:39:24 abreu kernel: wlp58s0: associate with 4c:bc:48:38:d8:4b 
(try 1/3)
Jun 16 11:39:24 abreu kernel: wlp58s0: RX AssocResp from 
4c:bc:48:38:d8:4b (capab=0x1101 status=0 aid=30)
Jun 16 11:39:24 abreu kernel: wlp58s0: associated
Jun 16 11:39:24 abreu kernel: wlp58s0: Limiting TX power to 20 (23 - 3) 
dBm as advertised by 4c:bc:48:38:d8:4b
Jun 16 11:39:50 abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht 
params rate 1920 100kbps nss 2 mcs 9
Jun 16 11:39:56 abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht 
params rate 1920 100kbps nss 2 mcs 9
Jun 16 11:40:02 abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht 
params rate 1920 100kbps nss 2 mcs 9
Jun 16 11:40:08 abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht 
params rate 1920 100kbps nss 2 mcs 9
Jun 16 11:40:20 abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht 
params rate 1920 100kbps nss 2 mcs 9
Jun 16 11:40:26 abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht 
params rate 1920 100kbps nss 2 mcs 9
Jun 16 11:40:32 abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht 
params rate 1920 100kbps nss 2 mcs 9
Jun 16 11:40:38 abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht 
params rate 1920 100kbps nss 2 mcs 9
Jun 16 11:40:43 abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht 
params rate 1920 100kbps nss 2 mcs 9
Jun 16 11:40:49 abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht 
params rate 1920 100kbps nss 2 mcs 9
Jun 16 11:41:01 abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht 
params rate 1920 100kbps nss 2 mcs 9
Jun 16 11:41:13 abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht 
params rate 1920 100kbps nss 2 mcs 9
Jun 16 11:41:19 abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht 
params rate 1920 100kbps nss 2 mcs 9
Jun 16 11:41:21 abreu kernel: wlp58s0: deauthenticating from 
4c:bc:48:38:d8:4b by local choice (Reason: 3=DEAUTH_LEAVING)

