Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A01C433FE
	for <ath10k@archiver.kernel.org>; Sat, 14 May 2022 19:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8CLTsQeXIYMP5yh7U1ctqLwRGwC29zWM6oP4c1XBNsk=; b=t2TVUpz2l/kofp
	MnUVefzX49J01a50+ZCIYDP4rxtBrrnwKZEdVEgBoQevNGPLbmcHea9pQxsdskDEjOkb7g4Sr82q9
	BE8hk5EmiCAzqj7kP2Elyyp+PIOn/r+tXIzLDk6xKXxqTK25Irx9VHn9+3dCwh0N78CqBMz1VRuIw
	FSVRJ0yp7hXfj9iv2rqzqvmiuAQoProFR96O5WuNS/r3izfVDQwfHDcI/QnaQA3FRyjZFB+iyNF5b
	LKjYuuj2BEiOLl792ETRGkutjVR7+SU1t/EcUXY9VZPzKYkOJ1OqOWCZl7Fn+l8UprN9rrZAlK0Ve
	tygo/iyRdu+hlZ3FnZ9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npxVd-0029i7-Ec; Sat, 14 May 2022 19:33:01 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npxVb-0029gn-Ji
 for ath10k@lists.infradead.org; Sat, 14 May 2022 19:33:00 +0000
Received: by mail-lf1-x12c.google.com with SMTP id y32so19731919lfa.6
 for <ath10k@lists.infradead.org>; Sat, 14 May 2022 12:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Kp0Ug+v47eYzPgOz78fUjRwt+4E0szT91XbUKkpzJNM=;
 b=QxxS4zLUOUc0+G26Yxyf7dONLWgYv6cOWDEjnYu6pEqztoiHpdY1879HogFxMYf3cB
 TiFfbHyPqGk85haRsY0hVr7mDDlPnW1xt7E7wEmz0rXeHXH6wDzo7Z7HwX6qy3sFYDqX
 21r0Q3g9lIpF987HbI6re1TWydYMqDFemtKHa8AsWxJdkyOEjdhMiNSbGGStWI+16gyN
 S3KsPjoyOrWk3zDZHfeOV2RHClwpegfOvPUKjV2GgD0xC6AHqZGWJIMHR+xDg9/6wX3n
 IDdTDqxJhy5Q7pnMRKDn3BVABk+TJkLki8/Xwb2IStC7dKzGsVIftbPuTNY1D6YQKqt5
 0zjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Kp0Ug+v47eYzPgOz78fUjRwt+4E0szT91XbUKkpzJNM=;
 b=XTXZGiAXwj4s7drQl6didD/ApScqd76oZPOTVuGYQ5cmE0G+XTUBmoZ4Va1VhmKGbr
 syZ/fMm79SLqePedpQyoTcTh5ijSq/VN2Qy8AIFJG6vBcv/tEA/0ks4voBAl+QYYTM9O
 xbWes+83uPSjqCeSV9r+wPusSQeFj6mx1tC2bya7eOroIiveK4haILIznGM5QDCv+WMQ
 8zK2Gle+wajoVyAgVp3b4kvwhiR1m7B8te3Mg6UQaQSLz7ejotsT3OR/GVezkMiN0XMD
 4kBE4uRWd0GiO9jd51xFcv4Q/of9W5b/NaVjxeA+q9REoBTEOnKs3j/BgnJ3WtBHjB8N
 77OA==
X-Gm-Message-State: AOAM532nQyfFnwnk1654lNH2nxiBx5lB7DQq0tuZgvUwcLxL0/WbhGLP
 SsFajR+KFEqEZsmPHv43kYH/Pw==
X-Google-Smtp-Source: ABdhPJwdd8au+0vtvbq641vlyNJC2kEfL2SQBgdGtBNTNwL3G5mE3kPWcMxnmCspEplTbp0aLzodzw==
X-Received: by 2002:a05:6512:3a86:b0:472:6287:6994 with SMTP id
 q6-20020a0565123a8600b0047262876994mr7659273lfu.16.1652556775666; 
 Sat, 14 May 2022 12:32:55 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 w21-20020ac24435000000b0047255d211ddsm788920lfl.268.2022.05.14.12.32.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 May 2022 12:32:55 -0700 (PDT)
Message-ID: <042e7478-dce3-7e78-e6fd-27251338fce8@linaro.org>
Date: Sat, 14 May 2022 21:32:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] ath10k: do not enforce interrupt trigger type
Content-Language: en-US
To: Steev Klimaszewski <steev@kali.org>, Kalle Valo <kvalo@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-msm@vger.kernel.org
References: <20220513151516.357549-1-krzysztof.kozlowski@linaro.org>
 <87zgjl4e8t.fsf@kernel.org> <3d856d44-a2d6-b5b8-ec78-ce19a3686986@kali.org>
 <3bf28d29-f841-81f7-68f8-3fb7f9c274bf@kali.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3bf28d29-f841-81f7-68f8-3fb7f9c274bf@kali.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220514_123259_688101_6CDDE609 
