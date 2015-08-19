Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x22d.google.com ([2a00:1450:4010:c04::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZS1PO-0006m4-N5
 for ath10k@lists.infradead.org; Wed, 19 Aug 2015 11:19:55 +0000
Received: by lbbpu9 with SMTP id pu9so905852lbb.3
 for <ath10k@lists.infradead.org>; Wed, 19 Aug 2015 04:19:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20150818190131.GA24548@mwanda>
References: <20150818190131.GA24548@mwanda>
Date: Wed, 19 Aug 2015 13:19:32 +0200
Message-ID: <CA+BoTQnShiN8LGhqqnNuqO_7FpPORRasH8p8j2uU9CHTm1Rudw@mail.gmail.com>
Subject: Re: ath10k: fix peer limit enforcement
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
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMTggQXVndXN0IDIwMTUgYXQgMjE6MDEsIERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJA
b3JhY2xlLmNvbT4gd3JvdGU6Cj4gSGVsbG8gTWljaGFsIEthemlvciwKPgo+IFRoZSBwYXRjaCBl
MDRjYWZiYzM4Yzc6ICJhdGgxMGs6IGZpeCBwZWVyIGxpbWl0IGVuZm9yY2VtZW50IiBmcm9tIEF1
Zwo+IDUsIDIwMTUsIGxlYWRzIHRvIHRoZSBmb2xsb3dpbmcgc3RhdGljIGNoZWNrZXIgd2Fybmlu
ZzoKPgo+ICAgICAgICAgZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9tYWMuYzo0MzY1
IGF0aDEwa19hZGRfaW50ZXJmYWNlKCkKPiAgICAgICAgIHdhcm46IGluY29uc2lzdGVudCByZXR1
cm5zICdtdXRleDomYXItPmNvbmZfbXV0ZXgnLgo+ICAgICAgICAgICBMb2NrZWQgb246ICAgbGlu
ZSA0MTI1Cj4gICAgICAgICAgIFVubG9ja2VkIG9uOiBsaW5lIDQzNDQKPiAgICAgICAgICAgICAg
ICAgICAgICAgIGxpbmUgNDM2NQpbLi4uXQoKR3JlYXQgam9iIGZpbmRpbmcgdGhpcyBhbmQgdGhl
IG90aGVyIG9uZSAoZG1hX21hcHBpbmdfZXJyb3IpIGFzIHdlbGwhCkkndmUganVzdCBzZW50IHBh
dGNoZXMgdG8gZml4IHRoZW0uCgpJJ2QgbG92ZSB0byBoYXZlIHRoaXMgc29ydCBvZiBzdGF0aWMg
YW5hbHlzaXMgaW4gbXkgdG9vbCBzZXQuIFdoYXQgZGlkCnlvdSB1c2UgKEkgaGF2ZSBhIHdlaXJk
IGZlZWxpbmcgSSBkaWQgYXNrIGFib3V0IGl0IGF0IG9uZSBwb2ludC4uKT8KVGhhbmtzIQoKCk1p
Y2hhxYIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0
aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
