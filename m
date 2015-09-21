Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22f.google.com ([2a00:1450:400c:c05::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zdvbv-000132-Ds
 for ath10k@lists.infradead.org; Mon, 21 Sep 2015 07:34:04 +0000
Received: by wiclk2 with SMTP id lk2so98545492wic.1
 for <ath10k@lists.infradead.org>; Mon, 21 Sep 2015 00:33:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1442362098-24859-1-git-send-email-greearb@candelatech.com>
References: <1442362098-24859-1-git-send-email-greearb@candelatech.com>
Date: Mon, 21 Sep 2015 09:33:42 +0200
Message-ID: <CA+BoTQkXma5KXpGa3XnnFw=13GRVoTEth0_=K-YNEKru1CpaOA@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Fix CCK rate definitions.
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

T24gMTYgU2VwdGVtYmVyIDIwMTUgYXQgMDI6MDgsICA8Z3JlZWFyYkBjYW5kZWxhdGVjaC5jb20+
IHdyb3RlOgo+IEZyb206IEJlbiBHcmVlYXIgPGdyZWVhcmJAY2FuZGVsYXRlY2guY29tPgo+Cj4g
VGhlIG9sZCB2YWx1ZXMgZGlkIE5PVCBtYXRjaCB3aGF0IGlzIGZvdW5kIGluIDEwLjEuNDY3Cj4g
ZmlybXdhcmUuICBJIGZpZ3VyZSBpdCBpcyBsaWtlbHkgaXQgaXMgd3JvbmcgZm9yIHRoZSBvdGhl
cnMKPiBhcyB3ZWxsLgoKRG9lcyB0aGlzIGZpeCBhbnl0aGluZyBhdCBhbGw/CgoKPiBTaWduZWQt
b2ZmLWJ5OiBCZW4gR3JlZWFyIDxncmVlYXJiQGNhbmRlbGF0ZWNoLmNvbT4KPiAtLS0KPiAgZHJp
dmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9ody5oIHwgMTQgKysrKysrKy0tLS0tLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL2h3LmggYi9kcml2ZXJzL25l
dC93aXJlbGVzcy9hdGgvYXRoMTBrL2h3LmgKPiBpbmRleCA0YzVlZWU0Li43MTBjYTMyIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvaHcuaAo+ICsrKyBiL2Ry
aXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvaHcuaAo+IEBAIC0yMDIsMTMgKzIwMiwxMyBA
QCBlbnVtIGF0aDEwa19od19yYXRlX29mZG0gewo+ICB9Owo+Cj4gIGVudW0gYXRoMTBrX2h3X3Jh
dGVfY2NrIHsKPiAtICAgICAgIEFUSDEwS19IV19SQVRFX0NDS19MUF8xMU0gPSAwLAo+IC0gICAg
ICAgQVRIMTBLX0hXX1JBVEVfQ0NLX0xQXzVfNU0sCj4gLSAgICAgICBBVEgxMEtfSFdfUkFURV9D
Q0tfTFBfMk0sCj4gLSAgICAgICBBVEgxMEtfSFdfUkFURV9DQ0tfTFBfMU0sCj4gLSAgICAgICBB
VEgxMEtfSFdfUkFURV9DQ0tfU1BfMTFNLAo+IC0gICAgICAgQVRIMTBLX0hXX1JBVEVfQ0NLX1NQ
XzVfNU0sCj4gLSAgICAgICBBVEgxMEtfSFdfUkFURV9DQ0tfU1BfMk0sCj4gKyAgICAgICBBVEgx
MEtfSFdfUkFURV9DQ0tfTFBfMTFNID0gMHg0MCwKPiArICAgICAgIEFUSDEwS19IV19SQVRFX0ND
S19MUF81XzVNID0gMHg0MSwKPiArICAgICAgIEFUSDEwS19IV19SQVRFX0NDS19MUF8yTSA9IDB4
NDIsCj4gKyAgICAgICBBVEgxMEtfSFdfUkFURV9DQ0tfTFBfMU0gPSAweDQzLAo+ICsgICAgICAg
QVRIMTBLX0hXX1JBVEVfQ0NLX1NQXzExTSA9IEFUSDEwS19IV19SQVRFX0NDS19MUF8xMU0gfCAw
eDQsCj4gKyAgICAgICBBVEgxMEtfSFdfUkFURV9DQ0tfU1BfNV81TSA9IEFUSDEwS19IV19SQVRF
X0NDS19MUF81XzVNIHwgMHg0LAo+ICsgICAgICAgQVRIMTBLX0hXX1JBVEVfQ0NLX1NQXzJNID0g
QVRIMTBLX0hXX1JBVEVfQ0NLX0xQXzJNIHwgMHg0LAo+ICB9OwoKVGhpcyBicmVha3MgUnggQ0NL
IHJhdGUgZGVjb2RpbmcvcmVwb3J0aW5nLiBTZWUgY29kZSBhc3NvY2lhdGVkIHdpdGgKYXRoMTBr
X21hY19od19yYXRlX3RvX2lkeCgpLgoKCk1pY2hhxYIKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hdGgxMGsK
