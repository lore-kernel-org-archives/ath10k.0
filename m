Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGTDZ-0008KO-FE
 for ath10k@lists.infradead.org; Tue, 16 Apr 2019 18:54:06 +0000
Received: by mail-lf1-x144.google.com with SMTP id k18so7912018lfj.13
 for <ath10k@lists.infradead.org>; Tue, 16 Apr 2019 11:54:04 -0700 (PDT)
Subject: Re: [PATCH] ath10k: remove iteration in wake_tx_queue
References: <20190327162906.6010-1-erik.stromdahl@gmail.com>
 <87bm1qq92j.fsf@toke.dk>
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Message-ID: <8772dfe6-3f52-05ca-f55a-b7eae14fa7ac@gmail.com>
Date: Tue, 16 Apr 2019 20:54:01 +0200
MIME-Version: 1.0
In-Reply-To: <87bm1qq92j.fsf@toke.dk>
Content-Language: en-US
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
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@redhat.com>, kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Cc: yiboz@codeaurora.org

CgpPbiA0LzEvMTkgMTowNSBQTSwgVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIHdyb3RlOgo+IEVy
aWsgU3Ryb21kYWhsIDxlcmlrLnN0cm9tZGFobEBnbWFpbC5jb20+IHdyaXRlczoKPiAKPj4gSXRl
cmF0aW5nIHRoZSBUWCBxdWV1ZSBhbmQgdGhlcmVieSBkZXF1ZXVpbmcgYWxsIGF2YWlsYWJsZSBw
YWNrZXRzIGluIHRoZQo+PiBxdWV1ZSBjb3VsZCByZXN1bHQgaW4gcGVyZm9ybWFuY2UgcGVuYWx0
aWVzIG9uIHNvbWUgU01QIHN5c3RlbXMuCj4+Cj4+IFRoZSByZWFzb24gZm9yIHRoaXMgaXMgbW9z
dCBsaWtlbHkgdGhhdCB0aGUgcGVyLWFjIGxvY2sgKGFjdGl2ZV90eHFfbG9jaykKPj4gaW4gbWFj
ODAyMTEgd2lsbCBiZSBoZWxkIGJ5IHRoZSBDUFUgaXRlcmF0aW5nIHRoZSBjdXJyZW50IHF1ZXVl
Lgo+Pgo+PiBUaGlzIHdpbGwgbG9jayB1cCBvdGhlciBDUFVzIHRyeWluZyB0byBwdXNoIG5ldyBt
ZXNzYWdlcyBvbiB0aGUgVFgKPj4gcXVldWUuCj4+Cj4+IEluc3RlYWQgb2YgaXRlcmF0aW5nIHRo
ZSBxdWV1ZSB3ZSBmZXRjaCBqdXN0IG9uZSBwYWNrZXQgYXQgdGhlIHRpbWUsCj4+IHJlc3VsdGlu
ZyBpbiBtaW5pbWFsIHN0YXJ2YXRpb24gb2YgdGhlIG90aGVyIENQVXMuCj4gCj4gRGlkIHlvdSB0
ZXN0IHRoaXMgd2l0aCBGZWxpeCcgcGF0Y2hlcyByZWR1Y2luZyB0aGUgdGltZSB0aGUgbG9jayBp
cyBoZWxkCj4gaW4gbWFjODAyMTE/Cj4gCj4gLVRva2UKPiAKSGkgVG9rZSwKCkkgYW0gbm90IGF3
YXJlIG9mIHRoZXNlIHBhdGNoZXMuIENhbiB5b3UgcGxlYXNlIHBvaW50IHRoZW0gb3V0IGZvciBt
ZT8KCi0tCkVyaWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
