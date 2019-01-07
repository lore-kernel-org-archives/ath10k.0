Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-tai-02.qualcomm.com ([103.229.16.227])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggP8y-0001Qq-Cn
 for ath10k@lists.infradead.org; Mon, 07 Jan 2019 07:16:18 +0000
Subject: RE: [PATCH] ath10k: Remove ATH10K_STATE_RESTARTED in simulate fw crash
From: Wen Gong <wgong@qti.qualcomm.com>
Date: Mon, 7 Jan 2019 07:16:08 +0000
Message-ID: <195f3bb0c88c43a6b1ca0ad336f947c0@aptaiexm02f.ap.qualcomm.com>
References: <1542163824-795-1-git-send-email-wgong@codeaurora.org>
 <CABvG-CWg-VXAtoN8HZumW-ZdP6dX9cO_8fWJ58C22kD2yDcXdw@mail.gmail.com>
In-Reply-To: <CABvG-CWg-VXAtoN8HZumW-ZdP6dX9cO_8fWJ58C22kD2yDcXdw@mail.gmail.com>
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
To: =?utf-8?B?TWljaGHFgiBLYXppb3I=?= <kazikcz@gmail.com>, Wen Gong <wgong@codeaurora.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

PiA+IEl0IGlzIGJlY2F1c2UgdGhlIHN0YXRlIGhhcyBub3QgY2hhbmdlZCB0byBBVEgxMEtfU1RB
VEVfT04NCj4gPiBpbW1lZGlhdGVseSwgdGhlbiBpdCB3aWxsIGhhdmUgbW9yZSB0aGFuIHR3byBz
aW11bGF0ZSBjcmFzaCBwcm9jZXNzDQo+ID4gcnVubmluZyBtZWFud2hpbGUsIGFuZCBjb21wbGV0
ZS93YWtldXAgc29tZSBmaWVsZCB0d2ljZSwgaXQgZGVzdHJveQ0KPiA+IHRoZSBub3JtYWwgcmVj
b3ZlcnkgcHJvY2Vzcy4NCj4gDQo+IFRoaXMgd2FzIGludGVuZGVkIHRvIGFsbG93IHRlc3Rpbmcg
bm90IG9ubHkgZmlybXdhcmUgY3Jhc2ggcGF0aCAoYW5kDQo+IHJlY292ZXJ5KSBidXQgYWxzbyBm
aXJtd2FyZSBjcmFzaCB3aGlsZSByZWNvdmVyaW5nIGZyb20gYSBmaXJtd2FyZSBjcmFzaC4NCj4g
DQpJZiBmaXJtd2FyZSBpcyByZWNvdmVyaW5nIGZyb20gY3Jhc2gsIHRoZW4gc2ltdWxhdGUgYSBu
ZXcgY3Jhc2ggd2lsbCB0cmlnZ2VyIGVycm9yLg0KU28gcmVtb3ZlIGl0Lg0KPiANCj4gTWljaGHF
gg0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18N
Cj4gYXRoMTBrIG1haWxpbmcgbGlzdA0KPiBhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiBo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwaw0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcg
bGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
