Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-tai-01.qualcomm.com ([103.229.16.226])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDRNk-0003y2-4S
 for ath10k@lists.infradead.org; Mon, 08 Apr 2019 10:20:05 +0000
Subject: RE: [PATCH] ath10k: Remove ATH10K_STATE_RESTARTED in simulate fw crash
From: Wen Gong <wgong@qti.qualcomm.com>
Date: Mon, 8 Apr 2019 10:19:58 +0000
Message-ID: <54b4dab1191d41b8b329f3ceb7017626@aptaiexm02f.ap.qualcomm.com>
References: <1542163824-795-1-git-send-email-wgong@codeaurora.org>
 <CABvG-CWg-VXAtoN8HZumW-ZdP6dX9cO_8fWJ58C22kD2yDcXdw@mail.gmail.com>
 <195f3bb0c88c43a6b1ca0ad336f947c0@aptaiexm02f.ap.qualcomm.com>
 <CABvG-CWAfB8jjCDW4ggjJ8_YC++CjttJOMOt4s24F3mymvNR9A@mail.gmail.com>
 <02904ba8682441e1a89668c1345cbec9@aptaiexm02f.ap.qualcomm.com>
In-Reply-To: <02904ba8682441e1a89668c1345cbec9@aptaiexm02f.ap.qualcomm.com>
Content-Language: en-US
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
To: =?utf-8?B?TWljaGHFgiBLYXppb3I=?= <kazikcz@gmail.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Wen Gong <wgong@codeaurora.org>

DQoNCg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFdlbiBHb25nDQo+
IFNlbnQ6IE1vbmRheSwgQXByaWwgMSwgMjAxOSAyOjExIFBNDQo+IFRvOiAnTWljaGHFgiBLYXpp
b3InIDxrYXppa2N6QGdtYWlsLmNvbT4NCj4gQ2M6IFdlbiBHb25nIDx3Z29uZ0Bjb2RlYXVyb3Jh
Lm9yZz47IGxpbnV4LXdpcmVsZXNzIDxsaW51eC0NCj4gd2lyZWxlc3NAdmdlci5rZXJuZWwub3Jn
PjsgYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gU3ViamVjdDogUkU6IFtFWFRdIFJlOiBb
UEFUQ0hdIGF0aDEwazogUmVtb3ZlIEFUSDEwS19TVEFURV9SRVNUQVJURUQgaW4NCj4gc2ltdWxh
dGUgZncgY3Jhc2gNCj4gDQo+ID4NCj4gPiBJZiBpdCdzIHN0aWxsIGJvdGhlcmluZyB5b3UgdGhl
biBwbGVhc2UgY29uc2lkZXIgYSBjcmFzaCBjb3VudGVyDQo+ID4gdGhyZXNob2xkIHNvIHRoYXQs
IGUuZy4gYWZ0ZXIgNSBjcmFzaC13aGlsZS1yZXN0YXJ0aW5nIGl0J3MgZ29pbmcgdG8NCj4gPiBn
aXZlIHVwLiBIb3dldmVyIEkgZG91YnQgaXQncyB3b3J0aCB0aGUgZWZmb3J0LiBNeSBleHBlcmll
bmNlIHRlbGxzIG1lDQo+ID4gZmlybXdhcmUgY3Jhc2hlcyBkdXJpbmcgcmVjb3ZlcnkgYXJlIHJh
cmVseSwgaWYgYXQgYWxsLCB0cmFuc2llbnQuDQo+ID4NCj4gPiBUaGUgc2ltdWxhdGVkIGZ3IGNy
YXNoIGlzIG5vdCByZXByZXNlbnRhdGl2ZSBoZXJlLiBJdCdzIGEgbWVyZSB0b29sIHRvDQo+ID4g
dGVzdCBkcml2ZXIgY29kZS4NCj4gPg0KPiBIaSBNaWNoYWwsDQo+IFRoZXJlIGhhdmUgYSBzdHJl
c3MgdGVzdCBjYXNlIGZvciB0aGUgc2ltdWxhdGUgZncgY3Jhc2gsIGl0IHdpbGwgc2ltdWxhdGUg
ZncNCj4gY3Jhc2gNCj4gaW4gYSB2ZXJ5IHNob3J0IHRpbWUgZm9yIGVhY2ggdGVzdCwgdGhpcyB3
aWxsIHRyaWdnZXIgdGhlIHN0cmVzcyB0ZXN0IGZhaWwuDQo+IFRoZSBzaW11bGF0ZSBmdyBjcmFz
aCBwcm9jZXNzIHNob3VsZCBub3QgYmUgcnVuIHBhcmFsbGVsLCBhZnRlciB0aGlzIHBhdGNoLCB0
aGUNCj4gU3RyZXNzIHRlc3QgY2FzZSB3aWxsIHBhc3MuDQo+ID4NCg0KSGkgTWljaGHFgiwNCkRv
IHlvdSBoYXZlIHNvbWUgbmV3IGNvbW1lbnRzPw0KDQo+ID4gTWljaGHFgg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAph
dGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2F0aDEwawo=
