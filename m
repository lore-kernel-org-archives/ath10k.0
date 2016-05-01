Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qg0-x22e.google.com ([2607:f8b0:400d:c04::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1awwOI-0000u4-5h
 for ath10k@lists.infradead.org; Sun, 01 May 2016 18:46:50 +0000
Received: by mail-qg0-x22e.google.com with SMTP id w36so7654436qge.3
 for <ath10k@lists.infradead.org>; Sun, 01 May 2016 11:46:28 -0700 (PDT)
Message-ID: <1462128385.5535.200.camel@edumazet-glaptop3.roam.corp.google.com>
Subject: Re: [Codel] fq_codel_drop vs a udp flood
From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Sun, 01 May 2016 11:46:25 -0700
In-Reply-To: <865DA393-262D-40B6-A9D3-1B978CD5F6C6@gmail.com>
References: <CAA93jw6QLyx9EaS+ntB0D3duoysu_Z-UYyQfHnRa=pfqPDfWOw@mail.gmail.com>
 <1462125592.5535.194.camel@edumazet-glaptop3.roam.corp.google.com>
 <865DA393-262D-40B6-A9D3-1B978CD5F6C6@gmail.com>
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

T24gU3VuLCAyMDE2LTA1LTAxIGF0IDIxOjIwICswMzAwLCBKb25hdGhhbiBNb3J0b24gd3JvdGU6
Cj4gPiBPbiAxIE1heSwgMjAxNiwgYXQgMjA6NTksIEVyaWMgRHVtYXpldCA8ZXJpYy5kdW1hemV0
QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiAKPiA+IGZxX2NvZGVsX2Ryb3AoKSBjb3VsZCBkcm9wIF9h
bGxfIHBhY2tldHMgb2YgdGhlIGZhdCBmbG93LCBpbnN0ZWFkIG9mIGEKPiA+IHNpbmdsZSBvbmUu
Cj4gCj4gVW5mb3J0dW5hdGVseSwgdGhhdCBjb3VsZCBoYXZlIGJhZCBjb25zZXF1ZW5jZXMgaWYg
dGhlIOKAnGZhdCBmbG934oCdCj4gaGFwcGVucyB0byBiZSBhIFRDUCBpbiBzbG93LXN0YXJ0IG9u
IGEgbG9uZy1SVFQgcGF0aC4gIFN1Y2ggYSBmbG93IGlzCj4gcmVzcG9uc2l2ZSwgYnV0IG9uIGFu
IG9yZGVyLW1hZ25pdHVkZSBsb25nZXIgdGltZXNjYWxlIHRoYW4gbWF5IGhhdmUKPiBiZWVuIGNv
bmZpZ3VyZWQgYXMgb3B0aW11bS4KCkFyZSB5b3UgdHJ5aW5nIHRvIHJlaW52ZW50IEh5c3RhcnQg
PyA7KQo+IAo+IFRoZSByZWFsIHByb2JsZW0gaXMgdGhhdCBmcV9jb2RlbF9kcm9wKCkgcGVyZm9y
bXMgdGhlIHNhbWUgKGV4Y2Vzc2l2ZSkKPiBhbW91bnQgb2Ygd29yayB0byBjb3BlIHdpdGggYSBz
aW5nbGUgdW5yZXNwb25zaXZlIGZsb3cgYXMgaXQgd291bGQgZm9yCj4gYSB0cnVlIEREb1MuICBP
cHRpbWlzaW5nIHRoZSBzZWFyY2ggZnVuY3Rpb24gaXMgc3VmZmljaWVudC4KCk9wdGltaXppbmcg
dGhlIHNlYXJjaCBmdW5jdGlvbiBpcyBub3QgcG9zc2libGUsIHVubGVzcyB5b3Ugc2xvdyBkb3du
IHRoZQpmYXN0IHBhdGguIFRoaXMgd2FzIG15IGRlc2lnbiBjaG9pY2UuCgpKdXN0IGRyb3AgaGFs
ZiBiYWNrbG9nIHBhY2tldHMgaW5zdGVhZCBvZiAxLCAobWF5YmUgYWRkIGEgY2FwIG9mIDY0CnBh
Y2tldHMgdG8gYXZvaWQgdG9vIGJpZyBidXJ0cyBvZiBrZnJlZV9za2IoKSB3aGljaCBtaWdodCBh
ZGQgY3B1CnNwaWtlcykgYW5kIHByb2JsZW0gaXMgZ29uZS4KClRDUCBpbiBzbG93IHN0YXJ0IHdv
bnQgYmUgaHVydCBhdCBhbGwuIEEgZmF0IFRDUCBmbG93IGlzIHN0aWxsIGZhdC4KCk9ubHkgYmFk
IENDIGNvdWxkIHBvc3NpYmx5IGJlIGh1cnQuCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
YXRoMTBrCg==
