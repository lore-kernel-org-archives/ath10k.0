Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x230.google.com ([2a00:1450:400c:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XWhFo-0004LI-Mj
 for ath10k@lists.infradead.org; Wed, 24 Sep 2014 07:44:49 +0000
Received: by mail-we0-f176.google.com with SMTP id w61so4862037wes.35
 for <ath10k@lists.infradead.org>; Wed, 24 Sep 2014 00:44:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1411507045-18973-3-git-send-email-greearb@candelatech.com>
References: <1411507045-18973-1-git-send-email-greearb@candelatech.com>
 <1411507045-18973-3-git-send-email-greearb@candelatech.com>
Date: Wed, 24 Sep 2014 09:44:26 +0200
Message-ID: <CA+BoTQkK=6NfPN9e-3qN2Qaq2RLVdEwrp5x03_T=E2ZLcBeiaA@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] ath10k: support ethtool stats.
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMjMgU2VwdGVtYmVyIDIwMTQgMjM6MTcsICA8Z3JlZWFyYkBjYW5kZWxhdGVjaC5jb20+IHdy
b3RlOgpbLi4uXQo+ICt2b2lkIGF0aDEwa19nZXRfZXRfc3RhdHMoc3RydWN0IGllZWU4MDIxMV9o
dyAqaHcsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBpZWVlODAyMTFfdmlmICp2
aWYsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBldGh0b29sX3N0YXRzICpzdGF0
cywgdTY0ICpkYXRhKQo+ICt7Cj4gKyAgICAgICBzdHJ1Y3QgYXRoMTBrICphciA9IGh3LT5wcml2
Owo+ICsgICAgICAgaW50IGkgPSAwOwo+ICsgICAgICAgc3RydWN0IGF0aDEwa190YXJnZXRfc3Rh
dHMgKmZ3X3N0YXRzOwo+ICsKPiArICAgICAgIGZ3X3N0YXRzID0gJmFyLT5kZWJ1Zy50YXJnZXRf
c3RhdHM7Cj4gKwo+ICsgICAgICAgbXV0ZXhfbG9jaygmYXItPmNvbmZfbXV0ZXgpOwo+ICsKPiAr
ICAgICAgIGlmIChhci0+c3RhdGUgPT0gQVRIMTBLX1NUQVRFX09OKQo+ICsgICAgICAgICAgICAg
ICBhdGgxMGtfcmVmcmVzaF9wZWVyX3N0YXRzKGFyKTsKPiArCj4gKyAgICAgICBtdXRleF91bmxv
Y2soJmFyLT5jb25mX211dGV4KTsKCkp1c3QgZm9yIGNvcnJlY3RuZXNzIHNha2UgLSBpdCdzIHBy
b2JhYmx5IGEgZ29vZCBpZGVhIHRvCm11dGV4X3VubG9jaygpIGF0IHRoZSBlbmQgKGkuZS4gYWZ0
ZXIgc3Bpbl91bmxvY2tfYmgoKSkgdG8gbWFrZSBzdXJlCnRoZSBzdGF0cyBhcmUgZm9yIHRoaXMg
cGFydGljdWxhciByZXF1ZXN0LiBXaXRoIHlvdXIgcGF0Y2ggdGhlcmUncyBhCnZlcnkgc2xpZ2h0
IGNoYW5jZSB0aGF0LCBlLmcuIGZ3X3N0YXRzIGRlYnVnIGZpbGUgaXMgYmVpbmcgcmVhZCBhdCB0
aGUKc2FtZSB0aW1lIGFuZCBpdCB1cGRhdGVzIGZ3IHN0YXRzIGJldHdlZW4gdGhlIGFib3ZlIG11
dGV4X3VubG9jaygpIGFuZApmb2xsb3dpbmcgc3Bpbl9sb2NrX2JoKCkuCgo+ICsgICAgICAgc3Bp
bl9sb2NrX2JoKCZhci0+ZGF0YV9sb2NrKTsKPiArICAgICAgIGRhdGFbaSsrXSA9IGZ3X3N0YXRz
LT5od19yZWFwZWQ7IC8qIHBwZHUgcmVhcGVkICovClsuLi5dCj4gKyAgICAgICBzcGluX3VubG9j
a19iaCgmYXItPmRhdGFfbG9jayk7Cj4gKwo+ICsgICAgICAgV0FSTl9PTihpICE9IEFUSDEwS19T
U1RBVFNfTEVOKTsKPiArfQoKCk1pY2hhxYIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgx
MGsK
