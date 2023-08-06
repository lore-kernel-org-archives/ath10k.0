Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B293C001B0
	for <ath10k@archiver.kernel.org>; Sun,  6 Aug 2023 18:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fCx+webezHRPsoYx1LzxXpYnT/6idCRU0qSJCDMln7o=; b=NIQrqzZ72Kpzao
	G9WeEmuIAUlFgdmGjJgzMNgrDWeOSo5TyHFUn7OszaPldKLfXCLijoxzEikHLBuAEpdle/lHJFnpU
	P63S8++wzfbjIL34a0GF5POpIJnM+NwLzHyMHZotFLXXllMM4XEKOh/QFOXpLQAP2EePAjkf7C4GY
	ya/JRy1soL/2MqmTH7vuMYb9Kiid9BSmwHCb2+dKlvRhbtD8cYtKgUUXiEJ2kRJuZItzX5hsLxENX
	Ve/cNUPu0gD6xBiNe8xoCKSdoXBto5sm1lQbIOkIkBFIZBe7mS05nAZEFBe4G4TFzzOByIXZYd1+S
	Re54leRkbI8tndWFXLjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSij0-00FiCU-2g;
	Sun, 06 Aug 2023 18:43:34 +0000
Received: from forward500b.mail.yandex.net ([2a02:6b8:c02:900:1:45:d181:d500])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSiiw-00FiBv-2F
	for ath10k@lists.infradead.org;
	Sun, 06 Aug 2023 18:43:33 +0000
Received: from mail-nwsmtp-smtp-production-main-37.myt.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-37.myt.yp-c.yandex.net [IPv6:2a02:6b8:c12:3093:0:640:c702:0])
	by forward500b.mail.yandex.net (Yandex) with ESMTP id 084145E691;
	Sun,  6 Aug 2023 21:37:21 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-37.myt.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id Kbb6xXYWpa60-FlA0v1ms;
	Sun, 06 Aug 2023 21:37:20 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ya.ru; s=mail; t=1691347040;
	bh=vwK9XXB3EITAFXBvUQ4+NwIXR8Np7Gscx0AI5emAXPY=;
	h=References:Date:In-Reply-To:Cc:To:From:Subject:Message-ID;
	b=XTrUyr1HqiXIKW75TSKWuKRctVEBImDbFm3piY4lSeJPOggQTikitVtVnQbD6/yJj
	 4j+yRtmLmP10iSM9rwDrFAs5zJPrNkwAEpFzTvcNNkax73daaC7eS7ii9B58adOU48
	 R3AiEJWWaAU665+fviYAoIfpKD/1z9cjbR5fFAEE=
Authentication-Results: mail-nwsmtp-smtp-production-main-37.myt.yp-c.yandex.net; dkim=pass header.i=@ya.ru
Message-ID: <06892d64e130bc21c7c522c45fdc42498b06324c.camel@ya.ru>
Subject: Re: [BUG] SoftAP: zero speed between clients on QCA6174
From: dukzcry@ya.ru
To: Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org
Date: Sun, 06 Aug 2023 21:37:20 +0300
In-Reply-To: <87edkktjkf.fsf@kernel.org>
References: <02bed0819c13c14dc1f52d7d2b658b00280d2634.camel@ya.ru>
	 <c7ecaf558a6b2b46c73ecbe8a291de3af40b35fd.camel@ya.ru>
	 <875yavfeln.fsf@kernel.org> <87edkktjkf.fsf@kernel.org>
User-Agent: Evolution 3.48.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230806_114331_215352_21FBDC49 
X-CRM114-Status: GOOD (  14.60  )
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

