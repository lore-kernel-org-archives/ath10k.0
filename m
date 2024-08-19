Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B982C3DA4A
	for <ath10k@archiver.kernel.org>; Mon, 19 Aug 2024 11:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/fkJFOFr4Pi+TqJs44xdKWi0c5WGA7D3bWDgHMSYpt4=; b=YXsttrXocTBLY5L4Bma8T6UmkA
	c/iHZ52Wa1VwHtFmwyO1JS0lg63nZRtK6Q0oYz+ZlzstW5JmYGwr5+xxTi7kYEgiqIGgJx2CgL38j
	4yxVi4oarOrJaelRb7XpzJaBc1I2VYDn7YOsBoWdIuHoFKBn9Ck7bRedBOvZ19xUli1M8HWiRI8Bx
	md2hSDd1JIFjX1WJgdFSdUvq71BTY2z4K2i2OzQTLir6jGXN01E+5GWxHxTgd10HVZ+AVrTGpsdSw
	Ct5+ci1MxbWdF2JOnid9efxWEpwmi0EfNullMqfGObthvastAfJENcrWWJwgMxFBFpb4/fRTzpTQT
	qhwkwJsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg0xv-00000001Ixu-0yFn;
	Mon, 19 Aug 2024 11:54:27 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg0tL-00000001Hig-15ko
	for ath10k@lists.infradead.org;
	Mon, 19 Aug 2024 11:49:45 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-6aef423f80aso38561327b3.2
        for <ath10k@lists.infradead.org>; Mon, 19 Aug 2024 04:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724068182; x=1724672982; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/fkJFOFr4Pi+TqJs44xdKWi0c5WGA7D3bWDgHMSYpt4=;
        b=ZBtFF0I3YEuJzB5/y9tVwvRmCCzlYEjjOJZhKKzZNILkFsThi0nAxvlJlLwo9jMLMX
         UPXA2W3g/yVIa6AeABwMvXz0VW+PmRKnUBinY0jBLvMk5CRt0cunEjJ8EVebAHoeLfhi
         v8aO2W7yxeVKWv5ZBb4A3A1RD1Jy3qN1sTd/o/k5gT+aI8Yk01sLOjAtiL3GwPisDje4
         DiZVXS7q/1b1g73mw016bb/MYRKS+JCCwJMmCtq4t7Fi6NTgVOzAbtGm/Rs2930+IMce
         hJ7eieJ1xXG06RuUMZ7pGJm49vdOK1RlS9Z8n5oFpbUtkt2hKypF7JhCCnN7lkwrIW+j
         osmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724068182; x=1724672982;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/fkJFOFr4Pi+TqJs44xdKWi0c5WGA7D3bWDgHMSYpt4=;
        b=DWMBT55SG1AS7cDUDgBN5vZFVj2L/Xds0lifnKzMEWNRbj/SZz+t+5b+jAQyKz4yVO
         P7qOam11qLZV3yn95Qk6JwpSRVb9Yai+XVk0a2j31nwggyd0TJpDfHY004zQqP20yzwF
         72ETYT8h1jRie2NrUHGjBOiZ/IyU+QdfYzj4+/kqpawBwY5OUEKlVc9+EWVd9ecINxyw
         rhkB0pSeAT+YBBGg3YTnV4nME4/g5pW8iEMrvdQE3C3BWuw0P7wjHVZTqOPMlibMKDYy
         YEhwGC3Jh2/7iXF7nISpK1VriUYdTWBv8/ujqMyXWnDiqgSY+F790WGeMoSC9jOdhami
         2gXQ==
X-Gm-Message-State: AOJu0YxJZgxCZtMFJLVeaj4Gk0phfvg6mnvK6svTqdKvTIQ/4C9+k0Ce
	OBMoUrhulMfx2VtkQyee+9l28MP8KxLeWmqNYj6gwUGL23oiaWg9
X-Google-Smtp-Source: AGHT+IEPF+ruZt+enu9Zc76jLGW3GhKXGX4gupbsfyR2h5pFG8ZPX6q89/VuSpV3Do5Y7u8lpghbFA==
X-Received: by 2002:a05:690c:6ac4:b0:64a:7040:2d8a with SMTP id 00721157ae682-6b1b90c5ef1mr121789817b3.23.1724068181672;
        Mon, 19 Aug 2024 04:49:41 -0700 (PDT)
Received: from [10.100.121.195] ([152.193.78.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf6fe3a579sm41765766d6.73.2024.08.19.04.49.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 04:49:41 -0700 (PDT)
Message-ID: <ba213369-ae0a-47ec-b5b4-31d4eeb5f404@gmail.com>
Date: Mon, 19 Aug 2024 04:49:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 0/1] wifi: ath10k: improvement on key removal failure
To: Felix Kaechele <felix@kaechele.ca>, linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org
References: <20240814164507.996303-1-prestwoj@gmail.com>
 <10435420-4f1f-4a56-aacd-41866ae7dac3@kaechele.ca>
Content-Language: en-US
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <10435420-4f1f-4a56-aacd-41866ae7dac3@kaechele.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_044943_341495_D8EF9865 
X-CRM114-Status: GOOD (  10.11  )
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

Hi Felix,

On 8/16/24 5:53 PM, Felix Kaechele wrote:
> I was somewhat hoping that it could fix the issues I'm having with my 
> QCA9379 as well, but it seems that's not the case.
> Still getting
>
> [ 7660.485652] ath10k_sdio mmc1:0001:1: failed to install key for vdev 
> 0 peer 76:ac:b9:xx:xx:xx: -110
> [ 7660.485679] wlan0: failed to set key (2, ff:ff:ff:ff:ff:ff) to 
> hardware (-110)
> [ 7660.509935] wlan0: deauthenticating from 76:ac:b9:xx:xx:xx by local 
> choice (Reason: 1=UNSPECIFIED)
> [ 7661.836653] wlan0: authenticate with b2:8b:a9:xx:xx:xx (local 
> address=de:56:bb:xx:xx:xx)
> [ 7661.836685] wlan0: send auth to b2:8b:a9:xx:xx:xx (try 1/3)
> [ 7661.849449] wlan0: authenticated
> [ 7661.853884] wlan0: associate with b2:8b:a9:xx:xx:xx (try 1/3)
> [ 7661.902242] wlan0: RX AssocResp from b2:8b:a9:xx:xx:xx 
> (capab=0x1111 status=0 aid=2)
> [ 7661.913192] wlan0: associated
> [ 7662.187718] wlan0: Limiting TX power to 24 (24 - 0) dBm as 
> advertised by b2:8b:a9:xx:xx:xx
>
> once every hour.
>
> That's unfortunate.
In your case it looks like a failure on a group re-key, which makes 
sense that you would see a disconnect. Definitely unfortunate.
>
> Regards,
> Felix

