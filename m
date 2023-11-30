Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0ACAC4167B
	for <ath10k@archiver.kernel.org>; Thu, 30 Nov 2023 15:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xYxQGcpqvZSnTdrcZYKUf6MgQycD5OfPTFYBGRzJOrw=; b=QQ7uAh9FlfQDY5Ip9iomuJasC+
	/hMBNmjgZ9EugTH7jySW4+GTDfz6nVxmxoLo6vGAi/8ofRE9Ek/WDVZ4BMRZhBsLm1A71vfMT1PaS
	cedHFyPrXU7/JHiys0cbKjl862MoEtNPcwPPkKgAe+t8hqaOxJYr7zJjJSlJ/bTU9AHKHdOyRMuNk
	OPNC4nZkmOYLU2nmBnd9OZBySPn0r5RvaZcOgS7rcjAi1BwP8kQL1IPPjy4lqNWCh4/5OxdjMUiTB
	eqo5bTyRqX8/92ys6Tbu+f6gL8m5froZZissOnDjySFAR9h3pAm0QokR4Uy4295ePd74FIwr/EtGv
	FSt7UOrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8il6-00BBB0-2X;
	Thu, 30 Nov 2023 15:15:20 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8il3-00BBAZ-20
	for ath10k@lists.infradead.org;
	Thu, 30 Nov 2023 15:15:19 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-6d817ccaa6dso607381a34.2
        for <ath10k@lists.infradead.org>; Thu, 30 Nov 2023 07:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701357313; x=1701962113; darn=lists.infradead.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xYxQGcpqvZSnTdrcZYKUf6MgQycD5OfPTFYBGRzJOrw=;
        b=KVxZrLV5cd7RraxMyC6rseDxLWfX3AnN/UySgSz1DSb+u8sOLJLR6tI4xDX2zD1r1E
         o8P8If1wZsxeJpxl03pqvg5ckYEx0qlrBd04s/5TxeIQ/BO0o2+koAKxU0V9WRxDRev+
         QR29PXNoXFYtqyhqJP+VooApVuQSsldscBSV9TyHY4VE/WPaFLU0PuKPdsN/zCOuc8h1
         QHiW4W4SQu6IylIF5QwvQ9vyQDfnEdt37KXzjksxZs3MXGIvwCQ7l0RdJC46hjjGm0m+
         WJkAsrCUq5sFa/ZJEDiI2u/TlJgV6Xv3OsHOXXOi1HYRel1UpQwcvu54b0vIpWvDq5x6
         UEQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701357313; x=1701962113;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xYxQGcpqvZSnTdrcZYKUf6MgQycD5OfPTFYBGRzJOrw=;
        b=HeHjvP5v8M7ErgkVu4TFuBQ8Q7+Y3OkYES+PEiz67UxOh5R30JPeisOBAAl9VWl15X
         ZjhkAnIEjmmfHHi0mua7PYSJ+Jqj40b6AySxmtxJiXpUppWyCgZMEK7Fc6G08ZdbUYTB
         duHEvh3Vep41Efbk583eIEwIVJRy9KIytcE1kD/9Srg7nHnDGDU7lDgK5cVrxwF+vkiL
         2xxK2i/rndAgTzpvsgGVUl8lXVXWSfNXTlRvs0M3wirJkZlMU+vj+g5LpDmIRse12xqh
         9Nl+YzhsKXHByJ6b8RjHXwhcjtyS0x2uysSw8G3aTwI5VxbPAB01Us57fWN4Mjs/T868
         C2pA==
X-Gm-Message-State: AOJu0Yy8RG6+Xz9LgzxqJVqlNACWrb8xgh79IhhQRynzvmZqA6ANyVEc
	MJA5niaiGRaF+Gwxd0icsgO0vylywF4=
X-Google-Smtp-Source: AGHT+IEai8Tld1vj5hVV4wJzYu+GSLDgLCyYtvTxx8tyPc23vfH9xk48vWnkxyzijpKSnYTynDE4kg==
X-Received: by 2002:a05:6830:1245:b0:6bf:3f4:3edc with SMTP id s5-20020a056830124500b006bf03f43edcmr23607904otp.22.1701357313036;
        Thu, 30 Nov 2023 07:15:13 -0800 (PST)
Received: from [10.102.4.159] (50-78-19-50-static.hfc.comcastbusiness.net. [50.78.19.50])
        by smtp.gmail.com with ESMTPSA id bs44-20020a05620a472c00b0077d7eaefc08sm565423qkb.87.2023.11.30.07.15.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Nov 2023 07:15:12 -0800 (PST)
