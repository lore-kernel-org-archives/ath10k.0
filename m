Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE4A7D15D8B
	for <ath10k@archiver.kernel.org>; Mon, 21 Oct 2024 12:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wED9LSDXASYhZO+sUv6q/7sOBSvh2CkLZsLZVG3FmQA=; b=bQbnMoL/IvwD0o0rQ/wbx1xxV+
	jN6ffOBBYk5yIr6Xun/32hK+q1rxeoF841NJHUPQi2Ab675LWfmaAzCFKozQN7j7uZVZAwG1CkRmv
	Wptc3HW8xwsvOy2gGAyzVXeShd3gxPUlwn079c5v/L+QVkD90Yqt3i0G1gP8+pXDDBdMP5S+wxq85
	cD831i4wTbRd6Q4HdjIbG2kvPcIaBg/2i45rOMco87YvUCb0SFxWKrmYPrKZz5rJN8kTZchlCJ6k7
	+UHT9KTixp2LtAaBDXbKNT6gkS2JB/UvH+iMzH/cnRno1vXWS7i7epbokEKY687X16J9iO2OSZPPQ
	BWNQYLBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2rzu-00000007LJB-1M8v;
	Mon, 21 Oct 2024 12:58:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2rlu-00000007J66-1OEH
	for ath10k@bombadil.infradead.org;
	Mon, 21 Oct 2024 12:44:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=wED9LSDXASYhZO+sUv6q/7sOBSvh2CkLZsLZVG3FmQA=; b=L4cBG6EeHcOqEwYc+3hURh//nl
	bKiKspAZq8s12x/s0x9KOAYqBY+P38Gzj8YDBbljvprlLxmho9GEGpMku+wuXdNzXPzS2KGzDjMgI
	Eu66LDcb3whWD9ccrInJ56FdffG/9dGOEqHE1M5AeHrn/wLsd207xjGS4FcWbNjbDt7WnyVVJa9zl
	g5HPtW99IsUVjgL5OutOutuxxPbW2trIoSOl6h8wi5aytb0qD2gaFx5PtCk1smCrQnFOTtAEiScu2
	92mKMyy/6rIWuYvo/XWhGNM9bJ0l6wnK+YRVemLlqx4MDMQZgINnHPQztiqjc0KBBLZOZXe91hxfG
	7Rv5Q05Q==;
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2rlq-00000007vcK-3Cll
	for ath10k@lists.infradead.org;
	Mon, 21 Oct 2024 12:44:28 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6cc250bbc9eso32478776d6.2
        for <ath10k@lists.infradead.org>; Mon, 21 Oct 2024 05:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729514663; x=1730119463; darn=lists.infradead.org;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wED9LSDXASYhZO+sUv6q/7sOBSvh2CkLZsLZVG3FmQA=;
        b=lqX/TZcDnllmCuuY1fINEjAuflRuX0jrHnm8ZUXYooTFgrdHECFt4k5P9f4nHR8J3A
         06Va7low57waCiHuXzdk61l69/xoUTySMcBTkKF0I7NxZogAJKxFYndyF5h75NC4Z0z+
         yEcbhi0q0Dz2qYhfyusYZkipqTctSU1r0yXouRVKb7SnI0byv+3suSXFiqIgv37K3isO
         s+HXYqqoGYhrT8FdmXm1Pxm4svLMOjPYcoEBEuEYFe9he/cK9xETFskAED6SWornYdL2
         eBMNFIfuvTgpuwlfszjkeyRudJnW1oLe+pa5h9TM6c1ZxI/l3/SFBFxav8FsGfJF7DKQ
         0LRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729514663; x=1730119463;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wED9LSDXASYhZO+sUv6q/7sOBSvh2CkLZsLZVG3FmQA=;
        b=Xk0srd/GgIgHWiJkEZv71mgi/0El7OtL6GNtyJT3+GAmxXxQu4EjuiZIbKyTyR0Wzp
         ffsPpLznR7JnfakUd7pr5YQxJFf3AYyC2jXCFQwCo7A2B92yI3W3fqt+D+OhEbWtbn0O
         6QtbTtsOOTQwLYXEVk1Yax+y11Kcgdw4YJvXNsCgG8YkY35c1TpeIork8N2JQV03/Dj/
         P0qdE6oXUenkXYfRCjFh5ggO65QpotI3pEsJ4NZyqaG0Zc+h5U5nr91m23Y8M4XeX29Q
         NANU9OaqeZDoYImWuT4ujKf5lQ7/1dNZi/bSRTl2zZkNoD97R4/vgQkI4g5PcODVwnZi
         Lo7g==
