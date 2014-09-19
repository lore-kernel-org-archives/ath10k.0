Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x233.google.com ([2a00:1450:400c:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XUrED-000293-KP
 for ath10k@lists.infradead.org; Fri, 19 Sep 2014 05:59:34 +0000
Received: by mail-we0-f179.google.com with SMTP id x48so1917535wes.38
 for <ath10k@lists.infradead.org>; Thu, 18 Sep 2014 22:59:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <541B0445.7040707@candelatech.com>
References: <1411046487-19544-1-git-send-email-michal.kazior@tieto.com>
 <1411046487-19544-2-git-send-email-michal.kazior@tieto.com>
 <541B0445.7040707@candelatech.com>
Date: Fri, 19 Sep 2014 07:59:09 +0200
Message-ID: <CA+BoTQnanQmHn_y_5hFZSaEVvCzbY42U+3Z=PVnWTRun-6Jx4g@mail.gmail.com>
Subject: Re: [PATCH 1/9] ath10k: fix tx/rx chainmask init
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
To: Ben Greear <greearb@candelatech.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMTggU2VwdGVtYmVyIDIwMTQgMTg6MTEsIEJlbiBHcmVlYXIgPGdyZWVhcmJAY2FuZGVsYXRl
Y2guY29tPiB3cm90ZToKPiBPbiAwOS8xOC8yMDE0IDA2OjIxIEFNLCBNaWNoYWwgS2F6aW9yIHdy
b3RlOgo+PiBGaXJtd2FyZSByZXBvcnRzIHRoZSBudW1iZXIgb2YgUkYgY2hhaW5zIHNvIHVzZQo+
PiB0aGF0IGZvciBpbml0aWFsaXphdGlvbiBvZiBzdXBwX3t0eCxyeH1fY2hhaW5tYXNrCj4+IGlu
c3RlYWQgb2YgdXNpbmcgYSBtYWNybyBmb3IgM3gzIGNoaXBzLgo+Pgo+PiBUaGlzIHNob3VsZCBt
YWtlIHR4L3J4IGNoYWlubWFzayByZXBvcnRzIGNvcnJlY3QKPj4gZm9yIGNoaXBzIG90aGVyIHRo
YW4gM3gzLgo+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBr
L3dtaS5jIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway93bWkuYwo+PiBpbmRleCAy
YzQyYmQ1Li43NzJjY2E1IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgv
YXRoMTBrL3dtaS5jCj4+ICsrKyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvd21p
LmMKPj4gQEAgLTIxOTgsNiArMjE5OCw5IEBAIHN0YXRpYyB2b2lkIGF0aDEwa193bWlfc2Vydmlj
ZV9yZWFkeV9ldmVudF9yeChzdHJ1Y3QgYXRoMTBrICphciwKPj4gICAgICAgICAgICAgICBhci0+
bnVtX3JmX2NoYWlucyA9IFdNSV9NQVhfU1BBVElBTF9TVFJFQU07Cj4+ICAgICAgIH0KPj4KPj4g
KyAgICAgYXItPnN1cHBfdHhfY2hhaW5tYXNrID0gKDEgPDwgYXItPm51bV9yZl9jaGFpbnMpIC0g
MTsKPj4gKyAgICAgYXItPnN1cHBfcnhfY2hhaW5tYXNrID0gKDEgPDwgYXItPm51bV9yZl9jaGFp
bnMpIC0gMTsKPgo+IEFyZSB0aGVyZSBhcmUgbm8gY2hpcHMgdGhhdCBzdXBwb3J0IGEgZGlmZmVy
ZW50IG51bWJlcgo+IG9mIHR4IGFuZCByeCBjaGFpbnM/CgpJIGRvbid0IHRoaW5rIGN1cnJlbnQg
ZmlybXdhcmUgaW50ZXJmYWNlIGlzIGNhcGFibGUgb2YgYWR2ZXJ0aXNpbmcKdGhhdCB0byB0aGUg
aG9zdCBzbyBJJ20gZ3Vlc3NpbmcgdGhlcmUgYXJlIG5vbmUgeWV0LgoKCk1pY2hhxYIKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5n
IGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
