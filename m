Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2C1C10F1A
	for <ath10k@archiver.kernel.org>; Thu,  9 May 2024 12:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:To:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Dznd3bjM/PeqDJaYgIJy0JnewJ/Lifz1NgwaaM3tKbU=; b=PB04JCYMHR6Wf8WqvREoa/bhai
	7xIi15gF1ph5IF2z+j2DoQFHWePgeSn24mjm84q0hx7qW2/XKFY74i/PMexj0BEK9rn8qj9HbGzUn
	6UVMtSSaJyKcUFeepk8LDD+vYcXtt02vdGDaauuPLVpzG+VphDE4fq/6obEXH42CxLG5Llj5pLrO9
	pqoj0aeXHZ+hpth5IYajNc4kdF/4VQbNTlU2nCkjHOiILEe1m9kGsNnKSqZuxNfGU9eWCAKylag7L
	WVvi/4Wc+pEKf+TA9GDmrmhamDv7hiYYYfnd7u9ZvUAlMYR1h1Dqn6f08rKZ7pvc6sZ3VL7x8i8Mr
	Ndg3rBWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s52a5-00000001NFs-3NNV;
	Thu, 09 May 2024 12:09:01 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s52a3-00000001NCh-1LIt
	for ath10k@lists.infradead.org;
	Thu, 09 May 2024 12:09:00 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-34f0e55787aso545763f8f.2
        for <ath10k@lists.infradead.org>; Thu, 09 May 2024 05:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715256535; x=1715861335; darn=lists.infradead.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dznd3bjM/PeqDJaYgIJy0JnewJ/Lifz1NgwaaM3tKbU=;
        b=Mm20emm/7j85xoDvKJJdpWRxnTf+j7WjDkpeT4y546fcYxJquIjg7RSr2s1buq/GfN
         rrKRSvsW67g18ZudxB3yqZXin9UNAEpEgr8BTXsBFqok9arn+dSM1HnRZKe6WTM+Fi19
         v9lEUZM2i32o0S1wLiQ4K2y63U/mHvUOotA6ME9/I1+TD3Sz178I2uqU8U/2esO2zPkV
         cCOw4DmpEe2yT51M34Rucnw7IkH0BjqiNNjsxHPortRA061T7qT8etcaXDlH2abq0Qz9
         BphjPgv3HKA//rw4Jv8K06CPF5viRgKvxgBSEaynBZYC8B3/5k5oZ0vJM9/3y9hrs50+
         TZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715256535; x=1715861335;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dznd3bjM/PeqDJaYgIJy0JnewJ/Lifz1NgwaaM3tKbU=;
        b=o4aZ8o2Rat0LAwJgWX7kzSX8tnwRXpbehTTvJ4HUAyzynCScY4SVTeE3YytIhiy809
         CZQEJ/xoRjFxE+avLwOOcUq972ex6qOvH6cJBYL169q+fX1HFarjDD1HIhHbgUJzXQjU
         GQIfUt52YjPE8AjYFhkhDPMNov4r6WWRgIHTdx2kXkhBMyKboWHVkEGu/RJOH4xDPa+P
         zCK1T/sAKLWUXYF7sN7dti8roJfUJFdN9O1KX1K/fSGNZZZrQw9o9JlcaOpmIkllq70b
         jxZNUZEo768SET2wZh6w6cvWaljLLzBYj4ZqlkW0MKV28DPdiJGGH3nJRQ70a77WC+xY
         dDUA==
X-Gm-Message-State: AOJu0YyMIxbTqXXOFY+BszCDtQU2/fLtgjq01RaLjbg88zh62u9s9Rrp
	7GFU21BDWKAbIpyfu2sQfdajEwQrWSbE8csnOkrcpV5PcPGYD7W+CNzIfDjq
X-Google-Smtp-Source: AGHT+IGZP2SgmlizTixsQVtity+wyhHPJhMg697cbMWykmY9Vx62KtvD8LIiDflJivsrDTmzrW04Sw==
X-Received: by 2002:a5d:5908:0:b0:34a:2d0c:4463 with SMTP id ffacd0b85a97d-34fca149bbdmr4276260f8f.4.1715256534886;
        Thu, 09 May 2024 05:08:54 -0700 (PDT)
