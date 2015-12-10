Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a717F-0001xv-TX
 for ath10k@lists.infradead.org; Thu, 10 Dec 2015 13:18:42 +0000
Received: by wmec201 with SMTP id c201so24405648wme.1
 for <ath10k@lists.infradead.org>; Thu, 10 Dec 2015 05:18:11 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20151209104935.GL3173@mwanda>
References: <20151209104935.GL3173@mwanda>
Date: Thu, 10 Dec 2015 14:18:11 +0100
Message-ID: <CA+BoTQnss5bmcp4hN1rUYgHckzJMt-MPeZivrTsV=3acxCSX4Q@mail.gmail.com>
Subject: Re: ath10k: replace vdev_id and tid in skb cb
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
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gOSBEZWNlbWJlciAyMDE1IGF0IDExOjQ5LCBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVy
QG9yYWNsZS5jb20+IHdyb3RlOgo+IEhlbGxvIE1pY2hhbCBLYXppb3IsCj4KPiBUaGlzIGlzIGEg
c2VtaS1hdXRvbWF0aWMgZW1haWwgYWJvdXQgbmV3IHN0YXRpYyBjaGVja2VyIHdhcm5pbmdzLgo+
Cj4gVGhlIHBhdGNoIDYwOWRiMjI5YjQyZjogImF0aDEwazogcmVwbGFjZSB2ZGV2X2lkIGFuZCB0
aWQgaW4gc2tiIGNiIgo+IGZyb20gTm92IDE4LCAyMDE1LCBsZWFkcyB0byB0aGUgZm9sbG93aW5n
IFNtYXRjaCBjb21wbGFpbnQ6Cj4KPiBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL2h0
dF90eC5jOjQ1MCBhdGgxMGtfaHR0X3R4X2dldF92ZGV2X2lkKCkKPiAgICAgICAgICB3YXJuOiB2
YXJpYWJsZSBkZXJlZmVyZW5jZWQgYmVmb3JlIGNoZWNrICdjYi0+dmlmJyAoc2VlIGxpbmUgNDQ2
KQo+Cj4gZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9odHRfdHguYwo+ICAgIDQ0NSAg
ICAgICAgICBzdHJ1Y3QgYXRoMTBrX3NrYl9jYiAqY2IgPSBBVEgxMEtfU0tCX0NCKHNrYik7Cj4g
ICAgNDQ2ICAgICAgICAgIHN0cnVjdCBhdGgxMGtfdmlmICphcnZpZiA9ICh2b2lkICopY2ItPnZp
Zi0+ZHJ2X3ByaXY7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXl5eXl5eXl5eCj4gRGVyZWZlcmVuY2UuCj4KPiAgICA0NDcKPiAgICA0NDggICAg
ICAgICAgaWYgKGluZm8tPmZsYWdzICYgSUVFRTgwMjExX1RYX0NUTF9UWF9PRkZDSEFOKQo+ICAg
IDQ0OSAgICAgICAgICAgICAgICAgIHJldHVybiBhci0+c2Nhbi52ZGV2X2lkOwo+ICAgIDQ1MCAg
ICAgICAgICBlbHNlIGlmIChjYi0+dmlmKQo+ICAgICAgICAgICAgICAgICAgICAgICAgICBeXl5e
Xl5eCj4gQ2hlY2tlZCB0b28gbGF0ZS4KClRoaXMgaXMgYSBmYWxzZSBwb3NpdGl2ZS4KClRoZSBk
cnZfcHJpdiBpcyBhIDAtbGVuL2R5bmFtaWMgYXJyYXkgYXQgdGhlIGVuZCBvZiBpZWVlODAyMTFf
dmlmCnN0cnVjdC4gVGhlIGNiLT52aWYtPmRydl9wcml2IGV4cHJlc3Npb24gc2hvdWxkIGJlIGV4
cGFuZGVkIHRvIGEgbWVyZQooY2ItPnZpZikrb2Zmc2V0b2YoZHJ2X3ByaXYpIHdoaWNoIGlzbid0
IGEgZGVyZWZlcmVuY2UgcGVyIHNlLgoKCk1pY2hhxYIKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hdGgxMGsK
