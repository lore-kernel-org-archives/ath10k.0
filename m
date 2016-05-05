Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x22e.google.com ([2a00:1450:4010:c07::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ayMdN-000703-8j
 for ath10k@lists.infradead.org; Thu, 05 May 2016 17:00:18 +0000
Received: by mail-lf0-x22e.google.com with SMTP id y84so103589061lfc.0
 for <ath10k@lists.infradead.org>; Thu, 05 May 2016 09:59:56 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [Codel] fq_codel_drop vs a udp flood
From: Jonathan Morton <chromatix99@gmail.com>
In-Reply-To: <CACiydb+kOLNBwEn+gDU3fZrXEQxp5FMFLH_mDS1ZO5J8r9yiBA@mail.gmail.com>
Date: Thu, 5 May 2016 19:59:51 +0300
Message-Id: <2D83E4F6-03DD-4421-AAE0-DD3C6A8AFCE0@gmail.com>
References: <CAA93jw6QLyx9EaS+ntB0D3duoysu_Z-UYyQfHnRa=pfqPDfWOw@mail.gmail.com>
 <1462125592.5535.194.camel@edumazet-glaptop3.roam.corp.google.com>
 <865DA393-262D-40B6-A9D3-1B978CD5F6C6@gmail.com>
 <1462128385.5535.200.camel@edumazet-glaptop3.roam.corp.google.com>
 <C5D365DA-18EE-446E-9D25-41F48B1C583E@gmail.com>
 <1462136140.5535.219.camel@edumazet-glaptop3.roam.corp.google.com>
 <CACiydbKUu11=zWitkDha0ddgk1-G_Z4-e1+=9ky776VktF5HHg@mail.gmail.com>
 <1462201620.5535.250.camel@edumazet-glaptop3.roam.corp.google.com>
 <CACiydbKeKUENncrc-NmYRcku-DGVeGqqzYMqsCqKdxPsR7yUOQ@mail.gmail.com>
 <1462205669.5535.254.camel@edumazet-glaptop3.roam.corp.google.com>
 <CACiydbL26Jj3EcEL4EmqaH=1Dm-Q0dpVwoWxqUSZ7ry10bRgeg@mail.gmail.com>
 <CAA93jw5Y3DSzuOZo=S6_dsUqJvy_3ThNe6tMic2ZJ14kQPnFHg@mail.gmail.com>
 <CACiydb+kOLNBwEn+gDU3fZrXEQxp5FMFLH_mDS1ZO5J8r9yiBA@mail.gmail.com>
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
To: Roman Yeryomin <leroi.lists@gmail.com>
Cc: make-wifi-fast@lists.bufferbloat.net, ath10k <ath10k@lists.infradead.org>, "codel@lists.bufferbloat.net" <codel@lists.bufferbloat.net>, Dave Taht <dave.taht@gmail.com>, Eric Dumazet <eric.dumazet@gmail.com>

PiBIYXZpbmcgc2FtZSAobG93KSBzcGVlZHMuCj4gU28gaXQgZGlkbid0IGhlbHAgYXQgYWxsIDoo
CgpBbHRob3VnaCB0aGUgbmV3IOKAnGVtZXJnZW5jeSBkcm9w4oCdIGNvZGUgaXMgbm93IGRyb3Bw
aW5nIGJhdGNoZXMgb2YgY29uc2VjdXRpdmUgcGFja2V0cywgQ29kZWwgaXMgYWxzbyBzdGlsbCBk
cm9wcGluZyBpbmRpdmlkdWFsIHBhY2tldHMgaW4gYmV0d2VlbiB0aGVzZSBiYXRjaGVzLCBwcm9i
YWJseSBhdCBhIGhpZ2ggcmF0ZS4gIFNpbmNlIGFsbCBmcmFnbWVudHMgb2YgYW4gb3JpZ2luYWwg
cGFja2V0IGFyZSByZXF1aXJlZCB0byByZWFzc2VtYmxlIGl0LCBidXQgQ29kZWwgZG9lc27igJl0
IGxpbmsgcmVsYXRlZCBmcmFnbWVudHMgd2hlbiBkZWNpZGluZyB0byBkcm9wLCBlYWNoIGZyYWdt
ZW50IGxvc3QgaW4gdGhpcyB3YXkgcmVkdWNlcyB0aHJvdWdocHV0IGVmZmljaWVuY3kuICBPbmx5
IGEgZnJhY3Rpb24gb2YgdGhlIG9yaWdpbmFsIHBhY2tldHMgY2FuIGJlIHJlYXNzZW1ibGVkIGNv
cnJlY3RseSwgYnV0IHRoZSBzdXJ2aXZpbmcgKHlldCB1c2VsZXNzKSBmcmFnbWVudHMgc3RpbGwg
b2NjdXB5IGxpbmsgY2FwYWNpdHkuCgpUaGlzIHBoZW5vbWVub24gaXMgbm90IENvZGVsIHNwZWNp
ZmljOyBJIHdvdWxkIGFsc28gZXhwZWN0IHRvIHNlZSBpdCBvbiBtb3N0IG90aGVyIEFRTXMsIGFu
ZCBkZWZpbml0ZWx5IG9uIFJFRCB2YXJpYW50cywgaW5jbHVkaW5nIFBJRS4gIEZvcnR1bmF0ZWx5
IGZvciByZWFsIHRyYWZmaWMsIGl0IG5vcm1hbGx5IGFyaXNlcyBvbmx5IG9uIGFydGlmaWNpYWwg
dHJhZmZpYyBzdWNoIGFzIGlwZXJmIHJ1bnMgd2l0aCBsYXJnZSBVRFAgcGFja2V0cy4gIFVuZm9y
dHVuYXRlbHkgZm9yIEFRTSBhZHZvY2F0ZXMsIGlwZXJmIHVzZXMgbGFyZ2UgVURQIHBhY2tldHMg
YnkgZGVmYXVsdCwgYW5kIGl0IGlzIHZlcnkgZWFzeSB0byBtaXNpbnRlcnByZXQgdGhlIHJlc3Vs
dHMgdW5mYXZvdXJhYmx5IGZvciBBUU0gKGFzIG9wcG9zZWQgdG8gdW5mYXZvdXJhYmx5IGZvciBp
cGVyZikuCgpJZiB5b3UgcmUtcnVuIHRoZSB0ZXN0IHdpdGggaXBlcmYgc2V0IHRvIGEgcGFja2V0
IHNpemUgY29tcGF0aWJsZSB3aXRoIHRoZSBwYXRoIE1UVSwgeW91IHNob3VsZCBzZWUgbXVjaCBi
ZXR0ZXIgdGhyb3VnaHB1dCBudW1iZXJzIGR1ZSB0byB0aGUgZWxpbWluYXRpb24gb2YgZnJhZ21l
bnRlZCBwYWNrZXRzLiAgQSBVRFAgcGF5bG9hZCBzaXplIG9mIDEyODAgYnl0ZXMgaXMgYSBzYWZl
LCBjb25zZXJ2YXRpdmUgZmlndXJlIGZvciBhIG5vcm1hbCBNVFUgaW4gdGhlIHZpY2luaXR5IG9m
IDE1MDAuCgo+IExpbWl0IG9mIDEwMjQgcGFja2V0cyBhbmQgMTAyNCBmbG93cyBpcyBub3Qgd2lz
ZSBJIHRoaW5rLgo+IAo+IChJZiBhbGwgYnVja2V0cyBhcmUgaW4gdXNlLCBlYWNoIGJ1Y2tldCBo
YXMgYSB2aXJ0dWFsIHF1ZXVlIG9mIDEgcGFja2V0LAo+IHdoaWNoIGlzIGFsbW9zdCB0aGUgc2Ft
ZSB0aGFuIGhhdmluZyBubyBxdWV1ZSBhdCBhbGwpCgpUaGlzLCB3aGlsZSB0aGVvcmV0aWNhbGx5
IGltcG9ydGFudCBpbiBleHRyZW1lIGNhc2VzIHdpdGggdmVyeSBsYXJnZSBudW1iZXJzIG9mIGZs
b3dzLCBpcyBub3QgcmVsZXZhbnQgdG8gdGhlIHNwZWNpZmljIHRlc3QgaW4gcXVlc3Rpb24uCgog
LSBKb25hdGhhbiBNb3J0b24KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