Received: from [10.123.13.239] ([195.55.200.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b79bca6sm1550776f8f.12.2024.05.09.05.08.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 May 2024 05:08:54 -0700 (PDT)
Message-ID: <cb6fe672-e18f-4864-980e-241749083565@gmail.com>
Date: Thu, 9 May 2024 05:08:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: ath10k@lists.infradead.org,
 "open list:MEDIATEK MT76 WIRELESS LAN DRIVER"
 <linux-wireless@vger.kernel.org>
From: James Prestwood <prestwoj@gmail.com>
Subject: Ath10k "hardware restarting" all clients at specific location
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_050859_471893_5B2BC4E8 
X-CRM114-Status: UNSURE (   8.99  )
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

I've got a really odd one here. We have about wifi 50 clients all 
experiencing a problem where seemingly out of the blue the ath10k driver 
times out reading a WMI command and restarts the hardware. I've poured 
though logs and cannot find any patters as far as when it happens. 
Sometimes during a scan, sometimes after a roam, and sometimes when the 
client has a stable connection. It appears completely random.

The issue looks to be isolated to a single physical location. We have 
many other locations with clients running an identical software stack 
(kernel version and ath10k firmware) and the same AP/network deployments 
and see ZERO instances of this in the last month of logs. Its only one 
physical location where clients are frequently seeing this happen. For 
this specific version of our software we are running:

Ubuntu 22.04 5.15.0-72-generic
QCA6174 HW 3.2
Ath10k firmware WLAN.RM.4.4.1-00288-QCARMSWPZ-1

I have also updated to the latest firmware (WLAN.RM.4.4.1-00309-) on a 
single client yesterday, and saw 3 instances of this still as of this 
morning.

Due to the isolated nature of this and having other locations with 
identical configurations/software it seems like some 
external/environmental difference at this location. Is there any 
external event that could cause this (rouge frame, interference, ???)

May 09 00:31:06 kernel: wlan0: disconnect from AP aa:46:8d:37:8f:48 for 
new assoc to aa:46:8d:37:80:b5
May 09 00:31:06 kernel: wlan0: associate with aa:46:8d:37:80:b5 (try 1/3)
May 09 00:31:06 kernel: wlan0: RX ReassocResp from aa:46:8d:37:80:b5 
(capab=0x1511 status=0 aid=4)
May 09 00:31:06 kernel: wlan0: associated
May 09 00:31:06 kernel: ath: EEPROM regdomain: 0x82d4
May 09 00:31:06 kernel: ath: EEPROM indicates we should expect a country 
code
May 09 00:31:06 kernel: ath: doing EEPROM country->regdmn map search
May 09 00:31:06 kernel: ath: country maps to regdmn code: 0x37
May 09 00:31:06 kernel: ath: Country alpha2 being used: ES
May 09 00:31:06 kernel: ath: Regpair used: 0x37
May 09 00:31:06 kernel: ath: regdomain 0x82d4 dynamically updated by 
country element
May 09 00:31:06 kernel: wlan0: Limiting TX power to 30 (30 - 0) dBm as 
advertised by aa:46:8d:37:80:b5
May 09 00:31:42 kernel: ath10k_pci 0000:02:00.0: timed out waiting peer 
stats info
May 09 00:31:45 kernel: ath10k_pci 0000:02:00.0: wmi command 90113 
timeout, restarting hardware
May 09 00:31:45 kernel: ath10k_pci 0000:02:00.0: could not request stats 
(-11)
May 09 00:31:45 kernel: ath10k_pci 0000:02:00.0: could not request peer 
stats info: -108
May 09 00:31:45 kernel: ath10k_pci 0000:02:00.0: failed to read 
hi_board_data address: -16
May 09 00:31:45 kernel: ieee80211 phy0: Hardware restart was requested
May 09 00:31:45 kernel: ath10k_pci 0000:02:00.0: could not request stats 
(-108)
May 09 00:31:45 kernel: ath10k_pci 0000:02:00.0: device successfully 
recovered
May 09 00:31:46 kernel: wlan0: deauthenticated from aa:46:8d:37:80:b5 
(Reason: 6=CLASS2_FRAME_FROM_NONAUTH_STA)

Thanks,

James


