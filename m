Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED10F606A327
	for <ath10k@archiver.kernel.org>; Mon,  2 Nov 2026 23:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aTujV16M;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QYdgqyJS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XnlljRANTEs2Cr5cmk+F0MuHRIDHA5pmAW+CqIR41gU=; b=aTujV16MULVv8Y
	sUQU3C8qcuFGSAzLEeNfhptTHZK3a8OKcEtARHcP8iMT7Gdza8Zeo9VictAZBm9D4VqesmNm84fXs
	6RA5UD2k19toFmYMyER3UeIghNMKn3KKRx52skRYdKmNFUgCYaNRYifyVcNUarL6tJzzLXBt7RjDu
	iLU+nsB7D4LRMDMXKIpdMa34rxUsvzE7UFNBTxyPkHSDxSisNYZ0+dSAin8QFeXAA6wpHvJvVY71J
	2jzQdeCjAJuJMhd2e01zto9jxXwwUD83R4/TLJgpAu0KxbPEj3KC2zH4ToTp+wyabcVRHT/qAbSP7
	25UFTAFuq6Z9dHYU9Pug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO1u2-00000000i9w-0uBJ;
	Mon, 02 Nov 2026 23:57:26 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO1tz-00000000i9T-3Yfk
	for ath10k@lists.infradead.org;
	Mon, 02 Nov 2026 23:57:25 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so23446045e9.3
        for <ath10k@lists.infradead.org>; Mon, 02 Nov 2026 15:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793663841; x=1794268641; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XnlljRANTEs2Cr5cmk+F0MuHRIDHA5pmAW+CqIR41gU=;
        b=QYdgqyJSKfMi5Sxy1PLcDuFFmiJiTkgFI4aRXEbuUIVclQGwXPIfmJyPiMLyodkOv2
         5CTlb+THmoNGAxweAdqvHJ/JZcUoOIUA5sTQxJagwN3fgPo5EoaxNutbFgARzwUqtlVR
         HmlOTdVkD3zOkRlcPC6PH4xObsViMSo5dC/2VLCnSJx8qwPE2Fche6diahgg5qEXj8pT
         l6/vDfbOGFvuL0CRnNhhWkSohz8gJSHVM664xt6xSJewRts0lWbH4faI83w595JMXTf5
         h0gqnDvRbV9VYNH8ro75wvFGozxSOOmEwhJqCXKG4WB4mV6pcr/pt+A5z/h/vP7k18T/
         W9Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793663841; x=1794268641;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XnlljRANTEs2Cr5cmk+F0MuHRIDHA5pmAW+CqIR41gU=;
        b=Ho/yTejQaraThfQiPptIFPzy6v70wDk4bbegul7ulAr9RUIYFQpRTrYt3xbxPfdTK8
         Vyp9czlAnqCW/N4q+1trD/3rhrSJC/szszrER0+zgWw5SXcd0P0hYeA11Qua1vZW/hEd
         3IVOum6bZeyV8oqzL3r5ChbGaIgD6DRVpdz28aT3woq6fOJ8+rPtCt1kzlV9NKUpsgA6
         OifTw95bQ9JjkHrhGF5wGiEAtrUod4tKXwDsneFWINwMjcOuUMZXLOvNAgXuaTKx+ZCq
         6Mxg8oZGlzQ3/IkG54WeefrLXSxG7GobgUjsAC2bKVd/iD/pHz8WA4ZGsivE8Fxf5mYv
         tTnQ==
X-Forwarded-Encrypted: i=1; AKwUvByRGECv7IWvb5/rwSN141C61cQ6SNmRMsBfoFQQcD2kcd6rOUDW7F7coGnJ/hvMq76W9aZq5lM=@lists.infradead.org
X-Gm-Message-State: AFq9FYJOOcphjKzudycTe5xj4UrlLu3vwDkyZRukKRw8qMzNRtPArpVa
	1zAphyZCkp3YxHreuF99CXz9en6u8kEEUrgli4IfYticQDDIfR4R1Ke8
