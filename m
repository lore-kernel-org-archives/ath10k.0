Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-bk0-x22c.google.com ([2a00:1450:4008:c01::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V08YA-0004be-6O
 for ath10k@lists.infradead.org; Fri, 19 Jul 2013 11:08:38 +0000
Received: by mail-bk0-f44.google.com with SMTP id 6so1597692bkj.31
 for <ath10k@lists.infradead.org>; Fri, 19 Jul 2013 04:08:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <8761w64xr0.fsf@kamboji.qca.qualcomm.com>
References: <1374129193-3533-1-git-send-email-michal.kazior@tieto.com>
 <1374129193-3533-2-git-send-email-michal.kazior@tieto.com>
 <8761w64xr0.fsf@kamboji.qca.qualcomm.com>
Date: Fri, 19 Jul 2013 13:08:12 +0200
Message-ID: <CA+BoTQkD7U4KY5xq7YhTWz-qFP2f3NuQ=nHDZ2LgYaq+5M3pjg@mail.gmail.com>
Subject: Re: [PATCH 1/3] ath10k: prevent HTC from being used after stopping
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

T24gMTkgSnVseSAyMDEzIDEzOjA0LCBLYWxsZSBWYWxvIDxrdmFsb0BxY2EucXVhbGNvbW0uY29t
PiB3cm90ZToKPiBNaWNoYWwgS2F6aW9yIDxtaWNoYWwua2F6aW9yQHRpZXRvLmNvbT4gd3JpdGVz
Ogo+Cj4+IEl0IHdhcyBwb3NzaWJsZSB0byBzdWJtaXQgbmV3IEhUQyBjb21tYW5kcwo+PiBhZnRl
ci93aGlsZSBIVEMgc3RvcHBlZC4gVGhpcyBsZWQgdG8gbWVtb3J5Cj4+IGNvcnJ1cHRpb24gaW4g
c29tZSByYXJlIGNhc2VzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWwgS2F6aW9yIDxtaWNo
YWwua2F6aW9yQHRpZXRvLmNvbT4KPgo+IFsuLi5dCj4KPj4gQEAgLTk1Nyw3ICs5NTUsNiBAQCB2
b2lkIGF0aDEwa19odGNfc3RvcChzdHJ1Y3QgYXRoMTBrX2h0YyAqaHRjKQo+PiAgICAgICB9Cj4+
Cj4+ICAgICAgIGF0aDEwa19oaWZfc3RvcChodGMtPmFyKTsKPj4gLSAgICAgYXRoMTBrX2h0Y19y
ZXNldF9lbmRwb2ludF9zdGF0ZXMoaHRjKTsKPj4gIH0KPgo+IElzIHRoaXMgb24gcHVycG9zZT8g
SSBjYW4ndCBmaXQgaXQgdG8gdGhlIGRlc2NyaXB0aW9uLgoKWW91J3JlIHJpZ2h0LiBJIHNob3Vs
ZCd2ZSBtZW50aW9uZWQgdGhhdCBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuCgpUaGlzIGxpbmUgaXMg
c2ltcGx5IHVubmVjZXNzYXJ5LiBEbyB5b3UgcHJlZmVyIGZpeGluZyB0aGUgY29tbWl0Cm1lc3Nh
Z2UgYWNjb3JkaW5nbHkgb3Igc2hvdWxkIEkgcG9zdCBpdCBhcyBhIHNlcGFyYXRlIHBhdGNoPwoK
ClBvemRyYXdpYW0gLyBCZXN0IHJlZ2FyZHMsCk1pY2hhxYIgS2F6aW9yLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAph
dGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2F0aDEwawo=
