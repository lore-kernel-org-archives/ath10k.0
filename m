Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c6az6-0001j9-A7
 for ath10k@lists.infradead.org; Tue, 15 Nov 2016 10:29:01 +0000
Received: by mail-wm0-x22b.google.com with SMTP id g23so157410070wme.1
 for <ath10k@lists.infradead.org>; Tue, 15 Nov 2016 02:28:40 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1479141222-8493-7-git-send-email-erik.stromdahl@gmail.com>
References: <1479141222-8493-1-git-send-email-erik.stromdahl@gmail.com>
 <1479141222-8493-7-git-send-email-erik.stromdahl@gmail.com>
From: Michal Kazior <michal.kazior@tieto.com>
Date: Tue, 15 Nov 2016 11:28:38 +0100
Message-ID: <CA+BoTQ=jSun0Je6sVsZz-SaiDA6+nZxSTJF_5OH0unPkjm1gvw@mail.gmail.com>
Subject: Re: [RFC 06/12] ath10k: bmi: Added SOC reg read/write functions
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMTQgTm92ZW1iZXIgMjAxNiBhdCAxNzozMywgRXJpayBTdHJvbWRhaGwgPGVyaWsuc3Ryb21k
YWhsQGdtYWlsLmNvbT4gd3JvdGU6Cj4gQWRkZWQgZnVuY3Rpb25zIGltcGxlbWVudGluZyB0aGUg
Zm9sbG93aW5nIEJNSSBjb21tYW5kczoKPgo+IEJNSV9SRUFEX1NPQ19SRUdJU1RFUgo+IEJNSV9X
UklURV9TT0NfUkVHSVNURVIKPgo+IFJlYWRpbmcgYW5kIHdyaXRpbmcgQk1JIHJlZ2lzdGVycyBp
cyBzb21ldGltZXMgbmVlZGVkIGZvcgo+IFNESU8gY2hpcHNldHMuCgpJIGRpZG4ndCBzZWUgYXRo
MTBrX2JtaV93cml0ZV9zb2NfcmVnIG5vciBhdGgxMGtfYm1pX3JlYWRfc29jX3JlZwpiZWluZyB1
c2VkIGluIHlvdXIgUGF0Y2ggMTIuIElzIHRoaXMgcGF0Y2ggcmVhbGx5IG5lY2Vzc2FyeT8KCgpb
Li4uXQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL2JtaS5j
IGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9ibWkuYwo+IGluZGV4IDI4NzJkMzQu
LjFjMzc4YTIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9i
bWkuYwo+ICsrKyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvYm1pLmMKPiBAQCAt
OTcsNyArOTcsOCBAQCBpbnQgYXRoMTBrX2JtaV9yZWFkX21lbW9yeShzdHJ1Y3QgYXRoMTBrICph
ciwKPiAgICAgICAgIHUzMiByeGxlbjsKPiAgICAgICAgIGludCByZXQ7Cj4KPiAtICAgICAgIGF0
aDEwa19kYmcoYXIsIEFUSDEwS19EQkdfQk1JLCAiYm1pIHJlYWQgYWRkcmVzcyAweCV4IGxlbmd0
aCAlZFxuIiwKPiArICAgICAgIGF0aDEwa19kYmcoYXIsIEFUSDEwS19EQkdfQk1JLAo+ICsgICAg
ICAgICAgICAgICAgICAiYm1pIHJlYWQgbWVtb3J5IGFkZHJlc3MgMHgleCBsZW5ndGggJWRcbiIs
Cj4gICAgICAgICAgICAgICAgICAgIGFkZHJlc3MsIGxlbmd0aCk7Cj4KPiAgICAgICAgIGlmIChh
ci0+Ym1pLmRvbmVfc2VudCkgewo+IEBAIC0xMzcsNyArMTM4LDggQEAgaW50IGF0aDEwa19ibWlf
d3JpdGVfbWVtb3J5KHN0cnVjdCBhdGgxMGsgKmFyLAo+ICAgICAgICAgdTMyIHR4bGVuOwo+ICAg
ICAgICAgaW50IHJldDsKPgo+IC0gICAgICAgYXRoMTBrX2RiZyhhciwgQVRIMTBLX0RCR19CTUks
ICJibWkgd3JpdGUgYWRkcmVzcyAweCV4IGxlbmd0aCAlZFxuIiwKPiArICAgICAgIGF0aDEwa19k
YmcoYXIsIEFUSDEwS19EQkdfQk1JLAo+ICsgICAgICAgICAgICAgICAgICAiYm1pIHdyaXRlIG1l
bW9yeSBhZGRyZXNzIDB4JXggbGVuZ3RoICVkXG4iLAo+ICAgICAgICAgICAgICAgICAgICBhZGRy
ZXNzLCBsZW5ndGgpOwo+CgpUaGVzZSAyIGh1bmtzIHNob3VsZG4ndCBiZSBtb2RpZmllZCBpbiB0
aGlzIHBhdGNoLiBJZiB5b3Ugd2FudCB0byBkbyBhCmNsZWFuIHVwIHRoaXMgd2FycmFudHMgYSBz
ZXBhcmF0ZSBwYXRjaCA6KQoKCk1pY2hhxYIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgx
MGsK
