Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x231.google.com ([2a00:1450:400c:c05::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WnjfY-0002Fa-47
 for ath10k@lists.infradead.org; Fri, 23 May 2014 07:13:32 +0000
Received: by mail-wi0-f177.google.com with SMTP id f8so363240wiw.4
 for <ath10k@lists.infradead.org>; Fri, 23 May 2014 00:13:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87ppj5wyri.fsf@kamboji.qca.qualcomm.com>
References: <1400767955-16313-1-git-send-email-michal.kazior@tieto.com>
 <1400767955-16313-3-git-send-email-michal.kazior@tieto.com>
 <87ppj5wyri.fsf@kamboji.qca.qualcomm.com>
Date: Fri, 23 May 2014 09:13:09 +0200
Message-ID: <CA+BoTQmxGEFSxyw84wQUrkbyq55UqMgwR2Vt+1nd29sTn=g7kQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ath10k: make core registering async
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

T24gMjIgTWF5IDIwMTQgMTg6NDIsIEthbGxlIFZhbG8gPGt2YWxvQHFjYS5xdWFsY29tbS5jb20+
IHdyb3RlOgo+IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGlldG8uY29tPiB3cml0ZXM6
Cj4KPj4gSWYgYXRoMTBrIHdhcyBidWlsdCBpbnRvIHRoZSBrZXJuZWwgaXQgY291bGQgc3RhbGwK
Pj4gYm9vdGluZyBmb3IgMTIwIHNlY29uZHMgYnkgZGVmYXVsdCAoNjAgc2Vjb25kcyBmb3IKPj4g
ZWFjaCBmaXJtd2FyZSBBUEkgdmFyaWFudCkgd2FpdGluZyBmb3IgZmlybXdhcmUKPj4gZmlsZXMg
YmVmb3JlIHVzZXJzcGFjZSB3YXMgcmVhZHkgb3IgZmlsZXN5c3RlbXMKPj4gbW91bnRlZC4KPj4K
Pj4gRml4IHRoaXMgYnkgbWFraW5nIHRoZSBjb3JlIHJlZ2lzdGVyaW5nCj4+IGFzeW5jaHJvbm91
cy4KPj4KPj4gVGhpcyBhbHNvIHNob3ZlcyBvZmYgYWJvdXQgMSBzZWNvbmQgZnJvbSBib290IHRp
bWUKPj4gb24gbW9zdCBzeXN0ZW1zIHNpbmNlIHRoZSBkcml2ZXIgaXMgbm93IG1vc3RseQo+PiBp
bml0aWFsaXplZCBpbiBhIHdvcmtlciBhbmQgbW9kcHJvYmUgdGFrZXMgdmVyeQo+PiBsaXR0bGUg
dGltZSB0byBjb21wbGV0ZS4KPj4KPj4gQXMgYSBzaWRlIGVmZmVjdCB0aGVyZSdzIG5vIHdheSB0
byBwcm9wYWdhdGUKPj4gcmVnaXN0ZXJpbmcgZXJyb3JzIHRvIHRoZSBwY2kgc3Vic3lzdGVtIGJ1
dCB0aGlzCj4+IHByb2JhYmx5IGlzbid0IHJlYWxseSBuZWNlc3NhcnkuCj4+Cj4+IFNpZ25lZC1v
ZmYtYnk6IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGlldG8uY29tPgo+Cj4gWy4uLl0K
Pgo+PiAtLS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3BjaS5jCj4+ICsrKyBi
L2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvcGNpLmMKPj4gQEAgLTI3NTgsOCArMjc1
OCw2IEBAIHN0YXRpYyB2b2lkIGF0aDEwa19wY2lfcmVtb3ZlKHN0cnVjdCBwY2lfZGV2ICpwZGV2
KQo+PiAgICAgICBpZiAoIWFyX3BjaSkKPj4gICAgICAgICAgICAgICByZXR1cm47Cj4+Cj4+IC0g
ICAgIHRhc2tsZXRfa2lsbCgmYXJfcGNpLT5tc2lfZndfZXJyKTsKPgo+IFdoeSB0aGlzPyBUaGF0
J3Mgbm90IG9idmlvdXMgdG8gbWUuCgpJdCBtaWdodCBlbmQgdXAgbm90IGJlaW5nIGluaXRpYWxp
emVkOiBJZiB5b3UsIHNheSwgcXVpY2tseSBpbnNlcnQgYW5kCmVqZWN0IGEgZGV2aWNlIHlvdSBt
aWdodCBub3QgZXZlbiBpbml0aWFsaXplIHRoZSB0YXNrbGV0IChpdCdzIGRvbmUKZWxzZXdoZXJl
OyBJIHN1cHBvc2Ugd2UgY291bGQgbW92ZSBpdCB0b28pIGJlZm9yZSBhdGgxMGtfcGNpX3JlbW92
ZSgpCmlzIGNhbGxlZC4gQWxzbyB0aGUgdGFza2xldCBpcyBhbHJlYWR5IGtpbGxlZCBlbHNld2hl
cmUgb24gdGhlCnRlYXJkb3duIGNvZGUgcGF0aC4KCkknbGwgc3BsaXQgaXQgaW50byBhIHNlcGFy
YXRlIHBhdGNoIHRoYXQgc2ltcGx5IHJlbW92ZXMgdGhpcyBsaW5lIGFzCml0J3MgbWVhbmluZ2xl
c3MgdG8gY2FsbCBpdCBoZXJlIGluIHRoZSBmaXJzdCBwbGFjZS4KCgpNaWNoYcWCCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBs
aXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
