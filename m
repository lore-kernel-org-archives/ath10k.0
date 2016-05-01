Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x236.google.com ([2a00:1450:4010:c07::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1awvyx-0008Ek-4R
 for ath10k@lists.infradead.org; Sun, 01 May 2016 18:20:39 +0000
Received: by mail-lf0-x236.google.com with SMTP id m64so14234038lfd.1
 for <ath10k@lists.infradead.org>; Sun, 01 May 2016 11:20:18 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [Codel] fq_codel_drop vs a udp flood
From: Jonathan Morton <chromatix99@gmail.com>
In-Reply-To: <1462125592.5535.194.camel@edumazet-glaptop3.roam.corp.google.com>
Date: Sun, 1 May 2016 21:20:10 +0300
Message-Id: <865DA393-262D-40B6-A9D3-1B978CD5F6C6@gmail.com>
References: <CAA93jw6QLyx9EaS+ntB0D3duoysu_Z-UYyQfHnRa=pfqPDfWOw@mail.gmail.com>
 <1462125592.5535.194.camel@edumazet-glaptop3.roam.corp.google.com>
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
To: Eric Dumazet <eric.dumazet@gmail.com>
Cc: make-wifi-fast@lists.bufferbloat.net, "codel@lists.bufferbloat.net" <codel@lists.bufferbloat.net>, Dave Taht <dave.taht@gmail.com>, ath10k <ath10k@lists.infradead.org>

Cj4gT24gMSBNYXksIDIwMTYsIGF0IDIwOjU5LCBFcmljIER1bWF6ZXQgPGVyaWMuZHVtYXpldEBn
bWFpbC5jb20+IHdyb3RlOgo+IAo+IGZxX2NvZGVsX2Ryb3AoKSBjb3VsZCBkcm9wIF9hbGxfIHBh
Y2tldHMgb2YgdGhlIGZhdCBmbG93LCBpbnN0ZWFkIG9mIGEKPiBzaW5nbGUgb25lLgoKVW5mb3J0
dW5hdGVseSwgdGhhdCBjb3VsZCBoYXZlIGJhZCBjb25zZXF1ZW5jZXMgaWYgdGhlIOKAnGZhdCBm
bG934oCdIGhhcHBlbnMgdG8gYmUgYSBUQ1AgaW4gc2xvdy1zdGFydCBvbiBhIGxvbmctUlRUIHBh
dGguICBTdWNoIGEgZmxvdyBpcyByZXNwb25zaXZlLCBidXQgb24gYW4gb3JkZXItbWFnbml0dWRl
IGxvbmdlciB0aW1lc2NhbGUgdGhhbiBtYXkgaGF2ZSBiZWVuIGNvbmZpZ3VyZWQgYXMgb3B0aW11
bS4KClRoZSByZWFsIHByb2JsZW0gaXMgdGhhdCBmcV9jb2RlbF9kcm9wKCkgcGVyZm9ybXMgdGhl
IHNhbWUgKGV4Y2Vzc2l2ZSkgYW1vdW50IG9mIHdvcmsgdG8gY29wZSB3aXRoIGEgc2luZ2xlIHVu
cmVzcG9uc2l2ZSBmbG93IGFzIGl0IHdvdWxkIGZvciBhIHRydWUgRERvUy4gIE9wdGltaXNpbmcg
dGhlIHNlYXJjaCBmdW5jdGlvbiBpcyBzdWZmaWNpZW50LgoKIC0gSm9uYXRoYW4gTW9ydG9uCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1h
aWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
