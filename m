Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x233.google.com ([2a00:1450:400c:c05::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XC404-00065g-1w
 for ath10k@lists.infradead.org; Tue, 29 Jul 2014 09:47:17 +0000
Received: by mail-wi0-f179.google.com with SMTP id f8so654217wiw.0
 for <ath10k@lists.infradead.org>; Tue, 29 Jul 2014 02:46:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87egx4iksd.fsf@kamboji.qca.qualcomm.com>
References: <1405941081-17359-1-git-send-email-michal.kazior@tieto.com>
 <1405941081-17359-2-git-send-email-michal.kazior@tieto.com>
 <87egx4iksd.fsf@kamboji.qca.qualcomm.com>
Date: Tue, 29 Jul 2014 11:46:48 +0200
Message-ID: <CA+BoTQnMKDCPTOZswZTg8s-_hmaKBiwDT_Rj4tt=ReR7RUWQ3w@mail.gmail.com>
Subject: Re: [PATCH 1/2] ath10k: introduce a stricter scan state machine
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
Cc: Ben Greear <greearb@candelatech.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "sw@simonwunderlich.de" <sw@simonwunderlich.de>

T24gMjkgSnVseSAyMDE0IDExOjIwLCBLYWxsZSBWYWxvIDxrdmFsb0BxY2EucXVhbGNvbW0uY29t
PiB3cm90ZToKPiBNaWNoYWwgS2F6aW9yIDxtaWNoYWwua2F6aW9yQHRpZXRvLmNvbT4gd3JpdGVz
Ogo+Cj4+IFRoaXMgYWltcyBhdCBmaXhpbmcgc29tZSByYXJlIHNjYW4gYnVncyByZWxhdGVkIHRv
Cj4+IGZpcm13YXJlIHJlcG9ydGluZyB1bmV4cGVjdGVkIHNjYW4gZXZlbnQKPj4gc2VxdWVuY2Vz
Lgo+Pgo+PiBPbmUgc3VjaCBidWcgd2FzIGlmIHNwZWN0cmFsIHNjYW4gcGh5ZXJyIHJlcG9ydGlu
Zwo+PiBwcmV2ZW50ZWQgZmlybXdhcmUgZnJvbSBwcm9wZXJseSBwcm9wYWdhdGluZyBzY2FuCj4+
IGV2ZW50cyB0byBob3N0LiBUaGlzIGxlYWRzbCB0byBzY2FuIHRpbWVvdXQuIEFmdGVyCj4+IHRo
YXQgbmV4dCBzY2FuIHdvdWxkIHRyaWdnZXIgc2NhbiBjb21wbGV0ZWQgZXZlbnQKPj4gZmlyc3Qg
KGJlZm9yZSBzY2FuIHN0YXJ0ZWQgZXZlbnQpIGxlYWRpbmcgdG8KPj4gYXItPnNjYW4uaW5fcHJv
Z3Jlc3MgYW5kIHRpbWVvdXQgdGltZXIgc3RhdGVzIHRvCj4+IGJlIG92ZXJ3cml0dGVuIGluY29y
cmVjdGx5IGFuZCBtYWtpbmcgdGhlIHZlcnkKPj4gbmV4dCBzY2FuIHRvIGhhbmcgZm9yZXZlci4K
Pj4KPj4gUmVwb3J0ZWQtYnk6IEphbnVzeiBEemllZHppYyA8amFudXN6LmR6aWVkemljQHRpZXRv
LmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIEthemlvciA8bWljaGFsLmthemlvckB0aWV0
by5jb20+Cj4KPj4gK2VudW0gYXRoMTBrX3NjYW5fc3RhdGUgewo+PiArICAgICBBVEgxMEtfU0NB
Tl9JRExFLAo+PiArICAgICBBVEgxMEtfU0NBTl9TVEFSVElORywKPj4gKyAgICAgQVRIMTBLX1ND
QU5fUlVOTklORywKPj4gKyAgICAgQVRIMTBLX1NDQU5fUlVOTklOR19BTkRfQUJPUlRJTkcsCj4+
ICt9Owo+Cj4gQ2FuJ3Qgd2UganVzdCBjYWxsIHRoZSBsYXN0IHN0YXRlIGp1c3QgYXMgQVRIMTBL
X1NDQU5fQUJPUlRJTkc/IEkgdGhpbmsKPiBJIHVuZGVyc3RhbmQgd2h5IHlvdSBhZGRlZCB0aGUg
d29yZCAicnVubmluZyIgdGhlcmUgYnV0IElNSE8gdGhhdCdzIG5vdAo+IG5lZWRlZC4KCkknbGwg
Y2hhbmdlIHRoYXQuCgoKPj4gQEAgLTIzMjMsOCArMjM0OCw2IEBAIHZvaWQgYXRoMTBrX2hhbHQo
c3RydWN0IGF0aDEwayAqYXIpCj4+ICAgICAgICAgICAgICAgYXRoMTBrX21vbml0b3Jfc3RvcChh
cik7Cj4+ICAgICAgIH0KPj4KPj4gLSAgICAgZGVsX3RpbWVyX3N5bmMoJmFyLT5zY2FuLnRpbWVv
dXQpOwo+PiAtICAgICBhdGgxMGtfcmVzZXRfc2NhbigodW5zaWduZWQgbG9uZylhcik7Cj4+ICAg
ICAgIGF0aDEwa19wZWVyX2NsZWFudXBfYWxsKGFyKTsKPj4gICAgICAgYXRoMTBrX2NvcmVfc3Rv
cChhcik7Cj4+ICAgICAgIGF0aDEwa19oaWZfcG93ZXJfZG93bihhcik7Cj4KPiBXaHkgeW91IGRv
bid0IGNhbGwgYXRoMTBrX3NjYW5fcmVzZXQoKSBoZXJlPyBJIHdvdWxkIGhhdmUgYXNzdW1lZCB0
aGF0Cj4geW91IGRvIHRoYXQuCgpIbW0uLiBHb29kIGNhdGNoLgoKQW55d2F5IEkgbmVlZCB0byB3
b3JrIG9uIHRoaXMgcGF0Y2ggYSBsaXR0bGUgYml0IG1vcmUgYW5kIGZpeCBhbm90aGVyCmNvcm5l
ciBjYXNlLgoKCk1pY2hhxYIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
