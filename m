Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5640C433F5
	for <ath10k@archiver.kernel.org>; Fri, 17 Dec 2021 12:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dhMEuQ9fIKeXTCyZNuTVK0HsnvqFO6djzHwyzMEV22o=; b=ZuKYniTjKTeiJw
	Rrr+pSCC2AZ242J6MEPb1ivCm0apGwzqF2E4mOz8Z8FXkpEPFjvsLCwtwmUgslkPJYLUHwZfuFksZ
	BMRI2luOr1ndsp2+QDNIS937AlsQeWmSvbsCqFjUw72EXJDrVxsp8X1TL1l5qszXlnjoZ3UdSEjiz
	XiMyJPhZStaOhXnKK+Ts1OBhCCcxT1FIGrYX3+BWSeYLVhUdSU9cIEF5X2uCVF5nby/etUxObsvIw
	2AVhemvHPUOF0UpJ6t+krwVJDyxHrAx1RYwBf0buXJ/NJ6kmFYMZ3+N0YBmae3kFw6bSBCwmCR61I
	8RuTGUufuDV2Zi5hNEQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myCIv-00A7Jw-Fg; Fri, 17 Dec 2021 12:25:41 +0000
Received: from vps.slashdirt.org ([144.91.108.218])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myCIr-00A7GB-FE
 for ath10k@lists.infradead.org; Fri, 17 Dec 2021 12:25:39 +0000
Received: from smtpclient.apple (unknown
 [IPv6:2a03:4980:117:e500:f57f:f2de:1685:6cbb])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by vps.slashdirt.org (Postfix) with ESMTPSA id 83887600F5;
 Fri, 17 Dec 2021 13:25:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 vps.slashdirt.org 83887600F5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=slashdirt.org; s=mail;
 t=1639743930; bh=w3lTyQFPgz1iRDYYTzvF8n7RYG8pjeS2PbjnS4HmxLA=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
 b=oWTQVimqdLJLbCY1SD2plmL3q3mxxDNIKfGakk8slmHH1OFDHWTywWe0O2BGks/gc
 T9pbcuMZTJLIm21XsyrtS/mY30ozETb3vE1OWE9VFgmhdxpFj2HWo7kbfrfTBcSjsO
 ACaBXevbaxU/QgAEUn82WTAsaiQgSkCu0UieuneU=
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: [PATCH] ath10k: support bus and device specific API 1 BDF
 selection
From: Thibaut <hacks@slashdirt.org>
In-Reply-To: <CAOX2RU6qaZ7NkeRe1bukgH6OxXOPvJS=z9PRp=UYAxMfzwD2oQ@mail.gmail.com>
Date: Fri, 17 Dec 2021 13:25:28 +0100
Cc: Christian Lamparter <chunkeey@gmail.com>, Kalle Valo <kvalo@kernel.org>,
 kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, open list <linux-kernel@vger.kernel.org>
Message-Id: <EC2778B3-B957-4F3F-B299-CC18805F8381@slashdirt.org>
References: <20211009221711.2315352-1-robimarko@gmail.com>
 <163890036783.24891.8718291787865192280.kvalo@kernel.org>
 <CAOX2RU5mqUfPRDsQNSpVPdiz6sE_68KN5Ae+2bC_t1cQzdzgTA@mail.gmail.com>
 <09a27912-9ea4-fe75-df72-41ba0fa5fd4e@gmail.com>
 <CAOX2RU6qaZ7NkeRe1bukgH6OxXOPvJS=z9PRp=UYAxMfzwD2oQ@mail.gmail.com>
To: Robert Marko <robimarko@gmail.com>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_042537_879609_C490C4CC 
X-CRM114-Status: GOOD (  14.55  )
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

Cgo+IExlIDE3IGTDqWMuIDIwMjEgw6AgMTM6MDYsIFJvYmVydCBNYXJrbyA8cm9iaW1hcmtvQGdt
YWlsLmNvbT4gYSDDqWNyaXQgOgo+IAo+IE9uIFdlZCwgOCBEZWMgMjAyMSBhdCAxNTowNywgQ2hy
aXN0aWFuIExhbXBhcnRlciA8Y2h1bmtlZXlAZ21haWwuY29tPiB3cm90ZToKPj4gCj4+IElzbid0
IHRoZSBvbmx5IHVzZXIgb2YgdGhpcyB0aGUgbm9uLXVwc3RyZWFtYWJsZSByYl9oYXJkY29uZmln
Cj4+IG1pa3JvdGlrIHBsYXRmb3JtIGRyaXZlcj8KClRoZSBkcml2ZXIgY291bGQgYmUgdXBzdHJl
YW1lZCBpZiBkZXNpcmFibGUuCllldCBJIHRoaW5rIGl04oCZcyBxdWl0ZSBvcnRob2dvbmFsIHRv
IGhhdmluZyB0aGUgcG9zc2liaWxpdHkgdG8gZHluYW1pY2FsbHkgbG9hZCBhIGRpZmZlcmVudCBC
REYgdmlhIEFQSSAxIGZvciBlYWNoIGF2YWlsYWJsZSByYWRpbywgd2hpY2ggYmVmb3JlIHRoaXMg
cGF0Y2ggY291bGRu4oCZdCBiZSBkb25lIGFuZCBpcyBuZWNlc3NhcnkgZm9yIHRoaXMgcGFydGlj
dWxhciBoYXJkd2FyZS4KCj4+IFNvLCBpbiB5b3VyIGNhc2UgdGhlIGRldmljZXMgaW4gcXVlc3Rp
b24KPj4gbmVlZHMgdG8gc2V0dXAgYSBkZXRvdXIgdGhyb3VnaCB0aGUgdXNlcnNwYWNlIGZpcm13
YXJlIChoZWxwZXIrc2NyaXB0cykKPj4gdG8gcHVsbCBvbiB0aGUgc3lzZnMgb2YgdGhhdCBtaWty
b3RpayBwbGF0Zm9ybSBkcml2ZXI/IFdvdWxkbid0IGl0Cj4+IGJlIHBvc3NpYmxlIHRvIGRvIHRo
aXMgbW9yZSBkaXJlY3RseT8KPiAKPiBZZXMsIGl0cyB0aGUgc29sZSBjdXJyZW50IHVzZXIgYXMg
aXRzIHRoZSBvbmx5IHZlbmRvciBzaGlwcGluZyB0aGUgQkRGCj4gYXMgcGFydCBvZiB0aGUKPiBm
YWN0b3J5IGRhdGEgYW5kIG5vdCBsaWtlIGEgdXNlcnNwYWNlIGJsb2IuCj4gCj4gSSBkb24ndCBz
ZWUgaG93IGNhbiBpdCBiZSBtb3JlIGRpcmVjdCwgaXRzIHRoZSBzYW1lIHNldHVwIGFzIHdoZW4K
PiBnZXR0aW5nIHByZS1jYWwKPiBkYXRhIGZvciBtb3N0IGRldmljZXMgY3VycmVudGx5LgoKSW5k
ZWVkLCBub3Qgc3VyZSBob3cgaXQgY291bGQgYmUgbW9yZSBkaXJlY3QgdGhhbiBpdCBhbHJlYWR5
IGlzLiBJ4oCZbSBvcGVuIHRvIHN1Z2dlc3Rpb25zIHRob3VnaC4KCj4gSSBhbSBhZGRpbmcgVGhp
YmF1dCB3aG8gaXMgdGhlIGF1dGhvciBvZiB0aGUgcGxhdGZvcm0gZHJpdmVyLgoKQmVzdCwKVGhp
YmF1dApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgx
MGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
