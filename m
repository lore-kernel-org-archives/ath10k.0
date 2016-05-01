Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yw0-x231.google.com ([2607:f8b0:4002:c05::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1awyPM-0005Zi-B2
 for ath10k@lists.infradead.org; Sun, 01 May 2016 20:56:05 +0000
Received: by mail-yw0-x231.google.com with SMTP id g133so219545895ywb.2
 for <ath10k@lists.infradead.org>; Sun, 01 May 2016 13:55:43 -0700 (PDT)
Message-ID: <1462136140.5535.219.camel@edumazet-glaptop3.roam.corp.google.com>
Subject: Re: [Codel] fq_codel_drop vs a udp flood
From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Sun, 01 May 2016 13:55:40 -0700
In-Reply-To: <C5D365DA-18EE-446E-9D25-41F48B1C583E@gmail.com>
References: <CAA93jw6QLyx9EaS+ntB0D3duoysu_Z-UYyQfHnRa=pfqPDfWOw@mail.gmail.com>
 <1462125592.5535.194.camel@edumazet-glaptop3.roam.corp.google.com>
 <865DA393-262D-40B6-A9D3-1B978CD5F6C6@gmail.com>
 <1462128385.5535.200.camel@edumazet-glaptop3.roam.corp.google.com>
 <C5D365DA-18EE-446E-9D25-41F48B1C583E@gmail.com>
Mime-Version: 1.0
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
To: Jonathan Morton <chromatix99@gmail.com>
Cc: make-wifi-fast@lists.bufferbloat.net, "codel@lists.bufferbloat.net" <codel@lists.bufferbloat.net>, Dave Taht <dave.taht@gmail.com>, ath10k <ath10k@lists.infradead.org>

T24gU3VuLCAyMDE2LTA1LTAxIGF0IDIzOjM1ICswMzAwLCBKb25hdGhhbiBNb3J0b24gd3JvdGU6
Cj4gPiBPbiAxIE1heSwgMjAxNiwgYXQgMjE6NDYsIEVyaWMgRHVtYXpldCA8ZXJpYy5kdW1hemV0
QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiAKPiA+IE9wdGltaXppbmcgdGhlIHNlYXJjaCBmdW5jdGlv
biBpcyBub3QgcG9zc2libGUsIHVubGVzcyB5b3Ugc2xvdyBkb3duIHRoZQo+ID4gZmFzdCBwYXRo
LiBUaGlzIHdhcyBteSBkZXNpZ24gY2hvaWNlLgo+IAo+IEkgYmVnIHRvIGRpZmZlci4gIENha2Ug
aXRlcmF0ZXMgb3ZlciB0aGUgcXVldWVzIGluIHRoZSBidWxrIGFuZCBzcGFyc2UKPiBsaXN0cywg
cmF0aGVyIHRoYW4gYWxsIHF1ZXVlcyBmdWxsIHN0b3AuICBUaGF04oCZcyBhIHN0cmFpZ2h0Zm9y
d2FyZAo+IG9wdGltaXNhdGlvbiB3aGljaCBjb3ZlcnMgdGhlIGNhc2UgaW4gcXVlc3Rpb24gaGVy
ZSwgYW5kIGhhcyBubyBlZmZlY3QKPiBvbiB0aGUgZmFzdCBwYXRoLgoKClRoYXRzIG5vdCBnb2lu
ZyB0byBoZWxwLCBzb3JyeSwgaWYgeW91IGhhdmUgaHVuZHJlZHMgb2YgZmxvd3MgaW4gdGhlc2UK
cXVldWVzLiAoSSBoYWQgMjAwIFRDUF9TVFJFQU0gcnVubmluZyBpbiBteSB0ZXN0LCBwbHVzIG9u
ZSBob3N0aWxlClVEUF9TVFJFQU0pCgpJdCBpcyBnb2luZyB0byBiZSBfbXVjaF8gc2xvd2VyLCBz
aW5jZSB5b3UnbGwgYnJpbmcgaW4gY3B1IGNhY2hlcyB3YXkKbW9yZSBtZW1vcnksIHdoaWxlIGRp
c2Mgc3BpbmxvY2sgaXMgaGVsZC4KCkJldHRlciBoYXZlIGEga25vd24gY29zdCBvZiAxIGNhY2hl
IGxpbmUgbWlzcyBwZXIgZHJvcCwgaW5zdGVhZCBvZiAyMDAKY2FjaGUgbGluZSBtaXNzZXMgcGVy
IGRyb3AuCgooNDA5NiBieXRlcyB0byBzdG9yZSBxLT5iYWNrbG9nc1tdIGFycmF5IC0+IDY0IGNh
Y2hlIGxpbmVzLgpJZiB3ZSBkcm9wIDY0IHNrYiBwZXIgcGFzcywgdGhpcyBhdmVyYWdlcyB0byAx
IGNhY2hlIGxpbmUgbWlzcyBwZXIgZHJvcCkKCkxpc3RlbiwgSSBuZXZlciB0aG91Z2h0IHBlb3Bs
ZSB3ZXJlIGdvaW5nIHRvIHVzZSBmcV9jb2RlbCBpbiBzb21lCmhvc3RpbGUgZW52LgoKSSBzaW1w
bHkgZGVzaWduZWQgaXQgdG8gYmUgdXNlZCBpbiBob21lIHJvdXRlcnMsIHNvIEkgd291bGQgbm90
IGltYWdpbmUKc29tZW9uZSB3b3VsZCBiZSB0cnlpbmcgdG8ga2lsbCBpdHMgb3duIEludGVybmV0
IGNvbm5lY3Rpb24uCgpTbyBJIGJlbGlldmUgSSB3aWxsIHNlbnQgdGhpcyBwYXRjaCBhcyBpcyB0
byBEYXZpZCBNaWxsZXIgZm9yIGluY2x1c2lvbi4KCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2F0aDEwawo=
