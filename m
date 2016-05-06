Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout.gmx.net ([212.227.15.15])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ayieP-0008T2-CQ
 for ath10k@lists.infradead.org; Fri, 06 May 2016 16:30:50 +0000
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Subject: Re: [Codel] fq_codel_drop vs a udp flood
From: moeller0 <moeller0@gmx.de>
In-Reply-To: <1462550314.13075.51.camel@edumazet-glaptop3.roam.corp.google.com>
Date: Fri, 6 May 2016 18:30:13 +0200
Message-Id: <98D677A4-8310-455B-9F7A-65C0B168E961@gmx.de>
References: <CAA93jw6QLyx9EaS+ntB0D3duoysu_Z-UYyQfHnRa=pfqPDfWOw@mail.gmail.com>
 <865DA393-262D-40B6-A9D3-1B978CD5F6C6@gmail.com>
 <1462128385.5535.200.camel@edumazet-glaptop3.roam.corp.google.com>
 <C5D365DA-18EE-446E-9D25-41F48B1C583E@gmail.com>
 <1462136140.5535.219.camel@edumazet-glaptop3.roam.corp.google.com>
 <CACiydbKUu11=zWitkDha0ddgk1-G_Z4-e1+=9ky776VktF5HHg@mail.gmail.com>
 <1462201620.5535.250.camel@edumazet-glaptop3.roam.corp.google.com>
 <CACiydbKeKUENncrc-NmYRcku-DGVeGqqzYMqsCqKdxPsR7yUOQ@mail.gmail.com>
 <1462205669.5535.254.camel@edumazet-glaptop3.roam.corp.google.com>
 <CACiydbL26Jj3EcEL4EmqaH=1Dm-Q0dpVwoWxqUSZ7ry10bRgeg@mail.gmail.com>
 <1462464776.13075.18.camel@edumazet-glaptop3.roam.corp.google.com>
 <CACiydbJYrFRMJvSHM6tJYWR8vmgV3xxnSUQsb-h5WcnLW=KXoQ@mail.gmail.com>
 <1462476207.13075.20.camel@edumazet-glaptop3.roam.corp.google.com>
 <CAA93jw4XZ1+LLX1z6wQ6DHsp4vFCS5zmMz-uku_8SBNG_KuUxA@mail.gmail.com>
 <542135C7-D7CC-4E33-B35B-C2AD259FA5AB@gmx.de>
 <20160506133323.0b190f47@redhat.com>
 <D29AB9B2-D514-4D14-9A16-CFB9ECD05B17@gmx.de>
 <1462541156.13075.34.camel@edumazet-glaptop3.roam.corp.google.com>
 <2BFC725A-F007-4D63-89BD-E1845F7E89BE@gmx.de>
 <1462550314.13075.51.camel@edumazet-glaptop3.roam.corp.google.com>
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
Cc: make-wifi-fast@lists.bufferbloat.net, =?utf-8?Q?Dave_T=C3=A4ht?= <dave.taht@gmail.com>, ath10k <ath10k@lists.infradead.org>, "codel@lists.bufferbloat.net" <codel@lists.bufferbloat.net>, Jesper Dangaard Brouer <brouer@redhat.com>, Jonathan Morton <chromatix99@gmail.com>, Roman Yeryomin <leroi.lists@gmail.com>