X-CRM114-Status: GOOD (  12.86  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

T24gMTQvMDUvMjAyMiAyMDowOSwgU3RlZXYgS2xpbWFzemV3c2tpIHdyb3RlOgoKPj4gd2NuMzk5
MCBodzEuMCB0YXJnZXQgMHgwMDAwMDAwOCBjaGlwX2lkIDB4MDAwMDAwMDAgc3ViIDAwMDA6MDAw
MAo+PiBrY29uZmlnIGRlYnVnIDAgZGVidWdmcyAwIHRyYWNpbmcgMCBkZnMgMCB0ZXN0bW9kZSAw
Cj4+IGZpcm13YXJlIHZlcsKgIGFwaSA1IGZlYXR1cmVzIHdvd2xhbixtZ210LXR4LWJ5LXJlZmVy
ZW5jZSxub24tYm1pIGNyYzMyIAo+PiBiM2Q0Yjc5MAo+PiBodHQtdmVyIDMuODYgd21pLW9wIDQg
aHR0LW9wIDMgY2FsIGZpbGUgbWF4LXN0YSAzMiByYXcgMCBod2NyeXB0byAxCj4+Cj4+IFdpdGgg
dGhpcyBwYXRjaCBhcHBsaWVkLCBJIG5vIGxvbmdlciBzZWUgdGhlIGVycm9yIG1lc3NhZ2UgaW4g
dGhlIAo+PiBjb21taXQgbWVzc2FnZSwgd2hlbiBJIHVuYmluZC9iaW5kIHdoZW4gd2lmaSBzdG9w
cyB3b3JraW5nLgo+Pgo+PiBUZXN0ZWQtYnk6IFN0ZWV2IEtsaW1hc3pld3NraSA8c3RlZXZAa2Fs
aS5vcmc+Cj4+Cj4+IC0tIFN0ZWV2Cj4+Cj4gQXBvbG9naWVzIGZvciB0aGUgc2Vjb25kIGVtYWls
IC0gSSd2ZSB0ZXN0ZWQgdGhpcyBub3cgb24gYm90aCB0aGUgTGVub3ZvIAo+IEZsZXggNUcsIGFz
IEkgaGF2ZSBzZWVuIHRoZSBpc3N1ZSBvbiBpdCBhcyB3ZWxsLCBhcyB3ZWxsIGFzIG9uIHRoZSAK
PiBMZW5vdm8gWW9nYSBDNjMwLCB3aGVyZSBJIGRpZCBub3QgYnV0IEkgZGlkIGhhdmUgaXNzdWVz
IHdpdGggYXR0ZW1wdGluZyAKPiB0byByZWJpbmQgdGhlIGRldmljZSwgcHJpb3IgdG8gdGhpcyBw
YXRjaC4KPiAKPiBGaXJtd2FyZSB2ZXJzaW9uIGZvciB0aGUgRmxleCA1RyBpcwo+IAo+IHFtaSBj
aGlwX2lkIDB4MzAyMjQgY2hpcF9mYW1pbHkgMHg0MDAxIGJvYXJkX2lkIDB4ZmYgc29jX2lkIDB4
NDAwNjAwMDAKPiBxbWkgZndfdmVyc2lvbiAweDMyMDgwMDA5IGZ3X2J1aWxkX3RpbWVzdGFtcCAy
MDIwLTExLTE2IDE0OjQ0IAo+IGZ3X2J1aWxkX2lkIAo+IFFDX0lNQUdFX1ZFUlNJT05fU1RSSU5H
PVdMQU4uSEwuMy4yLjAuYzgtMDAwMDktUUNBSExTV1NDODE4MFhNVFBMWi0xCj4gCj4gRmlybXdh
cmUgdmVyc2lvbiBvbiB0aGUgWW9nYSBDNjMwIGlzCj4gCj4gcW1pIGNoaXBfaWQgMHgzMDIxNCBj
aGlwX2ZhbWlseSAweDQwMDEgYm9hcmRfaWQgMHhmZiBzb2NfaWQgMHg0MDAzMDAwMQo+IHFtaSBm
d192ZXJzaW9uIDB4MjAwOTg1NmIgZndfYnVpbGRfdGltZXN0YW1wIDIwMTgtMDctMTkgMTI6Mjgg
Cj4gZndfYnVpbGRfaWQgUUNfSU1BR0VfVkVSU0lPTl9TVFJJTkc9V0xBTi5ITC4yLjAtMDEzODct
UUNBSExTV01UUExaLTEKPiAKClRoYW5rcyBmb3IgdGVzdGluZywgbXVjaCBhcHByZWNpYXRlZCEK
CgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEw
awo=
