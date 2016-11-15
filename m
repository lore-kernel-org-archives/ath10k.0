Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c6hGm-0002Gu-Sv
 for ath10k@lists.infradead.org; Tue, 15 Nov 2016 17:11:41 +0000
Received: by mail-wm0-x244.google.com with SMTP id a20so2014837wme.2
 for <ath10k@lists.infradead.org>; Tue, 15 Nov 2016 09:11:20 -0800 (PST)
Subject: Re: [RFC 06/12] ath10k: bmi: Added SOC reg read/write functions
References: <1479141222-8493-1-git-send-email-erik.stromdahl@gmail.com>
 <1479141222-8493-7-git-send-email-erik.stromdahl@gmail.com>
 <CA+BoTQ=jSun0Je6sVsZz-SaiDA6+nZxSTJF_5OH0unPkjm1gvw@mail.gmail.com>
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Message-ID: <5333e0c5-3449-5bcd-b467-3282d8b0a43b@gmail.com>
Date: Tue, 15 Nov 2016 18:11:17 +0100
MIME-Version: 1.0
In-Reply-To: <CA+BoTQ=jSun0Je6sVsZz-SaiDA6+nZxSTJF_5OH0unPkjm1gvw@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

CgpPbiAxMS8xNS8yMDE2IDExOjI4IEFNLCBNaWNoYWwgS2F6aW9yIHdyb3RlOgo+IE9uIDE0IE5v
dmVtYmVyIDIwMTYgYXQgMTc6MzMsIEVyaWsgU3Ryb21kYWhsIDxlcmlrLnN0cm9tZGFobEBnbWFp
bC5jb20+IHdyb3RlOgo+PiBBZGRlZCBmdW5jdGlvbnMgaW1wbGVtZW50aW5nIHRoZSBmb2xsb3dp
bmcgQk1JIGNvbW1hbmRzOgo+Pgo+PiBCTUlfUkVBRF9TT0NfUkVHSVNURVIKPj4gQk1JX1dSSVRF
X1NPQ19SRUdJU1RFUgo+Pgo+PiBSZWFkaW5nIGFuZCB3cml0aW5nIEJNSSByZWdpc3RlcnMgaXMg
c29tZXRpbWVzIG5lZWRlZCBmb3IKPj4gU0RJTyBjaGlwc2V0cy4KPiAKPiBJIGRpZG4ndCBzZWUg
YXRoMTBrX2JtaV93cml0ZV9zb2NfcmVnIG5vciBhdGgxMGtfYm1pX3JlYWRfc29jX3JlZwo+IGJl
aW5nIHVzZWQgaW4geW91ciBQYXRjaCAxMi4gSXMgdGhpcyBwYXRjaCByZWFsbHkgbmVjZXNzYXJ5
Pwo+IAo+IAoKWW91IGFyZSByaWdodCwgdGhlc2UgZnVuY3Rpb25zIGFyZSBub3QgdXNlZCBpbiBw
YXRjaCAxMi4gVGhleSBhcmUgdXNlZAppbiBzb21lIG90aGVyIHBhdGNoZXMgdGhhdCB3YXMgbm90
IGluY2x1ZGVkIGluIHRoaXMgc2VyaWVzIChuZWVkcyBtb3JlCmNsZWFudXAgYmVmb3JlIEkgY2Fu
IHB1Ymxpc2gpLiBJIHdpbGwgcmVtb3ZlIHRoZW0gZnJvbSB0aGUgc2VyaWVzLgoKPiBbLi4uXQo+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9ibWkuYyBiL2Ry
aXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvYm1pLmMKPj4gaW5kZXggMjg3MmQzNC4uMWMz
NzhhMiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9ibWku
Ywo+PiArKysgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL2JtaS5jCj4+IEBAIC05
Nyw3ICs5Nyw4IEBAIGludCBhdGgxMGtfYm1pX3JlYWRfbWVtb3J5KHN0cnVjdCBhdGgxMGsgKmFy
LAo+PiAgICAgICAgIHUzMiByeGxlbjsKPj4gICAgICAgICBpbnQgcmV0Owo+Pgo+PiAtICAgICAg
IGF0aDEwa19kYmcoYXIsIEFUSDEwS19EQkdfQk1JLCAiYm1pIHJlYWQgYWRkcmVzcyAweCV4IGxl
bmd0aCAlZFxuIiwKPj4gKyAgICAgICBhdGgxMGtfZGJnKGFyLCBBVEgxMEtfREJHX0JNSSwKPj4g
KyAgICAgICAgICAgICAgICAgICJibWkgcmVhZCBtZW1vcnkgYWRkcmVzcyAweCV4IGxlbmd0aCAl
ZFxuIiwKPj4gICAgICAgICAgICAgICAgICAgIGFkZHJlc3MsIGxlbmd0aCk7Cj4+Cj4+ICAgICAg
ICAgaWYgKGFyLT5ibWkuZG9uZV9zZW50KSB7Cj4+IEBAIC0xMzcsNyArMTM4LDggQEAgaW50IGF0
aDEwa19ibWlfd3JpdGVfbWVtb3J5KHN0cnVjdCBhdGgxMGsgKmFyLAo+PiAgICAgICAgIHUzMiB0
eGxlbjsKPj4gICAgICAgICBpbnQgcmV0Owo+Pgo+PiAtICAgICAgIGF0aDEwa19kYmcoYXIsIEFU
SDEwS19EQkdfQk1JLCAiYm1pIHdyaXRlIGFkZHJlc3MgMHgleCBsZW5ndGggJWRcbiIsCj4+ICsg
ICAgICAgYXRoMTBrX2RiZyhhciwgQVRIMTBLX0RCR19CTUksCj4+ICsgICAgICAgICAgICAgICAg
ICAiYm1pIHdyaXRlIG1lbW9yeSBhZGRyZXNzIDB4JXggbGVuZ3RoICVkXG4iLAo+PiAgICAgICAg
ICAgICAgICAgICAgYWRkcmVzcywgbGVuZ3RoKTsKPj4KPiAKPiBUaGVzZSAyIGh1bmtzIHNob3Vs
ZG4ndCBiZSBtb2RpZmllZCBpbiB0aGlzIHBhdGNoLiBJZiB5b3Ugd2FudCB0byBkbyBhCj4gY2xl
YW4gdXAgdGhpcyB3YXJyYW50cyBhIHNlcGFyYXRlIHBhdGNoIDopCj4gCj4gCj4gTWljaGHFggo+
IAoKT2sKCi9FcmlrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
