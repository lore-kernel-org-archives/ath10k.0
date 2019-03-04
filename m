Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0mFR-00047I-6i
 for ath10k@lists.infradead.org; Mon, 04 Mar 2019 11:59:11 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: Warning at drivers/net/wireless/ath/ath10k/mac.c:5625
 ath10k_bss_info_changed
References: <362a9b5f-8908-17f5-3594-6c3c68789dea@molgen.mpg.de>
 <CAEJqkggKGTn0ojWzuYGfoYehDnOf=je5L-7-M1kWogutPGMg3g@mail.gmail.com>
Date: Mon, 04 Mar 2019 13:59:03 +0200
In-Reply-To: <CAEJqkggKGTn0ojWzuYGfoYehDnOf=je5L-7-M1kWogutPGMg3g@mail.gmail.com>
 (Gabriel C.'s message of "Mon, 4 Mar 2019 12:47:40 +0100")
Message-ID: <874l8ic0l4.fsf@codeaurora.org>
MIME-Version: 1.0
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
To: Gabriel C <nix.or.die@gmail.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org

R2FicmllbCBDIDxuaXgub3IuZGllQGdtYWlsLmNvbT4gd3JpdGVzOgoKPiBBbSBNby4sIDQuIE3D
pHJ6IDIwMTkgdW0gMTI6MjggVWhyIHNjaHJpZWIgUGF1bCBNZW56ZWwgPHBtZW56ZWxAbW9sZ2Vu
Lm1wZy5kZT46Cj4KPj4gUmVzdW1pbmcgZnJvbSBBQ1BJIFMzIG9uIHRoZSBEZWxsIFhQUyAxMyA5
MzcwIHdpdGggRGViaWFuIFNpZC91bnN0YWJsZSwKPj4gTGludXggNC4xOS4yMCBzaG93ZWQgdGhl
IHdhcm5pbmcgYmVsb3cuIEl04oCZcyBub3QgcmVwcm9kdWNpYmxlLgoKWy4uLl0KCj4+IFsgMzAx
OC45OTI5MTZdIENhbGwgVHJhY2U6Cj4+IFsgMzAxOC45OTI5MjFdICA/IGF0aDEwa19jb25mX3R4
KzB4N2EvMHg0YjAgW2F0aDEwa19jb3JlXQo+PiBbIDMwMTguOTkyOTM3XSAgaWVlZTgwMjExX2Jz
c19pbmZvX2NoYW5nZV9ub3RpZnkrMHhhYi8weDFhMCBbbWFjODAyMTFdCj4+IFsgMzAxOC45OTI5
NDZdICBpZWVlODAyMTFfcmVjb25maWcrMHg2NjEvMHgxMmEwIFttYWM4MDIxMV0KPj4gWyAzMDE4
Ljk5Mjk2Ml0gIHdpcGh5X3Jlc3VtZSsweDdmLzB4MTIwIFtjZmc4MDIxMV0KPj4gWyAzMDE4Ljk5
Mjk2OV0gID8gd2lwaHlfc3VzcGVuZCsweDI3MC8weDI3MCBbY2ZnODAyMTFdCj4+IFsgMzAxOC45
OTI5NzFdICBkcG1fcnVuX2NhbGxiYWNrKzB4NTkvMHgxNTAKPj4gWyAzMDE4Ljk5Mjk3Ml0gIGRl
dmljZV9yZXN1bWUrMHg5Ny8weDE5MAo+PiBbIDMwMTguOTkyOTczXSAgYXN5bmNfcmVzdW1lKzB4
MTkvMHgzMAo+PiBbIDMwMTguOTkyOTc0XSAgYXN5bmNfcnVuX2VudHJ5X2ZuKzB4MzkvMHgxNjAK
Pj4gWyAzMDE4Ljk5Mjk3Nl0gIHByb2Nlc3Nfb25lX3dvcmsrMHgxYTcvMHgzYTAKPj4gWyAzMDE4
Ljk5Mjk3OF0gIHdvcmtlcl90aHJlYWQrMHgzMC8weDM5MAo+PiBbIDMwMTguOTkyOTc5XSAgPyBw
d3FfdW5ib3VuZF9yZWxlYXNlX3dvcmtmbisweGQwLzB4ZDAKPj4gWyAzMDE4Ljk5Mjk4MF0gIGt0
aHJlYWQrMHgxMTIvMHgxMzAKPj4gWyAzMDE4Ljk5Mjk4MV0gID8ga3RocmVhZF9iaW5kKzB4MzAv
MHgzMAo+PiBbIDMwMTguOTkyOTgzXSAgcmV0X2Zyb21fZm9yaysweDM1LzB4NDAKPj4gWyAzMDE4
Ljk5Mjk4NF0gLS0tWyBlbmQgdHJhY2UgM2FmNjE4Y2E5N2JkNGEwYSBdLS0tCj4+IGBgYAo+Pgo+
PiBQbGVhc2UgZmluZCBhbGwgTGludXggbWVzc2FnZXMgYXR0YWNoZWQuCj4KPiBJIHJlcG9ydGVk
IHRoYXQgdHdpY2UgYW5kIG5vIG9uZSBzZWVtcyB0byBjYXJlIGFib3V0Lgo+Cj4gaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvcGlwZXJtYWlsL2F0aDEway8yMDE4LU5vdmVtYmVyLzAxMjM5OC5o
dG1sCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvcGlwZXJtYWlsL2F0aDEway8yMDE4LURl
Y2VtYmVyLzAxMjY1OC5odG1sCgpEb2VzIHRoaXMgcGF0Y2ggaGVscDoKCmF0aDEwazogRHJvcCBX
QVJOX09OKClzIHRoYXQgYWx3YXlzIHRyaWdnZXIgZHVyaW5nIHN5c3RlbSByZXN1bWUKCmh0dHBz
Oi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTA4MzcxMzkvCgotLSAKS2FsbGUgVmFsbwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1h
aWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
