Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bjMx3-0004Jz-Fi
 for ath10k@lists.infradead.org; Mon, 12 Sep 2016 08:50:55 +0000
Received: by mail-wm0-x235.google.com with SMTP id 1so131826202wmz.1
 for <ath10k@lists.infradead.org>; Mon, 12 Sep 2016 01:50:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAOiWkA8NSv1VskZi4AnTgjt6p-NsRoTMzHqyAPwCsMKU-c9ujg@mail.gmail.com>
References: <CAOiWkA-VhhARncY-E9XnKXm=XmUraCgjDsM+eDLJW2Wx7Jn4Qw@mail.gmail.com>
 <CAJ-VmonT9SNipiMQdmgN4__4QMxgGKYg_-SwH4bieWKwfwdX5A@mail.gmail.com>
 <CAOiWkA8NSv1VskZi4AnTgjt6p-NsRoTMzHqyAPwCsMKU-c9ujg@mail.gmail.com>
From: Michal Kazior <michal.kazior@tieto.com>
Date: Mon, 12 Sep 2016 10:50:25 +0200
Message-ID: <CA+BoTQn5L58sPyE=u79GACoMEXSrdfmJi-OGv3K3kEX46k6sxA@mail.gmail.com>
Subject: Re: accessing ath10k calibration data
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
To: Marty Faltesek <mfaltesek@google.com>
Cc: Adrian Chadd <adrian@freebsd.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gOSBTZXB0ZW1iZXIgMjAxNiBhdCAxOTo0MiwgTWFydHkgRmFsdGVzZWsgPG1mYWx0ZXNla0Bn
b29nbGUuY29tPiB3cm90ZToKPiBJdCdzIGJsb2NrZWQgYnkgdGhlIGNvZGUgYmVsb3cgd2hpY2gg
SSB0cmllZCB0byBpZmRlZiBvdXQsIGJ1dCB0aGVuIGl0Cj4gcmV0dXJucyBhbGwgMCdzLgo+Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvZGVidWcuYwo+IGIv
ZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9kZWJ1Zy5jCj4gaW5kZXggOGIwMWUzZS4u
YmI4YjdlYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL2Rl
YnVnLmMKPiArKysgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL2RlYnVnLmMKPiBA
QCAtMTQzMywxMiArMTQzMywxMyBAQCBzdGF0aWMgaW50IGF0aDEwa19kZWJ1Z19jYWxfZGF0YV9v
cGVuKHN0cnVjdAo+IGlub2RlICppbm9kZSwgc3RydWN0IGZpbGUgKmZpbGUpCj4gICAgICAgICBp
bnQgcmV0Owo+Cj4gICAgICAgICBtdXRleF9sb2NrKCZhci0+Y29uZl9tdXRleCk7Cj4gLQo+ICsj
aWYgMAo+ICAgICAgICAgaWYgKGFyLT5zdGF0ZSAhPSBBVEgxMEtfU1RBVEVfT04gJiYKPiAgICAg
ICAgICAgICBhci0+c3RhdGUgIT0gQVRIMTBLX1NUQVRFX1VURikgewo+ICAgICAgICAgICAgICAg
ICByZXQgPSAtRU5FVERPV047Cj4gICAgICAgICAgICAgICAgIGdvdG8gZXJyOwo+ICAgICAgICAg
fQo+ICsjZW5kaWYKClRoaXMgd29uJ3Qgd29yay4gVGhlIGRyaXZlciBuZWVkcyB0byBnbyB0aHJv
dWdoIGF0aDEwa19zdGFydCgpLCBpLmUuCmZpcm13YXJlIG11c3QgYmUgbG9hZGVkLiBDYWwgZGF0
YSBpcyBjb29rZWQgYXMgcGFydCBvZiB0aGF0LgoKWW91IGNvdWxkIGdldCBhd2F5IHdpdGgganVz
dCBgaWZjb25maWcgd2xhbjAgdXBgLiBZb3UgZG9uJ3QgbmVlZCB0bwpjb25uZWN0IG9yIGFueXRo
aW5nLgoKSSBndWVzcyB0aGUgZHJpdmVyICpjb3VsZCogY2FjaGUgdGhlIGVuZCByZXN1bHRpbmcg
Y2FsIGRhdGEgd2hlbiB0aGUKZGV2aWNlIGlzIHByb2JlZCBhbmQgcmUtdXNlIGl0IGluIHN1YnNl
cXVlbnQgZmlybXdhcmUgYm9vdC11cCBhdHRlbXB0cwooaW5zdGVhZCBvZiByZS1jb21wdXRpbmcg
aXQpIG1ha2luZyBpdCBhdmFpbGFibGUgd2hlbiB0aGUgZGV2aWNlIGlzCnN0b3BwZWQgYXMgd2Vs
bC4gQW55IHZvbHVudGVlcnMgdG8gdHJ5ICphbmQqIHRlc3QgaWYgaXQgZG9lc24ndCBicmVhawph
bnl0aGluZz8gOikKCgo+IE9uIEZyaSwgU2VwIDksIDIwMTYgYXQgMTozOSBQTSwgQWRyaWFuIENo
YWRkIDxhZHJpYW5AZnJlZWJzZC5vcmc+IHdyb3RlOgo+PiBIaSwKPj4KPj4gSXQncyBqdXN0IGlu
IE9UUD8gWW91IHNob3VsZCBiZSBhYmxlIHRvIHJlYWQgdGhlIE9UUCBkYXRhIHdpdGhvdXQKPj4g
bmVlZGluZyBhIFNUQS9BUCB1cD8KCkkgd291bGQgYXJndWUgd2l0aCB0aGUgImp1c3QgT1RQIiBh
dCBsZWFzdCBmcm9tIHRoZSBkcml2ZXItZGV2aWNlCnByb3RvY29sIHBvaW50IG9mIHZpZXcuCgoK
TWljaGHFggoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
