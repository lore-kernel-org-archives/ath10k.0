Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8d2x-0004Hb-GZ
 for ath10k@lists.infradead.org; Tue, 26 Mar 2019 03:46:45 +0000
Received: by mail-qt1-x843.google.com with SMTP id d13so8331360qth.5
 for <ath10k@lists.infradead.org>; Mon, 25 Mar 2019 20:46:38 -0700 (PDT)
MIME-Version: 1.0
References: <362a9b5f-8908-17f5-3594-6c3c68789dea@molgen.mpg.de>
 <CAEJqkggKGTn0ojWzuYGfoYehDnOf=je5L-7-M1kWogutPGMg3g@mail.gmail.com>
 <874l8ic0l4.fsf@codeaurora.org>
 <CAEJqkgjYRu1Az6ec1ksQfLZ71fa062Us7XkOzw8BZ2bEoUe8BQ@mail.gmail.com>
 <87wol97hvp.fsf@kamboji.qca.qualcomm.com>
 <CA+ASDXOcbSGJs3Xk_SjjsAA87fcwrx_JB_mB9cyV=9u6V+FZ_A@mail.gmail.com>
In-Reply-To: <CA+ASDXOcbSGJs3Xk_SjjsAA87fcwrx_JB_mB9cyV=9u6V+FZ_A@mail.gmail.com>
From: Claire Chang <tientzu@google.com>
Date: Tue, 26 Mar 2019 11:46:26 +0800
Message-ID: <CALiNf2-Wdo4YnKLprUUyPF9QJBL10Mz3wvVG6fWtd_Xi-Yn=6w@mail.gmail.com>
Subject: Re: Warning at drivers/net/wireless/ath/ath10k/mac.c:5625
 ath10k_bss_info_changed
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
To: Brian Norris <briannorris@chromium.org>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, ath10k@lists.infradead.org, Gabriel C <nix.or.die@gmail.com>, Kalle Valo <kvalo@codeaurora.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

SGkKCk9uIFR1ZSwgTWFyIDI2LCAyMDE5IGF0IDEyOjQ5IEFNIEJyaWFuIE5vcnJpcyA8YnJpYW5u
b3JyaXNAY2hyb21pdW0ub3JnPiB3cm90ZToKPgo+IEhpIEthbGxlLAo+Cj4gT24gRnJpLCBNYXIg
OCwgMjAxOSBhdCAyOjU4IEFNIEthbGxlIFZhbG8gPGt2YWxvQGNvZGVhdXJvcmEub3JnPiB3cm90
ZToKPiA+IEdhYnJpZWwgQyA8bml4Lm9yLmRpZUBnbWFpbC5jb20+IHdyaXRlczoKPiA+ID4gQW0g
TW8uLCA0LiBNw6RyeiAyMDE5IHVtIDEyOjU5IFVociBzY2hyaWViIEthbGxlIFZhbG8gPGt2YWxv
QGNvZGVhdXJvcmEub3JnPjoKPiA+ID4+IEdhYnJpZWwgQyA8bml4Lm9yLmRpZUBnbWFpbC5jb20+
IHdyaXRlczoKPiA+ID4+ID4gSSByZXBvcnRlZCB0aGF0IHR3aWNlIGFuZCBubyBvbmUgc2VlbXMg
dG8gY2FyZSBhYm91dC4KPiA+ID4+ID4KPiA+ID4+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvcGlwZXJtYWlsL2F0aDEway8yMDE4LU5vdmVtYmVyLzAxMjM5OC5odG1sCj4gPiA+PiA+IGh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL3BpcGVybWFpbC9hdGgxMGsvMjAxOC1EZWNlbWJlci8w
MTI2NTguaHRtbAo+ID4gPj4KPiA+ID4+IERvZXMgdGhpcyBwYXRjaCBoZWxwOgo+ID4gPj4KPiA+
ID4+IGF0aDEwazogRHJvcCBXQVJOX09OKClzIHRoYXQgYWx3YXlzIHRyaWdnZXIgZHVyaW5nIHN5
c3RlbSByZXN1bWUKPiA+ID4+Cj4gPiA+PiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Bh
dGNoLzEwODM3MTM5Lwo+ID4gPj4KPiA+ID4KPiA+ID4gV2l0aG91dCB0byB0ZXN0IHRoaXMgcGF0
Y2ggSSBjYW4gY29uZmlybSBpdCB3aWxsIGhlbHAgLCBJIGRyb3BwZWQgdGhlCj4gPiA+IFdBUk5f
T04oKSdzIGluIDQuMTkgYWxyZWFkeS4KPiA+ID4gSWYgSSByZW1lbWJlciByaWdodCA0LjE5IGhh
cyBvbmUgV0FSTl9PTigpIHRyaWdnZXJzIHdoaWxlIDQuMjAgZ290IHR3by4KPiA+Cj4gPiBPaywg
dGhhbmtzLiBJJ2xsIHRyeSB0byBnZXQgdGhpcyBwYXRjaCB0byA1LjEuCj4KPiBQaW5nPyBJcyB0
aGVyZSBhbnkgc29sdXRpb24gcXVldWVkIGFueXdoZXJlPyBJdCdzIGtpbmRhIHNhZCBob3cgbG9u
Zwo+IHRoaXMgaGFzIHNhdCBoZXJlLgo+Cj4gQnJpYW4KCkRvIHdlIG5lZWQgdG8gc2V0IG1jYXN0
IHJhdGUgYW5kIGJhc2ljIHJhdGVzIGR1cmluZy9hZnRlciBzeXN0ZW0gcmVzdW1lPwpEcm9wcGlu
ZyB0aGUgV0FSTl9PTigpIHdpbGwgc29sdmUgdGhlIHdhcm5pbmcgaXNzdWUsIGJ1dCB3b24ndCBt
YWtlCnRob3NlIHJhdGVzIHNldCBwcm9wZXJseS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
dGgxMGsK
