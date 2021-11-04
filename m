Return-Path: <SRS0=jkzz=PX=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 216FAC433F5
	for <ath10k@archiver.kernel.org>; Thu,  4 Nov 2021 15:51:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC136611C0
	for <ath10k@archiver.kernel.org>; Thu,  4 Nov 2021 15:51:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC136611C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hsYMi9c3F4UdzCDulQ0h3I0NnKlh1U9Gl6eRfcaHrlM=; b=p5sbRizqJ8d8Hs
	Ndb4DBaJsMntSbZjBG5zGOQm3WXw94BTSTyscjfCOoxSQzbqCGsHhl3sdxscBmjzXWcHJzlALQ8yP
	0Sq4XU/rtdGwr0HkljihMNEgh2ITlMyNHrs/CdxHbZDXzIHPink2QXNsr4xbestr0daLXSft8Tjwr
	66YdDsD7H1+PBe5ShgEvPlAY9YZjxujkL48DZF30fryCerzghFmqIWq46R1TA2mrFT/avV7hzRoX7
	VSxkqRdkz/S90zsUKre6erKsU7Rt/yhv3oYU+r3EA+4YV8R7q617xy650p8EcISHzRLhd2vxs+fXN
	eQQSkHCuDS+jzhuRocBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mif1B-009Jqm-Fq; Thu, 04 Nov 2021 15:51:09 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mif18-009Jpp-HZ
 for ath10k@lists.infradead.org; Thu, 04 Nov 2021 15:51:07 +0000
Received: by mail-wr1-x432.google.com with SMTP id t30so9318312wra.10
 for <ath10k@lists.infradead.org>; Thu, 04 Nov 2021 08:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WZb02HUNcpyrSV5l5/+XMe5AMoc6YwLyY8T5euRMbL8=;
 b=kw1zp2Tegl4Kqb4SQ0i5nA93CA98pd7hYLtkw13rlOMEQZ+8Q418AzSmPVcyedY74C
 ABTDfoiZNmd1s4NmsY4PWLZhgb3Y1XfqgBLaWDRnQH+/hLeAofrOwy7p8lZsjZSugL3F
 qrmL7LzDpqv5BwpI1UxzYHz/nPrF7LPiHH5C3sKTPWd3H/lECZQohDF+Ynq7FWOlIIgS
 /aPrZ/MhApbdHIyUnl4liqM7yWj9yl03OnkwXGaX+xZbE2IgwRGwXsJAmP+kvLNTw606
 uTKDJKSeDBWCs1LcRwCwkV1jPQ1fCNcpeM/tbxb8ZP7j1CilcdcHqsXUIgJKjP9eWS94
 FLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WZb02HUNcpyrSV5l5/+XMe5AMoc6YwLyY8T5euRMbL8=;
 b=vSuiO/Bx+6hvpL9CZbONyltMSuXtQaxgUCG93IbiiTRgHDO0/raXA9EMQ7zuP/y0zG
 EFjgCZlctdwyJHYRaMI8x7Xq5OWTnatr5XIkRHlL3DQ4HOD06TeS6Na4whzcRabEyoqF
 rwTcV93KwWboNrQ6qfEXZFR/YHV2bfpM7a8WDo+ZE+5pX7DzKX0W+P4vvjmJXadIfhb7
 hxBuFy0SaZVIv7CAOqj8HlefpgTpubHRT8DkyNIgxbMeGQWy2CdXzK6FDSMUfFWPY4QM
 twZrqd5xRRgQsoZD0Rz2xEv7uZ3HRg4d+C1tT2JA2lLh8kWsVNY6RnyBHgoTTEnQeV53
 rjzQ==
X-Gm-Message-State: AOAM531QPqwqy9fyzTufLlR5uSB/1z2vzzzqxWvMn4RJq12gocsAmlS+
 hGWkk0qSrhxlyoXQ38zuFzwW23+FwNuB9A==
X-Google-Smtp-Source: ABdhPJyDTpRBmB3xRPfE1CErEHrPH0QFPa6OVsRksW9o7hV8xA9OzQNF3oJjV7lgeE4GnIlESrqjZA==
X-Received: by 2002:adf:ce8b:: with SMTP id r11mr45456071wrn.294.1636041064535; 
 Thu, 04 Nov 2021 08:51:04 -0700 (PDT)
Received: from debian64.daheim (p5b0d7fa5.dip0.t-ipconnect.de. [91.13.127.165])
 by smtp.gmail.com with ESMTPSA id e12sm6714724wrq.20.2021.11.04.08.51.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 08:51:04 -0700 (PDT)
