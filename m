Return-Path: <SRS0=bIdE=NJ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE73BC4338F
	for <ath10k@archiver.kernel.org>; Wed, 18 Aug 2021 15:18:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CC726104F
	for <ath10k@archiver.kernel.org>; Wed, 18 Aug 2021 15:18:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9CC726104F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OvKzSdBWcjibYU0CJTrlFuEoyHKFEfZx2ultxckU28o=; b=g1Lu10FQd6svsu
	v1UHq3uhdYkv6kIMz9kreJdm3NABTtlflsqYaqDsTy7LWkrMURkphrlpLTJYGmcPgvOdpthXC7cJs
	JV7NjSaXCqMW3lnZm7zMO2eKViY4109UVvzGNkszHQu3xTCSKfQVSKy9WV2YbquQIoQGGaN2PeM+I
	UHpiEQ5JzzbOSzAEnfvIZdG7KGwRhQwwqcm/olUGzDcDJwiZOF5xc6HwYV7S/6d6x+cHKN0bg9kMU
	7UZGJ2zEObl4S+xtBvkw/OS0bS0aiPCFLJl4VzYqkuH+zebR2Oy1HjxuWxv5ZT28asb+S78MTGW7R
	WNKySjeSC0wzKNWvj/4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGNL0-0061i9-Vu; Wed, 18 Aug 2021 15:18:43 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGNKx-0061gL-OE
 for ath10k@lists.infradead.org; Wed, 18 Aug 2021 15:18:41 +0000
Received: by mail-lj1-x232.google.com with SMTP id i28so5764969ljm.7
 for <ath10k@lists.infradead.org>; Wed, 18 Aug 2021 08:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=mRJIXAZWfL3FHk/FIINd4bbx35hByjZA0KaRevosRfk=;
 b=eLPedI1TaO6lrr0/OxYeOEllEz6gS2MvqQFLZ5nZ/YffS8RyCQsWyoN4xq3bLOnnkN
 abITjWOHAuGBM9ZJgU83WDOgwULIlFbdS5LWReu4l5+exxRoDh2Ve9cFWZ5CXx3YC2V7
 2rl/rwv7fzgg/Aj/QVLoeFXw7lHkcdmEmw3UffZeNUbYgpJJGNrOd8ukid7AehPEarn9
 /PGrnFmKwCH8GfVWFy1Z72Q5sAi05scR//UjOC+qcZMKfsb1fOlnlXybKb61Pgslpdni
 sH9G+FI/Bx8dTqApuHBUgaXwa4MGZXdXECLmAeM64i9s+sMyTEEoE0ppdpJ6i0OGHSWa
 ZZrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=mRJIXAZWfL3FHk/FIINd4bbx35hByjZA0KaRevosRfk=;
 b=Uy1IJA/O9COjsM+Xn+2/JFWv3inxx3mUrL+3xk5rn53uTP0UEmd+Vh61g9BzJNlHsp
 8Nl4doj05/rwKpMbt1trDUE9B566d3a6FN+uwNZYnmOsIMX6z+5cme2VfnHGnJPIwPg8
 xkAu6NHar7gN1EjDAfnITWaHJdOYiIR5Z2zp142UmeQ9Ydx95WzVH/cEqpiktxZSwqEr
 uTEIp3iYHtHCLKRuETRpw53n0bpZf8XhE5o/HTKniUF0Rh/oqXDesd6Il9GVFgt06UP8
 DgrjDQLqYqd4iH7noZxh2AnD1neGuitupdnyBBsUBfTx5m/m5/MvN7O6bXwLhlTspZJl
 z7Jg==
X-Gm-Message-State: AOAM531l1Xkf9VkS3H09XLQswLaNwzSksB0v7F0mm9w4xkbeA0h99LK8
 goerU1/frwWzqfzaZLm2nx12zgkNMD59Uoc2zgA=
X-Google-Smtp-Source: ABdhPJy2JugOHeh0mqxJKc73oO/kUEm5cXSbJPfFROIr/YPUOoPlOREjOGD5MhNYs+deACxX18hp4u4zVxkgANuKWJ8=
X-Received: by 2002:a2e:9881:: with SMTP id b1mr8366154ljj.53.1629299916138;
 Wed, 18 Aug 2021 08:18:36 -0700 (PDT)
MIME-Version: 1.0
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 18 Aug 2021 12:18:25 -0300
Message-ID: <CAOMZO5AAvZic-NFbYYSVfOxY-27QukXMX68f9eDmhbqAkBRKRw@mail.gmail.com>
Subject: NOHZ tick-stop error with ath10k SDIO
To: Kalle Valo <kvalo@codeaurora.org>, "Paul E . McKenney" <paulmck@kernel.org>
Cc: ath10k@lists.infradead.org, linux-mmc <linux-mmc@vger.kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Marek Vasut <marex@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_081839_831916_D5AE05A5 
X-CRM114-Status: UNSURE (   6.76  )
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

Hi,

When launching the hostapd application on a i.MX7 based board with an
ath10k device connected via SDIO, the following "NOHZ tick-stop error"
messages are seen:

# hostapd /etc/wifi.conf
Configuration file: /etc/wifi.conf
wlan0: interface state UNINITIALIZED->COUNTRY_UPDATE
[   63.021149] NOHZ tick-stop error: Non-RCU local softirq work is
pending, handler #08!!!
Using interface wlan0 with hwaddr 00:1f:7b:31:04:a0 and ssid "thessid"
[   67.332470] IPv6: ADDRCONF(NETDEV_CHANGE): wlan0: link becomes ready
wlan0: interface state COUNTRY_UPDATE->ENABLED
wlan0: AP-ENABLED
[   68.025845] NOHZ tick-stop error: Non-RCU local softirq work is
pending, handler #08!!!
[   69.025973] NOHZ tick-stop error: Non-RCU local softirq work is
pending, handler #08!!!
[   69.607432] cfg80211: failed to load regulatory.db
[   72.026748] NOHZ tick-stop error: Non-RCU local softirq work is
pending, handler #08!!!
[   73.027039] NOHZ tick-stop error: Non-RCU local softirq work is
pending, handler #08!!!
[   74.027159] NOHZ tick-stop error: Non-RCU local softirq work is
pending, handler #08!!!
[   75.027109] NOHZ tick-stop error: Non-RCU local softirq work is
pending, handler #08!!!
[   76.027461] NOHZ tick-stop error: Non-RCU local softirq work is
pending, handler #08!!!
[   77.027391] NOHZ tick-stop error: Non-RCU local softirq work is
pending, handler #08!!!
[   78.027560] NOHZ tick-stop error: Non-RCU local softirq work is
pending, handler #08!!!

This happens on all kernel versions from 5.10  to 5.13.

Any ideas on how to fix this problem?

Thanks,

Fabio Estevam

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
