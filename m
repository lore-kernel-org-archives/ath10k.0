Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fRN3T-0002YG-It
 for ath10k@lists.infradead.org; Fri, 08 Jun 2018 19:28:13 +0000
Received: by mail-wr0-x244.google.com with SMTP id d2-v6so14392645wrm.10
 for <ath10k@lists.infradead.org>; Fri, 08 Jun 2018 12:28:00 -0700 (PDT)
Message-ID: <1528486076.3619.2.camel@gmail.com>
Subject: Re: Frequent ath10k crashes with QCA6174 on kernels 4.16 and 4.17
From: timur.kristof@gmail.com
Date: Fri, 08 Jun 2018 21:27:56 +0200
In-Reply-To: <89a29eb6-996e-1c8e-b332-c14fdf241b79@codeaurora.org>
References: <c92e04d5b80af2a640ab97efce32d987ffb27ffe.camel@gmail.com>
 <87po1e69tz.fsf@kamboji.qca.qualcomm.com>
 <bc31b06dc4093b8613fbde6a13f16bd7e8c31e82.camel@gmail.com>
 <87fu2a4mk5.fsf@kamboji.qca.qualcomm.com>
 <8691304d5e1a0a99f41ebfa4aec6ba192b13e46a.camel@gmail.com>
 <ecd19f9f5ef727547986b8c4dbf47c3e083c684b.camel@gmail.com>
 <89a29eb6-996e-1c8e-b332-c14fdf241b79@codeaurora.org>
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
To: Ryan Hsu <ryanhsu@codeaurora.org>, Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org

T24gRnJpLCAyMDE4LTA2LTA4IGF0IDExOjM3IC0wNzAwLCBSeWFuIEhzdSB3cm90ZToKPiBPbiAw
NS8zMC8yMDE4IDEyOjE1IEFNLCBUaW11ciBLcmlzdMOzZiB3cm90ZToKPiAKPiA+IE9uIFR1ZSwg
MjAxOC0wNS0yOSBhdCAyMjozNiArMDMwMCwgVGltdXIgS3Jpc3TDs2Ygd3JvdGU6Cj4gPiA+IAo+
ID4gPiBUaGFua3MhCj4gPiA+IEl0IGRvZXMgbm90IGFwcGx5IHRvIDQuMTctcmM2IGFzLWlzLCBl
aXRoZXIsIGJ1dCBpdCBzZWVtcyBmaXhhYmxlCj4gPiA+IGF0Cj4gPiA+IHRoZSBmaXJzdCBnbGFu
Y2UuCj4gPiA+IAo+ID4gCj4gPiBCYXNpY2FsbHksIHRoZSBhdXRob3IgZm9yZ290IHRvIGRlZmlu
ZSBXTUlfUEVFUl9QSFlNT0RFIGJ1dCBzb21lCj4gPiBzZWFyY2hpbmcgZm91bmQgYW5vdGhlciBR
Q0EgZHJpdmVyIHdoZXJlIGl0IGlzIDB4ZCBzbyBJIGRlY2lkZWQgdG8KPiA+IGdvCj4gPiB3aXRo
IHRoYXQuIFRoZSBvdGhlciBlcnJvciB3YXMgdHJpdmlhbC4KPiA+IAo+ID4gSSBmaXhlZCB0aGUg
cGF0Y2ggYW5kIGFwcGxpZWQgbG9jYWxseSBvbiB0b3Agb2YgNC4xNy1yYzcuIEN1cnJlbnRseQo+
ID4gcnVubmluZyBpdCB0byB0ZXN0IGlmIGl0IHJlYWxseSBtaXRpZ2F0ZXMgdGhlIGlzc3VlLiBX
aWxsIHJlcG9ydAo+ID4gYmFjawo+ID4gd2hlbiBJIGhhdmUgcmVzdWx0cywgYW5kIHN1Ym1pdCB0
aGUgcGF0Y2ggaWYgSSdtIHNhdGlzZmllZC4KPiA+IAo+IAo+IFNvcnJ5LCBJJ3ZlIGJlZW4gZHJh
Z2dlZCBieSBzb21ldGhpbmcgZWxzZSBhbmQgZGlkbid0IHVwZGF0ZSB0aGlzCj4gcHJvbXB0bHku
Cj4gSSBqdXN0IHNlbnQgdGhlIHYyIGluY2x1ZGluZyB0aGUgbWlzc2luZyBXTUlfUEVFUl9QSFlN
T0RFLgo+IAo+IENhbiB5b3UgcGljayB1cCB0aGUgdjIgYW5kIHNlZSBpZiB0aGF0IGhlbHAgeW91
ciBpc3N1ZT8KPiAKPiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzEwNDU0OTY3
Lwo+IAoKSGkgUnlhbiwKCkkgYWxyZWFkeSBwb3N0ZWQgYSBwYXRjaCB2MiBoZXJlOgpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9waXBlcm1haWwvYXRoMTBrLzIwMTgtTWF5LzAxMTU0NS5odG1s
CihCYXNpY2FsbHkgbWFkZSB0aGUgc2FtZSBjaGFuZ2VzIGFzIHlvdS4pClllcywgaXQgZml4ZXMg
dGhlIHByb2JsZW0uCgpCZXN0IHJlZ2FyZHMsClRpbQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hdGgxMGsK
