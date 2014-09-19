Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x232.google.com ([2a00:1450:400c:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XUtnB-0001gZ-P5
 for ath10k@lists.infradead.org; Fri, 19 Sep 2014 08:43:50 +0000
Received: by mail-we0-f178.google.com with SMTP id q58so2141660wes.37
 for <ath10k@lists.infradead.org>; Fri, 19 Sep 2014 01:43:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87a95wngzt.fsf@kamboji.qca.qualcomm.com>
References: <1411046487-19544-1-git-send-email-michal.kazior@tieto.com>
 <1411046487-19544-7-git-send-email-michal.kazior@tieto.com>
 <87a95wngzt.fsf@kamboji.qca.qualcomm.com>
Date: Fri, 19 Sep 2014 10:43:25 +0200
Message-ID: <CA+BoTQmsVqvGgu_fUqKGqhEKXV7E_w0KdcH_GFoPhAvyjtVdDA@mail.gmail.com>
Subject: Re: [PATCH 6/9] ath10k: deduplicate wmi service ready logic
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMTkgU2VwdGVtYmVyIDIwMTQgMTA6MzcsIEthbGxlIFZhbG8gPGt2YWxvQHFjYS5xdWFsY29t
bS5jb20+IHdyb3RlOgo+IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGlldG8uY29tPiB3
cml0ZXM6Cj4KPj4gVGhlIGxvZ2ljIHJlc3BvbnNpYmxlIGZvciBwcm9jZXNzaW5nIHRoZSBldmVu
dCBpcwo+PiBubyBkaWZmZXJlbnQgYWNyb3NzIGRpZmZlcmVudCBmaXJtd2FyZSBiaW5hcmllcy4K
Pj4gVGhlIGRpZmZlcmVuY2UgdGhhdCBuZWVkcyB0byBiZSBkZWFsdCB3aXRoIGlzIHRoZQo+PiBB
Qkkgb2YgZGF0YSBzdHJ1Y3R1cmVzLgo+Pgo+PiBUaGUgaW50ZXJtZWRpYXRlIHN0cnVjdHVyZSB1
c2VzIF9fbGUzMiB0byBhdm9pZAo+PiBleHRyYSBtZW1vcnkgYWxsb2NhdGlvbnMgdG8gYnl0ZXN3
YXAKPj4gdmFyaWFibGUtbGVuZ3RoIHN1YnN0cnVjdHVyZXMgKGkuZS4gaG9zdCBtZW0KPj4gY2h1
bmtzKS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIEthemlvciA8bWljaGFsLmthemlvckB0
aWV0by5jb20+Cj4KPiBbLi4uXQo+Cj4+ICsgICAgIGlmICh0ZXN0X2JpdChBVEgxMEtfRldfRkVB
VFVSRV9XTUlfMTBYLCBhci0+ZndfZmVhdHVyZXMpKSB7Cj4+ICsgICAgICAgICAgICAgcmV0ID0g
YXRoMTBrX3dtaV8xMHhfcHVsbF9zdmNfcmR5X2V2KHNrYiwgJmFyZyk7Cj4+ICsgICAgICAgICAg
ICAgd21pXzEweF9zdmNfbWFwKGFyZy5zZXJ2aWNlX21hcCwgc3ZjX2JtYXApOwo+PiArICAgICB9
IGVsc2Ugewo+PiArICAgICAgICAgICAgIHJldCA9IGF0aDEwa193bWlfcHVsbF9zdmNfcmR5X2V2
KHNrYiwgJmFyZyk7Cj4+ICsgICAgICAgICAgICAgd21pX21haW5fc3ZjX21hcChhcmcuc2Vydmlj
ZV9tYXAsIHN2Y19ibWFwKTsKPj4gKyAgICAgfQo+Cj4gRm9yIGNvbnNpc3RlbmN5IHNob3VsZG4n
dCB0aGUgbGF0dGVyIGJlCj4gYXRoMTBrX3dtaV9tYWluX3B1bGxfc3ZjX3JkeV9ldigpPwoKR29v
ZCBwb2ludC4gTWFrZXMgc2Vuc2UuIEknbGwgYWRkIHRoZSBfbWFpbiB0byB0aGUgZnVuY3Rpb24g
bmFtZS4KCgo+PiAtLS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3dtaS5oCj4+
ICsrKyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvd21pLmgKPj4gQEAgLTEzOTQs
NiArMTM5NCw3IEBAIHN0cnVjdCB3bGFuX2hvc3RfbWVtX3JlcSB7Cj4+ICAgKiB3bWlfc2Vydmlj
ZV9yZWFkeV9ldmVudCxlLmcuLCAxMWFjIHBhc3Mgc29tZSBvZiB0aGUKPj4gICAqIGRldmljZSBj
YXBhYmlsaXR5IHRvIHRoZSBob3N0Lgo+PiAgICovCj4+ICsKPj4gIHN0cnVjdCB3bWlfc2Vydmlj
ZV9yZWFkeV9ldmVudCB7Cj4+ICAgICAgIF9fbGUzMiBzd192ZXJzaW9uOwo+PiAgICAgICBfX2xl
MzIgc3dfdmVyc2lvbl8xOwo+Cj4gSXNuJ3QgdGhpcyB1bm5lZWRlZCBjaGFuZ2U/CgpHb29kIGNh
dGNoLiBJJ2xsIGZpeCB0aGF0LgoKCk1pY2hhxYIKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
dGgxMGsK
