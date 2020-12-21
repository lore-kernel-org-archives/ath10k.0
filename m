Return-Path: <SRS0=1k1S=FZ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FAKE_REPLY_A1,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F3B4C433DB
	for <ath10k@archiver.kernel.org>; Mon, 21 Dec 2020 12:17:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 589192223E
	for <ath10k@archiver.kernel.org>; Mon, 21 Dec 2020 12:17:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 589192223E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:
	From:To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3FT6vPusndPKuOzyapNI+vl2q+wQQ0tDViTTsssdA1M=; b=DdVIvFOj4GxQnytSwhV+NG+0A8
	Ni5kLSH3UQVPshdPminXJOSmQB3BqQLEFvhWgJxJpiW5R9rNTEV0+zqK5Fyl723M7mxBtvrjtO3UD
	6wYcbuzV8ys+Vx1025zMzWk1xOOLuyRZ15sCb2ZLGiUOJ9dCclic3/zXsOgMQTkf/ppgucwSEpYrg
	8Tbt9g9kokHcnwz5XqKs//x7myKcwlqU3rrWgvegI2ld5cbCCZtcJnQ0Zl0N2mWxMqQG5Tt4+LEmi
	yFHbJSUmqs/GndXT8bc0cxHewo/bZT1CEP8TiVXjnvqUGliG/OtrxulyHDUGtG8joRJPEhY+8zIox
	QA1L9YkQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krK6H-0003qW-Ii; Mon, 21 Dec 2020 12:15:41 +0000
