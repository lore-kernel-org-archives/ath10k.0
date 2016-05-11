Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b0RZu-0000gy-FI
 for ath10k@lists.infradead.org; Wed, 11 May 2016 10:41:20 +0000
Received: by mail-wm0-x230.google.com with SMTP id n129so213752006wmn.1
 for <ath10k@lists.infradead.org>; Wed, 11 May 2016 03:40:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1462835475-11079-4-git-send-email-greearb@candelatech.com>
References: <1462835475-11079-1-git-send-email-greearb@candelatech.com>
 <1462835475-11079-4-git-send-email-greearb@candelatech.com>
Date: Wed, 11 May 2016 12:40:56 +0200
Message-ID: <CA+BoTQmbn_6TzfV5eNieD4=B5_CieQ2XRKeXVLKSgfaEQ_2kUg@mail.gmail.com>
Subject: Re: [PATCH 03/21] ath10k: Support setting debug mask from driver code.
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

T24gMTAgTWF5IDIwMTYgYXQgMDE6MTAsICA8Z3JlZWFyYkBjYW5kZWxhdGVjaC5jb20+IHdyb3Rl
Ogo+IEZyb206IEJlbiBHcmVlYXIgPGdyZWVhcmJAY2FuZGVsYXRlY2guY29tPgo+Cj4gTWlnaHQg
d2FudCB0byB0dXJuIG9mZiB2ZXJib3NlIGRlYnVnIGFzIHNvb24gYXMgeW91Cj4gc2VlIGEgZmly
bXdhcmUgY3Jhc2gsIGZvciBpbnN0YW5jZS4gIEhlbHBzIGtlZXAgZG1lc2cKPiBvdXRwdXQgZnJv
bSBvdmVyLXJ1bm5pbmcgdGhlIHN0dWZmIHlvdSBjYXJlIGFib3V0Lgo+Cj4gU2lnbmVkLW9mZi1i
eTogQmVuIEdyZWVhciA8Z3JlZWFyYkBjYW5kZWxhdGVjaC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMv
bmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvZGVidWcuYyB8IDUgKysrKysKPiAgZHJpdmVycy9uZXQv
d2lyZWxlc3MvYXRoL2F0aDEway9kZWJ1Zy5oIHwgMSArCj4gIDIgZmlsZXMgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0
aDEway9kZWJ1Zy5jIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9kZWJ1Zy5jCj4g
aW5kZXggZTI1MTE1NS4uYTY4OWJmMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL25ldC93aXJlbGVz
cy9hdGgvYXRoMTBrL2RlYnVnLmMKPiArKysgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRo
MTBrL2RlYnVnLmMKPiBAQCAtMTk0LDYgKzE5NCwxMSBAQCB2b2lkIGF0aDEwa19wcmludF9kcml2
ZXJfaW5mbyhzdHJ1Y3QgYXRoMTBrICphcikKPiAgfQo+ICBFWFBPUlRfU1lNQk9MKGF0aDEwa19w
cmludF9kcml2ZXJfaW5mbyk7Cj4KPiArdm9pZCBhdGgxMGtfc2V0X2RlYnVnX21hc2sodW5zaWdu
ZWQgaW50IHYpIHsKClRoZSB7IHNob3VsZCBiZSBvbiBuZXcgbGluZS4KCgo+ICsgICAgICAgYXRo
MTBrX2RlYnVnX21hc2sgPSB2Owo+ICt9Cj4gK0VYUE9SVF9TWU1CT0woYXRoMTBrX3NldF9kZWJ1
Z19tYXNrKTsKCkkgZGlkbid0IHNlZSBhbnkgdXNlcyBvZiB0aGlzIGluIHlvdXIgcGF0Y2hzZXQg
KGl0J3MgY29tbWVudGVkIG91dCBpbgoyMS8yMSkgYW5kIEknbSBub3QgZnVsbHkgY29udmluY2Vk
IGl0J3MgYSBnb29kIGlkZWEgdG8gb3ZlcnJpZGUKZGVidWdfbWFzayBsaWtlIHRoYXQuIE9uY2Ug
SSBzZXQgYSBkZWJ1Z19tYXNrIEkgZXhwZWN0IGl0IHRvIHN0YXkKdW5jaGFuZ2VkLiBXaGF0IGlm
IEkgZG8gd2FudCB0byB0cmFjZSB3aGF0IGhhcHBlbnMgYWZ0ZXIgZncgY3Jhc2g/CgpXb3VsZG4n
dCBpdCBiZSBiZXR0ZXIgdG8gaGF2ZSBhIGtub2IgdG8gdGVsbCBhdGgxMGsgd2hldGhlciBodwpy
ZWNvdmVyeSBzaG91bGQgYmUgYXV0b21hdGljIG9yIG1hbnVhbD8KCgpNaWNoYcWCCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBs
aXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
