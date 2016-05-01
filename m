Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x22e.google.com ([2a00:1450:4010:c07::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1awjIC-0001fX-7r
 for ath10k@lists.infradead.org; Sun, 01 May 2016 04:47:41 +0000
Received: by mail-lf0-x22e.google.com with SMTP id j8so24948811lfd.2
 for <ath10k@lists.infradead.org>; Sat, 30 Apr 2016 21:47:19 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [Make-wifi-fast] fq_codel_drop vs a udp flood
From: Jonathan Morton <chromatix99@gmail.com>
In-Reply-To: <CAA93jw6QLyx9EaS+ntB0D3duoysu_Z-UYyQfHnRa=pfqPDfWOw@mail.gmail.com>
Date: Sun, 1 May 2016 07:46:53 +0300
Message-Id: <A918BB9D-ECEE-4882-AA56-200C2FF28D79@gmail.com>
References: <CAA93jw6QLyx9EaS+ntB0D3duoysu_Z-UYyQfHnRa=pfqPDfWOw@mail.gmail.com>
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
To: Dave Taht <dave.taht@gmail.com>
Cc: make-wifi-fast@lists.bufferbloat.net, "codel@lists.bufferbloat.net" <codel@lists.bufferbloat.net>, ath10k <ath10k@lists.infradead.org>

Cj4gT24gMSBNYXksIDIwMTYsIGF0IDA2OjQxLCBEYXZlIFRhaHQgPGRhdmUudGFodEBnbWFpbC5j
b20+IHdyb3RlOgo+IAo+IGZxX2NvZGVsX2Ryb3AgbG9va3MgdGhyb3VnaCAxMDI0IHF1ZXVlcyBp
biB0aGUgbWFpbmxpbmUgdmVyc2lvbiBhbmQKPiA0MDk2IGluIHRoaXMuIFs0XSBUaGF0J3MgKmV4
cGVuc2l2ZSouCgpDYWtlIG9yaWdpbmFsbHkgaW5oZXJpdGVkIHRoaXMgYmVoYXZpb3VyLgoKU29t
ZSB0aW1lIGFnbywgSSBjaGFuZ2VkIGl0IHRvIHNlYXJjaCBvbmx5IHRoZSBxdWV1ZXMgaW4gdGhl
IGFjdGl2ZSBsaXN0cy4gIEluIGEgc2ltcGxlIGNhc2UgbGlrZSB0aGlzLCB0aGF0IG1lYW5zIGl0
IG9ubHkgaGFzIHRvIGNvbnNpZGVyIDEtMiBxdWV1ZXMgZWFjaCB0aW1lLCB3aGljaCBpcyBhIGh1
Z2UgaW1wcm92ZW1lbnQgYW5kIHN1ZmZpY2llbnQgZm9yIGFueSBub3JtYWwgdHJhZmZpYyBzaXR1
YXRpb24uCgpUaGUgdGhlb3JldGljYWwgd29yc3QtY2FzZSBwZXJmb3JtYW5jZSAoZWcuIHVuZGVy
IGEgRERvUykgcmVtYWlucyBwb29yLiAgVG8gZml4IHRoYXQsIEkgdGhpbmsgd2Ugd291bGQgbmVl
ZCB0byBtYWludGFpbiBhIG1heC1oZWFwIG9mIHF1ZXVlIGxlbmd0aHMgKHdoaWNoIGlzIGEgZ2Vu
ZXJhbGlzYXRpb24gb2YgdGhlIOKAnGtlZXAgMyBsb25nZXN0IHF1ZXVlc+KAnSBpZGVhKS4gIE9u
IHRoZSB1cHNpZGUsIHRoaXMgaGVhcCB3b3VsZCBvbmx5IG5lZWQgdG8gYmUgbWFpbnRhaW5lZCB3
aGVuIGRyb3BzIGFjdHVhbGx5IG9jY3VyLCBhbmQgd291bGQgcmVtYWluIGZhc3QgaW4gc2ltcGxl
IGNhc2VzIHdoZXJlIG9ubHkgb25lIG9yIHR3byBxdWV1ZXMgYXJlIGRpc3Byb3BvcnRpb25hdGVs
eSBsb25nLgoKSXTigJlzIGp1c3QgYXMgZWFzeSB0byBoZWFkLWRyb3AgYXMgdGFpbC1kcm9wLCBv
bmNlIHlvdSBkZWNpZGUgdG8gYmUgcXVldWUtZmFpciAod2hpY2ggKmlzKiBkZXNpcmFibGUgdG8g
bWFrZSBEb1MgYXR0YWNrcyBoYXJkZXIpLiAgSXQgaXMgdGhlIHF1ZXVlLWZhaXJuZXNzIHdoaWNo
IGlzIENQVSBpbnRlbnNpdmUgKGFuZCBjYW4gYmUgb3B0aW1pc2VkLCBzZWUgYWJvdmUpLiAgSGVh
ZC1kcm9wIGlzIHRoZW9yZXRpY2FsbHkgc3VwZXJpb3IsIHNpbmNlIGl0IGdldHMgdGhlIGNvbmdl
c3Rpb24gc2lnbmFsIHRvIHRoZSByZWNlaXZlciBmYXN0ZXIuICBBbiB1bnJlc3BvbnNpdmUgZmxv
dyB3b27igJl0IGNhcmUgZWl0aGVyIHdheSwgYnV0IGEgcmVzcG9uc2l2ZSBvbmUgd2lsbC4KCiAt
IEpvbmF0aGFuIE1vcnRvbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
