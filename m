Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x233.google.com ([2a00:1450:400c:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y8maA-0004By-71
 for ath10k@lists.infradead.org; Wed, 07 Jan 2015 09:07:15 +0000
Received: by mail-we0-f179.google.com with SMTP id q59so769146wes.10
 for <ath10k@lists.infradead.org>; Wed, 07 Jan 2015 01:06:51 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87lhm3iusl.fsf@kamboji.qca.qualcomm.com>
References: <1418829711-19713-1-git-send-email-bartosz.markowski@tieto.com>
 <1418829711-19713-6-git-send-email-bartosz.markowski@tieto.com>
 <87lhm3iusl.fsf@kamboji.qca.qualcomm.com>
Date: Wed, 7 Jan 2015 10:06:51 +0100
Message-ID: <CA+BoTQmJ3Z0LvBKb9ibpqR=YX_boMRTuvoU58-UJQt6+1mRGzg@mail.gmail.com>
Subject: Re: [PATCH 5/5] ath10k: implement support for ap beacon offloading
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Bartosz Markowski <bartosz.markowski@tieto.com>

T24gMTkgRGVjZW1iZXIgMjAxNCBhdCAxNToyMiwgS2FsbGUgVmFsbyA8a3ZhbG9AcWNhLnF1YWxj
b21tLmNvbT4gd3JvdGU6Cj4gQmFydG9zeiBNYXJrb3dza2kgPGJhcnRvc3oubWFya293c2tpQHRp
ZXRvLmNvbT4gd3JpdGVzOgo+Cj4+IEZyb206IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JA
dGlldG8uY29tPgo+Pgo+PiBOZXcgZmlybXdhcmUgcmV2aXNpb25zIHN1cHBvcnQgYmVhY29uIGFu
ZCBwcm9iZQo+PiByZXNwb25zZSB0ZW1wbGF0ZXMgaW5zdGVhZC4gVGhpcyBtZWFucyBTV0JBIGV2
ZW50cwo+PiBhcmUgbm8gbG9uZ2VyIGRlbGl2ZXJlZCBmb3IgdGhlc2UgZmlybXdhcmUKPj4gcmV2
aXNpb25zLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWwgS2F6aW9yIDxtaWNoYWwua2F6aW9y
QHRpZXRvLmNvbT4KPgo+IFsuLi5dCj4KPj4gKyAgICAgcmV0ID0gYXRoMTBrX21hY19zZXR1cF9i
Y25fcDJwX2llKGFydmlmLCBiY24pOwo+PiArICAgICBpZiAocmV0KSB7Cj4+ICsgICAgICAgICAg
ICAgYXRoMTBrX3dhcm4oYXIsICJmYWlsZWQgdG8gc2V0dXAgcDJwIGdvIGJjbiBpZTogJWRcbiIs
IHJldCk7Cj4+ICsgICAgICAgICAgICAga2ZyZWVfc2tiKGJjbik7Cj4+ICsgICAgICAgICAgICAg
cmV0dXJuIHJldDsKPj4gKyAgICAgfQo+PiArCj4+ICsgICAgIGF0aDEwa19tYWNfcmVtb3ZlX3Zl
bmRvcl9pZShiY24sIFdMQU5fT1VJX1dGQSwgV0xBTl9PVUlfVFlQRV9XRkFfUDJQLAo+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgb2Zmc2V0b2Yoc3RydWN0IGllZWU4MDIxMV9t
Z210LAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdS5iZWFj
b24udmFyaWFibGUpKTsKPgo+IEEgY29tbWVudCB3b3VsZCBiZSBuaWNlIHdoeSB5b3UgYXJlIHJl
bW92aW5nIHRoZSBQMlAgSUUuIEkgZ3Vlc3MgYmVjYXVzZQo+IHRoZXJlJ3MgYSBkaWZmZXJlbnQg
Y29tbWFuZCB0byBzZXQgdGhhdCBJRT8KCkNvcnJlY3QgLSBhdGgxMGtfd21pX3AycF9nb19iY25f
aWUoKSAoY2FsbGVkIGJ5CmF0aDEwa19tYWNfc2V0dXBfYmNuX3AycF9pZSkgaXMgdGhhdCBjb21t
YW5kLiBUaGUgcmVtb3ZhbCBhdm9pZHMKZHVwbGljYXRlIFAyUCBJRSBpbiBCZWFjb25zLiBJJ2xs
IGFkZCBhIGNvbW1lbnQuCgoKTWljaGHFggoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEw
awo=
