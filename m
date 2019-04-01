Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-tai-01.qualcomm.com ([103.229.16.226])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAqAU-0002bX-AT
 for ath10k@lists.infradead.org; Mon, 01 Apr 2019 06:11:40 +0000
Subject: RE: [PATCH] ath10k: Remove ATH10K_STATE_RESTARTED in simulate fw crash
From: Wen Gong <wgong@qti.qualcomm.com>
Date: Mon, 1 Apr 2019 06:11:31 +0000
Message-ID: <02904ba8682441e1a89668c1345cbec9@aptaiexm02f.ap.qualcomm.com>
References: <1542163824-795-1-git-send-email-wgong@codeaurora.org>
 <CABvG-CWg-VXAtoN8HZumW-ZdP6dX9cO_8fWJ58C22kD2yDcXdw@mail.gmail.com>
 <195f3bb0c88c43a6b1ca0ad336f947c0@aptaiexm02f.ap.qualcomm.com>
 <CABvG-CWAfB8jjCDW4ggjJ8_YC++CjttJOMOt4s24F3mymvNR9A@mail.gmail.com>
In-Reply-To: <CABvG-CWAfB8jjCDW4ggjJ8_YC++CjttJOMOt4s24F3mymvNR9A@mail.gmail.com>
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNaWNoYcWCIEthemlvciA8a2F6
aWtjekBnbWFpbC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgSmFudWFyeSA3LCAyMDE5IDQ6MzYgUE0N
Cj4gVG86IFdlbiBHb25nIDx3Z29uZ0BxdGkucXVhbGNvbW0uY29tPg0KPiBDYzogV2VuIEdvbmcg
PHdnb25nQGNvZGVhdXJvcmEub3JnPjsgbGludXgtd2lyZWxlc3MgPGxpbnV4LQ0KPiB3aXJlbGVz
c0B2Z2VyLmtlcm5lbC5vcmc+OyBhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiBTdWJqZWN0
OiBbRVhUXSBSZTogW1BBVENIXSBhdGgxMGs6IFJlbW92ZSBBVEgxMEtfU1RBVEVfUkVTVEFSVEVE
IGluDQo+IHNpbXVsYXRlIGZ3IGNyYXNoDQo+IFRoYXQncyBhY3R1YWxseSBhIGZlYXR1cmUsIG5v
dCBhIGJ1Zy4gSWYgZmlybXdhcmUgY3Jhc2hlcyB3aGlsZSBkcml2ZXINCj4gaXMgcmVzdGFydGlu
ZyBhZnRlciBhIGNyYXNoIHRoZW4gaXRzIGxpa2VseSBnb2luZyB0byBmYWlsIGFnYWluIGFuZA0K
PiBhZ2FpbiBjYXVzaW5nIGEgY3Jhc2gtcmVzdGFydCBsb29wIHdoaWNoIGNhbiBhZmZlY3Qgc3lz
dGVtIHBlcmZvcm1hbmNlDQo+IGFuZCByZXNwb25zaXZlbmVzcy4gSXQncyBiZXR0ZXIgdG8gZ2l2
ZSB1cCBhbmQgbGV0IHRoZSBzeXN0ZW0gYWRtaW4NCj4gdGFrZSBvdmVyLg0KPiANCj4gSWYgaXQn
cyBzdGlsbCBib3RoZXJpbmcgeW91IHRoZW4gcGxlYXNlIGNvbnNpZGVyIGEgY3Jhc2ggY291bnRl
cg0KPiB0aHJlc2hvbGQgc28gdGhhdCwgZS5nLiBhZnRlciA1IGNyYXNoLXdoaWxlLXJlc3RhcnRp
bmcgaXQncyBnb2luZyB0bw0KPiBnaXZlIHVwLiBIb3dldmVyIEkgZG91YnQgaXQncyB3b3J0aCB0
aGUgZWZmb3J0LiBNeSBleHBlcmllbmNlIHRlbGxzIG1lDQo+IGZpcm13YXJlIGNyYXNoZXMgZHVy
aW5nIHJlY292ZXJ5IGFyZSByYXJlbHksIGlmIGF0IGFsbCwgdHJhbnNpZW50Lg0KPiANCj4gVGhl
IHNpbXVsYXRlZCBmdyBjcmFzaCBpcyBub3QgcmVwcmVzZW50YXRpdmUgaGVyZS4gSXQncyBhIG1l
cmUgdG9vbCB0bw0KPiB0ZXN0IGRyaXZlciBjb2RlLg0KPiANCkhpIE1pY2hhbCwNClRoZXJlIGhh
dmUgYSBzdHJlc3MgdGVzdCBjYXNlIGZvciB0aGUgc2ltdWxhdGUgZncgY3Jhc2gsIGl0IHdpbGwg
c2ltdWxhdGUgZncgY3Jhc2gNCmluIGEgdmVyeSBzaG9ydCB0aW1lIGZvciBlYWNoIHRlc3QsIHRo
aXMgd2lsbCB0cmlnZ2VyIHRoZSBzdHJlc3MgdGVzdCBmYWlsLg0KVGhlIHNpbXVsYXRlIGZ3IGNy
YXNoIHByb2Nlc3Mgc2hvdWxkIG5vdCBiZSBydW4gcGFyYWxsZWwsIGFmdGVyIHRoaXMgcGF0Y2gs
IHRoZQ0KU3RyZXNzIHRlc3QgY2FzZSB3aWxsIHBhc3MuDQo+IA0KPiBNaWNoYcWCDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBs
aXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
