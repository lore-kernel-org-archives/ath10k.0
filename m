Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBSPu-0000Ap-Df
 for ath10k@lists.infradead.org; Tue, 02 Apr 2019 23:02:07 +0000
Received: by mail-lj1-x243.google.com with SMTP id r24so13134060ljg.3
 for <ath10k@lists.infradead.org>; Tue, 02 Apr 2019 16:02:04 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com.
 [209.85.208.175])
 by smtp.gmail.com with ESMTPSA id c7sm3198178lja.90.2019.04.02.16.01.59
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Apr 2019 16:02:00 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id f18so13078741lja.10
 for <ath10k@lists.infradead.org>; Tue, 02 Apr 2019 16:01:59 -0700 (PDT)
MIME-Version: 1.0
References: <362a9b5f-8908-17f5-3594-6c3c68789dea@molgen.mpg.de>
 <CAEJqkggKGTn0ojWzuYGfoYehDnOf=je5L-7-M1kWogutPGMg3g@mail.gmail.com>
 <874l8ic0l4.fsf@codeaurora.org>
 <CAEJqkgjYRu1Az6ec1ksQfLZ71fa062Us7XkOzw8BZ2bEoUe8BQ@mail.gmail.com>
 <87wol97hvp.fsf@kamboji.qca.qualcomm.com>
 <CA+ASDXOcbSGJs3Xk_SjjsAA87fcwrx_JB_mB9cyV=9u6V+FZ_A@mail.gmail.com>
 <CALiNf2-Wdo4YnKLprUUyPF9QJBL10Mz3wvVG6fWtd_Xi-Yn=6w@mail.gmail.com>
In-Reply-To: <CALiNf2-Wdo4YnKLprUUyPF9QJBL10Mz3wvVG6fWtd_Xi-Yn=6w@mail.gmail.com>
From: Brian Norris <briannorris@chromium.org>
Date: Tue, 2 Apr 2019 16:01:46 -0700
Message-ID: <CA+ASDXNnRv3AbPqjcsUpfLM+CMSv1CKduRfCUKtZgQ5s8xOPdw@mail.gmail.com>
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
To: Claire Chang <tientzu@google.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Gabriel C <nix.or.die@gmail.com>, Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>, Sriram R <srirrama@codeaurora.org>

