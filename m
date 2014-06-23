Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22f.google.com ([2a00:1450:400c:c05::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wz3qu-00021U-Os
 for ath10k@lists.infradead.org; Mon, 23 Jun 2014 13:00:05 +0000
Received: by mail-wi0-f175.google.com with SMTP id r20so4294880wiv.8
 for <ath10k@lists.infradead.org>; Mon, 23 Jun 2014 05:59:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1403526767.4418.24.camel@jlt4.sipsolutions.net>
References: <1400767955-16313-1-git-send-email-michal.kazior@tieto.com>
 <1400767955-16313-3-git-send-email-michal.kazior@tieto.com>
 <1400769683.4174.25.camel@jlt4.sipsolutions.net>
 <CA+BoTQk=DU=-HzVo-XsQTpCt6CS7aXxQMy5hTyQ7qC56ebBLZQ@mail.gmail.com>
 <1403524278.4418.19.camel@jlt4.sipsolutions.net>
 <CA+BoTQ=fpkOZXVgJt-OWdgSFX1_sO1g1E=J-7NnOb+e6a30FVA@mail.gmail.com>
 <1403526767.4418.24.camel@jlt4.sipsolutions.net>
Date: Mon, 23 Jun 2014 14:59:42 +0200
Message-ID: <CA+BoTQnvRgfObtvJcVj3np6LSRSHr_2uEfqRpOw59fuy88xnYQ@mail.gmail.com>
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

T24gMjMgSnVuZSAyMDE0IDE0OjMyLCBKb2hhbm5lcyBCZXJnIDxqb2hhbm5lc0BzaXBzb2x1dGlv
bnMubmV0PiB3cm90ZToKPiBPbiBNb24sIDIwMTQtMDYtMjMgYXQgMTQ6MTcgKzAyMDAsIE1pY2hh
bCBLYXppb3Igd3JvdGU6Cj4KPj4gPiBTZWVtcyBsaWtlIHRvIGZpeCBpdCB3ZSBqdXN0IG5lZWQg
dG8gZ2V0IGEgbW9kdWxlIHJlZmVyZW5jZSB0aG91Z2g/IENhbgo+PiA+IGEgbW9kdWxlIHB1dCgp
IGl0c2VsZiB0aG91Z2g/IEhtbW0uCj4+Cj4+IEl0IHNlZW1zIHNvbWUgZHJpdmVycyB1c2UgbW9k
dWxlX3B1dChUSElTX01PRFVMRSkgYW5kCj4+IF9fbW9kdWxlX2dldChUSElTX01PRFVMRSksIGUu
Zy4gdHVuL3RhcCBkcml2ZXIuCj4KPiBJIGRvbid0IHNlZSBob3cgdGhpcyBpc24ndCByYWN5IGlu
IHNpbWlsYXIgd2F5cyB0aG91Z2g/CgpJIHRoaW5rIHR1bi90YXAgdXNlcyBpdCBmb3IgZGlmZmVy
ZW50IHB1cnBvc2VzLgoKCj4+IEJ1dCBkb2VzIHRoaXMgYnVtcCB1cCB0aGUgbW9kdWxlIHJlZmNv
dW50IGluIHN1Y2ggYSB3YXkgdGhhdCBhbgo+PiBpbi1wcm9ncmVzcyBybW1vZCB3aWxsIHdhaXQv
YmxvY2sgdW50aWwgdGhlIHJlZmNvdW50IHJlYWNoZXMgMD8KPgo+IEl0IHNob3VsZCwgeWVzLCBi
dXQgeW91IHJhY2Ugb25jZSB5b3UgZG8gbW9kdWxlX3B1dCgpLCBubz8KCkl0J3Mgc3RpbGwgcmFj
eSwgSSBhZ3JlZS4KCkkgZG9uJ3Qgc2VlIGhvdyBkZXZpY2VfcmVsZWFzZV9kcml2ZXIoKSBjYW4g
YmUgbWFkZSB3b3JrIHN5bmNocm9ub3VzbHkKYXQgYWxsLiBJdCBzaG91bGQsIGhvd2V2ZXIsIGJl
IHBlcmZlY3RseSBmaW5lIGlmIHRoaXMgd2FzIGFuIGFzeW5jCnJlcXVlc3QgdG8gcmVsZWFzZSBh
IGRldmljZS9kcml2ZXIsIHJpZ2h0PwoKCk1pY2hhxYIKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hdGgxMGsK
