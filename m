Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x22b.google.com ([2a00:1450:400c:c00::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YvlZA-00050r-2r
 for ath10k@lists.infradead.org; Fri, 22 May 2015 11:56:41 +0000
Received: by wgez8 with SMTP id z8so15621213wge.0
 for <ath10k@lists.infradead.org>; Fri, 22 May 2015 04:56:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87zj4w4zdz.fsf@kamboji.qca.qualcomm.com>
References: <CA+BoTQ=V1psOoaL1WG7vSUjSLhPnQqBUODjeB3NyWt-pMtmNFA@mail.gmail.com>
 <1432282693-4553-1-git-send-email-michal.kazior@tieto.com>
 <87zj4w4zdz.fsf@kamboji.qca.qualcomm.com>
Date: Fri, 22 May 2015 13:56:18 +0200
Message-ID: <CA+BoTQkNO3oD36GFWVvG3TuAu1nKqTrW_54Z-V9de0Lt7jE8hA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] ath10k: handle cycle counter wraparound
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

T24gMjIgTWF5IDIwMTUgYXQgMTM6MzYsIEthbGxlIFZhbG8gPGt2YWxvQHFjYS5xdWFsY29tbS5j
b20+IHdyb3RlOgo+IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGlldG8uY29tPiB3cml0
ZXM6Cj4KPj4gV2hlbiBRQ0E5ODhYIGN5Y2xlIGNvdW50ZXIgSFcgcmVnaXN0ZXIgd3JhcHMKPj4g
YXJvdW5kIGl0IHJlc2V0cyB0byAweDdmZmZmZmZmIGluc3RlYWQgb2YgMC4gQWxsCj4+IG90aGVy
IGN5Y2xlIGNvdW50ZXIgcmVsYXRlZCByZWdpc3RlcnMgYXJlIGRpdmlkZWQKPj4gYnkgMiBzbyB0
aGV5IG5ldmVyIHdyYXBhcm91bmQgdGhlbXNlbHZlcy4gUUNBNjFYNAo+PiBoYXMgYSB1bmlmb3Jt
IENDIGFuZCBpdCB3cmFwYXJvdW5kcyBpbiBhIHJlZ3VsYXIKPj4gZmFzaGlvbiB0aG91Z2guCj4+
Cj4+IFdvcnN0IGNhc2Ugd3JhcGFyb3VuZCB0aW1lIGlzIGFwcHJveCAyNCBzZWNvbmRzCj4+ICgy
KiozMSAvIDg4TUh6KS4gU2luY2Ugc2NhbiBjaGFubmVsIHZpc2l0IHRpbWVzCj4+IGFyZSBtYXgg
NSBzZWNvbmRzIChvZmZjaGFubmVsIGNhc2UpIGl0IGlzCj4+IGd1YXJhbnRlZWQgdGhlcmUncyBi
ZWVuIGF0IG1vc3QgMSB3cmFwYXJvdW5kIGFuZAo+PiBpdCBpcyBwb3NzaWJsZSB0byBjb21wdXRl
IHN1cnZleSBkYXRhLgo+Pgo+PiBUaGlzIGZpeGVzIHNvbWUgb2NjYXNpb25hbCBpbmNvcnJlY3Qg
c3VydmV5IGRhdGEKPj4gb24gUUNBOTg4WCBhcyBzb21lIGNoYW5uZWxzIChkZXBlbmRpbmcgb24g
aG93L3doZW4KPj4gc2Nhbi9vZmZjaGFubmVsIHJlcXVlc3RzIHdlcmUgcmVxdWVzdGVkKSB3b3Vs
ZAo+PiBoYXZlIGFwcHJveCAyNCBzZWMgYWN0aXZlIHRpbWUgd2hpY2ggd2Fzbid0Cj4+IGFjdHVh
bGx5IHRoZSBjYXNlLgo+Pgo+PiBUaGlzIHNob3VsZCBoZWxwIG1ha2UgaG9zdGFwZCBBQ1MgbW9y
ZSByZWxpYWJsZS4KPj4KPj4gUmVwb3J0ZWQtYnk6IFNyaW5pdmFzYSBEdXZ2dXJpIDxzZHV2dnVy
aUBjaHJvbWl1bS5vcmc+Cj4+IFNpZ25lZC1vZmYtYnk6IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5r
YXppb3JAdGlldG8uY29tPgo+Cj4gWy4uLl0KPgo+PiArdm9pZCBhdGgxMGtfY29yZV9nZXRfY2Nf
ZGVsdGEoc3RydWN0IGF0aDEwayAqYXIsCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICB1
MzIgKmNjX2RlbHRhLCB1MzIgKnJjY19kZWx0YSwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHUzMiBjYywgdTMyIHJjYywKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIHUzMiBj
Y19wcmV2LCB1MzIgcmNjX3ByZXYpCj4+ICt7Cj4+ICsgICAgIGlmIChhci0+aHdfcGFyYW1zLmhh
c19zaGlmdGVkX2NjX3dyYXBhcm91bmQgJiYgY2MgPCBjY19wcmV2KSB7Cj4+ICsgICAgICAgICAg
ICAgY2NfcHJldiAtPSAweDdmZmZmZmZmOwo+PiArICAgICAgICAgICAgIHJjYyAqPSAyOwo+PiAr
ICAgICB9Cj4+ICsKPj4gKyAgICAgKmNjX2RlbHRhID0gY2MgLSBjY19wcmV2Owo+PiArICAgICAq
cmNjX2RlbHRhID0gcmNjIC0gcmNjX3ByZXY7Cj4+ICt9Cj4KPiBXaHkgZG8geW91IGhhdmUgdGhp
cyBmdW5jdGlvbiBpbiBjb3JlLmM/IFdoeSBub3QgaW4gd21pLmM/CgpJIGRvbid0IGNvbnNpZGVy
IHRoaXMgYSBwYXJ0IG9mIFdNSSBwcm90b2NvbCBwZXIgc2UuIEl0J3MgYSBsb2dpYwp3aGljaCBo
YXBwZW5zIHRvIGJlIHVzZWQgd2l0aCB2YWx1ZXMgZGVsaXZlcmVkIHZpYSBXTUkgYnV0IGlzIGNo
aXAKc3BlY2lmaWMgb3RoZXJ3aXNlLiBGb3Igd2hhdCBpdCdzIHdvcnRoIHdlIGNvdWxkIGJlIHJl
YWRpbmcgQ0MKcmVnaXN0ZXJzLCBlLmcuIGRpcmVjdGx5IHZpYSBNTUlPLgoKCk1pY2hhxYIKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWls
aW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
