Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x236.google.com ([2a00:1450:400c:c09::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1apWeX-000494-7S
 for ath10k@lists.infradead.org; Mon, 11 Apr 2016 07:52:58 +0000
Received: by mail-wm0-x236.google.com with SMTP id a140so1367521wma.0
 for <ath10k@lists.infradead.org>; Mon, 11 Apr 2016 00:52:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160411074438.GA15227@mwanda>
References: <20160411074438.GA15227@mwanda>
Date: Mon, 11 Apr 2016 09:52:34 +0200
Message-ID: <CA+BoTQmpYtGoYk4M-NaFduO8iX0KYgoLz6Mj_40i0um8MqDdww@mail.gmail.com>
Subject: Re: [patch] ath10k: add some sanity checks
From: Michal Kazior <michal.kazior@tieto.com>
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
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMTEgQXByaWwgMjAxNiBhdCAwOTo0NCwgRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBv
cmFjbGUuY29tPiB3cm90ZToKPiBTbWF0Y2ggY29tcGxhaW5zIHRoYXQgc2luY2UgImV2LT5wZWVy
X2lkIiBjb21lcyBmcm9tIHNrYi0+ZGF0YSB0aGF0Cj4gbWVhbnMgd2UgY2FuJ3QgdHJ1c3QgaXQg
YW5kIGhhdmUgdG8gZG8gYSBib3VuZHMgY2hlY2sgb24gaXQgdG8gcHJldmVudAo+IGFuIGFycmF5
IG92ZXJmbG93Lgo+Cj4gRml4ZXM6IDY5NDI3MjZmN2Y3YiAoJ2F0aDEwazogYWRkIGZhc3QgcGVl
cl9tYXAgbG9va3VwJykKPiBTaWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVu
dGVyQG9yYWNsZS5jb20+Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRo
L2F0aDEway90eHJ4LmMgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3R4cnguYwo+
IGluZGV4IDkzNjk0MTEuLmZkNmJhNjkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9uZXQvd2lyZWxl
c3MvYXRoL2F0aDEway90eHJ4LmMKPiArKysgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRo
MTBrL3R4cnguYwo+IEBAIC0xOTAsNiArMTkwLDkgQEAgdm9pZCBhdGgxMGtfcGVlcl9tYXBfZXZl
bnQoc3RydWN0IGF0aDEwa19odHQgKmh0dCwKPiAgICAgICAgIHN0cnVjdCBhdGgxMGsgKmFyID0g
aHR0LT5hcjsKPiAgICAgICAgIHN0cnVjdCBhdGgxMGtfcGVlciAqcGVlcjsKPgo+ICsgICAgICAg
aWYgKGV2LT5wZWVyX2lkID49IEFUSDEwS19NQVhfTlVNX1BFRVJfSURTKQo+ICsgICAgICAgICAg
ICAgICByZXR1cm47Cj4gKwoKVGhpcyB3aWxsIGxlYWQgdG8gYSB0aW1lb3V0IGluIHRoZSBvdGhl
ciBwYXJ0IG9mIHRoZSBjb2RlIHNvIHByaW50aW5nCmEgd2FybmluZyBoZXJlIHdpbGwgbWFrZSBp
dCBlYXNpZXIgdG8gdW5kZXJzdGFuZCB0aGUgZmFpbHVyZSwgZS5nLgoKICBhdGgxMGtfd2Fybihh
ciwgInJlY2VpdmVkIGh0dCBwZWVyIG1hcCBldmVudCB3aXRoIGlkeCBvdXQgb2YgYm91bmRzOgol
aHVcbiIsIGV2LT5wZWVyX2lkKTsKCgo+ICAgICAgICAgc3Bpbl9sb2NrX2JoKCZhci0+ZGF0YV9s
b2NrKTsKPiAgICAgICAgIHBlZXIgPSBhdGgxMGtfcGVlcl9maW5kKGFyLCBldi0+dmRldl9pZCwg
ZXYtPmFkZHIpOwo+ICAgICAgICAgaWYgKCFwZWVyKSB7Cj4gQEAgLTIxOCw2ICsyMjEsOSBAQCB2
b2lkIGF0aDEwa19wZWVyX3VubWFwX2V2ZW50KHN0cnVjdCBhdGgxMGtfaHR0ICpodHQsCj4gICAg
ICAgICBzdHJ1Y3QgYXRoMTBrICphciA9IGh0dC0+YXI7Cj4gICAgICAgICBzdHJ1Y3QgYXRoMTBr
X3BlZXIgKnBlZXI7Cj4KPiArICAgICAgIGlmIChldi0+cGVlcl9pZCA+PSBBVEgxMEtfTUFYX05V
TV9QRUVSX0lEUykKPiArICAgICAgICAgICAgICAgcmV0dXJuOwoKRGl0dG8gYnV0IHMvbWFwL3Vu
bWFwLgoKQW55d2F5LCBnb29kIGNhdGNoLCB0aGFua3MhCgoKTWljaGHFggoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAph
dGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2F0aDEwawo=