X-Forwarded-Encrypted: i=1; AJvYcCWU13QmeogzY7Mn8FSKdF9ZFZp5kX1rGhud8q1XkXnv+smWZ8hm7TxYz318nyT+E/VXzXz+e7s=@lists.infradead.org
X-Gm-Message-State: AOJu0YwoCIOOU0zOPwv9Ca3vxHb3G/0hcoUMyPGoo+4bDTtaYolj8sZc
	EWWecnlKh7MnCfh9pmzp4gGpEWTd6GnVJOKuJrcfL9aSTRU8ovbL
X-Google-Smtp-Source: AGHT+IFiDd7L9cgqfIMEBrgrhebMSoGL7kU/QVrq6Uq6u8vBwVceq+qF9dmZvX9W5ZZVyor167oKUg==
X-Received: by 2002:a05:6214:3d0d:b0:6cb:e6b2:4a84 with SMTP id 6a1803df08f44-6cde14d1c48mr191595186d6.14.1729514662847;
        Mon, 21 Oct 2024 05:44:22 -0700 (PDT)
Received: from [10.175.241.120] ([72.46.116.182])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ce008f5ccdsm16909986d6.32.2024.10.21.05.44.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 05:44:22 -0700 (PDT)
Message-ID: <954ffcc6-18ac-4f4b-9730-ab12c4ca7cd8@gmail.com>
Date: Mon, 21 Oct 2024 05:44:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: James Prestwood <prestwoj@gmail.com>
Subject: ath10k/QCA6174 performance hit with multicast frame registration
To: "open list:MEDIATEK MT76 WIRELESS LAN DRIVER"
 <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org
Cc: Jouni Malinen <j@w1.fi>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_134426_976962_C5ECB561 
X-CRM114-Status: GOOD (  14.34  )
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

A patch I authored appears to have introduced a performance hit with 
ath10k/QCA6174 when userspace registers for frames and sets the 
multicast RX flag:

commit 63b896629353157e8ca77cabdfab340b5c69ca59
Author: James Prestwood <prestwoj@gmail.com>
Date:   Tue Dec 5 17:15:36 2023 +0200

     wifi: ath10k: add support to allow broadcast action frame RX

First off, the performance issues appear generally as packet loss. It 
only seems to happen when we get 10-15 or more clients all on the same 
channel in the same vicinity (all registering for multicast frames). 
This is somewhat uncommon even in our uses-cases which is why it took a 
while to notice any of this behavior. Based on some PCAPs taken about 
50-75% of the air traffic was retransmissions, many were ADDBA/Block ACK 
related. Reverting this patch OR forcing the supplicant to not register 
for multicast frames (thereby bypassing the configure_filter logic in 
the driver) resolved the issues entirely.

 From the supplicant side I am currently modifying IWD to only register 
for these multicast frames when it needs them (i.e. when DPP starts). 
Looking at wpa_supplicant it already does this afaict. So I think 
broadly, the impact of this is relatively low and should only effect 
users of IWD, running QCA6174's, in high client load environments. And 
an IWD fix/workaround is in progress which would then only effect those 
actively using DPP.

 From the kernel side I would obviously like to fix this rather than 
revert, but I'm hoping to get some guidance on what might be causing 
this. Is the driver getting bombarded with multicast frames causing 
drops? Is there some lower level filter I need to configure (like in the 
firmware)? When I wrote this patch I was following what ath9k did as its 
the only other driver (besides hwsim) that actually supports this. This 
is making me question if ath9k also has this problem, but it was just 
never noticed?

Jouni, you implemented the ath9k support, was anything like this noticed 
in testing? Based on what we saw this last week its unlikely since it 
requires so many clients, but I figured I'd ask.

Thanks,

James


