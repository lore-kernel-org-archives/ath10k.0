Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iL2xO-00034O-Tu
 for ath10k@lists.infradead.org; Thu, 17 Oct 2019 10:24:36 +0000
Received: by mail-lj1-f199.google.com with SMTP id j6so325348ljb.19
 for <ath10k@lists.infradead.org>; Thu, 17 Oct 2019 03:24:29 -0700 (PDT)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: Re: [Make-wifi-fast] [PATCH v2 4/4] mac80211: Use Airtime-based Queue
 Limits (AQL) on packet dequeue
In-Reply-To: <751EA059-654B-4E06-A3D6-C727FE1FCE98@gmx.de>
References: <157115993755.2500430.12214017471129215800.stgit@toke.dk>
 <157115994190.2500430.14955682016008497593.stgit@toke.dk>
 <CA+iem5s=xbzZ5goaBO4tZWUKVQRaXb+SnB34NPCppej9mi8sAA@mail.gmail.com>
 <87o8yfg0zo.fsf@toke.dk> <751EA059-654B-4E06-A3D6-C727FE1FCE98@gmx.de>
Date: Thu, 17 Oct 2019 12:24:26 +0200
Message-ID: <87lftjfz51.fsf@toke.dk>
MIME-Version: 1.0
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
To: Sebastian Moeller <moeller0@gmx.de>
Cc: Kan Yan <kyan@google.com>, Rajkumar Manoharan <rmanohar@codeaurora.org>, Kevin Hayes <kevinhayes@google.com>, make-wifi-fast@lists.bufferbloat.net, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, John Crispin <john@phrozen.org>, Johannes Berg <johannes@sipsolutions.net>, Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>

