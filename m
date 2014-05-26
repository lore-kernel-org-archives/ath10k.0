Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x234.google.com ([2a00:1450:400c:c00::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WonbQ-0007BB-8L
 for ath10k@lists.infradead.org; Mon, 26 May 2014 05:37:41 +0000
Received: by mail-wg0-f52.google.com with SMTP id l18so7348970wgh.23
 for <ath10k@lists.infradead.org>; Sun, 25 May 2014 22:37:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87fvjytht6.fsf@kamboji.qca.qualcomm.com>
References: <1400158139-13836-1-git-send-email-michal.kazior@tieto.com>
 <1400158139-13836-3-git-send-email-michal.kazior@tieto.com>
 <87fvjytht6.fsf@kamboji.qca.qualcomm.com>
Date: Mon, 26 May 2014 07:37:13 +0200
Message-ID: <CA+BoTQkfZbzy62xZV0tcPw1xu8B-rioVVags3z+DJMGxMB-jFQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] ath10k: revert incomplete scatter-gather pci tx
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Avery Pennarun <apenwarr@gmail.com>

T24gMjUgTWF5IDIwMTQgMDk6NTMsIEthbGxlIFZhbG8gPGt2YWxvQHFjYS5xdWFsY29tbS5jb20+
IHdyb3RlOgo+IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGlldG8uY29tPiB3cml0ZXM6
Cj4KPj4gVGhpcyBwcmV2ZW50cyBsZWF2aW5nIGluY29tcGxldGUgc2NhdHRlci1nYXRoZXIKPj4g
dHJhbnNmZXIgb24gQ0UgcmluZ3Mgd2hpY2ggY2FuIGxlYWQgZmlybXdhcmUgdG8KPj4gY3Jhc2gu
Cj4+Cj4+IFJlcG9ydGVkLUJ5OiBBdmVyeSBQZW5uYXJ1biA8YXBlbndhcnJAZ21haWwuY29tPgo+
PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWwgS2F6aW9yIDxtaWNoYWwua2F6aW9yQHRpZXRvLmNvbT4K
Pgo+IFRoZSB0aXRsZSBpcyBhIGJpdCBtaXNsZWFkaW5nIGFzIHVzdWFsbHkgdGhlIGNvbW1pdCBs
b2cgd2l0aCB0aGUgd29yZAo+IHJldmVydCBtZWFucyB0aGF0IHRoZSBjb21taXQgaXMgcmV2ZXJ0
aW5nIGFub3RoZXIgZ2l0IGNvbW1pdC4gTWF5YmUKPiBzb21ldGhpbmcgbGlrZSB0aGlzIGlzIGJl
dHRlcjoKPgo+IGF0aDEwazogZHJvcCBpbmNvbXBsZXRlIHNjYXR0ZXItZ2F0aGVyIHBjaSB0eCB0
cmFuc2ZlcnMKCkdvb2QgcG9pbnQuIEkgd2FzIGFjdHVhbGx5IHRoaW5raW5nICdhYm9ydCcgLi4g
J3Byb3Blcmx5Jy4KCgo+PiArICAgICBpZiAoV0FSTl9PTihzcmNfcmluZy0+d3JpdGVfaW5kZXgg
PT0gc3JjX3JpbmctPnN3X2luZGV4KSkKPj4gKyAgICAgICAgICAgICByZXR1cm47Cj4+ICsKPj4g
KyAgICAgaWYgKFdBUk5fT04oc3JjX3JpbmctPndyaXRlX2luZGV4ID09Cj4+ICsgICAgICAgICAg
ICAgICAgIGF0aDEwa19jZV9zcmNfcmluZ193cml0ZV9pbmRleF9nZXQoYXIsIGN0cmxfYWRkcikp
KQo+PiArICAgICAgICAgICAgIHJldHVybjsKPgo+IFdBUk5fT04oKSBvbiBkYXRhIHBhdGggaXMg
ZGFuZ2Vyb3VzLiBXQVJOX09OX09OQ0UoKSBvciBhdGgxMGtfd2FybigpIGlzCj4gYmV0dGVyLgoK
R29vZCBwb2ludCEKCgo+PiArZXJyOgo+PiArICAgICBmb3IgKDsgaSA+IDA7IGktLSkKPgo+IElz
bid0IHRoaXMganVzdCBhIGZhbmN5IHdheSB0byBzYXkgJ3doaWxlIChpLS0gPiAwKSc/CgpOb3Qg
cmVhbGx5LiBNb3JlIGxpa2UgZG8geyAuLiB9IHdoaWxlICgtLWkgPiAwKSwgbm8/IEZpcnN0IGl0
ZXJhdGlvbgptdXN0IHVzZSB1bm1vZGlmaWVkIGBpYC4KCgpNaWNoYcWCCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0
aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vYXRoMTBrCg==
