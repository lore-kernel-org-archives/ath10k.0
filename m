Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22e.google.com ([2a00:1450:400c:c05::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xz0Ul-0001Ji-C6
 for ath10k@lists.infradead.org; Thu, 11 Dec 2014 09:57:16 +0000
Received: by mail-wi0-f174.google.com with SMTP id h11so13983354wiw.7
 for <ath10k@lists.infradead.org>; Thu, 11 Dec 2014 01:56:45 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1418214714-29689-3-git-send-email-michal.kazior@tieto.com>
References: <1418214714-29689-1-git-send-email-michal.kazior@tieto.com>
 <1418214714-29689-3-git-send-email-michal.kazior@tieto.com>
Date: Thu, 11 Dec 2014 10:56:43 +0100
Message-ID: <CA+BoTQ=yrruA_D_M8P=szxy75x=r7oxG9ukCedEZwZBp-5JX1g@mail.gmail.com>
Subject: Re: [PATCH 2/5] ath10k: fix STA u-APSD
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Michal Kazior <michal.kazior@tieto.com>

T24gMTAgRGVjZW1iZXIgMjAxNCBhdCAxMzozMSwgTWljaGFsIEthemlvciA8bWljaGFsLmthemlv
ckB0aWV0by5jb20+IHdyb3RlOgpbLi4uXQo+IEBAIC0zMDM2LDE0ICszMDYxLDExIEBAIHN0YXRp
YyBpbnQgYXRoMTBrX2FkZF9pbnRlcmZhY2Uoc3RydWN0IGllZWU4MDIxMV9odyAqaHcsCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgZ290byBlcnJfcGVlcl9kZWxldGU7Cj4gICAgICAgICAgICAg
ICAgIH0KPgo+IC0gICAgICAgICAgICAgICBwYXJhbSA9IFdNSV9TVEFfUFNfUEFSQU1fVFhfV0FL
RV9USFJFU0hPTEQ7Cj4gLSAgICAgICAgICAgICAgIHZhbHVlID0gV01JX1NUQV9QU19UWF9XQUtF
X1RIUkVTSE9MRF9BTFdBWVM7Cj4gLSAgICAgICAgICAgICAgIHJldCA9IGF0aDEwa193bWlfc2V0
X3N0YV9wc19wYXJhbShhciwgYXJ2aWYtPnZkZXZfaWQsCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXJhbSwgdmFsdWUpOwo+ICsgICAgICAgICAg
ICAgICByZXQgPSBhdGgxMGtfbWFjX3ZpZl9yZWNhbGNfcHNfd2FrZV90aHJlc2hvbGQoYXJ2aWYp
Owo+ICAgICAgICAgICAgICAgICBpZiAocmV0KSB7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAg
YXRoMTBrX3dhcm4oYXIsICJmYWlsZWQgdG8gc2V0IHZkZXYgJWkgVFggd2FrZSB0aHJlc2g6ICVk
XG4iLAo+ICsgICAgICAgICAgICAgICAgICAgICAgIGF0aDEwa193YXJuKGFyLCAiZmFpbGVkIHRv
IHJlY2FsYyBwcyB3YWtlIHRocmVzaG9sZCBvbiB2ZGV2ICVpOiAlZFxuIiwKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBhcnZpZi0+dmRldl9pZCwgcmV0KTsKPiAtICAgICAg
ICAgICAgICAgICAgICAgICBnb3RvIGVycl9wZWVyX2RlbGV0ZTsKPiArICAgICAgICAgICAgICAg
ICAgICAgICByZXR1cm4gcmV0OwoKT29wcy4gVGhpcyBpcyB3cm9uZy4gSSBzaG91bGQga2VlcCB0
aGUgZ290by4KClRoZXJlIGFyZSBhbHNvIHNvbWUgUnggcGVyZm9ybWFuY2UgaXNzdWVzIHJlbGF0
ZWQgdG8gZXhjZXNzaXZlIFBTLVBvbGwgdXNhZ2UuCgpJJ2xsIHJlLXNwaW4gbGF0ZXIuCgoKTWlj
aGHFggoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRo
MTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
