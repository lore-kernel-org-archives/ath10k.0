Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-bk0-x22a.google.com ([2a00:1450:4008:c01::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V970a-0005fy-6c
 for ath10k@lists.infradead.org; Tue, 13 Aug 2013 05:19:04 +0000
Received: by mail-bk0-f42.google.com with SMTP id my10so2159690bkb.1
 for <ath10k@lists.infradead.org>; Mon, 12 Aug 2013 22:18:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <878v07t0up.fsf@kamboji.qca.qualcomm.com>
References: <1375949813-10969-1-git-send-email-michal.kazior@tieto.com>
 <1375949813-10969-4-git-send-email-michal.kazior@tieto.com>
 <878v07t0up.fsf@kamboji.qca.qualcomm.com>
Date: Tue, 13 Aug 2013 07:18:42 +0200
Message-ID: <CA+BoTQnC=oA0MEkHo8qqcxDY6nLUSFf11VcFk+81OG7+iY_Cyg@mail.gmail.com>
Subject: Re: [PATCH 3/4] ath10k: implement 802.3 SNAP rx decap type A-MSDU
 handling
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

T24gMTIgQXVndXN0IDIwMTMgMTY6NTUsIEthbGxlIFZhbG8gPGt2YWxvQHFjYS5xdWFsY29tbS5j
b20+IHdyb3RlOgo+IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGlldG8uY29tPiB3cml0
ZXM6Cj4KPj4gVGhpcyBlbmFibGVzIGRyaXZlciB0byByeCBhbm90aGVyIGRlY2FwcGVkIGEtbXNk
dQo+PiBmcmFtZXMuIEl0IHNob3VsZCBwb3NzaWJseSBoZWxwIHdpdGggdGhyb3VnaHB1dHMKPj4g
aW4gc29tZSBjYXNlcyBhbmQgcmVkdWNlIChvciBlbGltaW5hdGUpIG51bWJlciBvZgo+PiBtZXNz
YWdlcyBsaWtlIHRoaXM6Cj4+Cj4+ICAgYXRoMTBrOiBlcnJvciBwcm9jZXNzaW5nIG1zZHVzIC01
MjQKPj4KPj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIEthemlvciA8bWljaGFsLmthemlvckB0aWV0
by5jb20+Cj4KPiBbLi4uXQo+Cj4+IEBAIC02NTksNiArNjU4LDE1IEBAIHN0YXRpYyBpbnQgYXRo
MTBrX2h0dF9yeF9hbXNkdShzdHJ1Y3QgYXRoMTBrX2h0dCAqaHR0LAo+PiAgICAgICAgICAgICAg
ICAgICAgICAgZGVjYXBfaGRyICs9IHJvdW5kdXAoY3J5cHRvX2xlbiwgNCk7Cj4+ICAgICAgICAg
ICAgICAgfQo+Pgo+PiArICAgICAgICAgICAgIGlmIChmbXQgPT0gUlhfTVNEVV9ERUNBUF84MDIz
X1NOQVBfTExDKSB7Cj4+ICsgICAgICAgICAgICAgICAgICAgICAvKiBTTkFQIDgwMi4zIGNvbnNp
c3RzIG9mOgo+PiArICAgICAgICAgICAgICAgICAgICAgICogW2RzdDo2XVtzcmM6Nl1bbGVuOjJd
W2RzYXA6MV1bc3NhcDoxXVtjdGw6MV1bc25hcDo1XQo+PiArICAgICAgICAgICAgICAgICAgICAg
ICogW2RhdGFdW2Zjczo0XS4KPj4gKyAgICAgICAgICAgICAgICAgICAgICAqCj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgKiBTaW5jZSB0aGlzIG92ZXJsYXBzIHdpdGggQS1NU0RVIGhlYWRlciAo
ZGEsIHNhLCBsZW4pCj4+ICsgICAgICAgICAgICAgICAgICAgICAgKiB0aGVyZSdzIG5vdGhpbmcg
ZXh0cmEgdG8gZG8uICovCj4+ICsgICAgICAgICAgICAgfQo+Cj4gVGhpcyBibG9jayBkb2Vzbid0
IGhhdmUgYW55IGNvZGUsIGlzIHRoYXQgb24gcHVycG9zZT8gTW9zdCBsaWtlbHkgYQo+IHN0YXRp
YyBjaGVja2VyIGZpbmRzIHRoaXMgbGF0ZXIgYW5kIHdlIG5lZWQgdG8gcmVtb3ZlIGl0Lgo+Cj4g
SWYgeW91ciBpZGVhIGlzIHRvIGRvY3VtZW50IHRoZSBMTEMgY2FzZSAod2hpY2ggaXMgdmVyeSBn
b29kISkgaXQncwo+IGJldHRlciB0byBkbyBldmVyeXRoaW5nIGluc2lkZSBhIGNvbW1lbnQsIGZv
ciBleGFtcGxlIGxpa2UgdGhpczoKPgo+ICAgICAgICAgLyogV2hlbiBmbXQgPT0gUlhfTVNEVV9E
RUNBUF84MDIzX1NOQVBfTExDOgo+ICAgICAgICAgICoKPiAgICAgICAgICAqIFNOQVAgODAyLjMg
Y29uc2lzdHMgb2Y6Cj4gICAgICAgICAgKiBbZHN0OjZdW3NyYzo2XVtsZW46Ml1bZHNhcDoxXVtz
c2FwOjFdW2N0bDoxXVtzbmFwOjVdCj4gICAgICAgICAgKiBbZGF0YV1bZmNzOjRdLgo+ICAgICAg
ICAgICoKPiAgICAgICAgICAqIFNpbmNlIHRoaXMgb3ZlcmxhcHMgd2l0aCBBLU1TRFUgaGVhZGVy
IChkYSwgc2EsIGxlbikKPiAgICAgICAgICAqIHRoZXJlJ3Mgbm90aGluZyBleHRyYSB0byBkby4g
Ki8KClllcywgaXQncyBvbiBwdXJwb3NlLiBJJ2xsIG1ha2UgYSBjb21tZW50IG91dCBvZiBpdCB0
aGVuLgoKClBvemRyYXdpYW0gLyBCZXN0IHJlZ2FyZHMsCk1pY2hhxYIgS2F6aW9yLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcg
bGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