KyBSYWZhZWwKKyBhdXRob3JzIG9mIHRoZXNlIGJhZCBjb21taXRzOgpjZDkzYjgzYWQ5MjcgYXRo
MTBrOiBzdXBwb3J0IGZvciBtdWx0aWNhc3QgcmF0ZSBjb250cm9sCmYyNzkyOTRlOWVlMiBhdGgx
MGs6IGFkZCBzdXBwb3J0IGZvciBjb25maWd1cmluZyBtYW5hZ2VtZW50IHBhY2tldCByYXRlCgpI
aSwKCk9uIE1vbiwgTWFyIDI1LCAyMDE5IGF0IDg6NDYgUE0gQ2xhaXJlIENoYW5nIDx0aWVudHp1
QGdvb2dsZS5jb20+IHdyb3RlOgo+IE9uIFR1ZSwgTWFyIDI2LCAyMDE5IGF0IDEyOjQ5IEFNIEJy
aWFuIE5vcnJpcyA8YnJpYW5ub3JyaXNAY2hyb21pdW0ub3JnPiB3cm90ZToKPiA+IE9uIEZyaSwg
TWFyIDgsIDIwMTkgYXQgMjo1OCBBTSBLYWxsZSBWYWxvIDxrdmFsb0Bjb2RlYXVyb3JhLm9yZz4g
d3JvdGU6Cj4gPiA+IEdhYnJpZWwgQyA8bml4Lm9yLmRpZUBnbWFpbC5jb20+IHdyaXRlczoKPiA+
ID4gPiBBbSBNby4sIDQuIE3DpHJ6IDIwMTkgdW0gMTI6NTkgVWhyIHNjaHJpZWIgS2FsbGUgVmFs
byA8a3ZhbG9AY29kZWF1cm9yYS5vcmc+Ogo+ID4gPiA+PiBHYWJyaWVsIEMgPG5peC5vci5kaWVA
Z21haWwuY29tPiB3cml0ZXM6Cj4gPiA+ID4+ID4gSSByZXBvcnRlZCB0aGF0IHR3aWNlIGFuZCBu
byBvbmUgc2VlbXMgdG8gY2FyZSBhYm91dC4KPiA+ID4gPj4gPgo+ID4gPiA+PiA+IGh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL3BpcGVybWFpbC9hdGgxMGsvMjAxOC1Ob3ZlbWJlci8wMTIzOTgu
aHRtbAo+ID4gPiA+PiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL3BpcGVybWFpbC9hdGgx
MGsvMjAxOC1EZWNlbWJlci8wMTI2NTguaHRtbAo+ID4gPiA+Pgo+ID4gPiA+PiBEb2VzIHRoaXMg
cGF0Y2ggaGVscDoKPiA+ID4gPj4KPiA+ID4gPj4gYXRoMTBrOiBEcm9wIFdBUk5fT04oKXMgdGhh
dCBhbHdheXMgdHJpZ2dlciBkdXJpbmcgc3lzdGVtIHJlc3VtZQo+ID4gPiA+Pgo+ID4gPiA+PiBo
dHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzEwODM3MTM5Lwo+ID4gPiA+Pgo+ID4g
PiA+Cj4gPiA+ID4gV2l0aG91dCB0byB0ZXN0IHRoaXMgcGF0Y2ggSSBjYW4gY29uZmlybSBpdCB3
aWxsIGhlbHAgLCBJIGRyb3BwZWQgdGhlCj4gPiA+ID4gV0FSTl9PTigpJ3MgaW4gNC4xOSBhbHJl
YWR5Lgo+ID4gPiA+IElmIEkgcmVtZW1iZXIgcmlnaHQgNC4xOSBoYXMgb25lIFdBUk5fT04oKSB0
cmlnZ2VycyB3aGlsZSA0LjIwIGdvdCB0d28uCj4gPiA+Cj4gPiA+IE9rLCB0aGFua3MuIEknbGwg
dHJ5IHRvIGdldCB0aGlzIHBhdGNoIHRvIDUuMS4KPiA+Cj4gPiBQaW5nPyBJcyB0aGVyZSBhbnkg
c29sdXRpb24gcXVldWVkIGFueXdoZXJlPyBJdCdzIGtpbmRhIHNhZCBob3cgbG9uZwo+ID4gdGhp
cyBoYXMgc2F0IGhlcmUuCj4gPgo+ID4gQnJpYW4KPgo+IERvIHdlIG5lZWQgdG8gc2V0IG1jYXN0
IHJhdGUgYW5kIGJhc2ljIHJhdGVzIGR1cmluZy9hZnRlciBzeXN0ZW0gcmVzdW1lPwo+IERyb3Bw
aW5nIHRoZSBXQVJOX09OKCkgd2lsbCBzb2x2ZSB0aGUgd2FybmluZyBpc3N1ZSwgYnV0IHdvbid0
IG1ha2UKPiB0aG9zZSByYXRlcyBzZXQgcHJvcGVybHkuCgpJIGRvbid0IHRoaW5rIHRoZXJlJ3Mg
YW55dGhpbmcgdG8gZml4IGhlcmUgYWJvdXQgdGhlIHJhdGUgaW5mbzsgdGhlCm9yaWdpbmFsIHBh
dGNoZXMganVzdCBtYWRlIG1pc3Rha2VzIHdpdGggaG93IHRoaXMgY2FsbGJhY2sgaXMgdXNlZC4g
SW4KdGhpcyBjYXNlLCB3ZSdyZSBub3QgYXNzb2NpYXRlZCAod2UncmUgbm90IHVzaW5nIFdvV0xB
TiksIHNvIGl0J3MKaWVlZTgwMjExX3JlY29uZmlnKCkgLT4gaWVlZTgwMjExX2Jzc19pbmZvX2No
YW5nZV9ub3RpZnkoKSwgd2hpY2gKbm90aWZpZXMgdGhlIGN1cnJlbnQgYXNzb2NpYXRpb24gc3Rh
dHVzIChub3QgYXNzb2NpYXRlZCksIGFzIHdlbGwgYXMgYQpmZXcgb3RoZXIgcGFyYW1ldGVycy4g
VGhlcmUgaXMgbm8gcmF0ZSBpbmZvIHRvIGJlIGhhZCwgc28gd2Ugc2hvdWxkCmp1c3QgZXhpdCBz
aWxlbnRseS4KCkkgZG9uJ3Qgc2VlIGFueSByZWFzb24gbm90IHRvIHRha2UgUmFmYWVsJ3MgcGF0
Y2guIEknbGwgcmVzcG9uZCB3aXRoCm15IFJldmlld2VkL1Rlc3RlZCB0aGVyZS4KCkJyaWFuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFp
bGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
