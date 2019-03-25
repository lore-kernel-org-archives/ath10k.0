Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8Smo-0002by-WC
 for ath10k@lists.infradead.org; Mon, 25 Mar 2019 16:49:33 +0000
Received: by mail-lj1-x243.google.com with SMTP id f18so8476559lja.10
 for <ath10k@lists.infradead.org>; Mon, 25 Mar 2019 09:49:22 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com.
 [209.85.208.169])
 by smtp.gmail.com with ESMTPSA id x6sm3454323lfe.67.2019.03.25.09.49.17
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Mar 2019 09:49:17 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id h16so4013278ljg.11
 for <ath10k@lists.infradead.org>; Mon, 25 Mar 2019 09:49:17 -0700 (PDT)
MIME-Version: 1.0
References: <362a9b5f-8908-17f5-3594-6c3c68789dea@molgen.mpg.de>
 <CAEJqkggKGTn0ojWzuYGfoYehDnOf=je5L-7-M1kWogutPGMg3g@mail.gmail.com>
 <874l8ic0l4.fsf@codeaurora.org>
 <CAEJqkgjYRu1Az6ec1ksQfLZ71fa062Us7XkOzw8BZ2bEoUe8BQ@mail.gmail.com>
 <87wol97hvp.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87wol97hvp.fsf@kamboji.qca.qualcomm.com>
From: Brian Norris <briannorris@chromium.org>
Date: Mon, 25 Mar 2019 09:49:05 -0700
Message-ID: <CA+ASDXOcbSGJs3Xk_SjjsAA87fcwrx_JB_mB9cyV=9u6V+FZ_A@mail.gmail.com>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Gabriel C <nix.or.die@gmail.com>, ath10k@lists.infradead.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

SGkgS2FsbGUsCgpPbiBGcmksIE1hciA4LCAyMDE5IGF0IDI6NTggQU0gS2FsbGUgVmFsbyA8a3Zh
bG9AY29kZWF1cm9yYS5vcmc+IHdyb3RlOgo+IEdhYnJpZWwgQyA8bml4Lm9yLmRpZUBnbWFpbC5j
b20+IHdyaXRlczoKPiA+IEFtIE1vLiwgNC4gTcOkcnogMjAxOSB1bSAxMjo1OSBVaHIgc2Nocmll
YiBLYWxsZSBWYWxvIDxrdmFsb0Bjb2RlYXVyb3JhLm9yZz46Cj4gPj4gR2FicmllbCBDIDxuaXgu
b3IuZGllQGdtYWlsLmNvbT4gd3JpdGVzOgo+ID4+ID4gSSByZXBvcnRlZCB0aGF0IHR3aWNlIGFu
ZCBubyBvbmUgc2VlbXMgdG8gY2FyZSBhYm91dC4KPiA+PiA+Cj4gPj4gPiBodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9waXBlcm1haWwvYXRoMTBrLzIwMTgtTm92ZW1iZXIvMDEyMzk4Lmh0bWwK
PiA+PiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL3BpcGVybWFpbC9hdGgxMGsvMjAxOC1E
ZWNlbWJlci8wMTI2NTguaHRtbAo+ID4+Cj4gPj4gRG9lcyB0aGlzIHBhdGNoIGhlbHA6Cj4gPj4K
PiA+PiBhdGgxMGs6IERyb3AgV0FSTl9PTigpcyB0aGF0IGFsd2F5cyB0cmlnZ2VyIGR1cmluZyBz
eXN0ZW0gcmVzdW1lCj4gPj4KPiA+PiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNo
LzEwODM3MTM5Lwo+ID4+Cj4gPgo+ID4gV2l0aG91dCB0byB0ZXN0IHRoaXMgcGF0Y2ggSSBjYW4g
Y29uZmlybSBpdCB3aWxsIGhlbHAgLCBJIGRyb3BwZWQgdGhlCj4gPiBXQVJOX09OKCkncyBpbiA0
LjE5IGFscmVhZHkuCj4gPiBJZiBJIHJlbWVtYmVyIHJpZ2h0IDQuMTkgaGFzIG9uZSBXQVJOX09O
KCkgdHJpZ2dlcnMgd2hpbGUgNC4yMCBnb3QgdHdvLgo+Cj4gT2ssIHRoYW5rcy4gSSdsbCB0cnkg
dG8gZ2V0IHRoaXMgcGF0Y2ggdG8gNS4xLgoKUGluZz8gSXMgdGhlcmUgYW55IHNvbHV0aW9uIHF1
ZXVlZCBhbnl3aGVyZT8gSXQncyBraW5kYSBzYWQgaG93IGxvbmcKdGhpcyBoYXMgc2F0IGhlcmUu
CgpCcmlhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
