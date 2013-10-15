Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-bk0-f45.google.com ([209.85.214.45])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VWARU-0002um-J8
 for ath10k@lists.infradead.org; Tue, 15 Oct 2013 19:38:11 +0000
Received: by mail-bk0-f45.google.com with SMTP id mx11so3313327bkb.4
 for <ath10k@lists.infradead.org>; Tue, 15 Oct 2013 12:37:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87a9iabc9c.fsf@kamboji.qca.qualcomm.com>
References: <20131015184548.14123.56949.stgit@localhost6.localdomain6>
 <20131015184656.14123.70575.stgit@localhost6.localdomain6>
 <87a9iabc9c.fsf@kamboji.qca.qualcomm.com>
Date: Tue, 15 Oct 2013 12:37:42 -0700
Message-ID: <CA+BoTQ=CqXN24Y-tb=r_ruUUNR_imcztULnoTScAvScvbPDbdA@mail.gmail.com>
Subject: Re: [PATCH 3/7] ath10k: track vif list internally
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

T24gMTUgT2N0b2JlciAyMDEzIDExOjQ5LCBLYWxsZSBWYWxvIDxrdmFsb0BxY2EucXVhbGNvbW0u
Y29tPiB3cm90ZToKPiBLYWxsZSBWYWxvIDxrdmFsb0BxY2EucXVhbGNvbW0uY29tPiB3cml0ZXM6
Cj4KPj4gRnJvbTogTWljaGFsIEthemlvciA8bWljaGFsLmthemlvckB0aWV0by5jb20+Cj4+Cj4+
IG1hYzgwMjExIGludGVyZmFjZSBpbnRlcmF0aW9ucyBmdW5jdGlvbnMgaGF2ZQo+PiBwZWN1bGlh
ciBsb2NraW5nIGlzc3Vlcy4gVGhpcyBwYXRjaCBpbnRyb2R1Y2VzCj4+IGludGVybmFsICh0byBh
dGgxMGspIHZpZiBsaXN0IHRoYXQgd2lsbCBiZSB1c2VkCj4+IGZvciB2aWYgaXRlcmF0aW9uIHB1
cnBvc2VzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWwgS2F6aW9yIDxtaWNoYWwua2F6aW9y
QHRpZXRvLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogS2FsbGUgVmFsbyA8a3ZhbG9AcWNhLnF1YWxj
b21tLmNvbT4KPgo+IFsuLi5dCj4KPj4gLS0tIGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0
aDEway9jb3JlLmMKPj4gKysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9jb3Jl
LmMKPj4gQEAgLTcxMyw2ICs3MTMsNyBAQCBzdHJ1Y3QgYXRoMTBrICphdGgxMGtfY29yZV9jcmVh
dGUodm9pZCAqaGlmX3ByaXYsIHN0cnVjdCBkZXZpY2UgKmRldiwKPj4gICAgICAgbXV0ZXhfaW5p
dCgmYXItPmNvbmZfbXV0ZXgpOwo+PiAgICAgICBzcGluX2xvY2tfaW5pdCgmYXItPmRhdGFfbG9j
ayk7Cj4+Cj4+ICsgICAgIElOSVRfTElTVF9IRUFEKCZhci0+YXJ2aWZzKTsKPj4gICAgICAgSU5J
VF9MSVNUX0hFQUQoJmFyLT5wZWVycyk7Cj4+ICAgICAgIGluaXRfd2FpdHF1ZXVlX2hlYWQoJmFy
LT5wZWVyX21hcHBpbmdfd3EpOwo+Pgo+PiBAQCAtODI0LDYgKzgyNSw3IEBAIGludCBhdGgxMGtf
Y29yZV9zdGFydChzdHJ1Y3QgYXRoMTBrICphcikKPj4gICAgICAgICAgICAgICBnb3RvIGVycl9k
aXNjb25uZWN0X2h0YzsKPj4KPj4gICAgICAgYXItPmZyZWVfdmRldl9tYXAgPSAoMSA8PCBUQVJH
RVRfTlVNX1ZERVZTKSAtIDE7Cj4+ICsgICAgIElOSVRfTElTVF9IRUFEKCZhci0+YXJ2aWZzKTsK
Pj4KPj4gICAgICAgcmV0dXJuIDA7Cj4KPiBNaWNoYWwsIHdoeSBkbyB0aGUgSU5JVF9MSVNUX0hF
QUQoKSB0d2ljZT8gSXNuJ3QgaXQgZW5vdWdoIHRvIGRvIGl0Cj4gY29yZV9zdGFydCgpPwoKQWgs
IGdvb2QgcG9pbnQuIEl0J3MgbW9zdCBsaWtlbHkgb2theSB0byBqdXN0IGRvIGl0IGluCmF0aDEw
a19jb3JlX3N0YXJ0KCkuIFRoZSBvbmUgaW4gYXRoMTBrX2NvcmVfY3JlYXRlKCkgaXNuJ3QgcmVx
dWlyZWQuCgoKTWljaGHFggoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
