Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22c.google.com ([2a00:1450:400c:c05::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XZfdY-0008Lw-7A
 for ath10k@lists.infradead.org; Thu, 02 Oct 2014 12:37:36 +0000
Received: by mail-wi0-f172.google.com with SMTP id n3so3812195wiv.5
 for <ath10k@lists.infradead.org>; Thu, 02 Oct 2014 05:37:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1412251934-7011-2-git-send-email-rmanohar@qti.qualcomm.com>
References: <1412251934-7011-1-git-send-email-rmanohar@qti.qualcomm.com>
 <1412251934-7011-2-git-send-email-rmanohar@qti.qualcomm.com>
Date: Thu, 2 Oct 2014 14:37:13 +0200
Message-ID: <CA+BoTQ=QEnDhW_Kb-dCO--67LAFNL37g4JSDuET84FFPLHpz8w@mail.gmail.com>
Subject: Re: [PATCH 1/4] ath10k: Add support to configure pktlog filter
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
To: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMiBPY3RvYmVyIDIwMTQgMTQ6MTIsIFJhamt1bWFyIE1hbm9oYXJhbiA8cm1hbm9oYXJAcXRp
LnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4gQWRkIHN1cHBvcnQgdG8gY29uZmlndXJlIHBhY2tldCBs
b2cgZmlsdGVycyAodHgsIHJ4LCByYXRlIGNvbnRyb2wpCj4gdmlhIGRlYnVnZnMuIFRvIGRpc2Fi
bGUgaHR0IHBrdGxvZyBldmVudHMgc2V0IHRoZSBmaWx0ZXJzIHRvIDAuClsuLi5dCj4gK3N0YXRp
YyBzc2l6ZV90IGF0aDEwa193cml0ZV9wa3Rsb2dfZmlsdGVyKHN0cnVjdCBmaWxlICpmaWxlLAo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgX191
c2VyICp1YnVmLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNp
emVfdCBjb3VudCwgbG9mZl90ICpwcG9zKQo+ICt7Cj4gKyAgICAgICBzdHJ1Y3QgYXRoMTBrICph
ciA9IGZpbGUtPnByaXZhdGVfZGF0YTsKPiArICAgICAgIHUzMiBmaWx0ZXI7Cj4gKyAgICAgICBp
bnQgcmV0Owo+ICsKPiArICAgICAgIGlmIChrc3RydG91aW50X2Zyb21fdXNlcih1YnVmLCBjb3Vu
dCwgMCwgJmZpbHRlcikpCj4gKyAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICsKPiAr
ICAgICAgIG11dGV4X2xvY2soJmFyLT5jb25mX211dGV4KTsKPiArICAgICAgIGlmIChmaWx0ZXIg
JiYgKGZpbHRlciAhPSBhci0+ZGVidWcucGt0bG9nX2ZpbHRlcikpCj4gKyAgICAgICAgICAgICAg
IHJldCA9IGF0aDEwa193bWlfcGRldl9wa3Rsb2dfZW5hYmxlKGFyLCBmaWx0ZXIpOwo+ICsgICAg
ICAgZWxzZQo+ICsgICAgICAgICAgICAgICByZXQgPSBhdGgxMGtfd21pX3BkZXZfcGt0bG9nX2Rp
c2FibGUoYXIpOwoKWW91J3JlIG5vdCBjaGVja2luZyBpZiBhci0+c3RhdGUgaXMgT04uCgpFdmVu
IGlmIEkgYXNzdW1lIHRoZSBhYm92ZSBkb2Vzbid0IGNyYXNoIHRoZSBkcml2ZXIvc3lzdGVtIHRo
aXMgaGFzCnN0cmFuZ2Ugc2VtYW50aWNzLiBPbiBvbmUgaGFuZCB0aGUgZHJpdmVyIGhhcyB0byBi
ZSBhZnRlciBkcnZfc3RhcnQKKGUuZy4gYXQgbGVhc3Qgb25lIGludGVyZmFjZSBtdXN0IGJlIHVw
KSBiZWZvcmUgaXQncyBwb3NzaWJsZSB0byBzZXQKaXQgYnV0IG9uIHRoZSBvdGhlciBoYW5kIHBr
dGxvZ19maWx0ZXIgaXMgcmV0YWluZWQgYWNyb3NzCmRydl9zdG9wL3N0YXJ0LiBJJ2QgZXhwZWN0
IGl0IHRvIGJlIHBvc3NpYmxlIHRvIHNldCB0aGUgcGt0bG9nX2ZpbHRlcgpyZWdhcmRsZXNzIG9m
IGRyaXZlciBzdGF0ZSBidXQgbWF5YmUgdGhhdCdzIGp1c3QgbWUuCgoKTWljaGHFggoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcg
bGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
