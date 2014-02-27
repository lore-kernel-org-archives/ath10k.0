Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ea0-x22f.google.com ([2a00:1450:4013:c01::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WIupF-0002V8-Hf
 for ath10k@lists.infradead.org; Thu, 27 Feb 2014 06:52:10 +0000
Received: by mail-ea0-f175.google.com with SMTP id z10so1529120ead.34
 for <ath10k@lists.infradead.org>; Wed, 26 Feb 2014 22:51:45 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <530E7AF2.1080908@candelatech.com>
References: <530E7AF2.1080908@candelatech.com>
Date: Thu, 27 Feb 2014 07:51:45 +0100
Message-ID: <CA+BoTQmr6+9wJ87pOmzPEBwPCMG5emfkfcUmzxXpH6gVPW+zFw@mail.gmail.com>
Subject: Re: Need to get msdu-chaining working.
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k <ath10k@lists.infradead.org>

T24gMjcgRmVicnVhcnkgMjAxNCAwMDozOCwgQmVuIEdyZWVhciA8Z3JlZWFyYkBjYW5kZWxhdGVj
aC5jb20+IHdyb3RlOgo+Cj4gSSdtIHVzaW5nIHJhdy1yeCBtb2RlIGluIG15IGZpcm13YXJlLCBh
bmQgaXQncyB0aHJvdWdocHV0IGlzCj4gZXh0cmVtZWx5IHBvb3IgYXQgaGlnaGVyIHNwZWVkcy4g
IEkgc2VlIGxhcmdlIG51bWJlcnMgb2Ygd2FybmluZ3MKPiBhYm91dCBtc2R1X2NoYWluaW5nLCBz
byBJIHN1c3BlY3QgdGhpcyBtYXkgYmUgdGhlIHJlYXNvbi4KCkkgYXNzdW1lIHRoaXMgcmVxdWly
ZXMgeW91ciBjdXN0b20gRlc/CgoKPiBEb2VzIGFueW9uZSBoYXZlIGFueSBzdWdnZXN0aW9ucyBm
b3Igd2hhdCBuZWVkcyB0byBiZSBkb25lCj4gdG8gaGFuZGxlIHRoZXNlIHNvcnRzIG9mIGZyYW1l
cyBwcm9wZXJseT8KPgo+ICAgICAgICAgICAgICAgICAgICAgICAgIC8qIEZJWE1FOiB3ZSBkbyBu
b3Qgc3VwcG9ydCBjaGFpbmluZyB5ZXQuCj4gICAgICAgICAgICAgICAgICAgICAgICAgICogdGhp
cyBuZWVkcyBpbnZlc3RpZ2F0aW9uICovCj4gICAgICAgICAgICAgICAgICAgICAgICAgaWYgKG1z
ZHVfY2hhaW5pbmcpIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGF0aDEwa193
YXJuKCJodHQgcnggbXNkdV9jaGFpbmluZyBpcyB0cnVlXG4iKTsKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGF0aDEwa19odHRfcnhfZnJlZV9tc2R1X2NoYWluKG1zZHVfaGVhZCk7
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiAgICAgICAgICAg
ICAgICAgICAgICAgICB9CgpGcm9tIHdoYXQgSSB1bmRlcnN0YW5kIGNoYWluZWQgbXNkdSBpcyBh
IG1zZHUgdGhhdCBoYXNuJ3QgZml0IGludG8gdGhlCnJ4IGJ1ZmZlciBhbmQgaXMgc3BsaXQgYWNy
b3NzIHRoZSBwb3BwZWQgYW1zZHUgbGlzdC4gSSBzdXNwZWN0IG9ubHkKdGhlIGZpcnN0IG1zZHUg
aW4gY2hhaW4gaGFzIHRoZSBodHRfcnhfZGVzYyBhbmQgYWxsIG90aGVyIGhhdmUgbm90Cih0aGlz
IGlzIHdoYXQgdGhlIGN1cnJlbnQgY29kZSBkb2VzLCBidXQgeW91J2xsIG5lZWQgdG8gdmVyaWZ5
IHRoYXQpLgoKSSB3b3VsZCB0cnkgdG8gY29uY2F0ZW5hdGUgYWxsIG1zZHVzIGludG8gb25lIChs
b3RzIG9mIG1lbWNweSA6KCApIG9yCmluY3JlYXNlIHRoZSBIVFRfUlhfQlVGX1NJWkUgc28gdGhh
dCBBLU1TRFUgZnJhbWVzIGNhbiBmaXQgaW50byBhCnNpbmdsZSBidWZmZXIgKGhvcGVmdWxseSBG
Vy9IVyBpcyBjYXBhYmxlIG9mIGRvaW5nIHRoYXQpLgoKCk1pY2hhxYIKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRo
MTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hdGgxMGsK
