Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D16B6D0D785
	for <ath10k@archiver.kernel.org>; Fri, 11 Oct 2024 12:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JYXhI4uqaBPdca/xkSzazU6us1mcfLn79gTY/K2O1Ns=; b=oAfUzEOvkhH9Cqt6OVtEK/fph2
	AuNZ+7oD4fGpN3daC9MKSrtoRnQk+1v+FZ3xadJT05jJjgX9UkRGvUBrEOw2rWYomMRRKCL4NNZ/q
	3LaIBYvjnIgB8AYKjKK+ALRtLAonU3PTIceem5YTEiTZzXfm1S24itZnLJh0HWM2jQccAWcybiv9D
	WE55t9y/W3OoAYKoZhtJv+BNZ+5hs/6k+mTWBmTEcfoMZj2EzW6TLOY9F6bge+hi+r8aDD7cmM9fe
	3MrEUlHuyuJPIsHcDz+nuTRVtvPxfXnVfGJXWRJNRKV6IF5EB0GXUgulw9FZLtMoRwIkvmjbEo0lI
	WNxQBOSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szF52-0000000GLz9-0YR5;
	Fri, 11 Oct 2024 12:49:16 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szF4z-0000000GLwg-11Q0
	for ath10k@lists.infradead.org;
	Fri, 11 Oct 2024 12:49:15 +0000
Received: from [141.14.220.45] (g45.guest.molgen.mpg.de [141.14.220.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id AE7AC61E5FE05;
	Fri, 11 Oct 2024 14:48:44 +0200 (CEST)
Message-ID: <8eda1bd2-88fc-4262-aec0-6f88a73797ef@molgen.mpg.de>
Date: Fri, 11 Oct 2024 14:48:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: failed to remove key (0, ce:ce:1e:27:bb:e0) from hardware (-110)
 (ETIMEDOUT)
To: James Prestwood <prestwoj@gmail.com>
Cc: Kalle Valo <kvalo@kernel.org>, Baochen Qiang <quic_bqiang@quicinc.com>,
 linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>
References: <d8253ab3-f4f0-40fd-a550-d75eef121b56@molgen.mpg.de>
 <8be8619d-f09f-43b2-ada8-2fca2a7d8ea5@gmail.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <8be8619d-f09f-43b2-ada8-2fca2a7d8ea5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_054913_446510_3292A105 
X-CRM114-Status: UNSURE (   9.30  )
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

Dear James,


Am 04.09.24 um 16:09 schrieb James Prestwood:

> On 9/4/24 3:45 AM, Paul Menzel wrote:

>> Linux 6.11-rc6+ logged the warning below when resuming from ACPI S3 
>> (or unloading and loading the `ath10k_core`/`ath10k_pci` modules) 
>> having been connected to an AVM network:
>>
>>     wlp58s0: failed to remove key (0, ce:ce:1e:27:bb:e0) from hardware (-110)
>>
>> Error code 110 is the value for ETIMEDOUT. I saw James patch [1], and 
>> applied it, and the error is still there (as expected).
> 
> My patch won't actually fix the timeout, I just lowered the time that 
> ath10k would wait before it continued which fixed some incompatibility 
> on the AP side of things. Based on your logs though, it appears you 
> already got disconnected before the failure to remove the key...

I am still applying your patch manually on the current master branch, 
and it looks like it hasn’t still been reviewed. Maybe it’s due to the 
RFC tag. Do you plan on moving it ahead?


Kind regards,

Paul


>> [1]: https://lore.kernel.org/all/20240814164507.996303-1-prestwoj@gmail.com/

