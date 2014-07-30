Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x234.google.com ([2a00:1450:400c:c05::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XCNBV-0001TF-CI
 for ath10k@lists.infradead.org; Wed, 30 Jul 2014 06:16:22 +0000
Received: by mail-wi0-f180.google.com with SMTP id n3so1681500wiv.13
 for <ath10k@lists.infradead.org>; Tue, 29 Jul 2014 23:15:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CALCETrUrqGzGvzbjyc2uMo0cA3HWZi=roPx0vFJRxEY7ii_PBA@mail.gmail.com>
References: <CALCETrUXvbhkKDAvEw+643mKZtJzcJtPGhxbo35r3h=rCMOWwA@mail.gmail.com>
 <87vbqqwoks.fsf@kamboji.qca.qualcomm.com>
 <CALCETrXtvTyFbc0RM0kHcW_UiX+eurRTdp0vdQER2ysUrd4FcQ@mail.gmail.com>
 <CA+BoTQ=q-Xfk6+FwcT7yLd+YpcZobNVhszfwhLHeyL3XExps4w@mail.gmail.com>
 <CALCETrUrqGzGvzbjyc2uMo0cA3HWZi=roPx0vFJRxEY7ii_PBA@mail.gmail.com>
Date: Wed, 30 Jul 2014 08:15:55 +0200
Message-ID: <CA+BoTQkq9N6uGRYSh=T_8Wrv7XgiGtzjG3fQwOE_B69ayF==Zw@mail.gmail.com>
Subject: Re: ath10k tx to a Macbook Pro stalls
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
To: Andy Lutomirski <luto@amacapital.net>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMjkgSnVseSAyMDE0IDE5OjUyLCBBbmR5IEx1dG9taXJza2kgPGx1dG9AYW1hY2FwaXRhbC5u
ZXQ+IHdyb3RlOgo+IE9uIE1vbiwgSnVsIDI4LCAyMDE0IGF0IDExOjI2IFBNLCBNaWNoYWwgS2F6
aW9yIDxtaWNoYWwua2F6aW9yQHRpZXRvLmNvbT4gd3JvdGU6Cj4+IE9uIDIyIEp1bHkgMjAxNCAw
NjoxMiwgQW5keSBMdXRvbWlyc2tpIDxsdXRvQGFtYWNhcGl0YWwubmV0PiB3cm90ZToKPj4+IE9u
IE1vbiwgSnVsIDIxLCAyMDE0IGF0IDExOjMxIEFNLCBLYWxsZSBWYWxvIDxrdmFsb0BxY2EucXVh
bGNvbW0uY29tPiB3cm90ZToKPj4+PiBBbmR5IEx1dG9taXJza2kgPGx1dG9AYW1hY2FwaXRhbC5u
ZXQ+IHdyaXRlczoKWy4uLl0KPj4+IERvZXMgdGhpcyBtZWFuIHRoYXQgdGhlIE1CUCBpcyBmYWls
aW5nIHRvIG5vdGljZSBUSU0gZW50cmllcywgb3IgdGhhdAo+Pj4gYXRoMTBrIHNvbWVob3cgc3Rv
cHMgYnVmZmVyaW5nIHBhY2tldHMgdG8gcG93ZXItc2F2aW5nIHN0YXRpb25zPwo+Pgo+PiBEbyB5
b3UgaGF2ZSB1LUFQU0QgZW5hYmxlZCBpbiB5b3VyIE9wZW5XUlQgY29uZmlndXJhdGlvbiBieSBh
bnkgY2hhbmNlPwo+Cj4gSG93IGRvIEkgdGVsbD8gIFRoZSBkb2NzIHNlZW0gb3V0IG9mIGRhdGUg
aGVyZS4gIEkgaGF2ZToKPgo+IGNvbmZpZyB3aWZpLWRldmljZSAncmFkaW8wJwo+ICAgICBvcHRp
b24gdHlwZSAnbWFjODAyMTEnCj4gICAgIG9wdGlvbiBod21vZGUgJzExYScKPiAgICAgb3B0aW9u
IHBhdGggJ3BjaTAwMDA6MDEvMDAwMDowMTowMC4wJwo+ICAgICBvcHRpb24gaHRtb2RlICdWSFQ4
MCcKPiAgICAgI29wdGlvbiBodG1vZGUgJ0hUNDAnCj4gICAgIG9wdGlvbiBkaXNhYmxlZCAnMCcK
PiAgICAgb3B0aW9uIGNoYW5uZWwgJzE0OScKPgo+IFRoZSByZWxldmFudCBwYXJ0IChJIHRoaW5r
KSBvZiAvdmFyL3J1bi9ob3N0YXBkLmNvbmYgaXM6Cj4KPiBpZWVlODAyMTFuPTEKPiBodF9jYXBh
Yj1bSFQ0MCtdW0xEUENdW1NIT1JULUdJLTIwXVtTSE9SVC1HSS00MF1bVFgtU1RCQ11bUlgtU1RC
QzFdW0RTU1NfQ0NLLTQwCj4gXQo+IHZodF9vcGVyX2Nod2lkdGg9MQo+IHZodF9vcGVyX2NlbnRy
X2ZyZXFfc2VnMF9pZHg9MTU1Cj4gaWVlZTgwMjExYWM9MQo+IHZodF9jYXBhYj1bUlhMRFBDXVtT
SE9SVC1HSS04MF1bVFgtU1RCQy0yQlkxXVtSWC1BTlRFTk5BLVBBVFRFUk5dW1RYLUFOVEVOTkEt
UEEKPiBUVEVSTl1bUlgtU1RCQzFdW01BWC1NUERVLTExNDU0XVtNQVgtQS1NUERVLUxFTi1FWFA3
XQoKRG8geW91IGhhdmUgYHVhcHNkX2FkdmVydGlzZW1lbnRfZW5hYmxlZD0xYCBzZXQgaW4gL3Zh
ci9ydW4vaG9zdGFwZC5jb25mPwoKCk1pY2hhxYIKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
dGgxMGsK
