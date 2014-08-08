Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x22f.google.com ([2a00:1450:400c:c00::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFhvC-0001IS-Sm
 for ath10k@lists.infradead.org; Fri, 08 Aug 2014 11:01:22 +0000
Received: by mail-wg0-f47.google.com with SMTP id b13so5409496wgh.18
 for <ath10k@lists.infradead.org>; Fri, 08 Aug 2014 04:00:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <878umzz2d0.fsf@kamboji.qca.qualcomm.com>
References: <1407402212-29809-1-git-send-email-michal.kazior@tieto.com>
 <1407402212-29809-3-git-send-email-michal.kazior@tieto.com>
 <878umzz2d0.fsf@kamboji.qca.qualcomm.com>
Date: Fri, 8 Aug 2014 13:00:56 +0200
Message-ID: <CA+BoTQnvS2C9_C7qkrX5cPLa8weHx_FmS8Gd=d2Pf=EAmf9EiQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] ath10k: remove target soc ps code
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

T24gOCBBdWd1c3QgMjAxNCAxMjo0NSwgS2FsbGUgVmFsbyA8a3ZhbG9AcWNhLnF1YWxjb21tLmNv
bT4gd3JvdGU6Cj4gTWljaGFsIEthemlvciA8bWljaGFsLmthemlvckB0aWV0by5jb20+IHdyaXRl
czoKPgo+PiBUaGUgc29jIHBvd2Vyc2F2ZSB3YXMgZGlzYWJsZWQgYnkgZGVmYXVsdC4gSXQKPj4g
bmV2ZXIgd2FzIGZ1bGx5IHRlc3RlZC4gU29tZSBodyBhcHBhcmVudGx5IGhhZAo+PiBwcm9ibGVt
cyB3aXRoIGl0IGFuZCB0aGUgaW1wbGVtZW50YXRpb24gaXRzZWxmIGhhZAo+PiBhIHBvc3NpYmxl
IHJhY2UuCj4+Cj4+IEp1c3QgcmVtb3ZlIHRoZSByZWZjb3VudGluZyBhbmQgc2ltcGx5IHdha2Ug
dXAgdGhlCj4+IGRldmljZSB3aGVuIHByb2JpbmcgYW5kIHB1dCB0byBzbGVlcCB3aGVuCj4+IHJl
bW92aW5nLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWwgS2F6aW9yIDxtaWNoYWwua2F6aW9y
QHRpZXRvLmNvbT4KPgo+IFRoaXMgb25lIGludHJvZHVjZWQgbmV3IHdhcm5pbmdzOgo+Cj4gZHJp
dmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9wY2kuYzo2NDY6NTogd2FybmluZzogc3ltYm9s
ICdhdGgxMGtfcGNpX3dha2UnIHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/
Cj4gZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9wY2kuYzo2NTM6Njogd2FybmluZzog
c3ltYm9sICdhdGgxMGtfcGNpX3NsZWVwJyB3YXMgbm90IGRlY2xhcmVkLiBTaG91bGQgaXQgYmUg
c3RhdGljPwoKSSBkaWRuJ3QgY2F0Y2ggdGhpcyBmb3Igc29tZSByZWFzb24uIENhbiB5b3Ugc2hh
cmUgaG93IHlvdSBydW4KY2hlY2twYXRjaCwgcGxlYXNlPwoKCj4gSXMgaXQgb2theSBpZiBJIGZp
eCBpdCBsaWtlIHRoaXM6Cj4KPiAtLS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBr
L3BjaS5jCj4gKysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9wY2kuYwo+IEBA
IC02NDMsMTQgKzY0MywxNCBAQCBzdGF0aWMgaW50IGF0aDEwa19wY2lfd2FrZV93YWl0KHN0cnVj
dCBhdGgxMGsgKmFyKQo+ICAgICAgICAgcmV0dXJuIC1FVElNRURPVVQ7Cj4gIH0KPgo+IC1pbnQg
YXRoMTBrX3BjaV93YWtlKHN0cnVjdCBhdGgxMGsgKmFyKQo+ICtzdGF0aWMgaW50IGF0aDEwa19w
Y2lfd2FrZShzdHJ1Y3QgYXRoMTBrICphcikKPiAgewo+ICAgICAgICAgYXRoMTBrX3BjaV9yZWdf
d3JpdGUzMihhciwgUENJRV9TT0NfV0FLRV9BRERSRVNTLAo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBQQ0lFX1NPQ19XQUtFX1ZfTUFTSyk7Cj4gICAgICAgICByZXR1cm4gYXRoMTBr
X3BjaV93YWtlX3dhaXQoYXIpOwo+ICB9Cj4KPiAtdm9pZCBhdGgxMGtfcGNpX3NsZWVwKHN0cnVj
dCBhdGgxMGsgKmFyKQo+ICtzdGF0aWMgdm9pZCBhdGgxMGtfcGNpX3NsZWVwKHN0cnVjdCBhdGgx
MGsgKmFyKQo+ICB7Cj4gICAgICAgICBhdGgxMGtfcGNpX3JlZ193cml0ZTMyKGFyLCBQQ0lFX1NP
Q19XQUtFX0FERFJFU1MsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBDSUVfU09D
X1dBS0VfUkVTRVQpOwoKTG9va3MgZ29vZCwgdGhhbmtzLgoKCk1pY2hhxYIKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QK
YXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hdGgxMGsK
