Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from villa.puc.rediris.es ([2001:720:418:ca00::7])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1awXw1-0004Dw-RS
 for ath10k@lists.infradead.org; Sat, 30 Apr 2016 16:40:03 +0000
Received: from [84.88.62.208] (helo=leo)
 by villa.puc.rediris.es with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <jose.nunez@cttc.cat>) id 1awXvR-0003ia-8c
 for ath10k@lists.infradead.org; Sat, 30 Apr 2016 18:39:25 +0200
Subject: Re: high RTT in 40 MHz channel width
References: <5723960B.9040404@cttc.cat>
From: =?UTF-8?B?Sm9zZSBOw7rDsWV6LU1hcnTDrW5leiAoQ1RUQyk=?=
 <jose.nunez@cttc.cat>
Message-ID: <5724DFBB.7000208@cttc.cat>
Date: Sat, 30 Apr 2016 18:39:23 +0200
MIME-Version: 1.0
In-Reply-To: <5723960B.9040404@cttc.cat>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: =?UTF-8?Q?I=c3=b1aki_Pascual?= <ipascual@cttc.cat>, ath10k@lists.infradead.org

SGkgYWxsLApqdXN0IHRvIGNsYXJpZnksIHJlc3VsdHMgYXJlIG1zLiBBbmQgc3RhdGlvbnMgYXJl
IGluIElCU1MgbW9kZS4KCkJXIDIwIE1IejogVENQIDAuOW1zIFVEUCAxLjFtcwpCVyA0MCBNSHo6
IFRDUCA3LjdtcyBVRFAgMS4zbXMKQlcgODAgTUh6OiBUQ1AgMy41bXMgVURQIDEuM21zCgpCZWhh
dmlvciB3aXRoIDQwTUh6IGFuZCA4ME1IeiBjaGFubmVsIGJhbmR3aWR0aCBpcyByZWFsbHkgd2Vp
cmQgdGFraW5nIAppbnRvIGFjY291bnQgdGhlcmUgYXJlIG5vIHJldHJhbnNtaXNzaW9ucy4gQW55
b25lIGZhY2luZyB0aGlzIGtpbmQgb2YgCnByb2JsZW0/CgpUaGFua3MsCkpvc2UKCk9uIDA0LzI5
LzIwMTYgMDc6MTIgUE0sIEnDsWFraSBQYXNjdWFsIHdyb3RlOgo+IEhpLAo+Cj4gSSBhbSBtZWFz
dXJpbmcgVENQIGFuZCBVRFAgbGF0ZW5jeSAoYWN0dWFsbHkgUlRUKSBhbmQgSSBhbSBnZXR0aW5n
IHRvbyAKPiBoaWdoIHZhbHVlcyB3aGVuIHdvcmtpbmcgd2l0aCBjaGFubmVscyB3aXRoIDQwTUh6
IChhbHNvIHdpdGggODBNSHopIAo+IHdpZHRoLgo+Cj4gSSBhbSB1c2luZyBocGluZzMgZm9yIHRl
c3RpbmcgYW5kIHRoZXNlIGFyZSB0aGUgUlRUIGF2ZyB2YWx1ZXM6Cj4KPiBCVyAyMCBNSHo6IFRD
UCAwLjkgVURQIDEuMQo+IEJXIDQwIE1IejogVENQIDcuNyBVRFAgMS4zCj4gQlcgODAgTUh6OiBU
Q1AgMy41IFVEUCAxLjMKPgo+IEkgaGF2ZSB0cmllZCBkaWZmZXJlbnQgY2hhbm5lbHMgd2l0aCBz
aW1pbGFyIHJlc3VsdHMuIEFjY29yZGluZyBocGluZyAKPiB0aGVyZSBhcmUgbm8gcGFja2V0IGxv
c3MgYW5kIHdpdGggd2lyZXNoYXJrIEkgZG9uJ3Qgc2VlIGFueSAKPiByZXRyYW5zbWlzc2lvbi4K
Pgo+IEkgYW0gdXNpbmc6Cj4gZHJpdmVyOiBhdGgxMGtfcGNpCj4gdmVyc2lvbjogNC4yLjArCj4g
ZmlybXdhcmUtdmVyc2lvbjogMTAuMS40NjctY3QtY29tLWZ1bGwtMDE0LTk2ZDU0Mwo+Cj4gQW55
IGlkZWFzPwo+Cj4gQmVzdHMsCj4KPiBJw7Fha2kKPgo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gYXRoMTBrIG1haWxpbmcgbGlzdAo+IGF0aDEwa0Bs
aXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hdGgxMGsKCi0tIApKb3NlIE7DusOxZXotTWFydMOtbmV6LCBQaEQKU2VuaW9yIFJl
c2VhcmNoZXIgICBlbWFpbDogam9zZS5udW5lekBjdHRjLmNhdApDT01ORVQgRGl2aXNpb24gICAg
IFdlYjogaHR0cDovL25ldHdvcmtzLmN0dGMuY2F0CgpDZW50cmUgVGVjbm9sw7JnaWMgZGUgVGVs
ZWNvbXVuaWNhY2lvbnMgZGUgQ2F0YWx1bnlhIChDVFRDKQpQYXJjIE1lZGl0ZXJyYW5pIGRlIGxh
IFRlY25vbG9naWEKQXYuIENhcmwgRnJpZWRyaWNoIEdhdXNzLCA3ICAgICAgICAgICAgICAgIFBo
LjorMzQgOTM2NDUyOTI3CjA4ODYwIENhc3RlbGxkZWZlbHMgLSBCYXJjZWxvbmEgICAgICAgICAg
ICBGYXg6ICszNCA5MzY0NTI5MDEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