X-Gm-Gg: AYBFou0rTOu0M0uEhspmokedFSbdKfsi2nHJJtPOVgg1J2KWb9Up2YG7RXg+tcNxumB
	wCThWvZWO1h5M40R8GAke4cLoCIj5vTlKfpjeOy8kr2nZo+C5gMr3KwPa1y1FzaEDe0+1QC8C9p
	bq1KYebbMuRapJ1zrP7QW36qDjcRgBjx8WO7UNCtiRyQ7HNsiZ+txhUbKax5duWK82m4KtHk8U+
	xLVrYy2Y2pVgB+p4Kmm7iSVGmmM+t49fVlQf8Ne3ZrZYH+q06LNbvfRqpDn6GKYSFtUQ7IwCXDT
	YPknbYI+08ay5paxEtM8yGP3qdpvxLr9+MMffc3fjJa64T/zlg2Yf4VYxq0iMfVToieq2o/lMWx
	ZpUbogwggiFoS3UFr4JBzC+rEgDMxdl9YjLlzhgcsHKQ3vbjrc9SlegtlaPjrG/CwxkUyuPeE9/
	7m4zNuqUgzC7nc43aJWKRki2EtTBOqtw8On+UzwGQ3wv9Ey+oo5az/P1R+mnVtUtxByx9hTesf2
	vj0CDn1ea++CuNSAzQNqMvUJgs5FshJzYxeGLo7uew6s83p4bj7EXk7Br2+g9qD97mfO01qt7yH
	AQ4PpJ0HiSREYBsHdChcAM8eA/7unokWNj6wAcm10Ob5jx29qKNqg20tBKdxG+TAQ4d/y0S0z6j
	Huw==
X-Received: by 2002:a05:600c:8b0a:b0:4a2:e0c:2b0a with SMTP id 5b1f17b1804b1-4ac1709a200mr273537485e9.16.1793663841176;
        Mon, 02 Nov 2026 15:57:21 -0800 (PST)
Received: from ?IPV6:2a02:8086:cd5:c900:c69f:4b72:77ee:5fe1? ([2a02:8086:cd5:c900:c69f:4b72:77ee:5fe1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a922c298sm15883245e9.9.2026.11.02.15.57.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 15:57:20 -0800 (PST)
Message-ID: <c45bdcae-63da-4552-9e35-59ec6a71621a@gmail.com>
Date: Mon, 2 Nov 2026 23:57:18 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 1/3] wifi: ath10k: set the PMF peer flag on
 WCN3990
To: "Nagashima, Shunsuke" <shunsuke@nagashi.ma>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
 ath10k@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Heidelberg <david@ixit.cz>, Fabricio Akio <fabricioakio@gmail.com>,
 Aleksei Kharlamov <aleksei.kharlamov@gmx.de>
References: <20261016-ath10k-series-v1-send-v1-0-c847697b3558@nagashi.ma>
 <20261016-ath10k-series-v1-send-v1-1-c847697b3558@nagashi.ma>
 <CAFEp6-2xY_gM=FRUp3R30TZ-NgT=-eYnyz_BPE0vxEenv+202w@mail.gmail.com>
 <CACB3TCKq--tdL6j+uGR_dxGdy-gHxQhY8p0h6xxqi_4Fd3VEOQ@mail.gmail.com>
Content-Language: en-US
From: Conn O'Griofa <connogriofa@gmail.com>
In-Reply-To: <CACB3TCKq--tdL6j+uGR_dxGdy-gHxQhY8p0h6xxqi_4Fd3VEOQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_155723_907094_B22EDE22 
X-CRM114-Status: GOOD (  11.74  )
X-Spam-Score: -2.1 (--)
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 02/11/2026 22:51, Nagashima, Shunsuke wrote:

> Aleksei, Conn: a firmware file update only helps devices that load that
> file. If you have time, could you make the same change to the
> firmware-N.bin your device loads, test it, and send it to
> linux-firmware?


I can confirm that the unmodified driver with a patched firmware fixes 
the issue on QCA9377 as well. I appended the mfp-support flag to the 
existing flags for both firmware variants that are relevant to my device:

./ath10k-fwencoder --modify --features=ignore-otp-result,mfp-support 
firmware-5.bin
./ath10k-fwencoder --modify 
--features=wowlan,ignore-otp-result,mfp-support firmware-6.bin

Testing each firmware individually confirms the flag is now present, and 
both firmware versions can now reach 300Mbps.

ath10k_pci 0000:02:00.0: firmware ver WLAN.TF.1.0-00002-QCATFSWPZ-5 api 
5 features ignore-otp,mfpcrc32 18db2397
ath10k_pci 0000:02:00.0: firmware ver WLAN.TF.2.1-00021-QCARMSWP-1 api 6 
features wowlan,ignore-otp,mfpcrc32 02bceae2

I would be happy to submit the modified firmware, but I am skeptical 
that it would be accepted? I'm not sure if I've ever observed 
unofficial/modified wifi firmware to ever have been accepted into 
linux-firmware (which seems completely understandable, given the risks).

Conn


