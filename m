Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dTU1j-00038w-GZ
 for ath10k@lists.infradead.org; Fri, 07 Jul 2017 14:14:37 +0000
Received: by mail-oi0-x243.google.com with SMTP id f134so4035732oig.0
 for <ath10k@lists.infradead.org>; Fri, 07 Jul 2017 07:14:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87bmowd0mh.fsf@kamboji.qca.qualcomm.com>
References: <CAMuHMdWVYA4TejcTjOQh7CBfFwJ=q59pzvuHrpH91Kx=-BK9fg@mail.gmail.com>
 <c72d2e7a-195d-bcac-4ce5-f3051531664c@gmail.com>
 <87bmowd0mh.fsf@kamboji.qca.qualcomm.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 7 Jul 2017 16:14:13 +0200
Message-ID: <CAK8P3a1CAmHcywnzngo1UOE69ZZZDVbocVEUFt6Uyy05fpaK5w@mail.gmail.com>
Subject: Re: ath10k: ret used but uninitialized
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
Cc: Erik Stromdahl <erik.stromdahl@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, linux-wireless <linux-wireless@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>

T24gRnJpLCBKdWwgNywgMjAxNyBhdCAxMjowNCBQTSwgS2FsbGUgVmFsbyA8a3ZhbG9AcWNhLnF1
YWxjb21tLmNvbT4gd3JvdGU6Cj4gRXJpayBTdHJvbWRhaGwgPGVyaWsuc3Ryb21kYWhsQGdtYWls
LmNvbT4gd3JpdGVzOgo+Cj4+PiBXaXRoIGdjYyA0LjEuMjoKPj4+Cj4+PiBkcml2ZXJzL25ldC93
aXJlbGVzcy9hdGgvYXRoMTBrL3NkaW8uYzogSW4gZnVuY3Rpb24KPj4+IOKAmGF0aDEwa19zZGlv
X21ib3hfcnhtc2dfcGVuZGluZ19oYW5kbGVy4oCZOgo+Pj4gZHJpdmVycy9uZXQvd2lyZWxlc3Mv
YXRoL2F0aDEway9zZGlvLmM6Njc2OiB3YXJuaW5nOiDigJhyZXTigJkgbWF5IGJlIHVzZWQKPj4+
IHVuaW5pdGlhbGl6ZWQgaW4gdGhpcyBmdW5jdGlvbgo+Pj4KPj4+PiArCj4+Pj4gKyAgICAgICAq
ZG9uZSA9IHRydWU7Cj4+Pj4gKwo+Pj4+ICsgICAgICAgLyogQ29weSB0aGUgbG9va2FoZWFkIG9i
dGFpbmVkIGZyb20gdGhlIEhUQyByZWdpc3RlciB0YWJsZSBpbnRvIG91cgo+Pj4+ICsgICAgICAg
ICogdGVtcCBhcnJheSBhcyBhIHN0YXJ0IHZhbHVlLgo+Pj4+ICsgICAgICAgICovCj4+Pj4gKyAg
ICAgICBsb29rYWhlYWRzWzBdID0gbXNnX2xvb2thaGVhZDsKPj4+PiArCj4+Pj4gKyAgICAgICB0
aW1lb3V0ID0gamlmZmllcyArIFNESU9fTUJPWF9QUk9DRVNTSU5HX1RJTUVPVVRfSFo7Cj4+Pgo+
Pj4gQWx0aG91Z2ggdmVyeSB1bmxpa2VseSBkdWUgdG8gdGhlIGxvbmcgdGltZW91dCwgaWYgdGhl
IGNvZGUgaXMgcHJlZW1wdGVkIGhlcmUsCj4+PiBhbmQgdGhlIGxvb3AgYmVsb3cgbmV2ZXIgZW50
ZXJlZCwgcmV0IHdpbGwgaW5kZWVkIGJlIHVuaW5pdGlhbGl6ZWQuCj4+Pgo+Pj4gSXQncyB1bmNs
ZWFyIHRvIG1lIHdoYXQgdGhlIHByb3BlciBpbml0aWFsaXphdGlvbiB3b3VsZCBiZSwgdGhvdWdo
LCBzbwo+Pj4gdGhhdCdzIHdoeSBJIGRpZG4ndCBzZW5kIGEgcGF0Y2guCj4+Pgo+PiBJIHRoaW5r
IGl0IHdvdWxkIGJlIGJlc3QgdG8gdXNlIDAgYXMgaW5pdGlhbCB2YWx1ZSBvZiByZXQgaW4gdGhp
cyBjYXNlLgo+PiBUaGlzIHdpbGwgbWFrZSBhbGwgb3RoZXIgaW50ZXJydXB0cyBiZSBwcm9jZXNz
ZWQgaW4gYSBub3JtYWwgd2F5Lgo+Pgo+PiBLYWxsZTogU2hvdWxkIEkgY3JlYXRlIGEgbmV3IHBh
dGNoIChpbml0aWFsaXppbmcgcmV0IHdpdGggemVybyk/Cj4KPiBZZXMsIHBsZWFzZSBzZW5kIGEg
bmV3IHBhdGNoIGZpeGluZyB0aGlzLgo+Cj4gQnV0IEkgZG9uJ3QgbGlrZSB0aGF0IG11Y2ggd2l0
aCB0aGUgc3R5bGUgb2YgaW5pdGlhbGlzaW5nIHJldCB0byB6ZXJvLAo+IGl0IHRlbmRzIHRvIGhp
ZGUgdGhpbmdzLiBJbnN0ZWFkIG15IHByZWZlcmVuY2UgaXMgc29tZXRoaW5nIGxpa2UgYmVsb3cK
PiB3aGVyZSB0aGUgZXJyb3IgaGFuZGxpbmcgaXMgbW9yZSBleHBsaWNpdCBhbmQgZWFzaWVyIHRv
IGZpbmQgd2hlcmUgaXQncwo+IGV4YWN0bHkgZmFpbGluZy4gQnV0IHRoYXQncyBqdXN0IGFuIGV4
YW1wbGUgaG93IEkgd291bGQgdHJ5IHRvIHNvbHZlIGl0LAo+IGl0IHN0aWxsIGxhY2tzIHRoZSBo
YW5kbGluZyBvZiAtRUNBTkNFTCBldGMuCgpJIHRoaW5rIEkgd291bGQgc2ltcGx5IHJlcGxhY2Ug
dGhlICJ3aGlsZSgpIHt9IiBsb29wIHdpdGggImRve30gd2hpbGUoKSIsCmFzIHRoYXQgd291bGQg
Z3VhcmFudGVlIGl0IHRvIGJlIHJ1biBhdCBsZWFzdCBvbmNlIGluIGEgd2F5IHRoYXQgdGhlCmNv
bXBpbGVyIGNhbiBzZWUuCgogICAgICAgQXJuZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0
aDEwawo=
