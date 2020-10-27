Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ua1-x942.google.com ([2607:f8b0:4864:20::942])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXQOh-0004S8-A1
 for ath10k@lists.infradead.org; Tue, 27 Oct 2020 14:56:28 +0000
Received: by mail-ua1-x942.google.com with SMTP id v27so557741uau.3
 for <ath10k@lists.infradead.org>; Tue, 27 Oct 2020 07:56:26 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com.
 [209.85.217.54])
 by smtp.gmail.com with ESMTPSA id w123sm174359vke.26.2020.10.27.07.56.23
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2020 07:56:23 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id d19so1008958vso.10
 for <ath10k@lists.infradead.org>; Tue, 27 Oct 2020 07:56:23 -0700 (PDT)
MIME-Version: 1.0
References: <20201020000506.1.Ifbc28707942179f1cefc7491e995814564495270@changeid>
 <CAD=FV=Xv7Usev=S_ViWPPsa0xL42KDymjEkqJF7S4CzDiuxP3g@mail.gmail.com>
 <CACTWRwtqcMxZKhDR-Q+3CyOw0Ju=iR+ZMg2pVrHEuzbOUebjOg@mail.gmail.com>
 <001a01d6aa24$6ceaf390$46c0dab0$@codeaurora.org>
 <CAD=FV=X5cVdMq9H+cABHmscZvJpswqGZONjqv7FL8kqRNvuHnQ@mail.gmail.com>
 <002801d6ac20$89ac4df0$9d04e9d0$@codeaurora.org>
In-Reply-To: <002801d6ac20$89ac4df0$9d04e9d0$@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 27 Oct 2020 07:56:10 -0700
Message-ID: <CAD=FV=W1FiHRHeX-sATY_9x33n6P2n3KaoxfiGjvn2mwAm_-BA@mail.gmail.com>
Subject: Re: [PATCH] ath10k: add option for chip-id based BDF selection
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
To: Rakesh Pillai <pillair@codeaurora.org>
Cc: Abhishek Kumar <kuabhs@chromium.org>, Brian Norris <briannorris@chromium.org>, linux-wireless <linux-wireless@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, Kalle Valo <kvalo@codeaurora.org>

