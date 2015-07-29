Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x231.google.com ([2a00:1450:400c:c05::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKJuz-0007xK-7o
 for ath10k@lists.infradead.org; Wed, 29 Jul 2015 05:28:41 +0000
Received: by wicgb10 with SMTP id gb10so183748424wic.1
 for <ath10k@lists.infradead.org>; Tue, 28 Jul 2015 22:28:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMQd7ma7hehYLBf-5hUD0sViUwWGX8vy7ENXuBi8Q49F88A45Q@mail.gmail.com>
References: <CAMQd7mbWC7rj8-eU7Jv21ehT8KrpC=L=xWxzDQxHEU_ePNSdUg@mail.gmail.com>
 <CA+BoTQmd0Uoi=2MNMsDXYe1yKsYa3P8uvVzWwXoMynQGtjeD4w@mail.gmail.com>
 <CAMQd7maioLviTaLHp+f03HafABijKD_d92K_SRO8XS51poKGqg@mail.gmail.com>
 <CA+BoTQkA0k1RBwzKFchcWebuWUmdoaqvaAq4BRz2o3C-GGUCog@mail.gmail.com>
 <CAMQd7ma7hehYLBf-5hUD0sViUwWGX8vy7ENXuBi8Q49F88A45Q@mail.gmail.com>
Date: Wed, 29 Jul 2015 07:28:19 +0200
Message-ID: <CA+BoTQkqttvPkk6qk6YV8SYPVnEcADfcUkLBCpjFoZBab81Byg@mail.gmail.com>
Subject: Re: QCA6174 hw2.1 irq_mode=0 broken on 4.2-rc3, working on 4.1.2
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
To: Enrico Tagliavini <enrico.tagliavini@gmail.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMjggSnVseSAyMDE1IGF0IDE2OjU3LCBFbnJpY28gVGFnbGlhdmluaSA8ZW5yaWNvLnRhZ2xp
YXZpbmlAZ21haWwuY29tPiB3cm90ZToKPiBJIHdhcyB0ZXN0aW5nIHRoZSBrZXJuZWwgZnJvbSBG
ZWRvcmEgcmF3aGlkZSB0byB0ZXN0IHNvbWUgaXNzdWUKPiByZWxhdGVkIHRvIHRoZSBzb3VuZCBj
YXJkLiBTbyB0aGlzIGlzIDQuMiByYzMgYXMgcmVsZWFzZWQgYnkgTGludXMKPiBwbHVzIHNvbWUg
RmVkb3JhIHBhdGNoLiBOb3RoaW5nIHJlbGF0ZWQgdG8gYXRoMTBrIGFzIGZhciBhcyBJIGNhbiBz
ZWUuCj4KPiBCaXNlY3Rpbmcgd291bGQgcmVxdWlyZSBhIGxvdCBvZiB0aW1lLiBJJ20gZG9pbmcg
dGhlIGZ1bGwgUlBNIHBhY2thZ2UsCj4gaW5jbHVkaW5nIG1vZHVsZXMgc2lnbmF0dXJlIGFuZCBz
byBvbiBhbmQgSSdtIGRvaW5nIHRoaXMgaW4gbXkgZnJlZQo+IHRpbWUuCgpJIHVuZGVyc3RhbmQu
CgoKPiBUaGlzIHdvbnQgd29yayBmb3IgYmlzZWN0aW5nLiBJIGhhdmUgdG8gc2V0dXAgc29tZXRo
aW5nIGVsc2UuIElzCj4gaXQgb2sgaWYgSSByZXN0cmljdCB0aGUgYmlzZWN0IG9uIHRoZSBhdGgx
MGsgdHJlZT8gVGhhdCBoYXMgZW5vdWdoCj4gY29tbWl0IGFscmVhZHkgdG8gYmVnaW4gd2l0aCwg
cGx1cyBJJ20gZ29pbmcgdG8gYmUgb24gdGhlIHJvYWQgaW4gbGVzcwo+IHRoYW4gdHdvIHdlZWtz
LgoKQXMgbG9uZyBhcyB5b3UgZXN0YWJsaXNoIGEgd29ya2luZyBhbmQgYSBub24td29ya2luZyBj
b21taXQgaWQgb24Ka3ZhbG8gdHJlZSBpdCBzaG91bGQgYmUgZmluZSBJIGd1ZXNzLgoKCk1pY2hh
xYIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEw
ayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
