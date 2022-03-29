Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA51C433EF
	for <ath10k@archiver.kernel.org>; Tue, 29 Mar 2022 16:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E1RD2/bp+tn+gxSiu1uordATquqouoFH2nz7nc/mVGE=; b=uaFKbay8mnwKCZ
	p26fhe/Q5eY69aD1/PvKvEu5SdaKxErseXSxlbPc1TaVyIz0IxdqNEHW5wdlCpn88M80qD2ppzevY
	/WU92ZESDYJzAbjIfQY6OuI0ZbRId0HOzOJm2+0W0XiXNhxqvB/fGcVF5F9jbcIEnQehYPYpT5+mN
	XCBhjJW/1E54FHY+3gLs/rItjBRGF/nHcALt6bxm1spfd2f1W0S5FOx4um6eK1tBRkR1zZMjJnEeA
	C3OGNuNezEyZ9B71PyMRaVcYe/PWG/mC0wJmqeMy67/3WcLfhzcKs3vXMo1nvfnX6oDwnJCv0M+Qq
	V3Uls2sxoBwYGEaiYRyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZEGZ-00CpSB-HD; Tue, 29 Mar 2022 16:00:19 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZEGX-00CpRr-9N
 for ath10k@lists.infradead.org; Tue, 29 Mar 2022 16:00:18 +0000
Received: by mail-lj1-x230.google.com with SMTP id r22so24039808ljd.4
 for <ath10k@lists.infradead.org>; Tue, 29 Mar 2022 09:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=YBCXQvdqkUI+N6wX/GhhbJMb7vkKVG7Akhg7ppXMy/E=;
 b=eIBAiNbVkzK6fvdDnW17tD6M5+vhQn1byetq3BRfmeBV+cEjnCNKUHAEWOX/4Xvgo3
 oiyrwq17nz01Qt3AjSR3MGd5/NjwpV+zyK8/+U6AzKYxy7GyDowSBVn4e10NbcOMIg1F
 MddiI5DPKWwyoETitbcTdjsWytvo91cDGrkrTip+7CP5GpQ8JjnJwBBSPhMlqNYrHK35
 rfxHexx68Yqy6l0V0ZrRzsZD/hCDO43ln2VPEefAXeeKiy1JDTgKahRcJiXppKxiNCtp
 mYMfc2NPr3Dyl7oHMeBsjqRbIy59qxREhW+iBR5W+TOQ8/5c9FB+vyWvqlLDQwmXFZXZ
 Yrmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YBCXQvdqkUI+N6wX/GhhbJMb7vkKVG7Akhg7ppXMy/E=;
 b=pApyEfJ4uGSXynvt6NwpKiKLj7aTmxvcLOGxnyvvPF1Facg89GPNKjY0nNyK1g/R8L
 Q7dqVDRgoqP+Ywl9p6+It0NPbCYrorUZOb95z/FrizNKSowRc8cPtT+MJs7OyZOaiCcE
 qJMge1ieXMMooQ7uzG5sDUJIvlZeI2xFU/ZmIuTl1JbxUI86q2pEw1ClfuPQ7jUkrS/E
 4OspHxdGgSwGUPumCrUwgu8bZn1h/PXKDOZlxm5280xhq98QNkwilwbAvrB8ylqUcIjz
 dzvRPZST1k9aLrQjLOmbH1pN/FJxDrh3Tf7ubXEGjO0jH/YCex0NHvASO+TdMDFrAWNz
 AbbQ==
X-Gm-Message-State: AOAM533Mcxb6bSzqsK8kpPYvSZ1HMsqRa4K0AXZNIBcheQaEOXsbzIfV
 BUMwgkIfBsiMGVyTdV0YJ5LRtJ2ViQxUk1kc
X-Google-Smtp-Source: ABdhPJzBT5v5dwQGGsY/H85KFOY9KneTZW5sK4ZlFEyqqt894YSC0V5eGj5iAQorXQLDi3xIjSBdZA==
X-Received: by 2002:a05:651c:1543:b0:249:a2bd:4a74 with SMTP id
 y3-20020a05651c154300b00249a2bd4a74mr3158875ljp.375.1648569613717; 
 Tue, 29 Mar 2022 09:00:13 -0700 (PDT)
Received: from [192.168.1.244] (81-233-89-221-no75.tbcn.telia.com.
 [81.233.89.221]) by smtp.gmail.com with ESMTPSA id
 p9-20020a056512312900b0044a5312dcbcsm2028709lfd.89.2022.03.29.09.00.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 09:00:07 -0700 (PDT)
Message-ID: <1ca2ff88-4751-acce-6202-abc7d22e4494@gmail.com>
Date: Tue, 29 Mar 2022 18:00:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] ath10k: add support for MSDU IDs for USB devices
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 davem@davemloft.net, kuba@kernel.org
References: <20220327171340.7893-1-erik.stromdahl@gmail.com>
 <875yny1w8t.fsf@kernel.org>
From: Erik Stromdahl <erik.stromdahl@gmail.com>
In-Reply-To: <875yny1w8t.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_090017_396212_D34EBA5F 
X-CRM114-Status: GOOD (  10.42  )
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



On 3/28/22 07:28, Kalle Valo wrote:
> Erik Stromdahl <erik.stromdahl@gmail.com> writes:
> 
>> commit 93bbdec6683e1c8ba2cc4e6 ("ath10k: htt: support MSDU ids with
>> SDIO") introduced MSDU ID allocation in the htt TX path for high latency
>> devices. This feature needs to be enabled for USB as well in order to
>> have a functional TX path.
>>
>> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
> 
> On what hardware and firmware version did you test these patches? I'll
> then add the Tested-on tag:
> 
> https://wireless.wiki.kernel.org/en/users/drivers/ath10k/submittingpatches#tested-on_tag
> 

Hardware: Linksys WUSB6100M
Fw version: QCA9377 hw1.0 USB 1.0.0.299

Above fw version is printed by the driver at startup:

ath10k_log_dbg: usb 1-3 firmware 1.0.0.299 booted

The firmware file can be obtained from here:
https://www.linksys.com/se/support-article?articleNum=198580

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