SGksCgpPbiBNb24sIE9jdCAyNiwgMjAyMCBhdCAxMDoxOCBQTSBSYWtlc2ggUGlsbGFpIDxwaWxs
YWlyQGNvZGVhdXJvcmEub3JnPiB3cm90ZToKPgo+Cj4KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tCj4gPiBGcm9tOiBEb3VnIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+Cj4g
PiBTZW50OiBUdWVzZGF5LCBPY3RvYmVyIDI3LCAyMDIwIDQ6MjEgQU0KPiA+IFRvOiBSYWtlc2gg
UGlsbGFpIDxwaWxsYWlyQGNvZGVhdXJvcmEub3JnPgo+ID4gQ2M6IEFiaGlzaGVrIEt1bWFyIDxr
dWFiaHNAY2hyb21pdW0ub3JnPjsgS2FsbGUgVmFsbwo+ID4gPGt2YWxvQGNvZGVhdXJvcmEub3Jn
PjsgYXRoMTBrIDxhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZz47IExLTUwKPiA+IDxsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnPjsgbGludXgtd2lyZWxlc3MgPGxpbnV4LQo+ID4gd2lyZWxl
c3NAdmdlci5rZXJuZWwub3JnPjsgQnJpYW4gTm9ycmlzIDxicmlhbm5vcnJpc0BjaHJvbWl1bS5v
cmc+Cj4gPiBTdWJqZWN0OiBSZTogW1BBVENIXSBhdGgxMGs6IGFkZCBvcHRpb24gZm9yIGNoaXAt
aWQgYmFzZWQgQkRGIHNlbGVjdGlvbgo+ID4KPiA+IEhpLAo+ID4KPiA+IE9uIFNhdCwgT2N0IDI0
LCAyMDIwIGF0IDk6NDAgQU0gUmFrZXNoIFBpbGxhaSA8cGlsbGFpckBjb2RlYXVyb3JhLm9yZz4g
d3JvdGU6Cj4gPiA+Cj4gPiA+ID4gICAgICAgICBpZiAoYmRfaWVfdHlwZSA9PSBBVEgxMEtfQkRf
SUVfQk9BUkQpIHsKPiA+ID4gPiArICAgICAgICAgICAgICAgLyogV2l0aCB2YXJpYW50IGFuZCBj
aGlwIGlkICovCj4gPiA+ID4gICAgICAgICAgICAgICAgIHJldCA9IGF0aDEwa19jb3JlX2NyZWF0
ZV9ib2FyZF9uYW1lKGFyLCBib2FyZG5hbWUsCj4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNpemVvZihib2FyZG5hbWUpLCB0cnVlKTsK
PiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBz
aXplb2YoYm9hcmRuYW1lKSwgdHJ1ZSwgdHJ1ZSk7Cj4gPiA+Cj4gPiA+IEluc3RlYWQgb2YgYWRk
aW5nIGEgbG90IG9mIGNvZGUgdG8gZ2VuZXJhdGUgYSBzZWNvbmQgZmFsbGJhY2sgbmFtZSwgaXRz
Cj4gPiBiZXR0ZXIgdG8ganVzdCBtb2RpZnkgdGhlIGNvbmRpdGlvbiBpbnNpZGUgdGhlIGZ1bmN0
aW9uCj4gPiDigJxhdGgxMGtfY29yZV9jcmVhdGVfYm9hcmRfbmFtZeKAnSB0byBhbGxvdyB0aGUg
Z2VuZXJhdGlvbiBvZiBCREYgdGFnIHVzaW5nCj4gPiBjaGlwIGlkLCBldmVuIOKAnGlmIGFyLT5p
ZC5iZGZfZXh0WzBdID09ICdcMCDigJwuCj4gPiA+Cj4gPiA+IFRoaXMgd2lsbCBtYWtlIHN1cmUg
dGhhdCB0aGUgdmFyaWFudCBzdHJpbmcgaXMgTlVMTCwgYW5kIGp1c3QgYm9hcmQtaWQgYW5kCj4g
PiBjaGlwLWlkIGlzIHVzZWQuIFRoaXMgd2lsbCBoZWxwIGF2b2lkIG1vc3Qgb2YgdGhlIGNvZGUg
Y2hhbmdlcy4KPiA+ID4gVGhlIGNvZGUgd291bGQgbG9vayBhcyBzaG93biBiZWxvdwo+ID4gPgo+
ID4gPiBAQCAtMTQ5Myw3ICsxNDkzLDcgQEAgc3RhdGljIGludCBhdGgxMGtfY29yZV9jcmVhdGVf
Ym9hcmRfbmFtZShzdHJ1Y3QKPiA+IGF0aDEwayAqYXIsIGNoYXIgKm5hbWUsCj4gPiA+ICAgICAg
ICAgfQo+ID4gPgo+ID4gPiAgICAgICAgIGlmIChhci0+aWQucW1pX2lkc192YWxpZCkgewo+ID4g
PiAtICAgICAgICAgICAgICAgaWYgKHdpdGhfdmFyaWFudCAmJiBhci0+aWQuYmRmX2V4dFswXSAh
PSAnXDAnKQo+ID4gPiArICAgICAgICAgICAgICAgaWYgKHdpdGhfdmFyaWFudCkKPiA+Cj4gPiBX
b3VsZG4ndCB0aGUgYWJvdmUganVzdCBiZSAiaWYgKHdpdGhfY2hpcF9pZCkiIGluc3RlYWQ/ICAu
Li5idXQgeWVhaCwKPiA+IHRoYXQgd291bGQgYmUgYSBjbGVhbmVyIHdheSB0byBkbyB0aGlzLiAg
QWJoaXNoZWs6IGRvIHlvdSB3YW50IHRvIHBvc3QKPiA+IGEgdjI/Cj4KPgo+IFRoZSBwYXJhbWV0
ZXIgbmFtZSBwYXNzZWQgdG8gdGhpcyBmdW5jdGlvbiBpcyAid2l0aF92YXJpYW50Iiwgc2luY2Ug
b3RoZXIgbm9uLXFtaSB0YXJnZXRzIChlZyBRQ0E2MTc0KSB1c2UgdGhpcyBhcyBhIGZsYWcgdG8g
anVzdCBhZGQgdGhlIHZhcmlhbnQgZmllbGQuCj4gVGhpcyBjYW4gYmUgcmVuYW1lZCB0byBzb21l
dGhpbmcgbWVhbmluZ2Z1bCBmb3IgYm90aCBxbWkgYW5kIG5vbi1xbWkgdGFyZ2V0cy4KCkkgdGhp
bmsgd2Ugc3RpbGwgbmVlZCBBYmhpc2hlaydzIGNoYW5nZSB0byBoYXZlIHR3byBib29sZWFucyBw
YXNzZWQgdG8KdGhpcyBmdW5jdGlvbiwgdGhvdWdoLCByaWdodD8gIFRodXMsIGl0J2xsIGJlIGNh
bGxlZCAzIHRpbWVzOgoKKiB3aXRoX2NoaXBfaWQgPSBmYWxzZSwgd2l0aF92YXJpYW50ID0gZmFs
c2UKKiB3aXRoX2NoaXBfaWQgPSB0cnVlLCB3aXRoX3ZhcmlhbnQgPSB0cnVlCiogd2l0aF9jaGlw
X2lkID0gdHJ1ZSwgd2l0aF92YXJpYW50ID0gZmFsc2UKClRoZSB0d28gY2FzZXMgeW91IHdhbnQg
dG8gY29tYmluZSBhcmUgYm90aCB3aXRoICJ3aXRoX2NoaXBfaWQgPSB0cnVlIiwKcmlnaHQ/ICBU
aGUgIndpdGhfdmFyaWFudCIgdmFyaWFibGUgYmVpbmcgZmFsc2Ugd2lsbCBtYWtlIHRoZSB2YXJp
YW50CnN0cmluZyBlbXB0eS4KCi1Eb3VnCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBr
Cg==
