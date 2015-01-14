Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x232.google.com ([2a00:1450:400c:c05::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YBKAR-0004Pv-KS
 for ath10k@lists.infradead.org; Wed, 14 Jan 2015 09:23:12 +0000
Received: by mail-wi0-f178.google.com with SMTP id z2so3910827wiv.5
 for <ath10k@lists.infradead.org>; Wed, 14 Jan 2015 01:22:46 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <21685.35179.110539.780864@gargle.gargle.HOWL>
References: <1420432796-10765-1-git-send-email-sujith@msujith.org>
 <87r3uy4t9y.fsf@kamboji.qca.qualcomm.com>
 <21685.35179.110539.780864@gargle.gargle.HOWL>
Date: Wed, 14 Jan 2015 10:22:46 +0100
Message-ID: <CA+BoTQmNkVKyeWB0fCFhG2MfMZYTz6Dp4+cs44Dm4HCKjTc3Zw@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Make HTT fill size configurable
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
To: Sujith Manoharan <sujith@msujith.org>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMTMgSmFudWFyeSAyMDE1IGF0IDIyOjA4LCBTdWppdGggTWFub2hhcmFuIDxzdWppdGhAbXN1
aml0aC5vcmc+IHdyb3RlOgo+IEthbGxlIFZhbG8gd3JvdGU6Cj4+IEknbSBub3Qgc3VyZSBpZiBJ
IHJlYWxseSBsaWtlIHRoaXMgcGF0aCBvZiBoYXZpbmcgaW50ZXJmYWNlcyB0bwo+PiBjb25maWd1
cmUgZHJpdmVyIGludGVybmFscy4gSSBzdXNwZWN0IHRoYXQgaWYgd2UgYWRkIHRoaXMsIHdlIHdp
bGwgaGF2ZQo+PiBldmVuIG1vcmUgbGF0ZXIuIEl0J3MgYSBsb3QgbW9yZSBkb2N1bWVudGluZyBm
b3IgdXMgYW5kIG1vcmUgd29yayB0byB0aGUKPj4gdXNlcnMgdG8gdW5kZXJzdGFuZCB3aGF0IHBh
cmFtZXRlcnMgdGhleSBzaG91bGQgdXNlLiBBbHNvIHRoaXMgbWVhbnMKPj4gdGhhdCB0ZXN0aW5n
IHdpbGwgYmUgbW9yZSBjaGFsbGVuZ2luZyBhcyBwZW9wbGUgd2lsbCB1c2UgZGlmZmVyZW50Cj4+
IHZhbHVlcyBhbmQgcmVzdWx0cyB3b24ndCBiZSBjb21wYXJhYmxlLgo+Pgo+PiBJc24ndCB0aGVy
ZSBhbnkgb3RoZXIgd2F5IHRvIHNvbHZlIHRoZSBwcm9ibGVtPyBMaWtlIGF1dG9tYXRpY2FsbHkK
Pj4gY2hhbmdpbmcgdGhlIHZhbHVlIHNvbWVob3cgKG5vIGlkZWEgaG93KSBvciBzb21lIG90aGVy
IG1lYW5zPwo+Cj4gV2UgYXJlIGxpbWl0aW5nIHBlcmZvcm1hbmNlIGJ5IHJlc3RyaWN0aW5nIHRo
ZSBmaWxsIHNpemUuIEEgdXNlcgo+IHdpbGwganVzdCB1c2UgdGhlIGRlZmF1bHQsIHdoaWNoIGlz
IHN0aWxsIHRoZSBzYW1lIGFuZCByZW1haW5zCj4gdW5jaGFuZ2VkLiBCdXQsIGhhdmluZyBhIHdh
eSB0byBhZGp1c3QgdGhpcyBiYXNlZCBvbiB0aGUgcGxhdGZvcm0KPiBzZWVtcyByZWFzb25hYmxl
IHRvIG1lIGFuZCBJIHRoaW5rIHRyeWluZyB0byBjaGFuZ2UgdGhpcyB2YWx1ZSBkeW5hbWljYWxs
eQo+IGlzIG92ZXJraWxsLgoKV2Ugc2hvdWxkIGp1c3QgZml4IHRoZSB0eC9yeCBwcm9jZXNzaW5n
IGluc3RlYWQuIFRoZSBIVFQgdGhyb3R0bGluZwpsaW1pdCB3YXMgb3JpZ2luYWxseSBpbnRyb2R1
Y2VkIHRvIGRlYWwgd2l0aCB3YXRjaGRvZyBpc3N1ZXMgd2UndmUKc2VlbiBvbiBBUDEzNS4gVGFz
a2xldHMgd2VyZSBzdGFydmluZyBzeXN0ZW0gdG9vIG11Y2guCgpJJ3ZlIGJlZW4gcGxheWluZyBh
cm91bmQgd2l0aCB0aHJlYWRlZCBpcnFzIGluIGF0aDEwayBpbiBteSB0cmVlIGFuZApJJ3ZlIHNl
ZW4gaW1wcm92ZW1lbnQgd2l0aCBSeC4gSG93ZXZlciBUeCBpbnN0ZWFkIGJlY29tZXMgYnJva2Vu
IGluCnRoZSBwcm9jZXNzIGFuZCBJJ20geWV0IHRvIGZpbmQgYSBkZWZpbml0ZSBhbmQgZmluYWwg
YW5zd2VyIHdoeSB0aGF0CmlzIHRoZSBjYXNlLiBNeSBzdXNwaWNpb24gaXMgdGhhdCBOQVBJLCB3
aGljaCBpcyB1c2VkIGJ5IHRoZSBldGhlcm5ldApkcml2ZXIsIHJ1bnMgaW4gdGFza2xldHMgYW5k
IHRoZXkgYXJlbid0IGZyZXF1ZW50IGVub3VnaCB0byB0cmlnZ2VyCmtzb2Z0aXJxZCBzbyB0aGV5
IHN0YXJ2ZSB0aGUgc3lzdGVtLiBUaGUgY3VycmVudCBub24tdGhyZWFkZWQgaXJxCmFwcHJvYWNo
IHlpZWxkcyBtb3JlIHRhc2tsZXQgc2NoZWR1bGVzIGZvciBUeCBhbmQgaGl0cyBrc29mdGlycWQg
bW9yZQpvZnRlbiBtYWtpbmcgaXQgbmljZSBvbiB1c2Vyc3BhY2UuIElmIHRoYXQncyB0aGUgY2Fz
ZSBJIGRvbid0IHJlYWxseQpoYXZlIGFuIGlkZWEgaG93IHRvIHNvbHZlIHRoaXMgbm93LgoKCk1p
Y2hhxYIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0
aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
