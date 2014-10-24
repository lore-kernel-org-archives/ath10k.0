Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pd0-f177.google.com ([209.85.192.177])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xhd4t-0000hb-OH
 for ath10k@lists.infradead.org; Fri, 24 Oct 2014 11:30:44 +0000
Received: by mail-pd0-f177.google.com with SMTP id v10so1295096pde.36
 for <ath10k@lists.infradead.org>; Fri, 24 Oct 2014 04:30:22 -0700 (PDT)
Date: Fri, 24 Oct 2014 20:30:19 +0900
From: Okhwan Lee <ohlee@mwnl.snu.ac.kr>
Message-ID: <etPan.544a384b.74b0dc51.8406@Mac-Pro.local>
In-Reply-To: <CA+BoTQn0iEYEQJ4AdO7xfRSHjX1CfO_uovPaxbtxSWQw0vPS+Q@mail.gmail.com>
References: <CANzpp-=opT==PUf5FhWi_cbB91+RhWk+jB7M4bfUCqh2wzQA2A@mail.gmail.com>
 <CA+BoTQmHGtO+XCRg1_jJstm+wHRQLU9sEpBRJ7U+_xO3nq7_VA@mail.gmail.com>
 <CANzpp-kV8LzPgeXHq=DHKsLSdTT+-9gjj08RXST4r3-QOtkanw@mail.gmail.com>
 <CA+BoTQn0iEYEQJ4AdO7xfRSHjX1CfO_uovPaxbtxSWQw0vPS+Q@mail.gmail.com>
Subject: Re: Change channel bandwidth without iw command
MIME-Version: 1.0
Content-Disposition: inline
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "=?utf-8?Q?ath10k=40lists.infradead.org?=" <ath10k@lists.infradead.org>

wqBIaSzCoAoKVGhpcyBsaW5rZWQgaW1hZ2VzIGFyZSB0aGUgcHJpbnRlZCBlcnJvciBtZXNzYWdl
cyB3aGVuIHRoZSBrZXJuZWwgaXMgaW4gcGFuaWMuwqAKaHR0cDovL3d3dy5td25sLnNudS5hYy5r
ci9+b2hsZWUvMS5qcGcKaHR0cDovL3d3dy5td25sLnNudS5hYy5rci9+b2hsZWUvMi5qcGcKClRo
YW5rIHlvdSBmb3IgeW91ciBoZWxwLgoKT2tod2FuCgoKLS0gIApPa2h3YW4gTGVlClNlbnQgd2l0
aCBBaXJtYWlsICAKCuy8nOynkCAyMDE064WEIDEw7JuUIDI07J28IOyXkOyEnCDsmKTtm4QgNDo0
OToyMywgTWljaGFsIEthemlvciAobWljaGFsLmthemlvckB0aWV0by5jb20obWFpbHRvOm1pY2hh
bC5rYXppb3JAdGlldG8uY29tKSkg7J6R7ISx65CoOgoKPiBPbiAyMyBPY3RvYmVyIDIwMTQgMDg6
NTcsIE9raHdhbiBMZWUgd3JvdGU6Cj4gPiBIaSwKPiA+Cj4gPiBUaGFuayB5b3UgZm9yIHlvdXIg
YW5zd2VyLgo+ID4KPiA+PiBUaGUgcGFuaWMgcHJpbnRvdXQgd291bGQgYmUgbW9zdCBoZWxwZnVs
LiBNeSBiZXN0IGd1ZXNzIGlzIHRoaXMKPiA+PiBjcmFzaGVzIGluIGF0aDEwa19kYmcoKSBhdCB0
aGUgdmVyeSBiZWdpbm5pbmcgb2YgYXRoMTBrX2NvbmZpZ19jaGFuCj4gPj4gYmVjYXVzZSBhci0+
Y2hhbmRlZi5jaGFuIGlzIE5VTEwuIFRoaXMgaXMgcHJvYmFibHkgdGhlIGNhc2Ugc2luY2UgeW91
Cj4gPj4gdXNlIG1vbml0b3JfY2hhbmRlZiB3aGljaCBpcyBwcm9iYWJseSAiZW1wdHkiIGF0IHRo
ZSBwb2ludCB5b3UgaW52b2tlCj4gPj4geW91ciBjb2RlLgo+ID4KPiA+IEZpcnN0LCB3ZSBjb25m
aXJtIHRoYXQgYXItPmNoYW5kZWYuY2hhbiBpcyBub3QgTlVMTC4KPiA+IFdlIGZpbmQgb3V0IHRo
ZSB0aGUgZXJyb3Igb2NjdXJzIHdoZW4gIndhaXRfZm9yX2NvbXBsZXRpb25fdGltZW91dCIgaXMg
Y2FsbGVkLgo+ID4gQXRoMTBrIGlzIHRyeWluZyB0byBzdG9wIHZkZXYgKG1vbml0b3JfZGV2KSB3
aGVuIGNoYW5nZSB0aGUgY2hhbm5lbCBzZXR0aW5nLgo+ID4gV2UgaGF2ZSBubyBpZGVhIGFib3V0
IHRoZSBkZXRhaWxzIG9mIGZ1bmN0aW9uLCBidXQgaXQgbWFrZSB3YWl0aW5nCj4gPiB0aW1lIGR1
cmF0aW9uIGZvciBwcmV2aW91cyBldmVudC4KPiA+IFdlIGFsc28gdGVzdCBieSByZXBsYWNpbmcg
d2FpdF9mb3JfY29tcGxldGlvbl90aW1lb3V0IHRvCj4gPiB3YWl0X2Zvcl9jb21wbGV0aW9uIChp
LmUuLCBpdCB1c2UgbWF4aW11bSB0aW1lb3V0IHZhbHVlKQo+ID4gQnV0IHRoZSBrZXJuZWwgcGFu
aWMgaXMgc3RpbGwgdGhlcmUuCj4gPgo+ID4gSG93ZXZlciwgaXQgaXMgbm90IGVhc3kgdG8gcHJp
bnRvdXQgdGhlIG1lc3NhZ2VzIHdoZW4gdGhlIHBhbmljIGlzIG9jY3VycmVkLAo+ID4gYmVjYXVz
ZSB0aGUgc3lzdGVtIHN0b3AgKHNpbWlsYXIgdG8gYmx1ZXNjcmVlbiBpbiB3aWRub3dzPykuCj4g
PiBBZnRlciByZWJvb3QgdGhlIHN5c3RlbSwgdGhlIGxvZyBtZXNzYWdlc3MgZnJvbSBwYW5pYyBp
cyBub3QgcmVjb3JlZAo+ID4gaW4ga2VybmVsIGxvZyBtZXNzYWdlcyAoL3Zhci9sb2cvc3lzbG9n
LCBkbWVzZywga2VybmVsX2xsb2cpIC4KPiAgCj4gQ2FuIHlvdSBhdCBsZWFzdCBkbyBhIHBob3Rv
IG9mIHRoZSBwYW5pYywgcG9zdCBpdCB0byBhbiBpbWFnZSBob3N0aW5nCj4gc2l0ZSBhbmQgbGlu
ayBpdCwgcGxlYXNlPwo+ICAKPiAgCj4gTWljaGHFggoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hdGgxMGsK
