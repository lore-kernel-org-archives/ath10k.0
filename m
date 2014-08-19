Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x22d.google.com ([2a00:1450:400c:c00::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XJfs8-0002uA-PQ
 for ath10k@lists.infradead.org; Tue, 19 Aug 2014 09:38:33 +0000
Received: by mail-wg0-f45.google.com with SMTP id x12so6059071wgg.28
 for <ath10k@lists.infradead.org>; Tue, 19 Aug 2014 02:38:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20140819082316.16842.85085.stgit@potku.adurom.net>
References: <20140819082038.16842.46876.stgit@potku.adurom.net>
 <20140819082316.16842.85085.stgit@potku.adurom.net>
Date: Tue, 19 Aug 2014 11:38:10 +0200
Message-ID: <CA+BoTQk5pm9GoS41YGtE7VPdsNiuX294KgiR5aXH0WWBPVq4SA@mail.gmail.com>
Subject: Re: [PATCH v7 5/8] ath10k: dump exception stack contents on firmware
 crash
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

T24gMTkgQXVndXN0IDIwMTQgMTA6MjMsIEthbGxlIFZhbG8gPGt2YWxvQHFjYS5xdWFsY29tbS5j
b20+IHdyb3RlOgo+IEZyb206IEJlbiBHcmVlYXIgPGdyZWVhcmJAY2FuZGVsYXRlY2guY29tPgo+
Cj4gRmlybXdhcmUgZGV2ZWxvcGVycyBjYW4gZGVjb2RlIHRoaXMgYW5kIG1heWJlIGZpZ3VyZSBv
dXQKPiB3aHkgdGhlIGZpcm13YXJlIGNyYXNoZWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBCZW4gR3Jl
ZWFyIDxncmVlYXJiQGNhbmRlbGF0ZWNoLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBLYWxsZSBWYWxv
IDxrdmFsb0BxY2EucXVhbGNvbW0uY29tPgo+IC0tLQpbLi4uXQo+ICsvKiBTYXZlIHRoZSBmaXJt
d2FyZSBleGNlcHRpb24gc3RhY2sgKi8KPiArc3RhdGljIHZvaWQgYXRoMTBrX3BjaV9kdW1wX2V4
Y19zdGFjayhzdHJ1Y3QgYXRoMTBrICphciwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHN0cnVjdCBhdGgxMGtfZndfY3Jhc2hfZGF0YSAqY3Jhc2hfZGF0YSkKPiArewo+
ICsgICAgICAgbG9ja2RlcF9hc3NlcnRfaGVsZCgmYXItPmRhdGFfbG9jayk7Cj4gKwo+ICsgICAg
ICAgQlVJTERfQlVHX09OKEFUSDEwS19GV19TVEFDS19TSVpFICUgNCk7Cj4gKwo+ICsgICAgICAg
YXRoMTBrX3BjaV9kaWFnX3JlYWRfaGkoYXIsIGNyYXNoX2RhdGEtPmV4Y19zdGFja19idWYsCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBoaV9lcnJfc3RhY2ssIEFUSDEwS19GV19T
VEFDS19TSVpFKTsKCkN1cnJlbnQgbWFzdGVyIHRyZWUgcGVyZm9ybXMgYW4gaW1wbGljaXQgYnl0
ZSBzd2FwIHNvIHRoZSBzdGFjayByZWFkCmZyb20gdGFyZ2V0IHdpbGwgYmUgaW4gaG9zdCBlbmRp
YW5lc3MuIElPVyBvbiBiaWctZW5kaWFuIGhvc3QgeW91J2xsCm1lc3NlZCB1cCBkYXRhIGFuZCB0
aGVyZSdzIG5vIGluZGljYXRpb24gb2YgZW5kaWFuZXNzIGFueW1vcmUuCgoKTWljaGHFggoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxp
bmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