Message-ID: <2515fe0a-107e-40dc-800f-6ca3d65a291a@gmail.com>
Date: Thu, 30 Nov 2023 07:15:10 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org
From: James Prestwood <prestwoj@gmail.com>
Subject: Ping/IP network loss post-roam
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_071517_661229_FDE8B98E 
X-CRM114-Status: GOOD (  13.71  )
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

We have noticed a sporadic problem that seems to come and go. It was 
first noticed only on a specific AP manufacturer but more recently seen 
on another which is why I'm revisiting the problem.

The client is using ath10k QCA6174 hw 3.2 hardware. The network is WPA2, 
configured with FT. This has been seen both with over-Air and over-DS.

The client will always roam using FT without a problem. No indication of 
failed FT (ft-auth/ft-action and assoc are both successful). Sometimes 
though, after the roam, the client seems to lose all IP networking 
capabilities (pings, tcp/udp all fail).

IWD is getting zero indication there there is a problem after the roam. 
No packet/beacon loss CQM events, no deauths. On the AP side (if we even 
get any indication of a problem) we see "client not responding". It 
appears there is some disconnect between the clients state and the state 
the AP thinks the client is in. The client thinks its connected, the AP 
thinks the client has disappeared.

After noticing this problem a watchdog was implemented which starts 
pinging post-roam and if enough pings fail it triggers a deauth and 
authenticates again. This at least gets the client back on the network, 
but obviously isn't great because the client loses networking for an 
extended period waiting for pings to fail, then deauth/reauthing, doing 
DHCP etc. We hadn't gotten any traction trying to explain the issue to 
the AP vendor. Its always a client issue...

These are production devices and ath10k debugging is not built in to the 
module. All I have is kernel/IWD logs which just shows the roam was 
successful, and we deauthed later. Not particularly useful.

I'm trying to determine where the problem is, is it client side or 
infrastructure, and if there is anything that can be done either from an 
ath10k driver or supplicant (IWD) perspective. Getting ath10k logs is 
something I'd like to eventually do but its easier said than done. These 
devices are always running and customers generally don't want them 
messed with. I have ssh access so if there is any additional info I can 
get without kernel changes I'm happy to try.

Nov 30 13:33:11 kernel: wlan0: disconnect from AP xx:xx:xx:xx:xx:xx for 
new assoc to yy:yy:yy:yy:yy:yy
Nov 30 13:33:11 kernel: wlan0: associate with yy:yy:yy:yy:yy:yy (try 1/3)
Nov 30 13:33:11 kernel: wlan0: RX ReassocResp from yy:yy:yy:yy:yy:yy 
(capab=0x411 status=0 aid=6)
Nov 30 13:33:11 kernel: wlan0: associated
Nov 30 13:33:11 kernel: ath: EEPROM regdomain: 0x809c
Nov 30 13:33:11 kernel: ath: EEPROM indicates we should expect a country 
code
Nov 30 13:33:11 kernel: ath: doing EEPROM country->regdmn map search
Nov 30 13:33:11 kernel: ath: country maps to regdmn code: 0x52
Nov 30 13:33:11 kernel: ath: Country alpha2 being used: CN
Nov 30 13:33:11 kernel: ath: Regpair used: 0x52
Nov 30 13:33:11 kernel: ath: regdomain 0x809c dynamically updated by 
country element

# This condition is detected by watchdog, and we deauth

Nov 30 13:33:34 kernel: wlan0: deauthenticating from yy:yy:yy:yy:yy:yy 
by local choice (Reason: 3=DEAUTH_LEAVING)

# We then auth to the very same BSS, successfully and have no problems 
(until it happens sometime later)

Nov 30 13:33:36 kernel: wlan0: authenticate with yy:yy:yy:yy:yy:yy
Nov 30 13:33:36 kernel: wlan0: send auth to yy:yy:yy:yy:yy:yy (try 1/3)
Nov 30 13:33:36 kernel: wlan0: authenticated
Nov 30 13:33:36 kernel: wlan0: associate with yy:yy:yy:yy:yy:yy (try 1/3)
Nov 30 13:33:36 kernel: wlan0: RX AssocResp from yy:yy:yy:yy:yy:yy 
(capab=0x411 status=0 aid=6)
Nov 30 13:33:36 kernel: wlan0: associated

Thanks,

James


