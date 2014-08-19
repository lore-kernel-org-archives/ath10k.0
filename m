Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x233.google.com ([2a00:1450:400c:c00::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XJiZ3-0001rk-4J
 for ath10k@lists.infradead.org; Tue, 19 Aug 2014 12:31:01 +0000
Received: by mail-wg0-f51.google.com with SMTP id b13so6364027wgh.22
 for <ath10k@lists.infradead.org>; Tue, 19 Aug 2014 05:30:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87a977o450.fsf@kamboji.qca.qualcomm.com>
References: <1407402260-29854-1-git-send-email-michal.kazior@tieto.com>
 <1407402260-29854-5-git-send-email-michal.kazior@tieto.com>
 <87a977o450.fsf@kamboji.qca.qualcomm.com>
Date: Tue, 19 Aug 2014 14:30:39 +0200
Message-ID: <CA+BoTQmgcBKfNKrAH5jKsehemx7rTxHHXMr8Qf+ctgfZpVj0Dg@mail.gmail.com>
Subject: Re: [PATCH 4/5] ath10k: split ce irq/handler setup
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

T24gMTQgQXVndXN0IDIwMTQgMTA6NDAsIEthbGxlIFZhbG8gPGt2YWxvQHFjYS5xdWFsY29tbS5j
b20+IHdyb3RlOgo+IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGlldG8uY29tPiB3cml0
ZXM6Cj4KPj4gSXQgZG9lc24ndCBtYWtlIG11Y2ggc2Vuc2UgdG8gb3ZlcndyaXRlIHNlbmRfY2IK
Pj4gYW5kIHJlY3ZfY2IgY2FsbGJhY2tzIG92ZXIgYW5kIG92ZXIgYWdhaW4gd2hlbmV2ZXIKPj4g
dHJhbnNwb3J0IHN0YXJ0cy4gSnVzdCBtYWtlIHN1cmUgdG8gdW5tYXNrIGNvcHkKPj4gZW5naW5l
IGludGVycnVwdHMgd2hlbiBzdGFydGluZy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIEth
emlvciA8bWljaGFsLmthemlvckB0aWV0by5jb20+Cj4KPiBUaGUgcGF0Y2ggbG9va3MsIGp1c3Qg
YSBmb2xsb3d1cCBxdWVzdGlvbiBmb3IgdGhlIGZ1dHVyZToKPgo+PiBAQCAtMTY3NCw3ICsxNjM5
LDkgQEAgc3RhdGljIGludCBhdGgxMGtfcGNpX2NlX2luaXQoc3RydWN0IGF0aDEwayAqYXIpCj4+
ICAgICAgICAgICAgICAgcGlwZV9pbmZvLT5oaWZfY2Vfc3RhdGUgPSBhcjsKPj4gICAgICAgICAg
ICAgICBhdHRyID0gJmhvc3RfY2VfY29uZmlnX3dsYW5bcGlwZV9udW1dOwo+Pgo+PiAtICAgICAg
ICAgICAgIHJldCA9IGF0aDEwa19jZV9pbml0X3BpcGUoYXIsIHBpcGVfbnVtLCBhdHRyKTsKPj4g
KyAgICAgICAgICAgICByZXQgPSBhdGgxMGtfY2VfaW5pdF9waXBlKGFyLCBwaXBlX251bSwgYXR0
ciwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGF0aDEwa19wY2lf
Y2Vfc2VuZF9kb25lLAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
YXRoMTBrX3BjaV9jZV9yZWN2X2RhdGEpOwo+Cj4gQXMgd2UgY2FsbCBhdGgxMGtfY2VfaW5pdF9w
aXBlKCkgb25seSBvbmNlIGFuZCBzZWVtIHRvIGhhdmUgb25seSBvbmUgc2V0Cj4gb2YgZnVuY3Rp
b25zLCB3aHkgZXZlbiBib3RoZXIgYm90aGVyIHdpdGggZnVuY3Rpb24gcG9pbnRlcnM/IFdoYXQg
aWYgd2UKPiBqdXN0IGNhbGwgdGhlIGZ1bmN0aW9ucyBkaXJlY3RseT8KClllYWgsIHdlIGNhbiBy
ZW1vdmUgdGhpcyBhYnN0cmFjdGlvbiBsYXRlci4gSSBkb24ndCB0aGVyZSdzIGFueXRoaW5nCmRl
cGVuZGluZyBvbiBpdCBhbnltb3JlLgoKCk1pY2hhxYIKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hdGgxMGsK
