Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x231.google.com ([2a00:1450:400c:c00::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YzM77-0001Zd-JO
 for ath10k@lists.infradead.org; Mon, 01 Jun 2015 09:34:34 +0000
Received: by wgbgq6 with SMTP id gq6so109087410wgb.3
 for <ath10k@lists.infradead.org>; Mon, 01 Jun 2015 02:34:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1433150613-5662-1-git-send-email-rmani@qti.qualcomm.com>
References: <1433150613-5662-1-git-send-email-rmani@qti.qualcomm.com>
Date: Mon, 1 Jun 2015 11:34:11 +0200
Message-ID: <CA+BoTQk+gRKdue26G1-Q=qsxf4y1Q5YJffSrPsUgYX8oMfMF=A@mail.gmail.com>
Subject: Re: [PATCH] ath10k: free wmi mgmt event skb when parsing fails
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
To: Raja Mani <rmani@qti.qualcomm.com>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMSBKdW5lIDIwMTUgYXQgMTE6MjMsIFJhamEgTWFuaSA8cm1hbmlAcXRpLnF1YWxjb21tLmNv
bT4gd3JvdGU6Cj4gV2hlbiB3bWkgbWdtdCBldmVudCBmdW5jdGlvbiBmYWlscyB0byBwYXJzZSBn
aXZlbiBza2IsCj4gaXQgc2hvdWxkIGJlIGZyZWVkIG9uIGZhaWx1cmUgY29uZGl0aW9uIHRvIGF2
b2lkIG1lbW9yeQo+IGxlYWtzLiBGb3VuZCB0aGlzIGR1cmluZyB0aGUgY29kZSByZXZpZXcuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBSYWphIE1hbmkgPHJtYW5pQHF0aS5xdWFsY29tbS5jb20+Cj4gLS0t
Cj4gIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvd21pLmMgfCAgICAxICsKPiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQv
d2lyZWxlc3MvYXRoL2F0aDEway93bWkuYyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgx
MGsvd21pLmMKPiBpbmRleCBiODkyZWI4Li44MThiZDI1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
bmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvd21pLmMKPiArKysgYi9kcml2ZXJzL25ldC93aXJlbGVz
cy9hdGgvYXRoMTBrL3dtaS5jCj4gQEAgLTIwODksNiArMjA4OSw3IEBAIGludCBhdGgxMGtfd21p
X2V2ZW50X21nbXRfcngoc3RydWN0IGF0aDEwayAqYXIsIHN0cnVjdCBza19idWZmICpza2IpCj4g
ICAgICAgICByZXQgPSBhdGgxMGtfd21pX3B1bGxfbWdtdF9yeChhciwgc2tiLCAmYXJnKTsKPiAg
ICAgICAgIGlmIChyZXQpIHsKPiAgICAgICAgICAgICAgICAgYXRoMTBrX3dhcm4oYXIsICJmYWls
ZWQgdG8gcGFyc2UgbWdtdCByeCBldmVudDogJWRcbiIsIHJldCk7Cj4gKyAgICAgICAgICAgICAg
IGRldl9rZnJlZV9za2Ioc2tiKTsKPiAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiAgICAg
ICAgIH0KCkdvb2QgY2F0Y2ghIExvb2tzIGdvb2QgdG8gbWUuCgoKTWljaGHFggoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlz
dAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
