Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout.gmx.net ([212.227.17.20])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iL2Xg-0002bM-Pi
 for ath10k@lists.infradead.org; Thu, 17 Oct 2019 09:58:02 +0000
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [Make-wifi-fast] [PATCH v2 4/4] mac80211: Use Airtime-based Queue
 Limits (AQL) on packet dequeue
From: Sebastian Moeller <moeller0@gmx.de>
In-Reply-To: <87o8yfg0zo.fsf@toke.dk>
Date: Thu, 17 Oct 2019 11:57:36 +0200
Message-Id: <751EA059-654B-4E06-A3D6-C727FE1FCE98@gmx.de>
References: <157115993755.2500430.12214017471129215800.stgit@toke.dk>
 <157115994190.2500430.14955682016008497593.stgit@toke.dk>
 <CA+iem5s=xbzZ5goaBO4tZWUKVQRaXb+SnB34NPCppej9mi8sAA@mail.gmail.com>
 <87o8yfg0zo.fsf@toke.dk>
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
Cc: Kan Yan <kyan@google.com>, Rajkumar Manoharan <rmanohar@codeaurora.org>, Kevin Hayes <kevinhayes@google.com>, make-wifi-fast@lists.bufferbloat.net, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, John Crispin <john@phrozen.org>, Johannes Berg <johannes@sipsolutions.net>, Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>