Received: from localhost.daheim ([127.0.0.1])
 by debian64.daheim with esmtp (Exim 4.95)
 (envelope-from <chunkeey@gmail.com>) id 1mie48-00085z-QO;
 Thu, 04 Nov 2021 16:51:03 +0100
Message-ID: <179edf00-3ae0-3964-3433-015da8274aff@gmail.com>
Date: Thu, 4 Nov 2021 16:51:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [RFC net-next/wireless-next v1 2/2] ath10k: move
 device_get_mac_address() and pass errors up the chain
Content-Language: de-DE
To: Mathias Kresin <dev@kresin.me>, netdev@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath10k@lists.infradead.org
Cc: Ansuel Smith <ansuelsmth@gmail.com>, Kalle Valo <kvalo@codeaurora.org>,
 "David S . Miller" <davem@davemloft.net>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Len Brown <lenb@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Michael Walle <michael@walle.cc>, Arnd Bergmann <arnd@arndb.de>
References: <20211030174111.1432663-1-chunkeey@gmail.com>
 <20211030174111.1432663-2-chunkeey@gmail.com>
 <2caec4e0-94f4-915c-60d1-c78e7bdc5364@kresin.me>
From: Christian Lamparter <chunkeey@gmail.com>
In-Reply-To: <2caec4e0-94f4-915c-60d1-c78e7bdc5364@kresin.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211104_085106_620261_DA07B685 
X-CRM114-Status: GOOD (  11.05  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

SGkgTWF0aGlhcywKCk9uIDAyLzExLzIwMjEgMjM6MDgsIE1hdGhpYXMgS3Jlc2luIHdyb3RlOgo+
IDEwLzMwLzIxIDc6NDEgUE0sIENocmlzdGlhbiBMYW1wYXJ0ZXI6Cj4+IC0tLSBhL2RyaXZlcnMv
bmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvYWhiLmMKPj4gKysrIGIvZHJpdmVycy9uZXQvd2lyZWxl
c3MvYXRoL2F0aDEway9haGIuYwo+PiBAQCAtNzQ1LDkgKzc0NSwxMSBAQCBzdGF0aWMgaW50IGF0
aDEwa19haGJfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4gwqDCoMKgwqDC
oCBzaXplID0gc2l6ZW9mKCphcl9wY2kpICsgc2l6ZW9mKCphcl9haGIpOwo+PiDCoMKgwqDCoMKg
IGFyID0gYXRoMTBrX2NvcmVfY3JlYXRlKHNpemUsICZwZGV2LT5kZXYsIEFUSDEwS19CVVNfQUhC
LAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGh3X3JldiwgJmF0aDEwa19h
aGJfaGlmX29wcyk7Cj4+IC3CoMKgwqAgaWYgKCFhcikgewo+PiAtwqDCoMKgwqDCoMKgwqAgZGV2
X2VycigmcGRldi0+ZGV2LCAiZmFpbGVkIHRvIGFsbG9jYXRlIGNvcmVcbiIpOwo+PiAtwqDCoMKg
wqDCoMKgwqAgcmV0dXJuIC1FTk9NRU07Cj4+ICvCoMKgwqAgaWYgKElTX0VSUihhcikpIHsKPj4g
K8KgwqDCoMKgwqDCoMKgIHJldCA9IFBUUl9FUlIoYXIpOwo+PiArwqDCoMKgwqDCoMKgwqAgaWYg
KHJldCAhPSAtRVBST0JFX0RFRkVSKQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZfZXJy
KCZwZGV2LT5kZXYsICJmYWlsZWQgdG8gYWxsb2NhdGUgY29yZTogJWRcbiIsIHJldCk7Cj4gCj4g
VGhlcmUncyBhIGhlbHBlciBmb3IgdGhhdDogZGV2X2Vycl9wcm9iZSgpLgoKSSB3YXMgbG9va2lu
ZyBmb3IgdGhhdC4gVGhhbmsgeW91ISA6LSkKKEkgbmVlZCB0byBjaGVjayBpZiB0aGlzIGRldmlj
ZV9nZXRfbWFjX2FkZHJlc3MoKSBhbGwgd29ya3MKd2l0aCA1LjE1LW5leHQgb3Igbm90LiBJdCdz
IHByb2JhYmx5IGVhc2llciB0byB3YWl0IHVudGlsCjUuMTYtcmMxLXd0IGdldHMgcmVsZWFzZWQp
LgoKUmVnYXJkcywKQ2hyaXN0aWFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
