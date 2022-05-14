Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A76C433EF
	for <ath10k@archiver.kernel.org>; Sat, 14 May 2022 18:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KRxB+I0gsY5ZaNYemAGXXCs7CeYYSNiD52dB7TQKM78=; b=bY4duXpMSNCqL2
	IjyPHuWpaFIVxCmR50PzBsVz+uPzvThXyJy5yVmZI/YJDX0ZhPy8zB9vEmSS6xG7RFgJfDQ4H0Yzu
	GkhMRgAZBoK6aOB+xyA4Ytrq0Kw0LzV+aH+2fqWu0DFnvIlRr4w4mH9ipZQPQfzjqFzjt67FKsvoS
	+VdETXLnwizQxKz00Rw8JcDh1QaCYt5mcfl9T3PgNk0hlE8X9XFaProuVBBdTKoT6zhQ6Fru+GRf0
	1boHkstQgPyR5FmWf511zCRMyc2fE5NF0YaZXXgTSs1ciGmsvlFe4D8HWAzUbhNpuFAk90M1FOIFE
	ucAdfKMOMOYTTB5lDQgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npwCd-0020r7-Px; Sat, 14 May 2022 18:09:19 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npwCb-0020ql-GY
 for ath10k@lists.infradead.org; Sat, 14 May 2022 18:09:18 +0000
Received: by mail-oi1-x22b.google.com with SMTP id v65so13900845oig.10
 for <ath10k@lists.infradead.org>; Sat, 14 May 2022 11:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kali.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=9VxSQhrcxP+Zxiex+/IGfZgunbN+QMPUuJtoX8ADJq0=;
 b=gwi8wGZKaAhyEL2N8U2FdTZRADeWgto+anF1Hh8tRJwSSQjeEhaDwQcYwrSGkxXZ0W
 BCnI9tOAs0bAF5kUYusrUQSQ0N5RSoYQ3/USaCh27tau0QhOVZfZuHOhEDaS7aLc+8HU
 dnKwj/A8/ag0Bg+w26MOFg3Sej3B3TuZ/jPyZHQMU3KUEXOu07NXmArf+6PcFmy7olm0
 vbJ5cYaHQt6BfVv3iaGLTcz2U1ovsCpDQleUmuoPAW9taQVe1uBMhabIY1Twl1gBjcLw
 6rGUvCe89RNNnWV+75sAC5j4pzGeBBWu97+HuM7nEEnWLTSnqUukEukd9a1Lk7nzb96O
 Mcyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=9VxSQhrcxP+Zxiex+/IGfZgunbN+QMPUuJtoX8ADJq0=;
 b=IRFj39FBIwArLp0OTPJKTrw0LjbFfsDSAbwablpQvGxfuDbGBH1AwshKaVugia0nKK
 wogMN/LLRK6U0ig2Bs0n/eNjVlPCzYCYWj5snYRjDzzvFi6b789k/DTzrN4VYkhLRrZk
 XJ56iqdw6GC64ppmJNJ+dM7/xcBxIK7LO9YOgJpHiL2CvR9XYiI1x2qtYVHMstEmWS6f
 hoRaB7UjA/SdyCufJJyoe00SwIYhpEX9w2GjLb033D5SzKvgp6OkluGrPjIy2FhON18e
 HRZJ+li+MHL3PyDi2q9+aJJOUsEMKmrnL5dDBMFJNhD4Oi7dLt5BRGROB9qhB0HaVMft
 1NFg==
X-Gm-Message-State: AOAM5331YimRsRIxMDFlg2I2HjBwoFPO4zF03ssHr7pFgCsx1c3/d+Qt
 +Dbdzb73HIy5cgZcb01NpG5hZA==
X-Google-Smtp-Source: ABdhPJwrvgAl50ASW9OPusxZQgrhHauO8CR+M14xcbBoh7KOYWtJ47rV3oDIQEF/CrNs8vca+izgNw==
X-Received: by 2002:a05:6808:98f:b0:325:d44d:62d6 with SMTP id
 a15-20020a056808098f00b00325d44d62d6mr10052930oic.145.1652551754058; 
 Sat, 14 May 2022 11:09:14 -0700 (PDT)
Received: from [192.168.11.16] (cpe-173-173-107-246.satx.res.rr.com.
 [173.173.107.246]) by smtp.gmail.com with ESMTPSA id
 y127-20020aca3285000000b00328e70cae5csm774163oiy.43.2022.05.14.11.09.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 May 2022 11:09:13 -0700 (PDT)
