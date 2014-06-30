Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x234.google.com ([2a00:1450:400c:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X1ULQ-0008Ae-0w
 for ath10k@lists.infradead.org; Mon, 30 Jun 2014 05:41:37 +0000
Received: by mail-we0-f180.google.com with SMTP id x48so7487579wes.39
 for <ath10k@lists.infradead.org>; Sun, 29 Jun 2014 22:41:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <8761jmtp1y.fsf@kamboji.qca.qualcomm.com>
References: <1403860015-31601-1-git-send-email-michal.kazior@tieto.com>
 <1403860015-31601-3-git-send-email-michal.kazior@tieto.com>
 <8761jmtp1y.fsf@kamboji.qca.qualcomm.com>
Date: Mon, 30 Jun 2014 07:41:07 +0200
Message-ID: <CA+BoTQ=n-NGGbJ9tJ+Q=7Lhnd2XxWTWRZLBV-q1gDoc7bFitrA@mail.gmail.com>
Subject: Re: [RFC/RFT 2/2] ath10k: fix Rx aggregation reordering
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Denton Gentry <denton.gentry@gmail.com>

T24gMjcgSnVuZSAyMDE0IDE2OjE3LCBLYWxsZSBWYWxvIDxrdmFsb0BxY2EucXVhbGNvbW0uY29t
PiB3cm90ZToKPiBNaWNoYWwgS2F6aW9yIDxtaWNoYWwua2F6aW9yQHRpZXRvLmNvbT4gd3JpdGVz
Ogo+Cj4+IEZpcm13YXJlIGRvZXNuJ3QgcGVyZm9ybSBSeCByZW9yZGVyaW5nIHNvIGl0IGlzCj4+
IGxlZnQgdG8gdGhlIGhvc3QgZHJpdmVyIHRvIGRvIHRoYXQuCj4+Cj4+IFVzZSBtYWM4MDIxMSB0
byBwZXJmb3JtIHJlb3JkZXJpbmcgaW5zdGVhZCBvZgo+PiByZS1pbnZlbnRpbmcgdGhlIHdoZWVs
Lgo+Pgo+PiBUaGlzIGZpeGVzIFRDUCB0aHJvdWdocHV0IGlzc3VlcyBpbiBzb21lCj4+IGVudmly
b25tZW50cyAobm90YWJseSBXaW5kb3dzIHN0YXRpb25zIGNvbm5lY3RpbmcKPj4gdG8gYXRoMTBr
IEFQKS4KPj4KPj4gUmVwb3J0ZWQtQnk6IERlbnRvbiBHZW50cnkgPGRlbnRvbi5nZW50cnlAZ21h
aWwuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWwgS2F6aW9yIDxtaWNoYWwua2F6aW9yQHRp
ZXRvLmNvbT4KPgo+IFsuLi5dCj4KPj4gLS0tIGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0
aDEway9odHRfcnguYwo+PiArKysgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL2h0
dF9yeC5jCj4+IEBAIC0yMSw2ICsyMSw3IEBACj4+ICAjaW5jbHVkZSAidHhyeC5oIgo+PiAgI2lu
Y2x1ZGUgImRlYnVnLmgiCj4+ICAjaW5jbHVkZSAidHJhY2UuaCIKPj4gKyNpbmNsdWRlICJtYWMu
aCIKPgo+IFdoeSB0aGlzPyBBdCBsZWFzdCBmcm9tIGEgcXVpY2sgc2VhcmNoIEkgZGlkbid0IHNl
ZSBhbnkgcmVhc29uIHRvIGFkZCB0aGlzLgoKYXRoMTBrX2dldF9hcnZpZigpCgoKPj4KPj4gICNp
bmNsdWRlIDxsaW51eC9sb2cyLmg+Cj4+Cj4+IEBAIC0xNTMzLDEwICsxNTM0LDk1IEBAIHZvaWQg
YXRoMTBrX2h0dF90MmhfbXNnX2hhbmRsZXIoc3RydWN0IGF0aDEwayAqYXIsIHN0cnVjdCBza19i
dWZmICpza2IpCj4+ICAgICAgIGNhc2UgSFRUX1QySF9NU0dfVFlQRV9TVEFUU19DT05GOgo+PiAg
ICAgICAgICAgICAgIHRyYWNlX2F0aDEwa19odHRfc3RhdHMoc2tiLT5kYXRhLCBza2ItPmxlbik7
Cj4+ICAgICAgICAgICAgICAgYnJlYWs7Cj4+ICsgICAgIGNhc2UgSFRUX1QySF9NU0dfVFlQRV9S
WF9BRERCQTogewo+PiArICAgICAgICAgICAgIHN0cnVjdCBhdGgxMGsgKmFyID0gaHR0LT5hcjsK
Pj4gKyAgICAgICAgICAgICBzdHJ1Y3QgaHR0X3J4X2FkZGJhICpldiA9ICZyZXNwLT5yeF9hZGRi
YTsKPj4gKyAgICAgICAgICAgICBzdHJ1Y3QgYXRoMTBrX3BlZXIgKnBlZXI7Cj4+ICsgICAgICAg
ICAgICAgc3RydWN0IGF0aDEwa192aWYgKmFydmlmOwo+PiArICAgICAgICAgICAgIHUxNiBpbmZv
MCwgdGlkLCBwZWVyX2lkOwo+PiArCj4+ICsgICAgICAgICAgICAgaW5mbzAgPSBfX2xlMzJfdG9f
Y3B1KGV2LT5pbmZvMCk7Cj4+ICsgICAgICAgICAgICAgdGlkID0gTVMoaW5mbzAsIEhUVF9SWF9C
QV9JTkZPMF9USUQpOwo+PiArICAgICAgICAgICAgIHBlZXJfaWQgPSBNUyhpbmZvMCwgSFRUX1JY
X0JBX0lORk8wX1BFRVJfSUQpOwo+Cj4gVGhpcyBldmVudCBoYW5kbGluZyBpcyBwcmV0dHkgbG9u
Zy4gSSB0aGluayBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gaGF2ZSBhCj4gc2VwYXJhdGUgZnVuY3Rp
b24gZm9yIHRoaXMgZXZlbnQuCj4KPj4gKyAgICAgY2FzZSBIVFRfVDJIX01TR19UWVBFX1JYX0RF
TEJBOiB7Cj4+ICsgICAgICAgICAgICAgc3RydWN0IGF0aDEwayAqYXIgPSBodHQtPmFyOwo+PiAr
ICAgICAgICAgICAgIHN0cnVjdCBodHRfcnhfYWRkYmEgKmV2ID0gJnJlc3AtPnJ4X2FkZGJhOwo+
PiArICAgICAgICAgICAgIHN0cnVjdCBhdGgxMGtfcGVlciAqcGVlcjsKPj4gKyAgICAgICAgICAg
ICBzdHJ1Y3QgYXRoMTBrX3ZpZiAqYXJ2aWY7Cj4+ICsgICAgICAgICAgICAgdTE2IGluZm8wLCB0
aWQsIHBlZXJfaWQ7Cj4KPiBBbmQgdGhlIHNhbWUgZm9yIHRoaXMgZXZlbnQuCgpHb29kIGlkZWEu
IEknbGwgZG8gdGhhdC4KCgpNaWNoYcWCCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBr
Cg==
