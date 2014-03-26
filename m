Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x229.google.com ([2a00:1450:400c:c03::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSls2-0002HR-Dh
 for ath10k@lists.infradead.org; Wed, 26 Mar 2014 11:19:47 +0000
Received: by mail-we0-f169.google.com with SMTP id w62so1027245wes.28
 for <ath10k@lists.infradead.org>; Wed, 26 Mar 2014 04:19:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87d2h9yzzy.fsf@kamboji.qca.qualcomm.com>
References: <1395745943-29492-1-git-send-email-michal.kazior@tieto.com>
 <1395745943-29492-3-git-send-email-michal.kazior@tieto.com>
 <87ppl9z54w.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQnMZ+B0nC_MdYqKk6z1wH-bK47vE+Uknqnv+FpJRKaRjA@mail.gmail.com>
 <87d2h9yzzy.fsf@kamboji.qca.qualcomm.com>
Date: Wed, 26 Mar 2014 12:19:21 +0100
Message-ID: <CA+BoTQ=F_SeKW7pYTWY9T1Zk9hKEFH=SJmcYjgpzD7Oo8LYy5A@mail.gmail.com>
Subject: Re: [PATCH 2/2] ath10k: split ce initialization and allocation
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMjYgTWFyY2ggMjAxNCAxMjoxMywgS2FsbGUgVmFsbyA8a3ZhbG9AcWNhLnF1YWxjb21tLmNv
bT4gd3JvdGU6Cj4gTWljaGFsIEthemlvciA8bWljaGFsLmthemlvckB0aWV0by5jb20+IHdyaXRl
czoKPgo+PiBPbiAyNiBNYXJjaCAyMDE0IDEwOjIyLCBLYWxsZSBWYWxvIDxrdmFsb0BxY2EucXVh
bGNvbW0uY29tPiB3cm90ZToKPj4+IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGlldG8u
Y29tPiB3cml0ZXM6Cj4+Pgo+Pj4+IC0tLSBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgx
MGsvY2UuaAo+Pj4+ICsrKyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvY2UuaAo+
Pj4+IEBAIC0xMDQsNyArMTA0LDggQEAgc3RydWN0IGF0aDEwa19jZV9yaW5nIHsKPj4+PiAgICAg
ICB2b2lkICpzaGFkb3dfYmFzZV91bmFsaWduZWQ7Cj4+Pj4gICAgICAgc3RydWN0IGNlX2Rlc2Mg
KnNoYWRvd19iYXNlOwo+Pj4+Cj4+Pj4gLSAgICAgdm9pZCAqKnBlcl90cmFuc2Zlcl9jb250ZXh0
Owo+Pj4+ICsgICAgIC8qIGtlZXAgbGFzdCAqLwo+Pj4+ICsgICAgIHZvaWQgKnBlcl90cmFuc2Zl
cl9jb250ZXh0WzBdOwo+Pj4+ICB9Owo+Pj4KPj4+IElmIHBvc3NpYmxlLCBJIHdvdWxkIHByZWZl
ciB0byBoYXZlIGNoYW5nZXMgbGlrZSB0aGlzIGluIGEgc2VwYXJhdGUKPj4+IHBhdGNoIGFzIGl0
IG1ha2VzIGVhc2llciB0byByZXZpZXcuIE9yIGF0IGxlYXN0IG1lbnRpb24gdGhlIGNoYW5nZSBp
bgo+Pj4gdGhlIGNvbW1pdCBsb2cuCj4+Cj4+IFRoZSBwYXRjaCBhbHJlYWR5IGFsdGVycyB0aGUg
YWxsb2NhdGlvbiBjb2RlIHNvIEkgdGhvdWdodCBJJ2Qgc3F1YXNoCj4+IHRoaXMgaGVyZS4gWW91
IHdhbnQgbWUgdG8ganVzdCB1cGRhdGUgdGhlIGNvbW1pdCBsb2cgb3Igc3BsaXQgaXQgdXA/Cj4K
PiBJbiB0aGlzIGNhc2UgdXBkYXRpbmcgdGhlIGNvbW1pdCBsb2cgaXMgZmluZS4KCk9rYXkuCgoK
Pj4+PiBAQCAtMjAxOCw5ICsyMDI5LDkgQEAgc3RhdGljIHZvaWQgYXRoMTBrX3BjaV9oaWZfcG93
ZXJfZG93bihzdHJ1Y3QgYXRoMTBrICphcikKPj4+PiAgICAgICBhdGgxMGtfcGNpX2ZyZWVfZWFy
bHlfaXJxKGFyKTsKPj4+PiAgICAgICBhdGgxMGtfcGNpX2tpbGxfdGFza2xldChhcik7Cj4+Pj4g
ICAgICAgYXRoMTBrX3BjaV9kZWluaXRfaXJxKGFyKTsKPj4+PiArICAgICBhdGgxMGtfcGNpX2Nl
X2RlaW5pdChhcik7Cj4+Pj4gICAgICAgYXRoMTBrX3BjaV93YXJtX3Jlc2V0KGFyKTsKPj4+Pgo+
Pj4+IC0gICAgIGF0aDEwa19wY2lfY2VfZGVpbml0KGFyKTsKPj4+PiAgICAgICBpZiAoIXRlc3Rf
Yml0KEFUSDEwS19QQ0lfRkVBVFVSRV9TT0NfUE9XRVJfU0FWRSwgYXJfcGNpLT5mZWF0dXJlcykp
Cj4+Pj4gICAgICAgICAgICAgICBhdGgxMGtfZG9fcGNpX3NsZWVwKGFyKTsKPj4+PiAgfQo+Pj4K
Pj4+IFdoeSB0aGlzPwo+Pgo+PiBhdGgxMGtfcGNpX2NlX2RlaW5pdCgpIHplcm9lcyBjb3B5IGVu
Z2luZSByZWdpc3RlcnMgbm93IHNvIEkgdGhvdWdodAo+PiBpdCdzIG5pY2UgdG8gaGF2ZSB0aGlz
IGRvbmUgYmVmb3JlIHJlc2V0Lgo+Pgo+PiBCZWZvcmUgYXRoMTBrX3BjaV9jZV9kZWluaXQoKSBm
cmVlZCBtZW1vcnkgc28gaXQgd2FzIHJlcXVpcmVkIHRvIHJlc2V0Cj4+IHRoZSBkZXZpY2UgYmVm
b3JlaGFuZC4gT3RoZXJ3aXNlIHlvdSByaXNrZWQgZGV2aWNlIGFjY2Vzc2luZyBtZW1vcnkKPj4g
dGhhdCB3YXNuJ3QgbWFwcGVkIG5vciBhbGxvY2F0ZWQgYnkgdGhlIGRyaXZlciBhbnltb3JlLgo+
Cj4gQnV0IGNhbiB5b3Ugc3BsaXQgdGhpcyBjaGFuZ2UgaW50byBpdCdzIG93biBwYXRjaCwgcGxl
YXNlPyBKdXN0IGluIGNhc2UKPiBpZiB0aGVyZSBhcmUgcmVncmVzc2lvbnMsIGl0J3MgZWFzaWVy
IHRvIGZpbmQgdGhlIGN1bHByaXQuCgpPa2F5LgoKCk1pY2hhxYIKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hdGgxMGsK
