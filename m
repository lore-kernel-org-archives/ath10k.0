Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aaSeF-0001M2-DI
 for ath10k@lists.infradead.org; Mon, 29 Feb 2016 18:34:24 +0000
Received: by mail-wm0-x235.google.com with SMTP id l68so2096988wml.0
 for <ath10k@lists.infradead.org>; Mon, 29 Feb 2016 10:33:58 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <5bc6ba3b4d5743dc641b85c2c4233631f5b3319a.1456513260.git.poh@qca.qualcomm.com>
References: <5bc6ba3b4d5743dc641b85c2c4233631f5b3319a.1456513260.git.poh@qca.qualcomm.com>
Date: Mon, 29 Feb 2016 19:33:57 +0100
Message-ID: <CA+BoTQkCwSkARQKWcjkJri9xS6GGiHq4NwjOoewqtHOetjevGw@mail.gmail.com>
Subject: Re: [PATCH v5] ath10k: set MAC timestamp in management Rx frame
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
To: Peter Oh <poh@qca.qualcomm.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMjYgRmVicnVhcnkgMjAxNiBhdCAyMDowMywgUGV0ZXIgT2ggPHBvaEBxY2EucXVhbGNvbW0u
Y29tPiB3cm90ZToKPiBDaGVjayBhbmQgc2V0IFJ4IE1BQyB0aW1lc3RhbXAgd2hlbiBmaXJtd2Fy
ZSBpbmRpY2F0ZXMgaXQuCj4gRmlybXdhcmUgYWRkcyBpdCBpbiBSeCBiZWFjb24gZnJhbWUgb25s
eSBhdCB0aGlzIG1vbWVudC4KPiBEcml2ZXIgYW5kIG1hYzgwMjExIG1heSB1dGlsaXplIGl0IHRv
IGRldGVjdCBzdWNoIGNsb2NrZHJpZnQKPiBvciBiZWFjb24gY29sbGlzaW9uIGFuZCB1c2UgdGhl
IHJlc3VsdCBmb3IgYmVhY29uIGNvbGxpc2lvbgo+IGF2b2lkYW5jZS4KPgo+IFNpZ25lZC1vZmYt
Ynk6IFBldGVyIE9oIDxwb2hAcWNhLnF1YWxjb21tLmNvbT4KPiAtLS0KWy4uLl0KPiArICAgICAg
IGlmIChyeF9zdGF0dXMgJiBXTUlfUlhfU1RBVFVTX0VYVF9JTkZPKSB7Cj4gKyAgICAgICAgICAg
ICAgIHN0YXR1cy0+bWFjdGltZSA9Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgX19sZTMyX3Rv
X2NwdShhcmcuZXh0X2luZm8ucnhfbWFjX3RpbWVzdGFtcF9sMzIpIHwKPiArICAgICAgICAgICAg
ICAgICAgICAgICAodTY0KV9fbGUzMl90b19jcHUoYXJnLmV4dF9pbmZvLnJ4X21hY190aW1lc3Rh
bXBfdTMyKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIDw8IDMyOwo+ICsgICAgICAgICAgICAg
ICBzdGF0dXMtPmZsYWcgfD0gUlhfRkxBR19NQUNUSU1FX0VORDsKPiArICAgICAgIH0KPiAgICAg
ICAgIC8qIEhhcmR3YXJlIGNhbiBSeCBDQ0sgcmF0ZXMgb24gNUdIei4gSW4gdGhhdCBjYXNlIHBo
eV9tb2RlIGlzIHNldCB0bwo+ICAgICAgICAgICogTU9ERV8xMUIuIFRoaXMgbWVhbnMgcGh5X21v
ZGUgaXMgbm90IGEgcmVsaWFibGUgc291cmNlIGZvciB0aGUgYmFuZAo+ICAgICAgICAgICogb2Yg
bWdtdCByeC4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway93
bWkuaCBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvd21pLmgKPiBpbmRleCA0ZDNj
YmM0Li5mMjA5ZDUxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgx
MGsvd21pLmgKPiArKysgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3dtaS5oCj4g
QEAgLTMwMzcsMTEgKzMwMzcsMTggQEAgc3RydWN0IHdtaV8xMF80X21nbXRfcnhfZXZlbnQgewo+
ICAgICAgICAgdTggYnVmWzBdOwo+ICB9IF9fcGFja2VkOwo+Cj4gK3N0cnVjdCB3bWlfbWdtdF9y
eF9leHRfaW5mbyB7Cj4gKyAgICAgICBfX2xlMzIgcnhfbWFjX3RpbWVzdGFtcF9sMzI7Cj4gKyAg
ICAgICBfX2xlMzIgcnhfbWFjX3RpbWVzdGFtcF91MzI7CgpPaC4uIEkgZmVlbCBiYWQgZm9yIG5v
dGljaW5nIHRoaXMgc28gbGF0ZS4gSSB0aGluayB0aGlzIGNhbiBiZQpyZXByZXNlbnRlZCB3aXRo
IGEgbWVyZSBfX2xlNjQgYW5kIHRoZW4gYWNjZXNzZWQgdmlhIGxlNjRfdG9fY3B1KCkuCgoKTWlj
aGHFggoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRo
MTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