SGkgRXJpYywKCj4gT24gTWF5IDYsIDIwMTYsIGF0IDE3OjU4ICwgRXJpYyBEdW1hemV0IDxlcmlj
LmR1bWF6ZXRAZ21haWwuY29tPiB3cm90ZToKPiAKPiBPbiBGcmksIDIwMTYtMDUtMDYgYXQgMTc6
MjUgKzAyMDAsIG1vZWxsZXIwIHdyb3RlOgo+PiBIaSBFcmljLAo+PiAKPj4+IE9uIE1heSA2LCAy
MDE2LCBhdCAxNToyNSAsIEVyaWMgRHVtYXpldCA8ZXJpYy5kdW1hemV0QGdtYWlsLmNvbT4gd3Jv
dGU6Cj4gCj4+PiBBbmdsZXMgb2YgYXR0YWNrIDoKPj4+IAo+Pj4gMSkgSSB3aWxsIHByb3ZpZGUg
YSBwZXIgZGV2aWNlIC9zeXMvY2xhc3MvbmV0L2V0aDAvZ3JvX21heF9mcmFncyBzbyB0aGF0Cj4+
PiB3ZSBjYW4gbW9yZSBlYXNpbHkgY29udHJvbCBhbW91bnQgb2Ygc2VncyBwZXIgR1JPIHBhY2tl
dHMuIEl0IG1ha2VzCj4+PiBzZW5zZSB0byBoYXZlIEdSTywgYnV0IG5vdCBzbyBtdWNoIGFsbG93
aW5nIGl0IHRvIGNvb2sgYmlnIHBhY2tldHMgdGhhdAo+Pj4gbWlnaHQgaHVydCBGUS4KPj4gCj4+
IAlUaGlzIHNvdW5kcyBncmVhdCwgc28gd2UgY2FuIHRlYWNoLCBzYXkgc3FtIHRvIHNldCB0aGlz
IHRvIGEKPj4gcmVhc29uYWJsZSB2YWx1ZSBnaXZlbiB0aGUgKHNoYXBlZCkgYmFuZHdpZHRoIG9m
IGEgZ2l2ZW4gaW50ZXJmYWNlLgo+PiBXb3VsZCBzb21ldGhpbmcgbGlrZSB0aGlzIGFsc28gbWFr
ZSBzZW5zZS9pcyBwb3NzaWJsZSBvbiB0aGUgc2VuZCBzaWRlCj4+IGZvciBHU08vVFNPPwo+IAo+
IFByb2JsZW0gb2YgZG9pbmcgdGhpcyBvbiB0aGUgc2VuZCBzaWRlLCBpcyB0aGF0IHRvbyBiaWcg
R1JPIHBhY2tldHMKPiB3b3VsZCBuZWVkIHRvIGJlIHNlZ21lbnRlZCBfYmVmb3JlXyByZWFjaGlu
ZyBxZGlzYywgYW5kIHdlIGRvIG5vdCBoYXZlCj4gc3VjaCBzdXBwb3J0LiAoVGhlIHNlZ21lbnRh
dGlvbiBoYXBwZW5zIGFmdGVyIHFkaXNjIGJlZm9yZSBoaXR0aW5nCj4gZGV2aWNlKQoKCUFoLCBz
byBub3QgcmVhbGx5IHBvc3NpYmxlIHRoZW4uCgo+IAo+IEluIGFueSBjYXNlLCB0aGF0IHdvdWxk
IGJlIG1vcmUgY3B1IGN5Y2xlcy4gSXQgaXMgcHJvYmFibHkgYmV0dGVyIHRvCj4gY29udHJvbCBH
Uk8gc2l6ZXMgdG8gb3B0aW1hbCB2YWx1ZXMuCgoJSSBndWVzcyB3ZSBjYW4gYWx3YXlzIGxpbWl0
IHRoZSBHUk8gc2VnbWVudHMgb24gdGhlIGludGVybmFsIGluZ3Jlc3MgaW50ZXJmYWNlcywgc28g
dGhhdCB0aGUgZXh0ZXJuYWwgZWdyZXNzIGludGVyZmFjZSBuZXZlciBzZWVzIHRvbyDigJxsb25n
4oCdIChhcyBpbiByZXF1aXJlZCB0cmFuc21pc3Npb24gdGltZSkgYWdncmVnYXRlcy9zdXBlci1w
YWNrZXRzLgoKPiAKPiBJIHBvc3RlZCB0aGUgZnFfY29kZWwgcGF0Y2ggdG8gbmV0ZGV2IDoKPiAK
PiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3BhdGNoLzYxOTM0NC8KCglTYXcgdGhpcywg
dG8gcXVvdGUgU3RpbXB5IOKAnGhhcHB5IGhhcHB5IGpveSBqb3nigJ0KCkJlc3QgUmVnYXJkcwoJ
U2ViYXN0aWFuCgo+IAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
