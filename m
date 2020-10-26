Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vs1-xe42.google.com ([2607:f8b0:4864:20::e42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXBKs-00032g-6U
 for ath10k@lists.infradead.org; Mon, 26 Oct 2020 22:51:31 +0000
Received: by mail-vs1-xe42.google.com with SMTP id w25so5701539vsk.9
 for <ath10k@lists.infradead.org>; Mon, 26 Oct 2020 15:51:28 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com.
 [209.85.217.49])
 by smtp.gmail.com with ESMTPSA id b15sm337798vsq.4.2020.10.26.15.51.25
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2020 15:51:25 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id e3so5702633vsr.8
 for <ath10k@lists.infradead.org>; Mon, 26 Oct 2020 15:51:25 -0700 (PDT)
MIME-Version: 1.0
References: <20201020000506.1.Ifbc28707942179f1cefc7491e995814564495270@changeid>
 <CAD=FV=Xv7Usev=S_ViWPPsa0xL42KDymjEkqJF7S4CzDiuxP3g@mail.gmail.com>
 <CACTWRwtqcMxZKhDR-Q+3CyOw0Ju=iR+ZMg2pVrHEuzbOUebjOg@mail.gmail.com>
 <001a01d6aa24$6ceaf390$46c0dab0$@codeaurora.org>
In-Reply-To: <001a01d6aa24$6ceaf390$46c0dab0$@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 26 Oct 2020 15:51:13 -0700
Message-ID: <CAD=FV=X5cVdMq9H+cABHmscZvJpswqGZONjqv7FL8kqRNvuHnQ@mail.gmail.com>
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

SGksCgpPbiBTYXQsIE9jdCAyNCwgMjAyMCBhdCA5OjQwIEFNIFJha2VzaCBQaWxsYWkgPHBpbGxh
aXJAY29kZWF1cm9yYS5vcmc+IHdyb3RlOgo+Cj4gPiAgICAgICAgIGlmIChiZF9pZV90eXBlID09
IEFUSDEwS19CRF9JRV9CT0FSRCkgewo+ID4gKyAgICAgICAgICAgICAgIC8qIFdpdGggdmFyaWFu
dCBhbmQgY2hpcCBpZCAqLwo+ID4gICAgICAgICAgICAgICAgIHJldCA9IGF0aDEwa19jb3JlX2Ny
ZWF0ZV9ib2FyZF9uYW1lKGFyLCBib2FyZG5hbWUsCj4gPiAtICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKGJvYXJkbmFtZSksIHRydWUpOwo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9m
KGJvYXJkbmFtZSksIHRydWUsIHRydWUpOwo+Cj4gSW5zdGVhZCBvZiBhZGRpbmcgYSBsb3Qgb2Yg
Y29kZSB0byBnZW5lcmF0ZSBhIHNlY29uZCBmYWxsYmFjayBuYW1lLCBpdHMgYmV0dGVyIHRvIGp1
c3QgbW9kaWZ5IHRoZSBjb25kaXRpb24gaW5zaWRlIHRoZSBmdW5jdGlvbiDigJxhdGgxMGtfY29y
ZV9jcmVhdGVfYm9hcmRfbmFtZeKAnSB0byBhbGxvdyB0aGUgZ2VuZXJhdGlvbiBvZiBCREYgdGFn
IHVzaW5nIGNoaXAgaWQsIGV2ZW4g4oCcaWYgYXItPmlkLmJkZl9leHRbMF0gPT0gJ1wwIOKAnC4K
Pgo+IFRoaXMgd2lsbCBtYWtlIHN1cmUgdGhhdCB0aGUgdmFyaWFudCBzdHJpbmcgaXMgTlVMTCwg
YW5kIGp1c3QgYm9hcmQtaWQgYW5kIGNoaXAtaWQgaXMgdXNlZC4gVGhpcyB3aWxsIGhlbHAgYXZv
aWQgbW9zdCBvZiB0aGUgY29kZSBjaGFuZ2VzLgo+IFRoZSBjb2RlIHdvdWxkIGxvb2sgYXMgc2hv
d24gYmVsb3cKPgo+IEBAIC0xNDkzLDcgKzE0OTMsNyBAQCBzdGF0aWMgaW50IGF0aDEwa19jb3Jl
X2NyZWF0ZV9ib2FyZF9uYW1lKHN0cnVjdCBhdGgxMGsgKmFyLCBjaGFyICpuYW1lLAo+ICAgICAg
ICAgfQo+Cj4gICAgICAgICBpZiAoYXItPmlkLnFtaV9pZHNfdmFsaWQpIHsKPiAtICAgICAgICAg
ICAgICAgaWYgKHdpdGhfdmFyaWFudCAmJiBhci0+aWQuYmRmX2V4dFswXSAhPSAnXDAnKQo+ICsg
ICAgICAgICAgICAgICBpZiAod2l0aF92YXJpYW50KQoKV291bGRuJ3QgdGhlIGFib3ZlIGp1c3Qg
YmUgImlmICh3aXRoX2NoaXBfaWQpIiBpbnN0ZWFkPyAgLi4uYnV0IHllYWgsCnRoYXQgd291bGQg
YmUgYSBjbGVhbmVyIHdheSB0byBkbyB0aGlzLiAgQWJoaXNoZWs6IGRvIHlvdSB3YW50IHRvIHBv
c3QKYSB2Mj8KCi1Eb3VnCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