U2ViYXN0aWFuIE1vZWxsZXIgPG1vZWxsZXIwQGdteC5kZT4gd3JpdGVzOgoKPj4gT24gT2N0IDE3
LCAyMDE5LCBhdCAxMTo0NCwgVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIDx0b2tlQHJlZGhhdC5j
b20+IHdyb3RlOgo+PiAKPj4gS2FuIFlhbiA8a3lhbkBnb29nbGUuY29tPiB3cml0ZXM6Cj4+IAo+
Pj4gSGkgVG9rZSwKPj4+IAo+Pj4gVGhhbmtzIGZvciBnZXR0aW5nIHRoaXMgZG9uZSEgSSB3aWxs
IGdpdmUgaXQgYSB0cnkgaW4gdGhlIG5leHQgZmV3Cj4+PiBkYXlzLiAgQSBmZXcgY29tbWVudHM6
Cj4+PiAKPj4+PiBUaGUgZXN0aW1hdGVkIGFpcnRpbWUgZm9yIGVhY2ggc2tiIGlzIHN0b3JlZCBp
biB0aGUgdHhfaW5mbywgc28gd2UgY2FuCj4+Pj4gc3VidHJhY3QgdGhlIHNhbWUgYW1vdW50IGZy
b20gdGhlIHJ1bm5pbmcgdG90YWwgd2hlbiB0aGUgc2tiIGlzIGZyZWVkIG9yCj4+Pj4gcmVjeWNs
ZWQuCj4+PiAKPj4+IExvb2tzIGxpa2UgYXRoMTBrIGRyaXZlciB6ZXJvIG91dCB0aGUgaW5mby0+
c3RhdHVzIGJlZm9yZSBjYWxsaW5nCj4+PiBpZWVlODAyMTFfdHhfc3RhdHVzKC4uLik6Cj4+PiBp
bnQgYXRoMTBrX3R4cnhfdHhfdW5yZWYoc3RydWN0IGF0aDEwa19odHQgKmh0dCwKPj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBodHRfdHhfZG9uZSAqdHhfZG9uZSkKPj4+
IHsKPj4+IC4uLgo+Pj4gICAgICAgIGluZm8gPSBJRUVFODAyMTFfU0tCX0NCKG1zZHUpOwo+Pj4g
ICAgICAgIG1lbXNldCgmaW5mby0+c3RhdHVzLCAwLCBzaXplb2YoaW5mby0+c3RhdHVzKSk7Cj4+
PiAuLi4KPj4+ICAgICAgICBpZWVlODAyMTFfdHhfc3RhdHVzKGh0dC0+YXItPmh3LCBtc2R1KTsK
Pj4+IH0KPj4gCj4+IEFoLCBidWdnZXI7IEkgd2FzIGFmcmFpZCB3ZSdkIHJ1biBpbnRvIHRoaXMu
IEEgcXVpY2sgZ3JlcCBpbmRpY2F0ZXMgdGhhdAo+PiBpdCdzIG9ubHkgYXRoMTBrIGFuZCBpd2wg
dGhhdCBkbyB0aGlzLCB0aG91Z2gsIHNvIGl0J3MgcHJvYmFibHkKPj4gbWFuYWdlYWJsZSB0byBq
dXN0IGZpeCB0aGlzLiBJIHRoaW5rIHRoZSBzaW1wbGVzdCBzb2x1dGlvbiBpcyBqdXN0IHRvCj4+
IHJlc3RvcmUgdGhlIGZpZWxkIGFmdGVyIGNsZWFyaW5nLCBubz8KPj4gCj4+PiBXZSBuZWVkIGVp
dGhlciByZXN0b3JlIHRoZSBpbmZvLT5zdGF0dXMudHhfdGltZV9lc3Qgb3IgY2FsbGluZwo+Pj4g
aWVlZTgwMjExX3N0YV91cGRhdGVfcGVuZGluZ19haXJ0aW1lKCkgaW4gYXRoMTBrIGJlZm9yZSB0
eF90aW1lX2VzdAo+Pj4gZ2V0IGVyYXNlZC4KPj4+IAo+Pj4+ICsgICAgICAgaWYgKGxvY2FsLT5h
aXJ0aW1lX2ZsYWdzICYgQUlSVElNRV9VU0VfQVFMKSB7Cj4+Pj4gKyAgICAgICAgICAgICAgIGFp
cnRpbWUgPSBpZWVlODAyMTFfY2FsY19leHBlY3RlZF90eF9haXJ0aW1lKGh3LCB2aWYsIHR4cS0+
c3RhLAo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBza2ItPmxlbiArIDM4KTsKPj4+IAo+Pj4gSSB0aGluayBpdCBpcyBiZXR0
ZXIgdG8gcHV0IHRoZSAiKyAgMzgiIHRoYXQgdGFrZXMgY2FyZSBvZiB0aGUgaGVhZGVyCj4+PiBv
dmVyaGVhZCBpbnNpZGUgaWVlZTgwMjExX2NhbGNfZXhwZWN0ZWRfdHhfYWlydGltZSgpLgo+PiAK
Pj4gSG1tLCBubyBzdHJvbmcgb3BpbmlvbiBhYm91dCB0aGlzOyBidXQgeWVhaCwgc2luY2Ugd2Ug
aGF2ZSBhIGRlZGljYXRlZAo+PiBmdW5jdGlvbiBmb3IgdGhpcyB1c2UgSSBndWVzcyB0aGVyZSdz
IG5vIGhhcm0gaW4gYWRkaW5nIGl0IHRoZXJlIDopCj4+IAo+Cj4gU2lsbHkgcXVlc3Rpb24sIGlz
IHRoaXMgT3ZlcmhlYWQgZ3VhcmFudGVlZCB0byBiZSAzOCBCeXRlcyBmb3IgYWxsCj4gZXRlcm5p
dHk/IE90aGVyd2lzZSBhIHZhcmlhYmxlIG9yIGEgcHJlcHJvY2Vzc29yIGNvbnN0YW50IG1pZ2h0
IGJlCj4gbW9yZSBmdXR1cmUgcHJvb2Y/CgpXZWxsLCB5ZWFoLCBhcyBsb25nIGFzIHdlJ3JlIHNl
bmRpbmcgRXRoZXJuZXQgcGFja2V0cy4gV2hpY2ggaXMga2luZGEKYmFrZWQgaW50byB0aGUgV2lG
aSBzdGFuZGFyZCA6KQoKLVRva2UKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
