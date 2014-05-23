Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22c.google.com ([2a00:1450:400c:c05::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wnkzz-0000eN-FL
 for ath10k@lists.infradead.org; Fri, 23 May 2014 08:38:44 +0000
Received: by mail-wi0-f172.google.com with SMTP id hi2so457188wib.5
 for <ath10k@lists.infradead.org>; Fri, 23 May 2014 01:38:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87oayovr1m.fsf@kamboji.qca.qualcomm.com>
References: <1399637749-13489-1-git-send-email-michal.kazior@tieto.com>
 <1400143324-14911-1-git-send-email-michal.kazior@tieto.com>
 <1400143324-14911-4-git-send-email-michal.kazior@tieto.com>
 <87oayovr1m.fsf@kamboji.qca.qualcomm.com>
Date: Fri, 23 May 2014 10:38:20 +0200
Message-ID: <CA+BoTQmJTsh3Kcwmqx19WAzoBhYrhkQaPT_S=JFVPptkVaaKyw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] ath10k: drain tx before restarting hw
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

T24gMjMgTWF5IDIwMTQgMTA6MjcsIEthbGxlIFZhbG8gPGt2YWxvQHFjYS5xdWFsY29tbS5jb20+
IHdyb3RlOgo+IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGlldG8uY29tPiB3cml0ZXM6
Cj4KPj4gVGhpcyBtYWtlcyBzdXJlIG5vIGZ1cnRoZXIgdHggcmVxdWVzdHMgYXJlCj4+IHN1Ym1p
dHRlZCB0byBIVFQgYmVmb3JlIGRyaXZlciB0ZWFyZG93bi4KPj4KPj4gVGhpcyBzaG91bGQgcHJl
dmVudCBpbnZhbGlkIHBvaW50ZXIvTlVMTAo+PiBkZXJlZmVyZW5jZSBvbiBodHQgdHggcG9vbCBp
biBhdGgxMGtfaHR0X3R4KCkgaW4KPj4gc29tZSBjYXNlcyBvZiBoZWF2eSB0cmFmZmljLgo+Pgo+
PiBSZXBvcnRlZC1CeTogQmVuIEdyZWVhciA8Z3JlZWFyYkBjYW5kZWxhdGVjaC5jb20+Cj4+IFNp
Z25lZC1vZmYtYnk6IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGlldG8uY29tPgo+Cj4g
Wy4uLl0KPgo+PiAtLS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL21hYy5jCj4+
ICsrKyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvbWFjLmMKPj4gQEAgLTIyODks
NiArMjI4OSwyMSBAQCBzdGF0aWMgdm9pZCBhdGgxMGtfdHgoc3RydWN0IGllZWU4MDIxMV9odyAq
aHcsCj4+ICAvKgo+PiAgICogSW5pdGlhbGl6ZSB2YXJpb3VzIHBhcmFtZXRlcnMgd2l0aCBkZWZh
dWx0IHZhdWxlcy4KPj4gICAqLwo+PiArc3RhdGljIHZvaWQgYXRoMTBrX2RyYWluX3R4KHN0cnVj
dCBhdGgxMGsgKmFyKQo+PiArewo+PiArICAgICAvKiB3b3JrZXJzIGNhbiBob2xkIGNvbmZfbXV0
ZXggLS0gYXZvaWQgZGVhZGxvY2sgKi8KPj4gKyAgICAgV0FSTl9PTihsb2NrZGVwX2lzX2hlbGQo
JmFyLT5jb25mX211dGV4KSk7Cj4KPiBJZiBDT05GSUdfTE9DS0RFUCBpcyBkaXNhYmxlZCB0aGlz
IHdpbGwgZmFpbCB3aXRoOgo+Cj4gZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9tYWMu
YzoyMzAxOjI6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAnbG9ja2Rl
cF9pc19oZWxkJyBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KPgo+IEkg
d2Fzbid0IGFibGUgdG8gY29tZSB1cCB3aXRoIGFueSBvdGhlciB3YXkgdGhhbiBhZGRpbmcgJyNp
ZmRlZgo+IENPTkZJR19MT0NLREVQJyB3aGljaCBpcyBxdWl0ZSB1Z2x5LiBXaGF0IHNob3VsZCB3
ZSBkbz8KCkkgZ3Vlc3Mgd2UgY291bGQgZGVmaW5lIGxvY2tkZXBfYXNzZXJ0X25vdF9oZWxkKCkg
aW4gZGVidWcuaD8KCgpNaWNoYcWCCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
