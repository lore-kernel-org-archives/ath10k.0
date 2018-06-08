Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fRMIK-0007cb-8r
 for ath10k@lists.infradead.org; Fri, 08 Jun 2018 18:39:29 +0000
Subject: Re: Frequent ath10k crashes with QCA6174 on kernels 4.16 and 4.17
References: <c92e04d5b80af2a640ab97efce32d987ffb27ffe.camel@gmail.com>
 <87po1e69tz.fsf@kamboji.qca.qualcomm.com>
 <bc31b06dc4093b8613fbde6a13f16bd7e8c31e82.camel@gmail.com>
 <87fu2a4mk5.fsf@kamboji.qca.qualcomm.com>
 <8691304d5e1a0a99f41ebfa4aec6ba192b13e46a.camel@gmail.com>
 <ecd19f9f5ef727547986b8c4dbf47c3e083c684b.camel@gmail.com>
From: Ryan Hsu <ryanhsu@codeaurora.org>
Message-ID: <89a29eb6-996e-1c8e-b332-c14fdf241b79@codeaurora.org>
Date: Fri, 8 Jun 2018 11:37:44 -0700
MIME-Version: 1.0
In-Reply-To: <ecd19f9f5ef727547986b8c4dbf47c3e083c684b.camel@gmail.com>
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
To: =?UTF-8?Q?Timur_Krist=c3=b3f?= <timur.kristof@gmail.com>, Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org, ryanhsu@codeaurora.org

T24gMDUvMzAvMjAxOCAxMjoxNSBBTSwgVGltdXIgS3Jpc3TDs2Ygd3JvdGU6Cgo+IE9uIFR1ZSwg
MjAxOC0wNS0yOSBhdCAyMjozNiArMDMwMCwgVGltdXIgS3Jpc3TDs2Ygd3JvdGU6Cj4+Cj4+IFRo
YW5rcyEKPj4gSXQgZG9lcyBub3QgYXBwbHkgdG8gNC4xNy1yYzYgYXMtaXMsIGVpdGhlciwgYnV0
IGl0IHNlZW1zIGZpeGFibGUgYXQKPj4gdGhlIGZpcnN0IGdsYW5jZS4KPj4KPiBCYXNpY2FsbHks
IHRoZSBhdXRob3IgZm9yZ290IHRvIGRlZmluZSBXTUlfUEVFUl9QSFlNT0RFIGJ1dCBzb21lCj4g
c2VhcmNoaW5nIGZvdW5kIGFub3RoZXIgUUNBIGRyaXZlciB3aGVyZSBpdCBpcyAweGQgc28gSSBk
ZWNpZGVkIHRvIGdvCj4gd2l0aCB0aGF0LiBUaGUgb3RoZXIgZXJyb3Igd2FzIHRyaXZpYWwuCj4K
PiBJIGZpeGVkIHRoZSBwYXRjaCBhbmQgYXBwbGllZCBsb2NhbGx5IG9uIHRvcCBvZiA0LjE3LXJj
Ny4gQ3VycmVudGx5Cj4gcnVubmluZyBpdCB0byB0ZXN0IGlmIGl0IHJlYWxseSBtaXRpZ2F0ZXMg
dGhlIGlzc3VlLiBXaWxsIHJlcG9ydCBiYWNrCj4gd2hlbiBJIGhhdmUgcmVzdWx0cywgYW5kIHN1
Ym1pdCB0aGUgcGF0Y2ggaWYgSSdtIHNhdGlzZmllZC4KPgpTb3JyeSwgSSd2ZSBiZWVuIGRyYWdn
ZWQgYnkgc29tZXRoaW5nIGVsc2UgYW5kIGRpZG4ndCB1cGRhdGUgdGhpcyBwcm9tcHRseS4KSSBq
dXN0IHNlbnQgdGhlIHYyIGluY2x1ZGluZyB0aGUgbWlzc2luZyBXTUlfUEVFUl9QSFlNT0RFLgoK
Q2FuIHlvdSBwaWNrIHVwIHRoZSB2MiBhbmQgc2VlIGlmIHRoYXQgaGVscCB5b3VyIGlzc3VlPwoK
aHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMDQ1NDk2Ny8KCi0tIApSeWFuIEhz
dQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEw
ayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
