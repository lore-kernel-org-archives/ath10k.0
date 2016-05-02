Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1axEgZ-0005Z2-Mn
 for ath10k@lists.infradead.org; Mon, 02 May 2016 14:18:57 +0000
Received: by mail-oi0-x244.google.com with SMTP id w198so23026022oiw.2
 for <ath10k@lists.infradead.org>; Mon, 02 May 2016 07:18:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1462136140.5535.219.camel@edumazet-glaptop3.roam.corp.google.com>
References: <CAA93jw6QLyx9EaS+ntB0D3duoysu_Z-UYyQfHnRa=pfqPDfWOw@mail.gmail.com>
 <1462125592.5535.194.camel@edumazet-glaptop3.roam.corp.google.com>
 <865DA393-262D-40B6-A9D3-1B978CD5F6C6@gmail.com>
 <1462128385.5535.200.camel@edumazet-glaptop3.roam.corp.google.com>
 <C5D365DA-18EE-446E-9D25-41F48B1C583E@gmail.com>
 <1462136140.5535.219.camel@edumazet-glaptop3.roam.corp.google.com>
Date: Mon, 2 May 2016 17:18:34 +0300
Message-ID: <CACiydbKUu11=zWitkDha0ddgk1-G_Z4-e1+=9ky776VktF5HHg@mail.gmail.com>
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
To: Eric Dumazet <eric.dumazet@gmail.com>
Cc: Jonathan Morton <chromatix99@gmail.com>, "codel@lists.bufferbloat.net" <codel@lists.bufferbloat.net>, Dave Taht <dave.taht@gmail.com>, ath10k <ath10k@lists.infradead.org>, make-wifi-fast@lists.bufferbloat.net

T24gMSBNYXkgMjAxNiBhdCAyMzo1NSwgRXJpYyBEdW1hemV0IDxlcmljLmR1bWF6ZXRAZ21haWwu
Y29tPiB3cm90ZToKPiBPbiBTdW4sIDIwMTYtMDUtMDEgYXQgMjM6MzUgKzAzMDAsIEpvbmF0aGFu
IE1vcnRvbiB3cm90ZToKPj4gPiBPbiAxIE1heSwgMjAxNiwgYXQgMjE6NDYsIEVyaWMgRHVtYXpl
dCA8ZXJpYy5kdW1hemV0QGdtYWlsLmNvbT4gd3JvdGU6Cj4+ID4KPj4gPiBPcHRpbWl6aW5nIHRo
ZSBzZWFyY2ggZnVuY3Rpb24gaXMgbm90IHBvc3NpYmxlLCB1bmxlc3MgeW91IHNsb3cgZG93biB0
aGUKPj4gPiBmYXN0IHBhdGguIFRoaXMgd2FzIG15IGRlc2lnbiBjaG9pY2UuCj4+Cj4+IEkgYmVn
IHRvIGRpZmZlci4gIENha2UgaXRlcmF0ZXMgb3ZlciB0aGUgcXVldWVzIGluIHRoZSBidWxrIGFu
ZCBzcGFyc2UKPj4gbGlzdHMsIHJhdGhlciB0aGFuIGFsbCBxdWV1ZXMgZnVsbCBzdG9wLiAgVGhh
dOKAmXMgYSBzdHJhaWdodGZvcndhcmQKPj4gb3B0aW1pc2F0aW9uIHdoaWNoIGNvdmVycyB0aGUg
Y2FzZSBpbiBxdWVzdGlvbiBoZXJlLCBhbmQgaGFzIG5vIGVmZmVjdAo+PiBvbiB0aGUgZmFzdCBw
YXRoLgo+Cj4KPiBUaGF0cyBub3QgZ29pbmcgdG8gaGVscCwgc29ycnksIGlmIHlvdSBoYXZlIGh1
bmRyZWRzIG9mIGZsb3dzIGluIHRoZXNlCj4gcXVldWVzLiAoSSBoYWQgMjAwIFRDUF9TVFJFQU0g
cnVubmluZyBpbiBteSB0ZXN0LCBwbHVzIG9uZSBob3N0aWxlCj4gVURQX1NUUkVBTSkKPgo+IEl0
IGlzIGdvaW5nIHRvIGJlIF9tdWNoXyBzbG93ZXIsIHNpbmNlIHlvdSdsbCBicmluZyBpbiBjcHUg
Y2FjaGVzIHdheQo+IG1vcmUgbWVtb3J5LCB3aGlsZSBkaXNjIHNwaW5sb2NrIGlzIGhlbGQuCj4K
PiBCZXR0ZXIgaGF2ZSBhIGtub3duIGNvc3Qgb2YgMSBjYWNoZSBsaW5lIG1pc3MgcGVyIGRyb3As
IGluc3RlYWQgb2YgMjAwCj4gY2FjaGUgbGluZSBtaXNzZXMgcGVyIGRyb3AuCj4KPiAoNDA5NiBi
eXRlcyB0byBzdG9yZSBxLT5iYWNrbG9nc1tdIGFycmF5IC0+IDY0IGNhY2hlIGxpbmVzLgo+IElm
IHdlIGRyb3AgNjQgc2tiIHBlciBwYXNzLCB0aGlzIGF2ZXJhZ2VzIHRvIDEgY2FjaGUgbGluZSBt
aXNzIHBlciBkcm9wKQo+Cj4gTGlzdGVuLCBJIG5ldmVyIHRob3VnaHQgcGVvcGxlIHdlcmUgZ29p
bmcgdG8gdXNlIGZxX2NvZGVsIGluIHNvbWUKPiBob3N0aWxlIGVudi4KPgo+IEkgc2ltcGx5IGRl
c2lnbmVkIGl0IHRvIGJlIHVzZWQgaW4gaG9tZSByb3V0ZXJzLCBzbyBJIHdvdWxkIG5vdCBpbWFn
aW5lCj4gc29tZW9uZSB3b3VsZCBiZSB0cnlpbmcgdG8ga2lsbCBpdHMgb3duIEludGVybmV0IGNv
bm5lY3Rpb24uCgpJbWFnaW5lIHlvdSBhcmUgYSB2aWRlbyBvcGVyYXRvciwgaGF2ZSBNYWNCb29r
IFBybywgZ2lnYWJpdCBMQU4gYW5kCk5BUyBvbiBldGhlcm5ldCBzaWRlLiBZb3Ugd291bGQgd2Fu
dCB0byBnZXQgbWF4aW11bSBzcGVlZC4gQW5kCmZxX2NvZGVsIGp1c3QgZHJvcHBlZCBpdCBkb3du
IHRvIDU1ME1icHMgZm9yIFRDUCAoaW5zdGVhZCBvZiA3NTBNYnBzKQphbmQgdG8gMzBNYnBzIGZv
ciBVRFAgKGluc3RlYWQgb2YgOTAwTWJwcykuClNvLCBhZ2FpbiwgaXQgbG9va3MgYnJva2VuIHRv
IG1lLgoKUmVnYXJkcywKUm9tYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
