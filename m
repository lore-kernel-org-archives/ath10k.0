Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x234.google.com ([2a00:1450:400c:c05::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WdFGw-00077O-7p
 for ath10k@lists.infradead.org; Thu, 24 Apr 2014 08:44:47 +0000
Received: by mail-wi0-f180.google.com with SMTP id q5so670083wiv.7
 for <ath10k@lists.infradead.org>; Thu, 24 Apr 2014 01:44:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1398327250-12923-1-git-send-email-yeohchunyeow@gmail.com>
References: <1398327250-12923-1-git-send-email-yeohchunyeow@gmail.com>
Date: Thu, 24 Apr 2014 10:44:22 +0200
Message-ID: <CA+BoTQkBCGyKYDaOMgdCi4Yw+SXeuRS+t0rGE8o=8+x2q5N74w@mail.gmail.com>
Subject: Re: [PATCH] ath10k: don't allow stand alone monitor mode for non-AP
 firmware
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
To: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMjQgQXByaWwgMjAxNCAxMDoxNCwgQ2h1bi1ZZW93IFllb2ggPHllb2hjaHVueWVvd0BnbWFp
bC5jb20+IHdyb3RlOgo+IEZpcm13YXJlIDk5OS45OTkuMC42MzYgZG9lcyBub3QgYWxsb3cgc3Rh
bmQgYWxvbmUgbW9uaXRvcgo+IG1vZGUuIFRoaXMgbWVhbnMgdGhhdCBicmlkZ2luZyB0aGUgU1RB
IG1vZGUgYW5kIHB1dCBpdCBpbnRvCj4gcHJvbWlzY3VvdXMgbW9kZSB3aWxsIGFsc28gY2F1c2Ug
dGhlIGZpcm13YXJlIHRvIGNyYXNoLiBBdm9pZAo+IHRoaXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBD
aHVuLVllb3cgWWVvaCA8eWVvaGNodW55ZW93QGdtYWlsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9u
ZXQvd2lyZWxlc3MvYXRoL2F0aDEway9tYWMuYyB8IDcgKysrKysrLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9tYWMuYyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0
aC9hdGgxMGsvbWFjLmMKPiBpbmRleCBlMmMwMWRjLi5mNjQwMzI4IDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvbWFjLmMKPiArKysgYi9kcml2ZXJzL25ldC93
aXJlbGVzcy9hdGgvYXRoMTBrL21hYy5jCj4gQEAgLTY0NywxMCArNjQ3LDE1IEBAIHN0YXRpYyBp
bnQgYXRoMTBrX21vbml0b3JfdmRldl9kZWxldGUoc3RydWN0IGF0aDEwayAqYXIpCj4KPiAgc3Rh
dGljIGludCBhdGgxMGtfbW9uaXRvcl9zdGFydChzdHJ1Y3QgYXRoMTBrICphcikKPiAgewo+IC0g
ICAgICAgaW50IHJldDsKPiArICAgICAgIGludCByZXQgPSAtMTsKPgo+ICAgICAgICAgbG9ja2Rl
cF9hc3NlcnRfaGVsZCgmYXItPmNvbmZfbXV0ZXgpOwo+Cj4gKyAgICAgICBpZiAoYXItPmZ3X3Zl
cnNpb25fYnVpbGQgPT0gNjM2KSB7Cj4gKyAgICAgICAgICAgICAgIGF0aDEwa193YXJuKCJzdGFu
ZCBhbG9uZSBtb25pdG9yIG1vZGUgaXMgbm90IHN1cHBvcnRlZFxuIik7Cj4gKyAgICAgICAgICAg
ICAgIHJldHVybiByZXQ7Cj4gKyAgICAgICB9CgpJIHRoaW5rIE1vbml0b3Igb3BlcmF0aW9uIHNo
b3VsZCBiZSBwZXJmb3JtZWQgb24gYSBiZXN0IGVmZm9ydCBiYXNpcy4KVGhpcyBtZWFucyBtb25p
dG9yX3N0YXJ0L3N0b3Agc2hvdWxkIGJlIGF0dGVtcHRlZCBvbmNlIG51bWJlciBvZgpub24tbW9u
aXRvciB2ZGV2cyBjaGFuZ2VzLgoKV2Ugc2hvdWxkIHByb2JhYmx5IGludHJvZHVjZSBhIGF0aDEw
a19yZWNhbGNfbW9uaXRvcigpIGZvciB0aGF0IHB1cnBvc2UuCgoKTWljaGHFggoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlz
dAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
