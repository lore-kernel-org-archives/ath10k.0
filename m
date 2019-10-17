Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout.gmx.net ([212.227.17.22])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iL2z4-0004uV-A4
 for ath10k@lists.infradead.org; Thu, 17 Oct 2019 10:26:20 +0000
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [Make-wifi-fast] [PATCH v2 4/4] mac80211: Use Airtime-based Queue
 Limits (AQL) on packet dequeue
From: Sebastian Moeller <moeller0@gmx.de>
In-Reply-To: <87lftjfz51.fsf@toke.dk>
Date: Thu, 17 Oct 2019 12:25:28 +0200
Message-Id: <18FC6F1D-084C-44BD-87E7-C9F394D6FCD1@gmx.de>
References: <157115993755.2500430.12214017471129215800.stgit@toke.dk>
 <157115994190.2500430.14955682016008497593.stgit@toke.dk>
 <CA+iem5s=xbzZ5goaBO4tZWUKVQRaXb+SnB34NPCppej9mi8sAA@mail.gmail.com>
 <87o8yfg0zo.fsf@toke.dk> <751EA059-654B-4E06-A3D6-C727FE1FCE98@gmx.de>
 <87lftjfz51.fsf@toke.dk>
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
To: =?utf-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Cc: Kan Yan <kyan@google.com>, Rajkumar Manoharan <rmanohar@codeaurora.org>, Kevin Hayes <kevinhayes@google.com>, Make-Wifi-fast <make-wifi-fast@lists.bufferbloat.net>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, John Crispin <john@phrozen.org>, Johannes Berg <johannes@sipsolutions.net>, Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>

