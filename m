Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ayNFU-0005dN-Kr
 for ath10k@lists.infradead.org; Thu, 05 May 2016 17:39:41 +0000
Received: by mail-oi0-x244.google.com with SMTP id d139so15115696oig.1
 for <ath10k@lists.infradead.org>; Thu, 05 May 2016 10:39:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <2D83E4F6-03DD-4421-AAE0-DD3C6A8AFCE0@gmail.com>
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
 <2D83E4F6-03DD-4421-AAE0-DD3C6A8AFCE0@gmail.com>
Date: Thu, 5 May 2016 20:39:19 +0300
Message-ID: <CACiydbL+Pbmjn+MQ060iXp_ExjVAf6kp9hSERT216tjMN9O6uA@mail.gmail.com>
Subject: Re: [Codel] fq_codel_drop vs a udp flood
From: Roman Yeryomin <leroi.lists@gmail.com>
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
Cc: make-wifi-fast@lists.bufferbloat.net, ath10k <ath10k@lists.infradead.org>, "codel@lists.bufferbloat.net" <codel@lists.bufferbloat.net>, Dave Taht <dave.taht@gmail.com>, Eric Dumazet <eric.dumazet@gmail.com>

T24gNSBNYXkgMjAxNiBhdCAxOTo1OSwgSm9uYXRoYW4gTW9ydG9uIDxjaHJvbWF0aXg5OUBnbWFp
bC5jb20+IHdyb3RlOgo+PiBIYXZpbmcgc2FtZSAobG93KSBzcGVlZHMuCj4+IFNvIGl0IGRpZG4n
dCBoZWxwIGF0IGFsbCA6KAo+Cj4gQWx0aG91Z2ggdGhlIG5ldyDigJxlbWVyZ2VuY3kgZHJvcOKA
nSBjb2RlIGlzIG5vdyBkcm9wcGluZyBiYXRjaGVzIG9mIGNvbnNlY3V0aXZlIHBhY2tldHMsIENv
ZGVsIGlzIGFsc28gc3RpbGwgZHJvcHBpbmcgaW5kaXZpZHVhbCBwYWNrZXRzIGluIGJldHdlZW4g
dGhlc2UgYmF0Y2hlcywgcHJvYmFibHkgYXQgYSBoaWdoIHJhdGUuICBTaW5jZSBhbGwgZnJhZ21l
bnRzIG9mIGFuIG9yaWdpbmFsIHBhY2tldCBhcmUgcmVxdWlyZWQgdG8gcmVhc3NlbWJsZSBpdCwg
YnV0IENvZGVsIGRvZXNu4oCZdCBsaW5rIHJlbGF0ZWQgZnJhZ21lbnRzIHdoZW4gZGVjaWRpbmcg
dG8gZHJvcCwgZWFjaCBmcmFnbWVudCBsb3N0IGluIHRoaXMgd2F5IHJlZHVjZXMgdGhyb3VnaHB1
dCBlZmZpY2llbmN5LiAgT25seSBhIGZyYWN0aW9uIG9mIHRoZSBvcmlnaW5hbCBwYWNrZXRzIGNh
biBiZSByZWFzc2VtYmxlZCBjb3JyZWN0bHksIGJ1dCB0aGUgc3Vydml2aW5nICh5ZXQgdXNlbGVz
cykgZnJhZ21lbnRzIHN0aWxsIG9jY3VweSBsaW5rIGNhcGFjaXR5Lgo+Cj4gVGhpcyBwaGVub21l
bm9uIGlzIG5vdCBDb2RlbCBzcGVjaWZpYzsgSSB3b3VsZCBhbHNvIGV4cGVjdCB0byBzZWUgaXQg
b24gbW9zdCBvdGhlciBBUU1zLCBhbmQgZGVmaW5pdGVseSBvbiBSRUQgdmFyaWFudHMsIGluY2x1
ZGluZyBQSUUuICBGb3J0dW5hdGVseSBmb3IgcmVhbCB0cmFmZmljLCBpdCBub3JtYWxseSBhcmlz
ZXMgb25seSBvbiBhcnRpZmljaWFsIHRyYWZmaWMgc3VjaCBhcyBpcGVyZiBydW5zIHdpdGggbGFy
Z2UgVURQIHBhY2tldHMuICBVbmZvcnR1bmF0ZWx5IGZvciBBUU0gYWR2b2NhdGVzLCBpcGVyZiB1
c2VzIGxhcmdlIFVEUCBwYWNrZXRzIGJ5IGRlZmF1bHQsIGFuZCBpdCBpcyB2ZXJ5IGVhc3kgdG8g
bWlzaW50ZXJwcmV0IHRoZSByZXN1bHRzIHVuZmF2b3VyYWJseSBmb3IgQVFNIChhcyBvcHBvc2Vk
IHRvIHVuZmF2b3VyYWJseSBmb3IgaXBlcmYpLgo+Cj4gSWYgeW91IHJlLXJ1biB0aGUgdGVzdCB3
aXRoIGlwZXJmIHNldCB0byBhIHBhY2tldCBzaXplIGNvbXBhdGlibGUgd2l0aCB0aGUgcGF0aCBN
VFUsIHlvdSBzaG91bGQgc2VlIG11Y2ggYmV0dGVyIHRocm91Z2hwdXQgbnVtYmVycyBkdWUgdG8g
dGhlIGVsaW1pbmF0aW9uIG9mIGZyYWdtZW50ZWQgcGFja2V0cy4gIEEgVURQIHBheWxvYWQgc2l6
ZSBvZiAxMjgwIGJ5dGVzIGlzIGEgc2FmZSwgY29uc2VydmF0aXZlIGZpZ3VyZSBmb3IgYSBub3Jt
YWwgTVRVIGluIHRoZSB2aWNpbml0eSBvZiAxNTAwLgoKU2V0dGluZyBwYWNrZXQgc2l6ZSB0byAx
MjgwICgtbDEyODApIGluc3RlYWQgb2YgMTQ3MiwgSSBnb3QgZXZlbiBsb3dlcgpzcGVlZCAoMTgt
MjBNYnBzKS4KT3RoZXIgaWRlYXM/Cgo+PiBMaW1pdCBvZiAxMDI0IHBhY2tldHMgYW5kIDEwMjQg
Zmxvd3MgaXMgbm90IHdpc2UgSSB0aGluay4KPj4KPj4gKElmIGFsbCBidWNrZXRzIGFyZSBpbiB1
c2UsIGVhY2ggYnVja2V0IGhhcyBhIHZpcnR1YWwgcXVldWUgb2YgMSBwYWNrZXQsCj4+IHdoaWNo
IGlzIGFsbW9zdCB0aGUgc2FtZSB0aGFuIGhhdmluZyBubyBxdWV1ZSBhdCBhbGwpCj4KPiBUaGlz
LCB3aGlsZSB0aGVvcmV0aWNhbGx5IGltcG9ydGFudCBpbiBleHRyZW1lIGNhc2VzIHdpdGggdmVy
eSBsYXJnZSBudW1iZXJzIG9mIGZsb3dzLCBpcyBub3QgcmVsZXZhbnQgdG8gdGhlIHNwZWNpZmlj
IHRlc3QgaW4gcXVlc3Rpb24uCj4KPiAgLSBKb25hdGhhbiBNb3J0b24KPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAph
dGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2F0aDEwawo=
