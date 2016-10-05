Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi0-x232.google.com ([2607:f8b0:4003:c06::232])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1brpFq-0007m9-4G
 for ath10k@lists.infradead.org; Wed, 05 Oct 2016 16:41:14 +0000
Received: by mail-oi0-x232.google.com with SMTP id r126so279555281oib.0
 for <ath10k@lists.infradead.org>; Wed, 05 Oct 2016 09:40:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQkwSX954pPEh3oYzL62H9y4Y6UuPVLSxxxCkM5AznY7NA@mail.gmail.com>
References: <1473801118-103112-1-git-send-email-mfaltesek@google.com>
 <CA+BoTQkwSX954pPEh3oYzL62H9y4Y6UuPVLSxxxCkM5AznY7NA@mail.gmail.com>
From: Marty Faltesek <mfaltesek@google.com>
Date: Wed, 5 Oct 2016 12:40:52 -0400
Message-ID: <CAOiWkA9W6JSfPScK0PwffUnWuv4ZXQD4AF1s2FbMq0MmmasLrg@mail.gmail.com>
Subject: Re: [PATCH] ath10k: cache calibration data when the core is stopped.
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gTW9uLCBPY3QgMywgMjAxNiBhdCA0OjAyIEFNLCBNaWNoYWwgS2F6aW9yIDxtaWNoYWwua2F6
aW9yQHRpZXRvLmNvbT4gd3JvdGU6Cj4gT24gMTMgU2VwdGVtYmVyIDIwMTYgYXQgMjM6MTEsIE1h
cnR5IEZhbHRlc2VrIDxtZmFsdGVzZWtAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4gWy4uLl0KPj4gK2lu
dAo+PiArYXRoMTBrX2NhbF9kYXRhX2FsbG9jKHN0cnVjdCBhdGgxMGsgKmFyLCB2b2lkICoqYnVm
KQo+PiArewo+PiArICAgICAgIHUzMiBoaV9hZGRyOwo+PiArICAgICAgIF9fbGUzMiBhZGRyOwo+
PiArICAgICAgIGludCByZXQ7Cj4+ICsKPj4gKyAgICAgICB2ZnJlZSgqYnVmKTsKPj4gKyAgICAg
ICAqYnVmID0gdm1hbGxvYyhRQ0E5ODhYX0NBTF9EQVRBX0xFTik7Cj4KPiBTaG91bGRuJ3QgeW91
IHVzZSBhci0+aHdfcGFyYW1zIHRvIGdldCBody1zcGVjaWZpYyBjYWxkYXRhIGxlbmd0aD8KCnl1
cCwgaXQgd2FzIGJlY2F1c2Ugd2Ugd2VyZSBiYXNlZCBvbiBiYWNrcG9ydHMgZnJvbSBlYXJsaWVy
IHRoaXMgeWVhci4KCj4KPgo+IFsuLi5dCj4+IEBAIC0xNzE0LDYgKzE3NTAsMTIgQEAgaW50IGF0
aDEwa19jb3JlX3N0YXJ0KHN0cnVjdCBhdGgxMGsgKmFyLCBlbnVtIGF0aDEwa19maXJtd2FyZV9t
b2RlIG1vZGUpCj4+Cj4+ICAgICAgICAgSU5JVF9MSVNUX0hFQUQoJmFyLT5hcnZpZnMpOwo+Pgo+
PiArICAgICAgIC8qCj4+ICsgICAgICAgICogV2UgYXJlIHVwIG5vdywgc28gbm8gbmVlZCB0byBj
YWNoZSBjYWxpYnJhdGlvbiBkYXRhLgo+PiArICAgICAgICAqLwo+Cj4gVGhlIGNvbW1lbnQgc3R5
bGUgaXM6Cj4KPiAgLyogY29tbWVudCAqLwo+Cj4gSWYgaXQncyBtdWx0aS1saW5lIGl0IHNob3Vs
ZCBiZToKPgo+ICAvKiBjb21tZW50Cj4gICAqIGNvbW1lbnQKPiAgICovCj4KPiBEaXR0byBmb3Ig
b3RoZXIgaW5zdGFuY2VzLgoKZml4ZWQsIHRoYW5rcy4KCj4KPgo+IFsuLi5dCj4+IEBAIC0xNzU3
LDYgKzE3OTksMTEgQEAgdm9pZCBhdGgxMGtfY29yZV9zdG9wKHN0cnVjdCBhdGgxMGsgKmFyKQo+
PiAgICAgICAgIGxvY2tkZXBfYXNzZXJ0X2hlbGQoJmFyLT5jb25mX211dGV4KTsKPj4gICAgICAg
ICBhdGgxMGtfZGVidWdfc3RvcChhcik7Cj4+Cj4+ICsgICAgICAgLyoKPj4gKyAgICAgICAgKiBD
YWNoZSBjYWNsaWJyYXRpb24gZGF0YSB3aGlsZSBzdG9wcGVkLgo+Cj4gdHlwby4gImNhbGlicmF0
aW9uIgo+Cj4KPiBNaWNoYcWCCgpmaXhlZCB0aGFua3MuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vYXRoMTBrCg==