Cgo+IE9uIE9jdCAxNywgMjAxOSwgYXQgMTE6NDQsIFRva2UgSMO4aWxhbmQtSsO4cmdlbnNlbiA8
dG9rZUByZWRoYXQuY29tPiB3cm90ZToKPiAKPiBLYW4gWWFuIDxreWFuQGdvb2dsZS5jb20+IHdy
aXRlczoKPiAKPj4gSGkgVG9rZSwKPj4gCj4+IFRoYW5rcyBmb3IgZ2V0dGluZyB0aGlzIGRvbmUh
IEkgd2lsbCBnaXZlIGl0IGEgdHJ5IGluIHRoZSBuZXh0IGZldwo+PiBkYXlzLiAgQSBmZXcgY29t
bWVudHM6Cj4+IAo+Pj4gVGhlIGVzdGltYXRlZCBhaXJ0aW1lIGZvciBlYWNoIHNrYiBpcyBzdG9y
ZWQgaW4gdGhlIHR4X2luZm8sIHNvIHdlIGNhbgo+Pj4gc3VidHJhY3QgdGhlIHNhbWUgYW1vdW50
IGZyb20gdGhlIHJ1bm5pbmcgdG90YWwgd2hlbiB0aGUgc2tiIGlzIGZyZWVkIG9yCj4+PiByZWN5
Y2xlZC4KPj4gCj4+IExvb2tzIGxpa2UgYXRoMTBrIGRyaXZlciB6ZXJvIG91dCB0aGUgaW5mby0+
c3RhdHVzIGJlZm9yZSBjYWxsaW5nCj4+IGllZWU4MDIxMV90eF9zdGF0dXMoLi4uKToKPj4gaW50
IGF0aDEwa190eHJ4X3R4X3VucmVmKHN0cnVjdCBhdGgxMGtfaHR0ICpodHQsCj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBodHRfdHhfZG9uZSAqdHhfZG9uZSkKPj4gewo+
PiAuLi4KPj4gICAgICAgIGluZm8gPSBJRUVFODAyMTFfU0tCX0NCKG1zZHUpOwo+PiAgICAgICAg
bWVtc2V0KCZpbmZvLT5zdGF0dXMsIDAsIHNpemVvZihpbmZvLT5zdGF0dXMpKTsKPj4gLi4uCj4+
ICAgICAgICBpZWVlODAyMTFfdHhfc3RhdHVzKGh0dC0+YXItPmh3LCBtc2R1KTsKPj4gfQo+IAo+
IEFoLCBidWdnZXI7IEkgd2FzIGFmcmFpZCB3ZSdkIHJ1biBpbnRvIHRoaXMuIEEgcXVpY2sgZ3Jl
cCBpbmRpY2F0ZXMgdGhhdAo+IGl0J3Mgb25seSBhdGgxMGsgYW5kIGl3bCB0aGF0IGRvIHRoaXMs
IHRob3VnaCwgc28gaXQncyBwcm9iYWJseQo+IG1hbmFnZWFibGUgdG8ganVzdCBmaXggdGhpcy4g
SSB0aGluayB0aGUgc2ltcGxlc3Qgc29sdXRpb24gaXMganVzdCB0bwo+IHJlc3RvcmUgdGhlIGZp
ZWxkIGFmdGVyIGNsZWFyaW5nLCBubz8KPiAKPj4gV2UgbmVlZCBlaXRoZXIgcmVzdG9yZSB0aGUg
aW5mby0+c3RhdHVzLnR4X3RpbWVfZXN0IG9yIGNhbGxpbmcKPj4gaWVlZTgwMjExX3N0YV91cGRh
dGVfcGVuZGluZ19haXJ0aW1lKCkgaW4gYXRoMTBrIGJlZm9yZSB0eF90aW1lX2VzdAo+PiBnZXQg
ZXJhc2VkLgo+PiAKPj4+ICsgICAgICAgaWYgKGxvY2FsLT5haXJ0aW1lX2ZsYWdzICYgQUlSVElN
RV9VU0VfQVFMKSB7Cj4+PiArICAgICAgICAgICAgICAgYWlydGltZSA9IGllZWU4MDIxMV9jYWxj
X2V4cGVjdGVkX3R4X2FpcnRpbWUoaHcsIHZpZiwgdHhxLT5zdGEsCj4+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2tiLT5sZW4g
KyAzOCk7Cj4+IAo+PiBJIHRoaW5rIGl0IGlzIGJldHRlciB0byBwdXQgdGhlICIrICAzOCIgdGhh
dCB0YWtlcyBjYXJlIG9mIHRoZSBoZWFkZXIKPj4gb3ZlcmhlYWQgaW5zaWRlIGllZWU4MDIxMV9j
YWxjX2V4cGVjdGVkX3R4X2FpcnRpbWUoKS4KPiAKPiBIbW0sIG5vIHN0cm9uZyBvcGluaW9uIGFi
b3V0IHRoaXM7IGJ1dCB5ZWFoLCBzaW5jZSB3ZSBoYXZlIGEgZGVkaWNhdGVkCj4gZnVuY3Rpb24g
Zm9yIHRoaXMgdXNlIEkgZ3Vlc3MgdGhlcmUncyBubyBoYXJtIGluIGFkZGluZyBpdCB0aGVyZSA6
KQo+IAoKU2lsbHkgcXVlc3Rpb24sIGlzIHRoaXMgT3ZlcmhlYWQgZ3VhcmFudGVlZCB0byBiZSAz
OCBCeXRlcyBmb3IgYWxsIGV0ZXJuaXR5PyBPdGhlcndpc2UgYSB2YXJpYWJsZSBvciBhIHByZXBy
b2Nlc3NvciBjb25zdGFudCBtaWdodCBiZSBtb3JlIGZ1dHVyZSBwcm9vZj8KCkJlc3QgUmVnYXJk
cwoJU2ViYXN0aWFuCgoKPiAtVG9rZQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gTWFrZS13aWZpLWZhc3QgbWFpbGluZyBsaXN0Cj4gTWFrZS13
aWZpLWZhc3RAbGlzdHMuYnVmZmVyYmxvYXQubmV0Cj4gaHR0cHM6Ly9saXN0cy5idWZmZXJibG9h
dC5uZXQvbGlzdGluZm8vbWFrZS13aWZpLWZhc3QKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
YXRoMTBrCg==
