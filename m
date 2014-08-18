Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x233.google.com ([2a00:1450:400c:c00::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XJNHT-0004C1-W6
 for ath10k@lists.infradead.org; Mon, 18 Aug 2014 13:47:28 +0000
Received: by mail-wg0-f51.google.com with SMTP id b13so5022905wgh.22
 for <ath10k@lists.infradead.org>; Mon, 18 Aug 2014 06:47:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87d2c4pkks.fsf@kamboji.qca.qualcomm.com>
References: <1407402260-29854-1-git-send-email-michal.kazior@tieto.com>
 <1407402260-29854-3-git-send-email-michal.kazior@tieto.com>
 <87d2c4pkks.fsf@kamboji.qca.qualcomm.com>
Date: Mon, 18 Aug 2014 15:47:03 +0200
Message-ID: <CA+BoTQmTiEaZ03Nu-UiOn2ObW8e-m7it7_Th2KKCn+byFP+mPg@mail.gmail.com>
Subject: Re: [PATCH 2/5] ath10k: setup irq method in probe
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

T24gMTMgQXVndXN0IDIwMTQgMTU6NDgsIEthbGxlIFZhbG8gPGt2YWxvQHFjYS5xdWFsY29tbS5j
b20+IHdyb3RlOgo+IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGlldG8uY29tPiB3cml0
ZXM6Cj4KPj4gSXQgZG9lc24ndCBtYWtlIHNlbnNlIHRvIHJlLWluaXQgaXJxcyBjb21wbGV0ZWx5
Cj4+IHdoZW5ldmVyIHRyYW5zcG9ydCBpcyBzdGFydGVkL3N0b3BwZWQuIERvIGl0IGp1c3QKPj4g
b25jZSB1cG9uIHByb2JpbmcvcmVtb3ZpbmcuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE1pY2hhbCBL
YXppb3IgPG1pY2hhbC5rYXppb3JAdGlldG8uY29tPgo+Cj4gWy4uLl0KPgo+PiBAQCAtMTkwNSwy
MiArMTkxNSwxMCBAQCBzdGF0aWMgaW50IF9fYXRoMTBrX3BjaV9oaWZfcG93ZXJfdXAoc3RydWN0
IGF0aDEwayAqYXIsIGJvb2wgY29sZF9yZXNldCkKPj4gICAgICAgICAgICAgICBnb3RvIGVycjsK
Pj4gICAgICAgfQo+Pgo+PiAtICAgICByZXQgPSBhdGgxMGtfY2VfZGlzYWJsZV9pbnRlcnJ1cHRz
KGFyKTsKPj4gLSAgICAgaWYgKHJldCkgewo+PiAtICAgICAgICAgICAgIGF0aDEwa19lcnIoImZh
aWxlZCB0byBkaXNhYmxlIENFIGludGVycnVwdHM6ICVkXG4iLCByZXQpOwo+PiAtICAgICAgICAg
ICAgIGdvdG8gZXJyX2NlOwo+PiAtICAgICB9Cj4+IC0KPj4gLSAgICAgcmV0ID0gYXRoMTBrX3Bj
aV9pbml0X2lycShhcik7Cj4+IC0gICAgIGlmIChyZXQpIHsKPj4gLSAgICAgICAgICAgICBhdGgx
MGtfZXJyKCJmYWlsZWQgdG8gaW5pdCBpcnFzOiAlZFxuIiwgcmV0KTsKPj4gLSAgICAgICAgICAg
ICBnb3RvIGVycl9jZTsKPj4gLSAgICAgfQo+PiAtCj4+ICAgICAgIHJldCA9IGF0aDEwa19wY2lf
cmVxdWVzdF9lYXJseV9pcnEoYXIpOwo+PiAgICAgICBpZiAocmV0KSB7Cj4+ICAgICAgICAgICAg
ICAgYXRoMTBrX2VycigiZmFpbGVkIHRvIHJlcXVlc3QgZWFybHkgaXJxOiAlZFxuIiwgcmV0KTsK
Pj4gLSAgICAgICAgICAgICBnb3RvIGVycl9kZWluaXRfaXJxOwo+PiArICAgICAgICAgICAgIGdv
dG8gZXJyX2NlOwo+PiAgICAgICB9Cj4KPiBZb3UgYWRkIGF0aDEwa19wY2lfY2VfaW5pdCgpIHRv
IHByb2JlKCkgYW5kIHJlc3BlY3RpdmUKPiBhdGgxMGtfcGNpX2NlX2RlaW5pdCgpIHRvIHJlbW92
ZSgpLCBhbmQgeW91IHJlbW92ZQo+IGF0aDEwa19wY2lfY2VfZGVpbml0KCkgZnJvbSBoaWZfcG93
ZXJfZG93bigpLiBCdXQgd2h5IGRvIHlvdSBsZWF2ZQo+IGF0aDEwa19wY2lfY2VfaW5pdCgpIHRv
IGhpZl9wb3dlcl91cCgpPyBJc24ndCB0aGF0IHVubmVjZXNzYXJ5IGFzIHdlCj4gYWxyZWFkeSBk
byB0aGF0IGluIHByb2JlKCk/CgpIbW0uLiBJIGRpZG4ndCBjaGVjayBpZiBjb3B5IGVuZ2luZSBy
ZWdpc3RlciBzdGF0ZSAobm90YWJsZSByaW5nIGluZGV4CnZhbHVlcykgaXMgZ3VhcmFudGVlZCB0
byBiZSB1c2FibGUgaW4gYWxsIGNhc2VzIHlldCBhbmQgZGVjaWRlZCBpdCdzCnNhZmVyIHRvIGp1
c3QgcmUtaW5pdCBpdCBvbiBlYWNoIHBvd2VyIHVwIHVudGlsIGl0IGlzIHByb3ZlbiBpdCBpcyBu
b3QKbmVjZXNzYXJ5LgoKCj4KPj4gKyAgICAgYXRoMTBrX2luZm8oInBjaSBpcnEgJXMgKG51bSAl
ZCkgaXJxX21vZGUgJWQgcmVzZXRfbW9kZSAlZFxuIiwKPj4gKyAgICAgICAgICAgICAgICAgYXRo
MTBrX3BjaV9nZXRfaXJxX21ldGhvZChhciksIGFyX3BjaS0+bnVtX21zaV9pbnRycywKPj4gKyAg
ICAgICAgICAgICAgICAgYXRoMTBrX3BjaV9pcnFfbW9kZSwgYXRoMTBrX3BjaV9yZXNldF9tb2Rl
KTsKPgo+ICJwY2kgaXJxICVzIGludGVycnVwdHMgJWQgaXJxX21vZGUgJWQgLi4uIgoKV2lsbCBm
aXguCgoKTWljaGHFggoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
