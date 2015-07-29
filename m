Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x235.google.com ([2a00:1450:400c:c05::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKJqD-0006U5-BE
 for ath10k@lists.infradead.org; Wed, 29 Jul 2015 05:23:46 +0000
Received: by wicgb10 with SMTP id gb10so183639927wic.1
 for <ath10k@lists.infradead.org>; Tue, 28 Jul 2015 22:23:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CY1PR0201MB07293EE8CB1375DF298F1E8EA98D0@CY1PR0201MB0729.namprd02.prod.outlook.com>
References: <CY1PR0201MB07293EE8CB1375DF298F1E8EA98D0@CY1PR0201MB0729.namprd02.prod.outlook.com>
Date: Wed, 29 Jul 2015 07:23:15 +0200
Message-ID: <CA+BoTQnyTxbO318M7iJe8kna7DuWfs1bc_RX1mobd1ePbVj4NQ@mail.gmail.com>
Subject: Re: Monitor mode TX retry reporting
From: Michal Kazior <michal.kazior@tieto.com>
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
To: Jussi Haakana <jussi.haakana@7signal.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMjggSnVseSAyMDE1IGF0IDE0OjIxLCBKdXNzaSBIYWFrYW5hIDxqdXNzaS5oYWFrYW5hQDdz
aWduYWwuY29tPiB3cm90ZToKPiBIaSwKPgo+IEkgaGF2ZSB0aGUgZm9sbG93aW5nIHRlc3Qgc2V0
dXA6Cj4gLSAxIGludGVyZmFjZSBpbiBtYW5hZ2VkIG1vZGUKPiAtIDEgaW50ZXJmYWNlIGluIG1v
bml0b3IgbW9kZQo+IC0gYXR0YWNoIHRvIEFQCj4gLSBzdGFydCB0Y3BkdW1wIG9uIG1vbml0b3Ig
aW50ZXJmYWNlCj4gLSB1cGxvYWQgZS5nLiAyMDBNQiBieSB1c2luZyBtYW5hZ2VkIG1vZGUgaW50
ZXJmYWNlCj4gLSBjaGVjayBjYXB0dXJlZCBmcmFtZXMKPgo+IEZvciBzb21lIHJlYXNvbiwgb24g
VFggZnJhbWVzLCBJIGNhbm5vdCBzZWUgYSBzaW5nbGUgZnJhbWUgdGhhdCBoYXMgcmV0cnkgYml0
IHNldAo+IG9uIGZyYW1lIGNvbnRyb2wgb2YgODAyLjExIGhlYWRlcnMuIEZvciBSWCwgcmV0cmll
cyBzZWVtIHRvIGJlIHJlcG9ydGVkIG5vcm1hbGx5Lgo+IEknZCBzYXkgdGhhdCBpdCBpcyB1bmxp
a2VseSB0aGF0IHJldHJhbnNtaXNzaW9ucyBkbyBub3QgaGFwcGVuIHdpdGggMjAwTUIgcGF5bG9h
ZD8KPiBBbnkgaWRlYXMgd2hhdCBjb3VsZCBiZSBjYXVzaW5nIHRoaXM/CgpZb3UgY2FuJ3Qgc25p
ZmYgeW91ciBvd24gcmV0cmFuc21pc3Npb25zIGJlY2F1c2UgdGhleSBhcmUgcGVyZm9ybWVkIGJ5
CmRldmljZSBhbmQgdGNwZHVtcCBzZWVzIG9ubHkgYSBzaW5nbGUgZnJhbWUgdGhhdCB3YXMgc3Vi
bWl0dGVkIHRocm91Z2gKdGhlIG5ldHdvcmtpbmcgc3RhY2suCgpJIGd1ZXNzIHlvdSBjb3VsZCBl
bXVsYXRlIHRoaXMgYnkgcG9zdGluZyBza2J1ZmYgY29waWVzIGFzIFJ4IGJhc2VkIG9uCnR4IHJl
dHJ5IHNlcmllcyAod2hpY2ggYXJlbid0IGF2YWlsYWJsZSBub3cgZHVlIHRvIGF0aDEwayBmaXJt
d2FyZQpsaW1pdGF0aW9uKS4gSG93ZXZlciBJJ20gbm90IGF3YXJlIGlmIHRoZXJlJ3MgYW55IGRy
aXZlciB0aGF0IGRvZXMKdGhhdC4KCklmIHlvdSB3YW50IHRvIHNuaWZmIHlvdXIgY2xpZW50IHJl
dHJhbnNtaXNzaW9ucyB5b3UnbGwgaGF2ZSB0byB1c2UgYQpzZXBhcmF0ZSBkZXZpY2UgdG8gYWN0
IGFzIGEgc25pZmZlciBvciBsaXN0ZW4gb24gdGhlIG90aGVyIGVuZHBvaW50CihpLmUuIEFQKS4K
CgpNaWNoYcWCCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