V2hhdCBhYm91dCBWTEFOIHRhZ3M/CgpCZXN0IFJlZ2FyZHMKCVNlYmFzdGlhbgoKPiBPbiBPY3Qg
MTcsIDIwMTksIGF0IDEyOjI0LCBUb2tlIEjDuGlsYW5kLUrDuHJnZW5zZW4gPHRva2VAcmVkaGF0
LmNvbT4gd3JvdGU6Cj4gCj4gU2ViYXN0aWFuIE1vZWxsZXIgPG1vZWxsZXIwQGdteC5kZT4gd3Jp
dGVzOgo+IAo+Pj4gT24gT2N0IDE3LCAyMDE5LCBhdCAxMTo0NCwgVG9rZSBIw7hpbGFuZC1Kw7hy
Z2Vuc2VuIDx0b2tlQHJlZGhhdC5jb20+IHdyb3RlOgo+Pj4gCj4+PiBLYW4gWWFuIDxreWFuQGdv
b2dsZS5jb20+IHdyaXRlczoKPj4+IAo+Pj4+IEhpIFRva2UsCj4+Pj4gCj4+Pj4gVGhhbmtzIGZv
ciBnZXR0aW5nIHRoaXMgZG9uZSEgSSB3aWxsIGdpdmUgaXQgYSB0cnkgaW4gdGhlIG5leHQgZmV3
Cj4+Pj4gZGF5cy4gIEEgZmV3IGNvbW1lbnRzOgo+Pj4+IAo+Pj4+PiBUaGUgZXN0aW1hdGVkIGFp
cnRpbWUgZm9yIGVhY2ggc2tiIGlzIHN0b3JlZCBpbiB0aGUgdHhfaW5mbywgc28gd2UgY2FuCj4+
Pj4+IHN1YnRyYWN0IHRoZSBzYW1lIGFtb3VudCBmcm9tIHRoZSBydW5uaW5nIHRvdGFsIHdoZW4g
dGhlIHNrYiBpcyBmcmVlZCBvcgo+Pj4+PiByZWN5Y2xlZC4KPj4+PiAKPj4+PiBMb29rcyBsaWtl
IGF0aDEwayBkcml2ZXIgemVybyBvdXQgdGhlIGluZm8tPnN0YXR1cyBiZWZvcmUgY2FsbGluZwo+
Pj4+IGllZWU4MDIxMV90eF9zdGF0dXMoLi4uKToKPj4+PiBpbnQgYXRoMTBrX3R4cnhfdHhfdW5y
ZWYoc3RydWN0IGF0aDEwa19odHQgKmh0dCwKPj4+PiAgICAgICAgICAgICAgICAgICAgICAgIGNv
bnN0IHN0cnVjdCBodHRfdHhfZG9uZSAqdHhfZG9uZSkKPj4+PiB7Cj4+Pj4gLi4uCj4+Pj4gICAg
ICAgaW5mbyA9IElFRUU4MDIxMV9TS0JfQ0IobXNkdSk7Cj4+Pj4gICAgICAgbWVtc2V0KCZpbmZv
LT5zdGF0dXMsIDAsIHNpemVvZihpbmZvLT5zdGF0dXMpKTsKPj4+PiAuLi4KPj4+PiAgICAgICBp
ZWVlODAyMTFfdHhfc3RhdHVzKGh0dC0+YXItPmh3LCBtc2R1KTsKPj4+PiB9Cj4+PiAKPj4+IEFo
LCBidWdnZXI7IEkgd2FzIGFmcmFpZCB3ZSdkIHJ1biBpbnRvIHRoaXMuIEEgcXVpY2sgZ3JlcCBp
bmRpY2F0ZXMgdGhhdAo+Pj4gaXQncyBvbmx5IGF0aDEwayBhbmQgaXdsIHRoYXQgZG8gdGhpcywg
dGhvdWdoLCBzbyBpdCdzIHByb2JhYmx5Cj4+PiBtYW5hZ2VhYmxlIHRvIGp1c3QgZml4IHRoaXMu
IEkgdGhpbmsgdGhlIHNpbXBsZXN0IHNvbHV0aW9uIGlzIGp1c3QgdG8KPj4+IHJlc3RvcmUgdGhl
IGZpZWxkIGFmdGVyIGNsZWFyaW5nLCBubz8KPj4+IAo+Pj4+IFdlIG5lZWQgZWl0aGVyIHJlc3Rv
cmUgdGhlIGluZm8tPnN0YXR1cy50eF90aW1lX2VzdCBvciBjYWxsaW5nCj4+Pj4gaWVlZTgwMjEx
X3N0YV91cGRhdGVfcGVuZGluZ19haXJ0aW1lKCkgaW4gYXRoMTBrIGJlZm9yZSB0eF90aW1lX2Vz
dAo+Pj4+IGdldCBlcmFzZWQuCj4+Pj4gCj4+Pj4+ICsgICAgICAgaWYgKGxvY2FsLT5haXJ0aW1l
X2ZsYWdzICYgQUlSVElNRV9VU0VfQVFMKSB7Cj4+Pj4+ICsgICAgICAgICAgICAgICBhaXJ0aW1l
ID0gaWVlZTgwMjExX2NhbGNfZXhwZWN0ZWRfdHhfYWlydGltZShodywgdmlmLCB0eHEtPnN0YSwK
Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHNrYi0+bGVuICsgMzgpOwo+Pj4+IAo+Pj4+IEkgdGhpbmsgaXQgaXMgYmV0dGVy
IHRvIHB1dCB0aGUgIisgIDM4IiB0aGF0IHRha2VzIGNhcmUgb2YgdGhlIGhlYWRlcgo+Pj4+IG92
ZXJoZWFkIGluc2lkZSBpZWVlODAyMTFfY2FsY19leHBlY3RlZF90eF9haXJ0aW1lKCkuCj4+PiAK
Pj4+IEhtbSwgbm8gc3Ryb25nIG9waW5pb24gYWJvdXQgdGhpczsgYnV0IHllYWgsIHNpbmNlIHdl
IGhhdmUgYSBkZWRpY2F0ZWQKPj4+IGZ1bmN0aW9uIGZvciB0aGlzIHVzZSBJIGd1ZXNzIHRoZXJl
J3Mgbm8gaGFybSBpbiBhZGRpbmcgaXQgdGhlcmUgOikKPj4+IAo+PiAKPj4gU2lsbHkgcXVlc3Rp
b24sIGlzIHRoaXMgT3ZlcmhlYWQgZ3VhcmFudGVlZCB0byBiZSAzOCBCeXRlcyBmb3IgYWxsCj4+
IGV0ZXJuaXR5PyBPdGhlcndpc2UgYSB2YXJpYWJsZSBvciBhIHByZXByb2Nlc3NvciBjb25zdGFu
dCBtaWdodCBiZQo+PiBtb3JlIGZ1dHVyZSBwcm9vZj8KPiAKPiBXZWxsLCB5ZWFoLCBhcyBsb25n
IGFzIHdlJ3JlIHNlbmRpbmcgRXRoZXJuZXQgcGFja2V0cy4gV2hpY2ggaXMga2luZGEKPiBiYWtl
ZCBpbnRvIHRoZSBXaUZpIHN0YW5kYXJkIDopCj4gCj4gLVRva2UKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEw
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vYXRoMTBrCg==