Message-ID: <3bf28d29-f841-81f7-68f8-3fb7f9c274bf@kali.org>
Date: Sat, 14 May 2022 13:09:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH] ath10k: do not enforce interrupt trigger type
Content-Language: en-US
From: Steev Klimaszewski <steev@kali.org>
To: Kalle Valo <kvalo@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Govind Singh <govinds@codeaurora.org>,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm@vger.kernel.org
References: <20220513151516.357549-1-krzysztof.kozlowski@linaro.org>
 <87zgjl4e8t.fsf@kernel.org> <3d856d44-a2d6-b5b8-ec78-ce19a3686986@kali.org>
In-Reply-To: <3d856d44-a2d6-b5b8-ec78-ce19a3686986@kali.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220514_110917_607127_23B91D6D 
X-CRM114-Status: GOOD (  15.76  )
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

Ck9uIDUvMTQvMjIgMTI6MDUgQU0sIFN0ZWV2IEtsaW1hc3pld3NraSB3cm90ZToKPgo+IE9uIDUv
MTMvMjIgMTA6NTcgQU0sIEthbGxlIFZhbG8gd3JvdGU6Cj4+IEtyenlzenRvZiBLb3psb3dza2kg
PGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JpdGVzOgo+Pgo+Pj4gSW50ZXJydXB0
IGxpbmUgY2FuIGJlIGNvbmZpZ3VyZWQgb24gZGlmZmVyZW50IGhhcmR3YXJlIGluIGRpZmZlcmVu
dCAKPj4+IHdheSwKPj4+IGV2ZW4gaW52ZXJ0ZWQuwqAgVGhlcmVmb3JlIGRyaXZlciBzaG91bGQg
bm90IGVuZm9yY2Ugc3BlY2lmaWMgdHJpZ2dlcgo+Pj4gdHlwZSAtIGVkZ2UgcmlzaW5nIC0gYnV0
IGluc3RlYWQgcmVseSBvbiBEZXZpY2V0cmVlIHRvIGNvbmZpZ3VyZSBpdC4KPj4+Cj4+PiBBbGwg
UXVhbGNvbW0gRFRTSSB3aXRoIFdDTjM5OTAgZGVmaW5lIHRoZSBpbnRlcnJ1cHQgdHlwZSBhcyBs
ZXZlbCBoaWdoLAo+Pj4gc28gdGhlIG1pc21hdGNoIGJldHdlZW4gRFRTSSBhbmQgZHJpdmVyIGNh
dXNlcyByZWJpbmQgaXNzdWVzOgo+Pj4KPj4+IMKgwqAgJCBlY2hvIDE4ODAwMDAwLndpZmkgPiAv
c3lzL2J1cy9wbGF0Zm9ybS9kcml2ZXJzL2F0aDEwa19zbm9jL3VuYmluZAo+Pj4gwqDCoCAkIGVj
aG8gMTg4MDAwMDAud2lmaSA+IC9zeXMvYnVzL3BsYXRmb3JtL2RyaXZlcnMvYXRoMTBrX3Nub2Mv
YmluZAo+Pj4gwqDCoCBbwqDCoCA0NC43NjMxMTRdIGlycTogdHlwZSBtaXNtYXRjaCwgZmFpbGVk
IHRvIG1hcCBod2lycS00NDYgZm9yIAo+Pj4gaW50ZXJydXB0LWNvbnRyb2xsZXJAMTdhMDAwMDAh
Cj4+PiDCoMKgIFvCoMKgIDQ0Ljc2MzEzMF0gYXRoMTBrX3Nub2MgMTg4MDAwMDAud2lmaTogZXJy
b3IgLUVOWElPOiBJUlEgaW5kZXggCj4+PiAwIG5vdCBmb3VuZAo+Pj4gwqDCoCBbwqDCoCA0NC43
NjMxNDBdIGF0aDEwa19zbm9jIDE4ODAwMDAwLndpZmk6IGZhaWxlZCB0byBpbml0aWFsaXplIAo+
Pj4gcmVzb3VyY2U6IC02Cj4+IFNvIHlvdSB0ZXN0ZWQgb24gV0NOMzk5MD8gT24gd2hhdCBmaXJt
d2FyZSB2ZXJzaW9uPyBJIGNhbiBhZGQgdGhlCj4+IFRlc3RlZC1vbiB0YWcgaWYgeW91IHByb3Zp
ZGUgdGhhdC4KPj4KPiBIZWxsbyBLcnp5c3RvZiwgS2FsbGUsCj4KPiBJIGhhdmUgc2VlbiB0aGlz
IGlzc3VlIGFzIHdlbGwgb24gYSBMZW5vdm8gRmxleCA1Rywgd2hpY2ggaGFzIGEgV0NOMzk5MDoK
Pgo+IHdjbjM5OTAgaHcxLjAgdGFyZ2V0IDB4MDAwMDAwMDggY2hpcF9pZCAweDAwMDAwMDAwIHN1
YiAwMDAwOjAwMDAKPiBrY29uZmlnIGRlYnVnIDAgZGVidWdmcyAwIHRyYWNpbmcgMCBkZnMgMCB0
ZXN0bW9kZSAwCj4gZmlybXdhcmUgdmVywqAgYXBpIDUgZmVhdHVyZXMgd293bGFuLG1nbXQtdHgt
YnktcmVmZXJlbmNlLG5vbi1ibWkgY3JjMzIgCj4gYjNkNGI3OTAKPiBodHQtdmVyIDMuODYgd21p
LW9wIDQgaHR0LW9wIDMgY2FsIGZpbGUgbWF4LXN0YSAzMiByYXcgMCBod2NyeXB0byAxCj4KPiBX
aXRoIHRoaXMgcGF0Y2ggYXBwbGllZCwgSSBubyBsb25nZXIgc2VlIHRoZSBlcnJvciBtZXNzYWdl
IGluIHRoZSAKPiBjb21taXQgbWVzc2FnZSwgd2hlbiBJIHVuYmluZC9iaW5kIHdoZW4gd2lmaSBz
dG9wcyB3b3JraW5nLgo+Cj4gVGVzdGVkLWJ5OiBTdGVldiBLbGltYXN6ZXdza2kgPHN0ZWV2QGth
bGkub3JnPgo+Cj4gLS0gU3RlZXYKPgpBcG9sb2dpZXMgZm9yIHRoZSBzZWNvbmQgZW1haWwgLSBJ
J3ZlIHRlc3RlZCB0aGlzIG5vdyBvbiBib3RoIHRoZSBMZW5vdm8gCkZsZXggNUcsIGFzIEkgaGF2
ZSBzZWVuIHRoZSBpc3N1ZSBvbiBpdCBhcyB3ZWxsLCBhcyB3ZWxsIGFzIG9uIHRoZSAKTGVub3Zv
IFlvZ2EgQzYzMCwgd2hlcmUgSSBkaWQgbm90IGJ1dCBJIGRpZCBoYXZlIGlzc3VlcyB3aXRoIGF0
dGVtcHRpbmcgCnRvIHJlYmluZCB0aGUgZGV2aWNlLCBwcmlvciB0byB0aGlzIHBhdGNoLgoKRmly
bXdhcmUgdmVyc2lvbiBmb3IgdGhlIEZsZXggNUcgaXMKCnFtaSBjaGlwX2lkIDB4MzAyMjQgY2hp
cF9mYW1pbHkgMHg0MDAxIGJvYXJkX2lkIDB4ZmYgc29jX2lkIDB4NDAwNjAwMDAKcW1pIGZ3X3Zl
cnNpb24gMHgzMjA4MDAwOSBmd19idWlsZF90aW1lc3RhbXAgMjAyMC0xMS0xNiAxNDo0NCAKZndf
YnVpbGRfaWQgClFDX0lNQUdFX1ZFUlNJT05fU1RSSU5HPVdMQU4uSEwuMy4yLjAuYzgtMDAwMDkt
UUNBSExTV1NDODE4MFhNVFBMWi0xCgpGaXJtd2FyZSB2ZXJzaW9uIG9uIHRoZSBZb2dhIEM2MzAg
aXMKCnFtaSBjaGlwX2lkIDB4MzAyMTQgY2hpcF9mYW1pbHkgMHg0MDAxIGJvYXJkX2lkIDB4ZmYg
c29jX2lkIDB4NDAwMzAwMDEKcW1pIGZ3X3ZlcnNpb24gMHgyMDA5ODU2YiBmd19idWlsZF90aW1l
c3RhbXAgMjAxOC0wNy0xOSAxMjoyOCAKZndfYnVpbGRfaWQgUUNfSU1BR0VfVkVSU0lPTl9TVFJJ
Tkc9V0xBTi5ITC4yLjAtMDEzODctUUNBSExTV01UUExaLTEKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vYXRoMTBrCg==
