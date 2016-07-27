Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bSOdQ-0001LT-3B
 for ath10k@lists.infradead.org; Wed, 27 Jul 2016 13:12:31 +0000
Received: by mail-wm0-x22d.google.com with SMTP id i5so61885351wmg.0
 for <ath10k@lists.infradead.org>; Wed, 27 Jul 2016 06:12:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5798B042.4070604@qti.qualcomm.com>
References: <1469623006-13178-1-git-send-email-vthiagar@qti.qualcomm.com>
 <1469623006-13178-3-git-send-email-vthiagar@qti.qualcomm.com>
 <CA+BoTQ=kUP-Qtw1EWKKfM_aGtJS_4oQdz4tqD5tiJkF_k3-vOA@mail.gmail.com>
 <5798B042.4070604@qti.qualcomm.com>
From: Michal Kazior <michal.kazior@tieto.com>
Date: Wed, 27 Jul 2016 15:12:04 +0200
Message-ID: <CA+BoTQnc5x1+YoW=n3e+iXg13HwZaP_BOS_mJWzOWBY+9s=dAw@mail.gmail.com>
Subject: Re: [PATCH 2/4] ath10k: Add provision for Rx descriptor abstraction
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
To: "Thiagarajan, Vasanthakumar" <vthiagar@qti.qualcomm.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMjcgSnVseSAyMDE2IGF0IDE0OjU5LCBUaGlhZ2FyYWphbiwgVmFzYW50aGFrdW1hcgo8dnRo
aWFnYXJAcXRpLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4gT24gV2VkbmVzZGF5IDI3IEp1bHkgMjAx
NiAwNjoxMyBQTSwgTWljaGFsIEthemlvciB3cm90ZToKPj4gT24gMjcgSnVseSAyMDE2IGF0IDE0
OjM2LCBWYXNhbnRoYWt1bWFyIFRoaWFnYXJhamFuClsuLi5dCj4+PiAtLS0gYS9kcml2ZXJzL25l
dC93aXJlbGVzcy9hdGgvYXRoMTBrL2NvcmUuYwo+Pj4gKysrIGIvZHJpdmVycy9uZXQvd2lyZWxl
c3MvYXRoL2F0aDEway9jb3JlLmMKPj4+IEBAIC02OCw2ICs2OCw3IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgYXRoMTBrX2h3X3BhcmFtcyBhdGgxMGtfaHdfcGFyYW1zX2xpc3RbXSA9IHsKPj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAuYm9hcmRfc2l6ZSA9IFFDQTk4OFhfQk9BUkRfREFUQV9T
WiwKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAuYm9hcmRfZXh0X3NpemUgPSBRQ0E5ODhY
X0JPQVJEX0VYVF9EQVRBX1NaLAo+Pj4gICAgICAgICAgICAgICAgICB9LAo+Pj4gKyAgICAgICAg
ICAgICAgIC5od19yeF9kZXNjX29wcyA9ICZxY2E5ODh4X3J4X2Rlc2Nfb3BzLAo+PiBbLi4uXQo+
Pj4gK3N0cnVjdCBhdGgxMGtfaHdfcnhfZGVzY19vcHMgewo+Pj4gKyAgICAgICBpbnQgKCpyeF9k
ZXNjX2dldF9sM19wYWRfYnl0ZXMpKHN0cnVjdCBodHRfcnhfZGVzYyAqcnhkKTsKPj4+ICt9Owo+
Pgo+PiBCZW5qYW1pbiBpcyB0cnlpbmcgdG8gaW1wbGVtZW50IGNvdmVyYWdlIGNsYXNzIGJ5IHBv
a2luZyBodyByZWdpc3RlcnMKPj4gb3ZlciBmaXJtd2FyZSdzIGhlYWQgWzFdLiBJJ20gdGhpbmtp
bmcgdGhlIGh3X3J4X2Rlc2Nfb3BzIGNvdWxkIGJlCj4+IGdlbmVyYWxpemVkIHRvIGh3X29wcyBz
byBpdCBjYW4gYmUgdXNlZCBmb3IgZG9pbmcgaHctc3BlY2lmaWMgaGFja3MgYXMKPj4gd2VsbC4g
V2hhdCBkbyB5b3UgdGhpbms/Cj4KPiBTdXJlLiBJbnN0ZWFkIG9mIHJld29ya2luZyB0aGlzIHBh
dGNoIHNldCwgY2FuIHRoaXMgYmUgZG9uZSBpbiBhIHNlcGFyYXRlIHBhdGNoPy4KCkkgZG9uJ3Qg
cmVhbGx5IG1pbmQgZXNwZWNpYWxseSBzaW5jZSB0aGVyZSdzIG5vdCBtdWNoIGNvbW1lbnRzIG9u
IGhpcyB3b3JrIHlldC4KCgpNaWNoYcWCCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBr
Cg==