Received: from mout.gmx.net ([212.227.15.19])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krK6E-0003q4-5Z
 for ath10k@lists.infradead.org; Mon, 21 Dec 2020 12:15:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1608552922;
 bh=00xwXvPNNGlbI7Cto4qngICHBvflUeaVNeSB9oY8N6E=;
 h=X-UI-Sender-Class:To:Cc:Reply-To:From:Subject:Date;
 b=W3lKbbI4kwCtedz/VOr+ISLnImBHIjoBWXznZWdlz0dm1YQw1shcCxd+7lFAgI2NG
 owfZURE9RUJztse+zcQp5GnH4xJy/eVy22Mdqe6IkQ3WWIezM+h0AH1DLkEgDBA+J3
 d2GyuZcrIybBmgg3cH1JFCGq86TOiJpQlYpQqnp0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.1.100] ([91.18.227.215]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MbirE-1kLqtQ0T4Y-00dBpo; Mon, 21
 Dec 2020 13:15:22 +0100
To: =?UTF-8?Q?Alvin_=c5=a0ipraga?= <ALSI@bang-olufsen.dk>
From: "sparks71@gmx.de" <sparks71@gmx.de>
Subject: Re: [PATCH] Revert "ath: add support for special 0x0 regulatory
 domain"
Message-ID: <a0c917eb-181d-5a83-d1ad-b5ddd5e719bf@gmx.de>
Date: Mon, 21 Dec 2020 13:15:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-US
X-Provags-ID: V03:K1:jpXrUR93XLZnfXTuX19xVJHJzRk2hMwUQK4i/8R5uCG4/KgyOeW
 sYhPRoyWz3Z8bGoC5aXXC1QPMqBHH02rgdJ8fzxRnBF5VKaeKe4JovRvBeM2uRauHe+fN+a
 ZT8AdJQhLpAw/ro4ATK1CCAfxgn8aI4KoZKs2raBj14dUIyIIXKeZ32TSrm2ntWsWvF+ZPc
 ytrb9/3FwLuRfr8St8ZVQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7KfRuC0E1Qg=:Ew1CyNb6dUTtVRDWCg9w1Q
 uldLG9ukb9ONc++UAtCgIGD+lytqHEA6L7yJekIRDuV6zAP9gSKPAxK3p59q2PL95hQbtn82m
 dl3kyUtyTkGWjv+S3qdedIiVk3SaY0H+5cSMu1jVlbtt9iBT3zrN69Iw5Uxx8PlBzqs/ANA3G
 xeluxtW4kFIJ9zy97nc13ItYQfyEEFQAQ831QPi7LEUazwp3+84X1Ovfm5Rrdd6w4rUhtoArW
 dnndfFhd2bJkLMS94Ron3n/ZPcYr1odTCuYiiNMkMEwC52ipRrma7esy48lDNsd5fpzgSB9jH
 t2yOIFOd3gLpCSAvT1zJ6Jo5atYZU1sFg+FM4KuVk+iyencMCU5fytOZhttx21B9z7NCjBFAh
 gFgWdMdvM77PrtuOZA6vFsiIvjDVKJmIEnSfWm8Fzlh77YMAsePxsiiUyTWcN58QODpZaaAV+
 t0L/KJ6UAyKoxWIhv0wgufluZKI7u9uAk3AAuv44jraWl7p65LQ/BiNGHoeQX23CKfmAXGRNT
 SDmwIP11TzfyVpHoBVVVzuszC5ttlnUgdTmGe3OSBQFTDx6HKLevZVAtN16CVEM6tYC/m/aOq
 CKbJMtFVojx1UCjphcslBw8PdiU804tAayZzowXw32QjphyhiOQc1I3gYjaQXMbsU8RZLzBAh
 ouEcG7OF5waF4o6o0JY5Q/mowbR0qhveNiEPdW8Pa0kE2D80Bk5S3Fmx5rNkbKsghMrAiz/j7
 9y9Q/ghQvxXI652zltyQolFAK0HyJaEO+W7hsVlFfuWv7ez6EGSt/djd98jG02EquGme7PNhK
 sB+D3YP6VvVPeEHaMixTvJJ4xvfpTtGk6lb+H/75XEU6WPfaWW5pfaUb0NMnKy48cKHtQZT3o
 5/TIeDMkSaPlJpBKyyGw==
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_071538_433526_11F0B6BC 
X-CRM114-Status: GOOD (  30.88  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Reply-To: 6a7e3314-6f91-cedb-1ffc-55ae9189dcf4@bang-olufsen.dk
Cc: jkmalinen@gmail.com, felix+kernel@gueux.org, ath10k@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

PiBPbiAxMC8zMC8yMCA4OjIwIEFNLCBKb3VuaSBNYWxpbmVuIHdyb3RlOgo+ID4gU28gdGhlIGlz
c3VlIGlzIGluIG5vdCBiZWluZyBhYmxlIHRvIG9wZXJhdGUgYW4gQVAgb24gdGhlIDUgR0h6IGJh
bmQ/ID4gVGhhdCBzb3VuZHMgbGlrZSB0aGUgZXhwZWN0ZWQgYmVoYXZpb3IgZm9yIGFueSBkZXZp
Y2UgdGhhdCBoYXMgbm90Cj4gPiBiZWVuIGNhbGlicmF0ZWQgYW5kIHByb3Zpc2lvbmVkIGZvciBh
IHNwZWNpZmljIGNvdW50cnkgd2hlcmUgPgo+IHJlZ3VsYXRvcnkgcnVsZXMgYWxsb3cgb3BlcmF0
aW9uIG9uIHRoZSA1IEdIeiBiYW5kLiBJIHVuZGVyc3RhbmQgdGhhdAo+ID4gdGhpcyBtYXkgbG9v
ayBsaWtlIGEgcmVncmVzc2lvbiBzaW5jZSB0aGUgY29tbWl0IHJlbW92ZWQgPgo+IGZ1bmN0aW9u
YWxpdHksIGJ1dCBpdCBmZWVscyBsaWtlIGEgYnVnIGZpeCB0byBtZSBzaW5jZSB0aGF0ID4KPiBm
dW5jdGlvbmFsaXR5IHNob3VsZCBub3QgaGF2ZSBiZWVuIGVuYWJsZWQgYnkgZGVmYXVsdCBpbiB0
aGUgZmlyc3QgPgo+IHBsYWNlLiBUaGUgZ29hbCBoZXJlIGlzIHRvIGF2b2lkIGluYXBwcm9wcmlh
dGUgb3BlcmF0aW9uIG9uIHRoZSBiYW5kID4KPiB3aXRob3V0IGV4cGxpY2l0IGNvbmZpZ3VyYXRp
b24gdG8gZW5hYmxlIHN1Y2ggb3BlcmF0aW9uLiBJbiBBUCA+Cj4gZGV2aWNlcywgdGhlIGRldmlj
ZSBzaG91bGQgaGF2ZSBiZWVuIHByb3Zpc2lvbmVkIGZvciBhIHNwZWNpZmljID4KPiBjb3VudHJ5
IHRvIGJlIGFibGUgdG8gZW5mb3JjZSB0aGUgY29ycmVjdCBmcmVxdWVuY3kgcmFuZ2UgPgo+IHJl
c3RyaWN0aW9ucy4gVGhlIHNhZmUgZGVmYXVsdCBmb3IgYSBkZXZpY2UgdGhhdCBkb2VzIG5vdCBo
YXZlIHN1Y2ggPgo+IGV4cGxpY2l0IGNvbmZpZ3VyYXRpb24gd2l0aGluIHRoZSBXTEFOIGNvbXBv
bmVudCBpdHNlbGYgaXMgdG8gdXNlIHRoZQo+ID4gd29ybGQgcm9hbWluZyBtb2RlIHdoaWNoIHBy
ZXZlbnRzIGluaXRpYWxpemF0aW9uIG9mIHJhZGlhdGlvbiAoaS5lLiwKPiA+IGRvZXMgbm90IGFs
bG93IEFQIG1vZGUgdG8gYmUgc3RhcnRlZCBidXQgYWxsb3dzIHN0YXRpb24gbW9kZQo+IG9wZXJh
dGlvbiA+IHRvIGNvbm5lY3QgdG8gYW4gYWxyZWFkeSBzdGFydGVkIEFQKSBvbiB0aGUgNSBHSHog
YmFuZC4KPiBUaGlzIGV4cGxhbmF0aW9uIG1ha2VzIHBlcmZlY3Qgc2Vuc2UsIGJ1dCBhcmUgeW91
IHN1cmUgdGhhdCB0aGF0IGlzIHdoYXQKPiB0aGUgMHgwIHJlZ3VsYXRvcnkgZG9tYWluIG1lYW5z
PyBGb3IgZXhhbXBsZSB0aGUgcGFnZXMgWzFdWzJdIHN0YXRlCj4gdW5lcXVpdm9jYWxseSB0aGF0
IDB4MCBtZWFucyBVUy4KPgo+IElmIHdlIGFzc3VtZSAweDAgPSBVUywgZG8geW91IGFncmVlIHRo
YXQgYW4gRUVQUk9NIHByb2dyYW1tZWQgd2l0aCAweDAKPiBzaG91bGQgaW1wbHkgdGhhdCB0aGUg
ZGV2aWNlIGlzIHN1aXRhYmx5IGNhbGlicmF0ZWQgZm9yIG9wZXJhdGlvbiBpbiB0aGUKPiBVbml0
ZWQgU3RhdGVzLCBhbmQgYXMgc3VjaCBzaG91bGQgcGVybWl0IGluaXRpYXRpbmcgcmFkaWF0aW9u
IG9uIHRoZSA1Cj4gR0h6IGJhbmQgKGV0Yy4pPyBPciBoYXZlIEkgbWlzc2VkIHNvbWV0aGluZz8K
Pgo+IEkgYWxzbyB0cmllZCB0byBnZXQgdGhlIHBhdGNoIGluIHF1ZXN0aW9uIHJldmVydGVkIGJh
c2VkIG9uIHRoaXMKPiByYXRpb25hbGUsIHNlZSBbM10gZm9yIG1vcmUgaW5mby4gSSBob3BlIHNv
bWVib2R5IGNhbiBoZWxwIGNsZWFyIHVwIHRoaXMKPiBtaXN1bmRlcnN0YW5kaW5nLCBzaW5jZSBp
dCBzZWVtcyB0byBtZSB0aGF0IHRoZSBtYWluIGlzc3VlIGlzOiB3aGF0IGlzCj4gdGhlIHRydWUg
bWVhbmluZyBvZiAweDA/Cj4KPiBCdHcsIHRoZSBoYXJkd2FyZSB0aGF0IEbDqWxpeCBpcyByZWZl
cnJpbmcgdG8gZG9lcyBoYXZlIGFuIEZDQyBJRFs0XSBhbmQKPiBzZWVtcyB0byBiZSBzdWl0YWJs
eSBjZXJ0aWZpZWQgZm9yIHRoZSBVUy4KPgo+IEtpbmQgcmVnYXJkcywKPiBBbHZpbgoKSGVsbG8s
IHRoaXMgaXMgbm90IGNvcnJlY3QuLi4KCkkgaGF2ZSBzdWNoIGEgY2FyZCB3aXRoIDB4MCBpbiB0
aGUgZWVwcm9tCmR1ZSB0byB0aGUgcGF0Y2ggdGhlIGNvbXBsZXRlIG1pZGJhbmQgaW4gc3RhdGlv
biBtb2RlIGlzIG1pc3NpbmcKU28gdGhlIGNhcmQgY2FuJ3Qgc2VlIEFQJ3MgaW4gbWlkYmFuZCBv
ciBjb25uZWN0IHRvIEFQJ3MgZWl0aGVyLi4uLgoKd2h5IGFyZSB0aGUgY2FyZHMgbWFwcGVkIHRv
IDB4NjQgYW5kIG5vdCAweDZjPwoKaHR0cHM6Ly9idWdzLmxhdW5jaHBhZC5uZXQvdWJ1bnR1Lytz
b3VyY2UvbGludXgtZmlybXdhcmUvK2J1Zy8xODk1MzMzCmh0dHBzOi8vd3d3Lm1haWwtYXJjaGl2
ZS5jb20vYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcvbXNnMTMwNDAuaHRtbAoKdGhlIHBhdGNo
IGhhcyBtYWRlIHRoZSBjYXJkIHVudXNhYmxlIGZvciBtZSBhbmQgSSAgaGFkIHRvIGRlYWwgZXh0
ZW5zaXZlbHkgd2l0aCB0aGUgdGhlbWF0aWNzIC4uLgoKYW5kIHllcyBteSBjYXJkIGFsc28gaGFz
IGEgRkNDIElEIGFuZCBpdCB3b3VsZCBiZSBuZXcgdG8gbWUgdGhhdCB0aGVyZSBpcyBubyBtaWRi
YW5kIGluIHRoZSBVU0EuLi4KCgogwqBiZXN0IHJlZ2FyZHMKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vYXRoMTBrCg==
