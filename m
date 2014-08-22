Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x235.google.com ([2a00:1450:400c:c05::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XKifg-00006Z-Oe
 for ath10k@lists.infradead.org; Fri, 22 Aug 2014 06:50:02 +0000
Received: by mail-wi0-f181.google.com with SMTP id bs8so9456934wib.8
 for <ath10k@lists.infradead.org>; Thu, 21 Aug 2014 23:49:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20140821124907.27159.64620.stgit@potku.adurom.net>
References: <20140821124705.27159.67898.stgit@potku.adurom.net>
 <20140821124907.27159.64620.stgit@potku.adurom.net>
Date: Fri, 22 Aug 2014 08:49:35 +0200
Message-ID: <CA+BoTQk6wvXMEWnfFvASJwzj2AC0VB=Zby+zLO-tJ3NN_eA2mg@mail.gmail.com>
Subject: Re: [PATCH v8 2/4] ath10k: provide firmware crash info via debugfs
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

T24gMjEgQXVndXN0IDIwMTQgMTQ6NDksIEthbGxlIFZhbG8gPGt2YWxvQHFjYS5xdWFsY29tbS5j
b20+IHdyb3RlOgo+IEZyb206IEJlbiBHcmVlYXIgPGdyZWVhcmJAY2FuZGVsYXRlY2guY29tPgo+
Cj4gU3RvcmUgdGhlIGZpcm13YXJlIHJlZ2lzdGVycyBhbmQgb3RoZXIgcmVsZXZhbnQgZGF0YSB0
byBhIGZpcm13YXJlIGNyYXNoIGR1bXAKPiBmaWxlIGFuZCBwcm92aWRlIGl0IHRvIHVzZXItc3Bh
Y2UgdmlhIGRlYnVnZnMuIFNob3VsZCBoZWxwIHdpdGggZmlndXJpbmcgb3V0Cj4gd2h5IHRoZSBm
aXJtd2FyZSBjcmFzaGVkLgo+Cj4ga3ZhbG86IHJlbW92ZSBkYmdsb2cgc3VwcG9ydCwgcmV3b3Jr
IGFuZCByZWZhY3RvciB0aGUgY29kZSB0byBhdm9pZCBpZmRlZnMgYW5kCj4gb3RoZXJ3aXNlIHNp
bXBsaWZ5IGl0IGFzIHdlbGwKPgo+IFNpZ25lZC1vZmYtYnk6IEJlbiBHcmVlYXIgPGdyZWVhcmJA
Y2FuZGVsYXRlY2guY29tPgo+IFNpZ25lZC1vZmYtYnk6IEthbGxlIFZhbG8gPGt2YWxvQHFjYS5x
dWFsY29tbS5jb20+Cj4gLS0tClsuLi5dCj4gK3N0YXRpYyBzdHJ1Y3QgYXRoMTBrX2R1bXBfZmls
ZV9kYXRhICphdGgxMGtfYnVpbGRfZHVtcF9maWxlKHN0cnVjdCBhdGgxMGsgKmFyKQo+ICt7Cj4g
KyAgICAgICBzdHJ1Y3QgYXRoMTBrX2Z3X2NyYXNoX2RhdGEgKmNyYXNoX2RhdGEgPSBhci0+ZGVi
dWcuZndfY3Jhc2hfZGF0YTsKPiArICAgICAgIHN0cnVjdCBhdGgxMGtfZHVtcF9maWxlX2RhdGEg
KmR1bXBfZGF0YTsKPiArICAgICAgIHN0cnVjdCBhdGgxMGtfdGx2X2R1bXBfZGF0YSAqZHVtcF90
bHY7Cj4gKyAgICAgICBpbnQgaGRyX2xlbiA9IHNpemVvZigqZHVtcF9kYXRhKTsKPiArICAgICAg
IHVuc2lnbmVkIGludCBsZW4sIHNvZmFyID0gMDsKPiArICAgICAgIHVuc2lnbmVkIGNoYXIgKmJ1
ZjsKPiArCj4gKyAgICAgICBsb2NrZGVwX2Fzc2VydF9oZWxkKCZhci0+Y29uZl9tdXRleCk7Clsu
Li5dCj4gK3N0YXRpYyBpbnQgYXRoMTBrX2Z3X2NyYXNoX2R1bXBfb3BlbihzdHJ1Y3QgaW5vZGUg
Kmlub2RlLCBzdHJ1Y3QgZmlsZSAqZmlsZSkKPiArewo+ICsgICAgICAgc3RydWN0IGF0aDEwayAq
YXIgPSBpbm9kZS0+aV9wcml2YXRlOwo+ICsgICAgICAgc3RydWN0IGF0aDEwa19kdW1wX2ZpbGVf
ZGF0YSAqZHVtcDsKPiArICAgICAgIGludCByZXQ7Cj4gKwo+ICsgICAgICAgbXV0ZXhfbG9jaygm
YXItPmNvbmZfbXV0ZXgpOwoKSSBkb24ndCB0aGluayB3ZSBuZWVkIGNvbmZfbXV0ZXggaGVyZSBh
dCBhbGwsIGRvIHdlPyBJJ20gc29ycnksIEkKc2hvdWxkJ3ZlIHNwb3R0ZWQgdGhpcyBlYXJsaWVy
LiBGZWVsIGZyZWUgdG8ganVzdCBpZ25vcmUgbWUgOi0pCgpPdGhlciB0aGFuIHRoYXQgdGhpcyBs
b29rcyBmaW5lLgoKCk1pY2hhxYIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
