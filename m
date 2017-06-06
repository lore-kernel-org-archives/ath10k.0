Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx3.ghmt.de ([188.210.45.230])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dI78G-0007jR-BF
 for ath10k@lists.infradead.org; Tue, 06 Jun 2017 05:34:22 +0000
From: "Lindner, Frank" <Frank.Lindner@ghmt.de>
Date: Tue, 6 Jun 2017 07:33:37 +0200
Subject: AW: is it possible to enable dualband or even 2.4 GHz on QCA9994?
 (Compex WLE1216V5-20)
Message-ID: <35449B299288584097A15B3FEB9C3E58257871085F@SBS-GHMT.ghmt.local>
References: <35449B299288584097A15B3FEB9C3E5825786B4500@SBS-GHMT.ghmt.local>
 <6cadea3f-b386-7fc2-9295-720ced82631d@candelatech.com>
 <CAJ-VmontSGS9yBCRKJu7kkjrmG6zkYV47YH6vRSpUqyUEj2nvw@mail.gmail.com>
 <35449B299288584097A15B3FEB9C3E582578710584@SBS-GHMT.ghmt.local>
 <CAJ-Vmo=-mcob1dEv4i2EWJ2whh2tBwF7J+EO-XpBcRMZXNULbA@mail.gmail.com>
In-Reply-To: <CAJ-Vmo=-mcob1dEv4i2EWJ2whh2tBwF7J+EO-XpBcRMZXNULbA@mail.gmail.com>
Content-Language: de-DE
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
To: Adrian Chadd <adrian@freebsd.org>
Cc: Ben Greear <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

SGksDQoNCkFkcmlhbiwgZG8geW91IGhhdmUgc29tZSB1cGRhdGVzPyBJIHNlYXJjaCBmb3IgYW4g
ZHVhbGJhbmQgY2FyZCAoTUlOSSBQQ0llKSB3aXRoIDR4NCBXYXZlMiwgbGlrZSA5OTg0IG8gOTk5
NC4gSXQgd2lsbCBiZSBuZWVkZWQgb25seSBmb3IgcmVjZWl2aW5nIHBhdGguIEFuZCBJIG5lZWQg
dGhlIGluZm8sIGlmIGFuZCBob3cgaXMgcG9zc2libGUgdG8gZW5hYmxlIGR1YWxiYW5kIG1vZGUu
IElmIHRoZXJlIGlzIHNvbWUgcGh5c2ljcyBsaWtlIExOQSBvciB3aGF0IGV2ZXIgbWlzc2luZywg
d2UgY2FuIGRvIHRoaXMgb3VyIHNlbGYuDQpUaGFua3MuDQpCRw0KRnJhbmsNCg0KLS0tLS1VcnNw
csO8bmdsaWNoZSBOYWNocmljaHQtLS0tLQ0KVm9uOiBhZHJpYW4uY2hhZGRAZ21haWwuY29tIFtt
YWlsdG86YWRyaWFuLmNoYWRkQGdtYWlsLmNvbV0gSW0gQXVmdHJhZyB2b24gQWRyaWFuIENoYWRk
DQpHZXNlbmRldDogTWl0dHdvY2gsIDMxLiBNYWkgMjAxNyAyMTo0OA0KQW46IExpbmRuZXIsIEZy
YW5rDQpDYzogQmVuIEdyZWVhcjsgYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcNCkJldHJlZmY6
IFJlOiBpcyBpdCBwb3NzaWJsZSB0byBlbmFibGUgZHVhbGJhbmQgb3IgZXZlbiAyLjQgR0h6IG9u
IFFDQTk5OTQ/IChDb21wZXggV0xFMTIxNlY1LTIwKQ0KDQpPbiAzMCBNYXkgMjAxNyBhdCAyMjoy
MywgTGluZG5lciwgRnJhbmsgPEZyYW5rLkxpbmRuZXJAZ2htdC5kZT4gd3JvdGU6DQo+IEhpLg0K
PiA5OTk0IGlzIENhc2NhZGUsIHdoaWNoIHNob3VsZCBiZSAyLjQgR0h6IGNhcGFibGUgYXMgZmFz
IGFzIFF1YWxjb21tIGlzIGNvcnJlY3Qgb24gdGhlaXIgc3BlY3Mgc2l0ZS4NCj4gUXVlc3Rpb24g
d2FzIG5vdCwgd2hpY2ggb3RoZXIgY2FyZCBjYW4gZG8gMi40IEdIei4gSSB3YW50IHRvIGVuYWJs
ZSAyLjQgR0h6IC8gZHVhbGJhbmQgbW9kZSB2aWEgc29tZSByZWdpc3RlcnMgb3Igd2hhdCBldmVy
IG9uIHRoaXMgY2FyZC4NCj4gV2hlcmUgY2FuIEkgZmluZCB0aGUgY2FsYnJhdGlvbiBmaWxlcyAg
eW91J3ZlIG1lbnRpb25lZD8NCg0KSGksDQoNCkkgL3RoaW5rLyBjYXNjYWRlIGRvZXNuJ3QgaGF2
ZSB0aGUgYWJpbGl0eSB0byBydW4gZHVhbCBtb2RlLiBJdCdzIGRlc2lnbmVkIHRvIGVpdGhlciBi
ZSAyRyBvciA1RywgYW5kIG5vdCBib3RoIGxpa2UgU1RBIG1vZGUuIEknZCBoYXZlIHRvIGdvIGNo
ZWNrLg0KDQooSSB0aGluayBJIHJhbiBvdmVyIHRoaXMgaXNzdWUgYXQgd29yayByZWNlbnRseS4u
KQ0KDQoNCi1hZHJpYW4NCg0KDQoNClZvcnN0YW5kc3ZvcnNpdHplbmRlcjogRGlwbC4tSW5nLiBE
aXJrIFdpbGhlbG0NCkF1ZnNpY2h0c3JhdHN2b3JzaXR6ZW5kZXI6IERyLi1JbmcuIFBldGVyIEhh
c3NlDQpIYW5kZWxzcmVnaXN0ZXI6IEhSQiBTYWFyYnLDvGNrZW4gTnIuIDEzMjAxDQpVc3QuSUQg
TnIuOiBERSAxNTM4MDc2MjcNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
