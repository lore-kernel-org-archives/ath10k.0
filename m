Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x233.google.com ([2a00:1450:400c:c05::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XAFQ5-0001XK-RT
 for ath10k@lists.infradead.org; Thu, 24 Jul 2014 09:34:38 +0000
Received: by mail-wi0-f179.google.com with SMTP id f8so3668147wiw.6
 for <ath10k@lists.infradead.org>; Thu, 24 Jul 2014 02:34:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <871ttbrtp8.fsf@kamboji.qca.qualcomm.com>
References: <87mwc0ro8i.fsf@kamboji.qca.qualcomm.com>
 <1406136773-19957-1-git-send-email-sw@simonwunderlich.de>
 <871ttbrtp8.fsf@kamboji.qca.qualcomm.com>
Date: Thu, 24 Jul 2014 11:34:12 +0200
Message-ID: <CA+BoTQkmEoJ4TTDvBE9cagUGRFPKWVBFjGcyXfMsHHD9-bdDJA@mail.gmail.com>
Subject: Re: [PATCHv3-ath-resend 2/2] ath10k: add spectral scan feature
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
Cc: Simon Wunderlich <sw@simonwunderlich.de>, Mathias Kretschmer <mathias.kretschmer@fokus.fraunhofer.de>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "Giori,
 Kathy" <kgiori@qca.qualcomm.com>, Sven Eckelmann <sven@narfation.org>

T24gMjQgSnVseSAyMDE0IDExOjI5LCBLYWxsZSBWYWxvIDxrdmFsb0BxY2EucXVhbGNvbW0uY29t
PiB3cm90ZToKPiBTaW1vbiBXdW5kZXJsaWNoIDxzd0BzaW1vbnd1bmRlcmxpY2guZGU+IHdyaXRl
czoKPgo+PiBBZGRzIHRoZSBzcGVjdHJhbCBzY2FuIGZlYXR1cmUgZm9yIGF0aDEway4gVGhlIHNw
ZWN0cmFsIHNjYW4gaXMgdHJpZ2dlcmVkIGJ5Cj4+IGNvbmZpZ3VyaW5nIGEgbW9kZSB0aHJvdWdo
IGEgZGVidWdmcyBjb250cm9sIGZpbGUuIFNhbXBsZXMgY2FuIGJlIGdhdGhlcmVkIHZpYQo+PiBh
bm90aGVyIHJlbGF5IGRlYnVnZnMgZmlsZS4KPj4KWy4uLl0KPj4gQEAgLTgwMCw4ICs4MDAsNiBA
QCBpbnQgYXRoMTBrX2NvcmVfc3RhcnQoc3RydWN0IGF0aDEwayAqYXIpCj4+ICAgICAgIGVsc2UK
Pj4gICAgICAgICAgICAgICBhci0+ZnJlZV92ZGV2X21hcCA9ICgxIDw8IFRBUkdFVF9OVU1fVkRF
VlMpIC0gMTsKPj4KPj4gLSAgICAgSU5JVF9MSVNUX0hFQUQoJmFyLT5hcnZpZnMpOwo+PiAtCj4+
ICAgICAgIGlmICghdGVzdF9iaXQoQVRIMTBLX0ZMQUdfRklSU1RfQk9PVF9ET05FLCAmYXItPmRl
dl9mbGFncykpIHsKPj4gICAgICAgICAgICAgICBhdGgxMGtfaW5mbygiJXMgKDB4JTA4eCwgMHgl
MDh4KSBmdyAlcyBhcGkgJWQgaHR0ICVkLiVkXG4iLAo+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGFyLT5od19wYXJhbXMubmFtZSwKPj4gQEAgLTEwODQsNiArMTA4MiwxMiBAQCBzdHJ1Y3Qg
YXRoMTBrICphdGgxMGtfY29yZV9jcmVhdGUodm9pZCAqaGlmX3ByaXYsIHN0cnVjdCBkZXZpY2Ug
KmRldiwKPj4gICAgICAgSU5JVF9XT1JLKCZhci0+cmVnaXN0ZXJfd29yaywgYXRoMTBrX2NvcmVf
cmVnaXN0ZXJfd29yayk7Cj4+ICAgICAgIElOSVRfV09SSygmYXItPnJlc3RhcnRfd29yaywgYXRo
MTBrX2NvcmVfcmVzdGFydCk7Cj4+Cj4+ICsgICAgIElOSVRfTElTVF9IRUFEKCZhci0+YXJ2aWZz
KTsKPgo+IEknbSBhIGJpdCBzdXNwaWNpb3VzIGFib3V0IHRoaXMsIHdoeSBpcyBpdCBuZWVkZWQ/
CgpHb29kIGh1bmNoLiBhci0+YXJ2aWZzIG11c3QgYmUgcmUtaW5pdGlhbGl6ZWQgaW4gY29yZV9z
dGFydCBmb3IKcmVjb3ZlcnkgdG8gd29yayBjb3JyZWN0bHkuCgoKTWljaGHFggoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlz
dAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
