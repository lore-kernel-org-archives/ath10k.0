Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-tai-02.qualcomm.com ([103.229.16.227])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVSBL-0002uc-8y
 for ath10k@lists.infradead.org; Tue, 28 May 2019 02:49:45 +0000
Subject: RE: [PATCH] ath10k: Remove ATH10K_STATE_RESTARTED in simulate fw crash
From: Wen Gong <wgong@qti.qualcomm.com>
Date: Tue, 28 May 2019 02:49:30 +0000
Message-ID: <301c4b127ea74abd8a9d8221d93656fd@aptaiexm02f.ap.qualcomm.com>
References: <1542163824-795-1-git-send-email-wgong@codeaurora.org>
 <CABvG-CWg-VXAtoN8HZumW-ZdP6dX9cO_8fWJ58C22kD2yDcXdw@mail.gmail.com>
 <195f3bb0c88c43a6b1ca0ad336f947c0@aptaiexm02f.ap.qualcomm.com>
 <CABvG-CWAfB8jjCDW4ggjJ8_YC++CjttJOMOt4s24F3mymvNR9A@mail.gmail.com>
 <02904ba8682441e1a89668c1345cbec9@aptaiexm02f.ap.qualcomm.com>
 <54b4dab1191d41b8b329f3ceb7017626@aptaiexm02f.ap.qualcomm.com>
 <CABvG-CWz0rBCXfF7mX9L62=fmdcYhpOaO5JNLtvSE87o_XJFng@mail.gmail.com>
 <1fec49e1b6794860a1eff2330bcdea28@aptaiexm02f.ap.qualcomm.com>
 <CA+ASDXP1Ftpi93p=Bp2w1rRd3xVtNn_+diwkKTMXbTqK0B3ahA@mail.gmail.com>
 <b073fa90e9a3437c9846ce2d22fab15f@aptaiexm02f.ap.qualcomm.com>
In-Reply-To: <b073fa90e9a3437c9846ce2d22fab15f@aptaiexm02f.ap.qualcomm.com>
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
To: Brian Norris <briannorris@chromium.org>
Cc: =?utf-8?B?TWljaGHFgiBLYXppb3I=?= <kazikcz@gmail.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Wen Gong <wgong@codeaurora.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhdGgxMGsgPGF0aDEway1ib3Vu
Y2VzQGxpc3RzLmluZnJhZGVhZC5vcmc+IE9uIEJlaGFsZiBPZiBXZW4gR29uZw0KPiBTZW50OiBX
ZWRuZXNkYXksIEFwcmlsIDEwLCAyMDE5IDEwOjQ1IEFNDQo+IFRvOiBCcmlhbiBOb3JyaXMgPGJy
aWFubm9ycmlzQGNocm9taXVtLm9yZz4NCj4gQ2M6IE1pY2hhxYIgS2F6aW9yIDxrYXppa2N6QGdt
YWlsLmNvbT47IGxpbnV4LXdpcmVsZXNzIDxsaW51eC0NCj4gd2lyZWxlc3NAdmdlci5rZXJuZWwu
b3JnPjsgYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmc7IFdlbiBHb25nDQo+IDx3Z29uZ0Bjb2Rl
YXVyb3JhLm9yZz4NCj4gU3ViamVjdDogW0VYVF0gUkU6IFtQQVRDSF0gYXRoMTBrOiBSZW1vdmUg
QVRIMTBLX1NUQVRFX1JFU1RBUlRFRCBpbg0KPiBzaW11bGF0ZSBmdyBjcmFzaA0KPiANCj4gSWYg
Q2hyb21lT1MgaXMgZWFzeSB0byBjaGFuZ2UgdG9vbCwNCj4gSSB0aGluayBJIHdpbGwgY2hhbmdl
IHRoZSBtZWNoYW5pc20gb2YgdGhlIHNpbXVsYXRlX2Z3X2NyYXNoLg0KPiBUaGVuIGFsbCB0b29s
cyB3aWxsIHdvcmsgbm9ybWFsbHkuDQo+IA0KTmV3IHBhdGNoIHVwbG9hZGVkDQpodHRwczovL3Bh
dGNod29yay5rZXJuZWwub3JnL3BhdGNoLzEwODk3NTg3Lw0KW3YyXSBhdGgxMGs6IFJlbW92ZSBB
VEgxMEtfU1RBVEVfUkVTVEFSVEVEIGluIHNpbXVsYXRlIGZ3IGNyYXNoDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0
aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vYXRoMTBrCg==
