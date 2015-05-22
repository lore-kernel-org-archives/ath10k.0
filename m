Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x22d.google.com ([2a00:1450:400c:c00::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yvlcq-0006d2-Kq
 for ath10k@lists.infradead.org; Fri, 22 May 2015 12:00:29 +0000
Received: by wgbgq6 with SMTP id gq6so15606456wgb.3
 for <ath10k@lists.infradead.org>; Fri, 22 May 2015 05:00:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQkNO3oD36GFWVvG3TuAu1nKqTrW_54Z-V9de0Lt7jE8hA@mail.gmail.com>
References: <CA+BoTQ=V1psOoaL1WG7vSUjSLhPnQqBUODjeB3NyWt-pMtmNFA@mail.gmail.com>
 <1432282693-4553-1-git-send-email-michal.kazior@tieto.com>
 <87zj4w4zdz.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQkNO3oD36GFWVvG3TuAu1nKqTrW_54Z-V9de0Lt7jE8hA@mail.gmail.com>
Date: Fri, 22 May 2015 14:00:05 +0200
Message-ID: <CA+BoTQ=xNbcQv+FVZWUAki5f0zQ_F0hTW3V6FkTp-DzQOr-FFA@mail.gmail.com>
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

T24gMjIgTWF5IDIwMTUgYXQgMTM6NTYsIE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGll
dG8uY29tPiB3cm90ZToKPiBPbiAyMiBNYXkgMjAxNSBhdCAxMzozNiwgS2FsbGUgVmFsbyA8a3Zh
bG9AcWNhLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4+IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXpp
b3JAdGlldG8uY29tPiB3cml0ZXM6ClsuLi5dCj4+PiArdm9pZCBhdGgxMGtfY29yZV9nZXRfY2Nf
ZGVsdGEoc3RydWN0IGF0aDEwayAqYXIsCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
dTMyICpjY19kZWx0YSwgdTMyICpyY2NfZGVsdGEsCj4+PiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdTMyIGNjLCB1MzIgcmNjLAo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIHUz
MiBjY19wcmV2LCB1MzIgcmNjX3ByZXYpCj4+PiArewo+Pj4gKyAgICAgaWYgKGFyLT5od19wYXJh
bXMuaGFzX3NoaWZ0ZWRfY2Nfd3JhcGFyb3VuZCAmJiBjYyA8IGNjX3ByZXYpIHsKPj4+ICsgICAg
ICAgICAgICAgY2NfcHJldiAtPSAweDdmZmZmZmZmOwo+Pj4gKyAgICAgICAgICAgICByY2MgKj0g
MjsKPj4+ICsgICAgIH0KPj4+ICsKPj4+ICsgICAgICpjY19kZWx0YSA9IGNjIC0gY2NfcHJldjsK
Pj4+ICsgICAgICpyY2NfZGVsdGEgPSByY2MgLSByY2NfcHJldjsKPj4+ICt9Cj4+Cj4+IFdoeSBk
byB5b3UgaGF2ZSB0aGlzIGZ1bmN0aW9uIGluIGNvcmUuYz8gV2h5IG5vdCBpbiB3bWkuYz8KPgo+
IEkgZG9uJ3QgY29uc2lkZXIgdGhpcyBhIHBhcnQgb2YgV01JIHByb3RvY29sIHBlciBzZS4gSXQn
cyBhIGxvZ2ljCj4gd2hpY2ggaGFwcGVucyB0byBiZSB1c2VkIHdpdGggdmFsdWVzIGRlbGl2ZXJl
ZCB2aWEgV01JIGJ1dCBpcyBjaGlwCj4gc3BlY2lmaWMgb3RoZXJ3aXNlLiBGb3Igd2hhdCBpdCdz
IHdvcnRoIHdlIGNvdWxkIGJlIHJlYWRpbmcgQ0MKPiByZWdpc3RlcnMsIGUuZy4gZGlyZWN0bHkg
dmlhIE1NSU8uCgpOb3cgdGhhdCBJIHRoaW5rIGFib3V0IGl0IHRoaXMgd291bGQgZml0IGludG8g
aHcuYyBhcyB3ZWxsLgoKCk1pY2hhxYIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