0JIg0KfRgiwgMDMvMDgvMjAyMyDQsiAxNTowOCArMDMwMCwgS2FsbGUgVmFsbyDQv9C40YjQtdGC
Ogo+ID4gPiA+IEthbGxlIFZhbG8gPGt2YWxvQGtlcm5lbC5vcmc+IHdyaXRlczoKPiA+ID4gPiAK
PiA+ID4gPiA+ID4gPiA+IGR1a3pjcnlAeWEucnXCoHdyaXRlczoKPiA+ID4gPiA+ID4gPiA+IAo+
ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiBMb29rcyBsaWtlIGZpcm13YXJlIGlzc3VlLiBGaXhlZCBi
eSBkb3duZ3JhZGluZwo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiBsaW51eC1maXJtd2FyZQo+ID4g
PiA+ID4gPiA+ID4gPiA+ID4gPiBwYWNrYWdlCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+IGRvd24g
dG8gMjAyMjA0MTEKPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiA+ID4g
PiA+IExhc3QgZ29vZCBmaXJtd2FyZSAKPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gbGludXgtZmly
bXdhcmUtMjAyMjA0MTEKPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gW8KgwqDCoCAzLjg1OTU4N10g
YXRoMTBrX3BjaSAwMDAwOjAyOjAwLjA6Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+IGZpcm13YXJl
IHZlcgo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiBXTEFOLlJNLjQuNC4xLQo+ID4gPiA+ID4gPiA+
ID4gPiA+ID4gPiAwMDE1Ny1RQ0FSTVNXUFotMSBhcGkgNiBmZWF0dXJlcyB3b3dsYW4saWdub3Jl
LQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiBvdHAsbWZwCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+
IGNyYzMyCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+IDkwZWViZWZiCj4gPiA+ID4gPiA+ID4gPiAK
PiA+ID4gPiA+ID4gPiA+IFsuLi5dCj4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+ID4g
PiA+ID4gRmlyc3QgYmFkIGZpcm13YXJlCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+IGxpbnV4LWZp
cm13YXJlLTIwMjIwNTA5Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+IFvCoMKgwqAgMy43Njc3MTNd
IGF0aDEwa19wY2kgMDAwMDowMjowMC4wOgo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiBmaXJtd2Fy
ZSB2ZXIKPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gV0xBTi5STS40LjQuMS0KPiA+ID4gPiA+ID4g
PiA+ID4gPiA+ID4gMDAyODgtIGFwaSA2IGZlYXR1cmVzIHdvd2xhbixpZ25vcmUtb3RwLG1mcAo+
ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiBjcmMzMiBiZjkwN2M3Ywo+ID4gPiA+ID4gPiA+ID4gCj4g
PiA+ID4gPiA+ID4gPiBUaGFua3MgZm9yIHRoZSByZXBvcnQsIEkgZm9yd2FyZGVkIHRoaXMgYW5k
IGhvcGVmdWxseQo+ID4gPiA+ID4gPiA+ID4gaXQgZ2V0cwo+ID4gPiA+ID4gPiA+ID4gZml4ZWQu
Cj4gPiA+ID4gCj4gPiA+ID4gVGhlcmUncyBub3cgYSBuZXcgdmVyc2lvbiBmaXJtd2FyZS02LmJp
bl9XTEFOLlJNLjQuNC4xLTAwMzA5LQo+ID4gPiA+IGF2YWlsYWJsZToKPiA+ID4gPiAKPiA+ID4g
PiBodHRwczovL2dpdGh1Yi5jb20va3ZhbG8vYXRoMTBrLWZpcm13YXJlL3RyZWUvbWFzdGVyL1FD
QTYxNzQvaHczLjAvNC40LjEKPiA+ID4gPiAKPiA+ID4gPiBJZiB5b3UgY2FuLCBwbGVhc2UgdGVz
dCBpdCBhbmQgbGV0IHVzIGtub3cgaWYgdGhlIGlzc3VlIGlzCj4gPiA+ID4gZml4ZWQgb3IKPiA+
ID4gPiBub3QuCj4gPiA+ID4gCgpUaGFua3MhIFRoZSBpc3N1ZSBpcyBmaXhlZCB3aXRoIGl0LiBU
aG91Z2h0IG5vdGljZWQgdGhhdCBTVS1CRUFNRk9STUVFClZIVCBjYXBhYmlsaXR5IGlzIG5vdCBz
dXBwb3J0ZWQgYW55bW9yZSBhcyByZXBvcnRlZCBieSBob3N0YXBkLCBub3QKc3VyZSBpZiBuZWVk
ZWQgdGhvdWdoLCBJIGp1c3QgcmVtb3ZlZCBpdCBmcm9tIGhvc3RhcGQgY29uZmlnCgpbICAgIDMu
OTA0Njg2XSBhdGgxMGtfcGNpIDAwMDA6MDI6MDAuMDogZmlybXdhcmUgdmVyIFdMQU4uUk0uNC40
LjEtCjAwMzA5LSBhcGkgNiBmZWF0dXJlcyB3b3dsYW4saWdub3JlLW90cCxtZnAgY3JjMzIgMDc5
M2JjZjIKCmhvc3RhcGRbMTM5NF06IERyaXZlciBkb2VzIG5vdCBzdXBwb3J0IGNvbmZpZ3VyZWQg
VkhUIGNhcGFiaWxpdHkKW1ZIVF9DQVBfU1VfQkVBTUZPUk1FRV9DQVBBQkxFXQoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxp
c3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
