Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1alrbG-00019K-JM
 for ath10k@lists.infradead.org; Fri, 01 Apr 2016 05:26:27 +0000
Received: by mail-wm0-x229.google.com with SMTP id 127so7299103wmu.1
 for <ath10k@lists.infradead.org>; Thu, 31 Mar 2016 22:26:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <56FD77A1.2010807@candelatech.com>
References: <56F5F38A.2070602@candelatech.com>
 <CA+BoTQmwGONqJ0MgccrMzzx9UsGuRCZpdy1RSqdgkcNm_te0xQ@mail.gmail.com>
 <56FC52F5.7080407@candelatech.com>
 <CA+BoTQ=ZPA87-5iK7YtxQSAW-SeXaaBU1j+9gVMC-5c7cpTwrA@mail.gmail.com>
 <56FD77A1.2010807@candelatech.com>
Date: Fri, 1 Apr 2016 07:26:05 +0200
Message-ID: <CA+BoTQn9WOaCeTz22WS7FDe6ypu2Dxeu82zYKrQ+CyUxxqCa1Q@mail.gmail.com>
Subject: Re: Deadlock on (faked) firmware crash, CUS239,
 modified 10.4.3 firmware.
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
Cc: ath10k <ath10k@lists.infradead.org>

T24gMzEgTWFyY2ggMjAxNiBhdCAyMToxNiwgQmVuIEdyZWVhciA8Z3JlZWFyYkBjYW5kZWxhdGVj
aC5jb20+IHdyb3RlOgpbLi4uXQo+IEkgdHJpZWQgYWRkaW5nIGNoZWNrIGZvciBGVyBjcmFzaCB5
ZXN0ZXJkYXksIGJ1dCB0aGF0IGRpZCBub3QgaGVscC4KPgo+IFRvZGF5LCBJIGFkZGVkIGEgbGlt
aXQgb2YgMjAwMCBsb29wcy4gIEkgc2VlIHRoYXQgaGl0LCBhbmQgdGhlbiBrZXJuZWwKPiBjcmFz
aGVzLiAgTWF5YmUgbXkgcGF0Y2ggaXMgd3JvbmcuCj4KPiBJJ3ZlIHRyaWVkIHRvIGFwcGx5IChh
bG1vc3QpIGV2ZXJ5IHBhdGNoIGluIGxpbnV4LmF0aCByZWxhdGVkIHRvIGF0aDEwaywKPiBpbmNs
dWRpbmcgYSBmZXcgZnJvbSB0aGUgbWFpbGluZyBsaXN0IHRoYXQgaGF2ZSBub3QgYmVlbiBhcHBs
aWVkIHlldC4KPgo+IE15IHB1c2gtcGVuZGluZyBtZXRob2Qgbm93IGxvb2tzIGxpa2UgdGhpczoK
Pgo+IHZvaWQgYXRoMTBrX21hY190eF9wdXNoX3BlbmRpbmcoc3RydWN0IGF0aDEwayAqYXIpCj4g
ewpbLi4uXQo+IH0KCkxvb2tzIHNhbmUuCgoKPiBUaGUgY3Jhc2ggSSBnZXQgaXMgdGhpczoKPgo+
Cj4gYXRoMTBrX3BjaSAwMDAwOjA1OjAwLjA6IGZpcm13YXJlIGNyYXNoZWQhICh1dWlkCj4gMmEx
MTg3MDgtOTc3ZC00M2Q2LThkNDAtMDc5ZGRlYzk5ZWIzKQpbLi4uXQo+IEJVRzogdW5hYmxlIHRv
IGhhbmRsZSBrZXJuZWwgcGFnaW5nIHJlcXVlc3QgYXQgMDAwMDAwMDAwMDAwMTAwMAo+IElQOiBb
PGZmZmZmZmZmYTA4ZTk4MTA+XSBfX3NrYl9kZXF1ZXVlKzB4MmUvMHgzNyBbbWFjODAyMTFdCgpI
bW0uLiBEbyB5b3UgaGF2ZSAyYTU4ZDQyYzFlMDEgKCJtYWM4MDIxMTogZml4IHR4cSBxdWV1ZSBy
ZWxhdGVkCmNyYXNoZXMiKSBhcHBsaWVkPwoKWW91IG1pZ2h0IHdhbnQgdG8gc3RhcnQgZHVtcGlu
ZyBlYWNoIGl0ZXJhdGlvbiBvZiBwdXNoX3BlbmRpbmcoKSBhZnRlcgpGVyBjcmFzaGVzIHRvIHNl
ZSBpZiBhbGwgcG9pbnRlcnMgYXJlIGZpbmUgYW5kIHdoYXQgcmV0dmFsIGFyZSBzcGl0dGVkCm91
dCBieSBlYWNoIHB1c2hfdHhxKCkuCgoKTWljaGHFggoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2F0aDEwawo=
