Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22c.google.com ([2a00:1450:400c:c05::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wz1LT-0004BO-0J
 for ath10k@lists.infradead.org; Mon, 23 Jun 2014 10:19:27 +0000
Received: by mail-wi0-f172.google.com with SMTP id hi2so3866712wib.11
 for <ath10k@lists.infradead.org>; Mon, 23 Jun 2014 03:19:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1400769683.4174.25.camel@jlt4.sipsolutions.net>
References: <1400767955-16313-1-git-send-email-michal.kazior@tieto.com>
 <1400767955-16313-3-git-send-email-michal.kazior@tieto.com>
 <1400769683.4174.25.camel@jlt4.sipsolutions.net>
Date: Mon, 23 Jun 2014 12:19:03 +0200
Message-ID: <CA+BoTQk=DU=-HzVo-XsQTpCt6CS7aXxQMy5hTyQ7qC56ebBLZQ@mail.gmail.com>
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

SGkgSm9oYW5uZXMsCgoKT24gMjIgTWF5IDIwMTQgMTY6NDEsIEpvaGFubmVzIEJlcmcgPGpvaGFu
bmVzQHNpcHNvbHV0aW9ucy5uZXQ+IHdyb3RlOgo+IE9uIFRodSwgMjAxNC0wNS0yMiBhdCAxNjox
MiArMDIwMCwgTWljaGFsIEthemlvciB3cm90ZToKPgo+PiBBcyBhIHNpZGUgZWZmZWN0IHRoZXJl
J3Mgbm8gd2F5IHRvIHByb3BhZ2F0ZQo+PiByZWdpc3RlcmluZyBlcnJvcnMgdG8gdGhlIHBjaSBz
dWJzeXN0ZW0gYnV0IHRoaXMKPj4gcHJvYmFibHkgaXNuJ3QgcmVhbGx5IG5lY2Vzc2FyeS4KPgo+
IFlvdSBzaG91bGQgcHJvYmFibHkgdW5iaW5kIGlmIGl0IGZhaWxzIC0gaXdsd2lmaSBkb2VzIHRo
YXQuCgpIbW0uLgoKQXMgaXQgc3RhbmRzIGF0aDEwayBub3cgZGVhZGxvY2tzIHdoZW4gZmlybXdh
cmUgcHJvYmluZyB3b3JrZXIgZmFpbHMKYW5kIGNhbGxzIGRldmljZV9yZWxlYXNlX2RyaXZlcigp
LiBUaGlzIGluZGlyZWN0bHkgaGl0cyBwY2kgcmVtb3ZlKCkKY2FsbGJhY2sgd2hpY2ggd2FpdHMg
Zm9yIHRoZSB3b3JrZXIuIE9vcHMuCgpTbyBJJ3ZlIHRha2VuIGEgbG9vayBob3cgb3RoZXIgZHJp
dmVyIGRvIGl0IHNvIEkgY2FuIGNvbWUgdXAgd2l0aCBhCnNvbHV0aW9uIC0gbW9zdCBvZiB0aGVt
IHNlZW0gdXNlIGNvbXBsZXRpb25zLiBBZnRlciB0YWtpbmcgYSBjbG9zZXIKbG9vayBJIGNhbWUg
dG8gYSBjb25jbHVzaW9uIHRoaXMgaXMgaW5oZXJlbnRseSByYWN5IHRvby4gQ29uc2lkZXIgdGhl
CmZvbGxvd2luZyBzY2VuYXJpbzoKCiBbc3lzY2FsbF0KIGluc21vZAogcGNpLT5wcm9iZSgpCiBx
dWV1ZV93b3JrKCkKIHJldHVybgogW3dvcmtlcl0KIHByb2JlX2Z3KCkKIFtzeXNjYWxsXQogcm1t
b2QKIGRldl9sb2NrKCkKIHBjaS0+cmVtb3ZlKCkKIHdhaXRfZm9yX2NvbXBsZXRpb24oKQogW3dv
cmtlcl0KIGNvbXBsZXRlX2FsbCgpCiBkZXZpY2VfcmVsZWFzZV9kcml2ZXIoKQogZGV2X2xvY2so
KQoge2FscmVhZHkgaGVsZCwgeWllbGR9CiBbc3lzY2FsbF0KIGZyZWUoaW50ZXJuYWwgc3RydWN0
dXJlcykKIGRldl91bmxvY2soKQogcmV0dXJuCiBbd29ya2VyXQoge3dva2VuIHVwLCBidXQgZGV2
LT5kcml2ZXIgPT0gTlVMTCBzbyBubyBjYWxsYmFja3N9CiBkZXZfdW5sb2NrKCkKIHJldHVybgoK
VGhlIGRyaXZlciBjb2RlIHNlY3Rpb24gbWF5IG5vdCBiZSByZWFjaGFibGUgYW55bW9yZSB1cG9u
IHdvcmtlcgpyZXR1cm5pbmcgZnJvbSB0aGUgZGV2aWNlX3JlbGVhc2VfZHJpdmVyKCkgY2FsbCwg
cmlnaHQ/IEFsc28gc2luY2UKYXRoMTBrIHVzZXMgYW4gaW50ZXJuYWwgd29ya2VyIGl0IGFsc28g
bWVhbnMgdGhlIHdvcmtfc3RydWN0IHdvdWxkIGJlCmFscmVhZHkgZnJlZWQgYnkgdGhlIHN5c2Nh
bGwgZmxvdyAoaS5lLiB3b3JrZXIgd291bGQgcnVuIGFmdGVyIGRyaXZlcgpoYXMgc3VwcG9zZWRs
eSBiZWVuIGNsZWFuZWQgdXAuLikuIEV2ZW4gaWYgYXRoMTBrIHdhcyB0byB1c2UKcmVxdWVzdF9m
aXJtd2FyZV9ub3dhaXQoKSwgd2hpY2ggYWxsb2NhdGVzIGEgdGVtcG9yYXJ5IHdvcmtfc3RydWN0
LAp0aGUgdW5yZWFjaGFibGUgY29kZSBzZWN0aW9uIHN0aWxsIHJlbWFpbnMgYSBwcm9ibGVtLgoK
T3IgbWF5YmUgdGhpcyBpc24ndCByZWFsbHkgYSBwcm9ibGVtIGFuZC9vciBJJ20gbWlzc2luZyBz
b21ldGhpbmc/CgoKTWljaGHFggoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
