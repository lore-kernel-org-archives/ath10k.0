Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ed1-f65.google.com ([209.85.208.65])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGTQb-00057N-58
 for ath10k@lists.infradead.org; Tue, 16 Apr 2019 19:07:34 +0000
Received: by mail-ed1-f65.google.com with SMTP id d46so14046300eda.7
 for <ath10k@lists.infradead.org>; Tue, 16 Apr 2019 12:07:32 -0700 (PDT)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: Re: [PATCH] ath10k: remove iteration in wake_tx_queue
In-Reply-To: <8772dfe6-3f52-05ca-f55a-b7eae14fa7ac@gmail.com>
References: <20190327162906.6010-1-erik.stromdahl@gmail.com>
 <87bm1qq92j.fsf@toke.dk> <8772dfe6-3f52-05ca-f55a-b7eae14fa7ac@gmail.com>
Date: Tue, 16 Apr 2019 20:07:27 +0100
Message-ID: <87imvdu5u8.fsf@toke.dk>
MIME-Version: 1.0
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
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Erik Stromdahl <erik.stromdahl@gmail.com>, kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Cc: yiboz@codeaurora.org

RXJpayBTdHJvbWRhaGwgPGVyaWsuc3Ryb21kYWhsQGdtYWlsLmNvbT4gd3JpdGVzOgoKPiBPbiA0
LzEvMTkgMTowNSBQTSwgVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIHdyb3RlOgo+PiBFcmlrIFN0
cm9tZGFobCA8ZXJpay5zdHJvbWRhaGxAZ21haWwuY29tPiB3cml0ZXM6Cj4+IAo+Pj4gSXRlcmF0
aW5nIHRoZSBUWCBxdWV1ZSBhbmQgdGhlcmVieSBkZXF1ZXVpbmcgYWxsIGF2YWlsYWJsZSBwYWNr
ZXRzIGluIHRoZQo+Pj4gcXVldWUgY291bGQgcmVzdWx0IGluIHBlcmZvcm1hbmNlIHBlbmFsdGll
cyBvbiBzb21lIFNNUCBzeXN0ZW1zLgo+Pj4KPj4+IFRoZSByZWFzb24gZm9yIHRoaXMgaXMgbW9z
dCBsaWtlbHkgdGhhdCB0aGUgcGVyLWFjIGxvY2sgKGFjdGl2ZV90eHFfbG9jaykKPj4+IGluIG1h
YzgwMjExIHdpbGwgYmUgaGVsZCBieSB0aGUgQ1BVIGl0ZXJhdGluZyB0aGUgY3VycmVudCBxdWV1
ZS4KPj4+Cj4+PiBUaGlzIHdpbGwgbG9jayB1cCBvdGhlciBDUFVzIHRyeWluZyB0byBwdXNoIG5l
dyBtZXNzYWdlcyBvbiB0aGUgVFgKPj4+IHF1ZXVlLgo+Pj4KPj4+IEluc3RlYWQgb2YgaXRlcmF0
aW5nIHRoZSBxdWV1ZSB3ZSBmZXRjaCBqdXN0IG9uZSBwYWNrZXQgYXQgdGhlIHRpbWUsCj4+PiBy
ZXN1bHRpbmcgaW4gbWluaW1hbCBzdGFydmF0aW9uIG9mIHRoZSBvdGhlciBDUFVzLgo+PiAKPj4g
RGlkIHlvdSB0ZXN0IHRoaXMgd2l0aCBGZWxpeCcgcGF0Y2hlcyByZWR1Y2luZyB0aGUgdGltZSB0
aGUgbG9jayBpcyBoZWxkCj4+IGluIG1hYzgwMjExPwo+PiAKPj4gLVRva2UKPj4gCj4gSGkgVG9r
ZSwKPgo+IEkgYW0gbm90IGF3YXJlIG9mIHRoZXNlIHBhdGNoZXMuIENhbiB5b3UgcGxlYXNlIHBv
aW50IHRoZW0gb3V0IGZvciBtZT8KClRoZXkndmUgYWxyZWFkeSBiZWVuIG1lcmdlZC4gQ29tbWl0
cyBkY2VjMWQ5YmM4YTcgYW5kIDdlZjc2OTQ1OWYxNCBpbgptYWM4MDIxMS1uZXh0IDopCgotVG9r
ZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBr
IG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
