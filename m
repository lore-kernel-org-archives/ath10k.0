Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJuwu-0001gp-EH
 for ath10k@lists.infradead.org; Fri, 26 Apr 2019 07:07:09 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: remove iteration in wake_tx_queue
References: <20190327162906.6010-1-erik.stromdahl@gmail.com>
 <87bm1qq92j.fsf@toke.dk>
 <8772dfe6-3f52-05ca-f55a-b7eae14fa7ac@gmail.com>
 <87imvdu5u8.fsf@toke.dk>
 <f915fa20-a4e1-7312-dea2-d60b716e4877@gmail.com>
Date: Fri, 26 Apr 2019 10:07:03 +0300
In-Reply-To: <f915fa20-a4e1-7312-dea2-d60b716e4877@gmail.com> (Erik
 Stromdahl's message of "Wed, 17 Apr 2019 15:29:41 +0200")
Message-ID: <87sgu5utwo.fsf@kamboji.qca.qualcomm.com>
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: yiboz@codeaurora.org, Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

RXJpayBTdHJvbWRhaGwgPGVyaWsuc3Ryb21kYWhsQGdtYWlsLmNvbT4gd3JpdGVzOgoKPiBPbiA0
LzE2LzE5IDk6MDcgUE0sIFRva2UgSMO4aWxhbmQtSsO4cmdlbnNlbiB3cm90ZToKPj4gRXJpayBT
dHJvbWRhaGwgPGVyaWsuc3Ryb21kYWhsQGdtYWlsLmNvbT4gd3JpdGVzOgo+Pgo+Pj4gT24gNC8x
LzE5IDE6MDUgUE0sIFRva2UgSMO4aWxhbmQtSsO4cmdlbnNlbiB3cm90ZToKPj4+PiBFcmlrIFN0
cm9tZGFobCA8ZXJpay5zdHJvbWRhaGxAZ21haWwuY29tPiB3cml0ZXM6Cj4+Pj4KPj4+Pj4gSXRl
cmF0aW5nIHRoZSBUWCBxdWV1ZSBhbmQgdGhlcmVieSBkZXF1ZXVpbmcgYWxsIGF2YWlsYWJsZSBw
YWNrZXRzIGluIHRoZQo+Pj4+PiBxdWV1ZSBjb3VsZCByZXN1bHQgaW4gcGVyZm9ybWFuY2UgcGVu
YWx0aWVzIG9uIHNvbWUgU01QIHN5c3RlbXMuCj4+Pj4+Cj4+Pj4+IFRoZSByZWFzb24gZm9yIHRo
aXMgaXMgbW9zdCBsaWtlbHkgdGhhdCB0aGUgcGVyLWFjIGxvY2sgKGFjdGl2ZV90eHFfbG9jaykK
Pj4+Pj4gaW4gbWFjODAyMTEgd2lsbCBiZSBoZWxkIGJ5IHRoZSBDUFUgaXRlcmF0aW5nIHRoZSBj
dXJyZW50IHF1ZXVlLgo+Pj4+Pgo+Pj4+PiBUaGlzIHdpbGwgbG9jayB1cCBvdGhlciBDUFVzIHRy
eWluZyB0byBwdXNoIG5ldyBtZXNzYWdlcyBvbiB0aGUgVFgKPj4+Pj4gcXVldWUuCj4+Pj4+Cj4+
Pj4+IEluc3RlYWQgb2YgaXRlcmF0aW5nIHRoZSBxdWV1ZSB3ZSBmZXRjaCBqdXN0IG9uZSBwYWNr
ZXQgYXQgdGhlIHRpbWUsCj4+Pj4+IHJlc3VsdGluZyBpbiBtaW5pbWFsIHN0YXJ2YXRpb24gb2Yg
dGhlIG90aGVyIENQVXMuCj4+Pj4KPj4+PiBEaWQgeW91IHRlc3QgdGhpcyB3aXRoIEZlbGl4JyBw
YXRjaGVzIHJlZHVjaW5nIHRoZSB0aW1lIHRoZSBsb2NrIGlzIGhlbGQKPj4+PiBpbiBtYWM4MDIx
MT8KPj4+Pgo+Pj4+IC1Ub2tlCj4+Pj4KPj4+IEhpIFRva2UsCj4+Pgo+Pj4gSSBhbSBub3QgYXdh
cmUgb2YgdGhlc2UgcGF0Y2hlcy4gQ2FuIHlvdSBwbGVhc2UgcG9pbnQgdGhlbSBvdXQgZm9yIG1l
Pwo+Pgo+PiBUaGV5J3ZlIGFscmVhZHkgYmVlbiBtZXJnZWQuIENvbW1pdHMgZGNlYzFkOWJjOGE3
IGFuZCA3ZWY3Njk0NTlmMTQgaW4KPj4gbWFjODAyMTEtbmV4dCA6KQo+Pgo+PiAtVG9rZQo+Pgo+
Cj4gSSBzZWUuIEkgYW0gdXNpbmcgdGhlIGF0aCB0cmVlIGFuZCBJIGNvdWxkbid0IGZpbmQgdGhl
bSB0aGVyZS4KPiBJIGNhbiBjaGVycnktcGljayB0aGVtIHRvIG15IG93biB0cmVlIGFuZCB0cnkg
dGhlbSBvdXQKPiAob3Igd2FpdCB1bnRpbCBLYWxsZSB1cGRhdGVzIGF0aC5naXQpLgoKSXQgd2ls
bCB0YWtlIGEgd2hpbGUgYmVmb3JlIHRoZXNlIGNvbW1pdHMgdHJpY2tsZSBkb3duIHRvIGF0aC1u
ZXh0CmJyYW5jaCwgbW9zdCBsaWtlbHkgYWZ0ZXIgdjUuMi1yYzEgaXMgcmVsZWFzZWQuCgotLSAK
S2FsbGUgVmFsbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
