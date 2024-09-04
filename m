Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB43DCA0ED3
	for <ath10k@archiver.kernel.org>; Wed,  4 Sep 2024 10:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dfB/6k69VviH28y28g1ULLPKNLuYrR4YFjAoHC8C+vU=; b=Elm+Kq/bOSZWXS2Ls7H5eAJvQu
	AEzRUnAtsD5zZgy7xYWRj3Bqar9x8u1VgL+jOU5lhSpGpsreUIs8bh/wh1XmRZMJzBrVIDi+AsbR8
	naoYc9Snf4q0qy7JMtegmEi8G+pEO97rhCXGBs3KQUfq/i3Wo1tWcIK9OriMr5vsPhqK8bbZGvVkS
	QzORgGruc3WTWWzSbb1BMLLL/mrB8iklQGmMUOtKjgobZO508AtDClljZuBTZbrKtemSsWDiIC9tX
	1Wo2xVLlk9ZKIPn5r2eLmJISGElQxUSiQMJ16QT8nHTFFGJleBr6+eLgfQF0StVRQareQd4JMXiQf
	lgeMfF+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slnWe-00000003yrZ-0RrW;
	Wed, 04 Sep 2024 10:46:12 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slnWa-00000003ypt-3ViH
	for ath10k@lists.infradead.org;
	Wed, 04 Sep 2024 10:46:11 +0000
Received: from [192.168.179.80] (p54b6ff28.dip0.t-ipconnect.de [84.182.255.40])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 8E5BA61BA1843;
	Wed,  4 Sep 2024 12:45:34 +0200 (CEST)
Message-ID: <d8253ab3-f4f0-40fd-a550-d75eef121b56@molgen.mpg.de>
Date: Wed, 4 Sep 2024 12:45:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: failed to remove key (0, ce:ce:1e:27:bb:e0) from hardware (-110)
 (ETIMEDOUT)
To: Kalle Valo <kvalo@kernel.org>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,
 James Prestwood <prestwoj@gmail.com>, linux-wireless@vger.kernel.org,
 ath10k@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_034609_055008_E70EC500 
X-CRM114-Status: UNSURE (   4.85  )
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


Linux 6.11-rc6+ logged the warning below when resuming from ACPI S3 (or 
unloading and loading the `ath10k_core`/`ath10k_pci` modules) having 
been connected to an AVM network:

     wlp58s0: failed to remove key (0, ce:ce:1e:27:bb:e0) from hardware 
(-110)

Error code 110 is the value for ETIMEDOUT. I saw James patch [1], and 
applied it, and the error is still there (as exepected).

Can the warning be improved so the user know, which component is at fault?


Kind regards,

Paul


[1]: https://lore.kernel.org/all/20240814164507.996303-1-prestwoj@gmail.com/

```
Sep 04 07:21:38.469669 abreu kernel: Linux version 
6.11.0-rc6-00027-ga91d08fcc356 (build@bohemianrhapsody.molgen.mpg.de) 
(gcc (Debian 14.2.0-4) 14.2.0, GNU ld (GNU Binutils for Debian) 2.43.1) 
#294 SMP PREEMPT_DYNAMIC Tue Sep  3 23:01:18 CEST 2024
Sep 04 07:21:38.469718 abreu kernel: Command line: 
BOOT_IMAGE=/vmlinuz-6.11.0-rc6-00027-ga91d08fcc356 
root=UUID=32e29882-d94d-4a92-9ee4-4d03002bfa29 ro quiet pci=noaer 
mem_sleep_default=deep log_buf_len=8M cryptomgr.notests
[…]
Sep 04 12:34:55.826218 abreu sudo[25874]:  pmenzel : TTY=pts/7 ; 
PWD=/home/pmenzel ; USER=root ; COMMAND=/usr/sbin/modprobe ath10k_pci
Sep 04 12:34:55.828046 abreu sudo[25874]: pam_unix(sudo:session): 
session opened for user root(uid=0) by pmenzel(uid=5272)
Sep 04 12:34:55.869839 abreu kernel: ath10k_pci 0000:3a:00.0: pci irq 
msi oper_irq_mode 2 irq_mode 0 reset_mode 0
Sep 04 12:34:56.005202 abreu sudo[25874]: pam_unix(sudo:session): 
session closed for user root
Sep 04 12:34:56.161706 abreu kernel: ath10k_pci 0000:3a:00.0: qca6174 
hw3.2 target 0x05030000 chip_id 0x00340aff sub 1a56:1535
Sep 04 12:34:56.162591 abreu kernel: ath10k_pci 0000:3a:00.0: kconfig 
debug 0 debugfs 0 tracing 0 dfs 0 testmode 0
Sep 04 12:34:56.163115 abreu kernel: ath10k_pci 0000:3a:00.0: firmware 
ver WLAN.RM.4.4.1-00309- api 6 features wowlan,ignore-otp,mfp crc32 0793bcf2
Sep 04 12:34:56.241683 abreu kernel: ath10k_pci 0000:3a:00.0: board_file 
api 2 bmi_id N/A crc32 d2863f91
Sep 04 12:34:56.333784 abreu kernel: ath10k_pci 0000:3a:00.0: htt-ver 
3.87 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
Sep 04 12:34:56.417649 abreu kernel: ath: EEPROM regdomain: 0x6c
Sep 04 12:34:56.417919 abreu kernel: ath: EEPROM indicates we should 
expect a direct regpair map
Sep 04 12:34:56.418022 abreu kernel: ath: Country alpha2 being used: 00
Sep 04 12:34:56.418114 abreu kernel: ath: Regpair used: 0x6c
Sep 04 12:34:56.422440 abreu NetworkManager[610]: <info> 
[1725446096.4223] device (wlan0): driver supports Access Point (AP) mode
[…]
Sep 04 12:35:12.042484 abreu wpa_supplicant[618]: wlp58s0: WPA: Group 
rekeying completed with ce:ce:1e:27:bb:e0 [GTK=CCMP]
Sep 04 12:35:21.800998 abreu sudo[25953]:  pmenzel : TTY=pts/7 ; 
PWD=/home/pmenzel ; USER=root ; COMMAND=/usr/sbin/modprobe -r ath10k_pci
Sep 04 12:35:21.803733 abreu sudo[25953]: pam_unix(sudo:session): 
session opened for user root(uid=0) by pmenzel(uid=5272)
Sep 04 12:35:21.881668 abreu kernel: wlp58s0: deauthenticating from 
ce:ce:1e:27:bb:e0 by local choice (Reason: 3=DEAUTH_LEAVING)
Sep 04 12:35:22.905717 abreu kernel: ath10k_pci 0000:3a:00.0: failed to 
install key for vdev 0 peer ce:ce:1e:27:bb:e0: -110
Sep 04 12:35:22.906604 abreu kernel: wlp58s0: failed to remove key (0, 
ce:ce:1e:27:bb:e0) from hardware (-110)
Sep 04 12:35:22.908927 abreu wpa_supplicant[618]: wlp58s0: 
CTRL-EVENT-DISCONNECTED bssid=ce:ce:1e:27:bb:e0 reason=3 locally_generated=1
Sep 04 12:35:22.908995 abreu wpa_supplicant[618]: BSSID 
ce:ce:1e:27:bb:e0 ignore list count incremented to 2, ignoring for 10 
seconds
```

