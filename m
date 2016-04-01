Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1alsHQ-0001eu-TH
 for ath10k@lists.infradead.org; Fri, 01 Apr 2016 06:10:02 +0000
Received: by mail-wm0-x22f.google.com with SMTP id 191so8127631wmq.0
 for <ath10k@lists.infradead.org>; Thu, 31 Mar 2016 23:09:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1459457986-29222-3-git-send-email-greearb@candelatech.com>
References: <1459457986-29222-1-git-send-email-greearb@candelatech.com>
 <1459457986-29222-3-git-send-email-greearb@candelatech.com>
Date: Fri, 1 Apr 2016 08:09:39 +0200
Message-ID: <CA+BoTQkL5OM-QLVVe0RHEOoN-Vj4a0+U9EfaUf=2n+PO3mPDyQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] ath10k: Add BUG_ON if we over-write peer-map pointer.
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

T24gMzEgTWFyY2ggMjAxNiBhdCAyMjo1OSwgIDxncmVlYXJiQGNhbmRlbGF0ZWNoLmNvbT4gd3Jv
dGU6Cj4gRnJvbTogQmVuIEdyZWVhciA8Z3JlZWFyYkBjYW5kZWxhdGVjaC5jb20+Cj4KPiBOb3Qg
c3VyZSB0aGlzIGNhbiBoYXBwZW4sIGJ1dCBzZWVtcyBsaWtlIGEgcmVhc29uYWJsZSBzYW5pdHkK
PiBjaGVjay4KPgo+IFNpZ25lZC1vZmYtYnk6IEJlbiBHcmVlYXIgPGdyZWVhcmJAY2FuZGVsYXRl
Y2guY29tPgo+IC0tLQo+ICBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3R4cnguYyB8
IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3R4cnguYyBiL2RyaXZlcnMvbmV0L3dpcmVs
ZXNzL2F0aC9hdGgxMGsvdHhyeC5jCj4gaW5kZXggOTRjMjdmNi4uMTcyYjFkNiAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3R4cnguYwo+ICsrKyBiL2RyaXZl
cnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvdHhyeC5jCj4gQEAgLTMwOSw2ICszMDksNyBAQCB2
b2lkIGF0aDEwa19wZWVyX21hcF9ldmVudChzdHJ1Y3QgYXRoMTBrX2h0dCAqaHR0LAo+ICAgICAg
ICAgYXRoMTBrX3dhcm4oYXIsIC8qQVRIMTBLX0RCR19IVFQsKi8gImh0dCBwZWVyIG1hcCB2ZGV2
ICVkIHBlZXIgJXBNIGlkICVkXG4iLAo+ICAgICAgICAgICAgICAgICAgICBldi0+dmRldl9pZCwg
ZXYtPmFkZHIsIGV2LT5wZWVyX2lkKTsKPgo+ICsgICAgICAgQlVHX09OKGFyLT5wZWVyX21hcFtl
di0+cGVlcl9pZF0gJiYgKGFyLT5wZWVyX21hcFtldi0+cGVlcl9pZF0gIT0gcGVlcikpOwoKRG9l
cyB0aGlzIHJlYWxseSBuZWVkIHRvIGJlIGEgQlVHX09OPwoKCk1pY2hhxYIKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QK
YXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hdGgxMGsK
