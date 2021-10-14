Return-Path: <SRS0=RSRu=PC=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71E7DC433F5
	for <ath10k@archiver.kernel.org>; Thu, 14 Oct 2021 11:55:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A6A860295
	for <ath10k@archiver.kernel.org>; Thu, 14 Oct 2021 11:55:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3A6A860295
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nc078DPH3sT7qilKdKk1YNvqJmms06nMb/EnDslotNY=; b=Rvo5hslJhgO58KBaulPhYOfsdU
	gCz2QydJTaFHJh9LPlCeg2KUF++WOLdOQJVo5Vs5LuuNDlD1OK0e0ZOIaKFKJ0PuAYm7a6UBD/TyE
	n+g0S5W9tuXy1+WpD/B14giulQD14fL2g4wVCpCqePjLH22cv9R/KPlNBYFIDJVsn32ROod+VGWZn
	atF31le9oM6baMO//lG9fzszYntRe/eTH0P2wkydMt0BgPQdJu8s2UsbG5GJdBc4pnlCK9JjtY6xd
	o/H2SOECz4eJlWcTGO21XINf2OFTtbCJlIoFPUUdSNT4gn0uTXucZcaWtTepnYhWcHLgu959rHwPI
	K+gkrd8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mazJm-002xb9-Qn; Thu, 14 Oct 2021 11:54:38 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mazJj-002xZm-4j
 for ath10k@lists.infradead.org; Thu, 14 Oct 2021 11:54:36 +0000
Received: by mail-wr1-x42b.google.com with SMTP id t2so18611662wrb.8
 for <ath10k@lists.infradead.org>; Thu, 14 Oct 2021 04:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Qh70ZouKZ85gIbpuXKWewmPLqOEF6lltY7MRU3dhsLQ=;
 b=cn8xR7iiAw7tWLtSnmilwd0CLe4cIYuLcWV6O7XQ5LHFnC/wOFIWN4l3qyN6BY/cdh
 AS/BEtzOkPPJ5YvO0DQPfmbY7qhU9fI/9imeranMOICUU0X4q8sP2J4qAmieeoLD+nhK
 HCTGk05ojGTmiqhKPYB+q8hH1ptSggXPQDx0d06jXoCevxZe4/+UAgsJ7aD4/ClHjIDM
 Uq5d3+wzLafXiIO/rGCntLEJUnvzl5Grh6fujZ9n6G/AzHdjs/mNvee7wuGUcKCbGqZN
 hhAIlxxxWuVoWMEk21U4XseZsNKCBloH6AeNxzN0KJ4c23+pyL9kgi+FRKa4kRWi4HUZ
 5DaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Qh70ZouKZ85gIbpuXKWewmPLqOEF6lltY7MRU3dhsLQ=;
 b=alC6iYr+CNu1rdJfZE65Pk7X4scFBTJ2r9hBbbOyxsATV5nebC2v5yDzLHerjDVN88
 UCjo0/x10cCeKW1myaTCkrV8HtaM4I4vmt7pg27AhA2dBjcDv/y0i9dnAoGUdJxZBq61
 D8lfp/0pDhjdsWXLo4+oMsVBcMDucxQi3MtSBvQUd8vYKh0fOfr1XlG9KuH1yAVykbCw
 HUKqOi8UPNC2nbfgrjCtPl8v2tJtAyFthB/kgTyx2MncfTCDyd3w8gdkPo9xNmm/z/DM
 du5tCxvJsjxRHt++UZQjj2oMKHDkfPALZwiqItEEJ0Cgc2RY9KxDPEXrSA0mr+1LMNs8
 kTIg==
X-Gm-Message-State: AOAM531OCa31Xw4KyBf8d8Yy9F6TEgp9+hpWUdJ9A9NhUdn1dNVECxZ1
 DeJRX19VOZyMqSUC9U9BesQ=
X-Google-Smtp-Source: ABdhPJy1ZYZCOFqvLyyp8cFqmb+AwiD6hjCGDA1IY0Kv5GkMzSNmSJNkDkdSXDMvEMcXmypDMbPF0A==
X-Received: by 2002:adf:8bca:: with SMTP id w10mr6144612wra.43.1634212472296; 
 Thu, 14 Oct 2021 04:54:32 -0700 (PDT)
Received: from debian64.daheim
 (p200300d5ff0f7400d63d7efffebde96e.dip0.t-ipconnect.de.
 [2003:d5:ff0f:7400:d63d:7eff:febd:e96e])
 by smtp.gmail.com with ESMTPSA id c17sm2194410wmk.23.2021.10.14.04.54.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 04:54:31 -0700 (PDT)
Received: from localhost.daheim ([127.0.0.1])
 by debian64.daheim with esmtp (Exim 4.95)
 (envelope-from <chunkeey@gmail.com>) id 1mazJe-0008WG-Sw;
 Thu, 14 Oct 2021 13:54:30 +0200
Subject: Re: [PATCH] ath10k: support bus and device specific API 1 BDF
 selection
To: Robert Marko <robimarko@gmail.com>, kvalo@codeaurora.org,
 davem@davemloft.net, kuba@kernel.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20211009221711.2315352-1-robimarko@gmail.com>
From: Christian Lamparter <chunkeey@gmail.com>
Message-ID: <ba520cf0-480e-245b-395f-7d3a5f771521@gmail.com>
Date: Thu, 14 Oct 2021 13:54:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211009221711.2315352-1-robimarko@gmail.com>
Content-Language: de-DE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_045435_263546_424A6A5C 
X-CRM114-Status: GOOD (  19.97  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 10/10/2021 00:17, Robert Marko wrote:
> Some ath10k IPQ40xx devices like the MikroTik hAP ac2 and ac3 require the
> BDF-s to be extracted from the device storage instead of shipping packaged
> API 2 BDF-s.
> 
> This is required as MikroTik has started shipping boards that require BDF-s
> to be updated, as otherwise their WLAN performance really suffers.
> This is however impossible as the devices that require this are release
> under the same revision and its not possible to differentiate them from
> devices using the older BDF-s.
> 
> In OpenWrt we are extracting the calibration data during runtime and we are
> able to extract the BDF-s in the same manner, however we cannot package the
> BDF-s to API 2 format on the fly and can only use API 1 to provide BDF-s on
> the fly.
> This is an issue as the ath10k driver explicitly looks only for the
> board.bin file and not for something like board-bus-device.bin like it does
> for pre-cal data.
> Due to this we have no way of providing correct BDF-s on the fly, so lets
> extend the ath10k driver to first look for BDF-s in the
> board-bus-device.bin format, for example: board-ahb-a800000.wifi.bin
> If that fails, look for the default board file name as defined previously.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---

As mentioned in Robert's OpenWrt Pull request:
https://github.com/openwrt/openwrt/pull/4679

It looks like the data comes from an mtd-partition parser.
So the board data takes an extra detour through userspace
for this.

Maybe it would be great, if that BDF (and likewise pre-cal)
files could be fetched via an nvmem-consumer there?
(Kalle: like the ath9k-nvmem patches)

This would help with many other devices as well, since currently
in OpenWrt all pre-cal data has to be extracted by userspace
helpers, while it could be easily accessible through nvmem.

What do you think?

Cheers,
Christian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
