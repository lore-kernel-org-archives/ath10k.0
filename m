Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x22b.google.com ([2a00:1450:400c:c00::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XWhMn-0000y6-Gu
 for ath10k@lists.infradead.org; Wed, 24 Sep 2014 07:52:02 +0000
Received: by mail-wg0-f43.google.com with SMTP id y10so6074241wgg.14
 for <ath10k@lists.infradead.org>; Wed, 24 Sep 2014 00:51:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1411518383-32634-2-git-send-email-greearb@candelatech.com>
References: <1411518383-32634-1-git-send-email-greearb@candelatech.com>
 <1411518383-32634-2-git-send-email-greearb@candelatech.com>
Date: Wed, 24 Sep 2014 09:51:39 +0200
Message-ID: <CA+BoTQ=fS30xz9KcdBJcioNers6PovOFEeqPCCSFn52HkscXug@mail.gmail.com>
Subject: Re: [RFC 2/2] ath10k: re-config ht_caps when chainmask is modified.
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

T24gMjQgU2VwdGVtYmVyIDIwMTQgMDI6MjYsICA8Z3JlZWFyYkBjYW5kZWxhdGVjaC5jb20+IHdy
b3RlOgpbLi4uXQo+ICtzdGF0aWMgc3RydWN0IGllZWU4MDIxMV9zdGFfdmh0X2NhcCBhdGgxMGtf
Y3JlYXRlX3ZodF9jYXAoc3RydWN0IGF0aDEwayAqYXIsCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgdXNlX2NmZ19jaGFpbnMp
Cj4gIHsKPiAgICAgICAgIHN0cnVjdCBpZWVlODAyMTFfc3RhX3ZodF9jYXAgdmh0X2NhcCA9IHsw
fTsKPiAgICAgICAgIHUxNiBtY3NfbWFwOwo+ICAgICAgICAgaW50IGk7Cj4gKyAgICAgICBpbnQg
bnJmID0gYXItPm51bV9yZl9jaGFpbnM7Cj4gKwo+ICsgICAgICAgaWYgKHVzZV9jZmdfY2hhaW5z
ICYmIGFyLT5jZmdfdHhfY2hhaW5tYXNrKQo+ICsgICAgICAgICAgICAgICBucmYgPSBnZXRfbnNz
X2Zyb21fY2hhaW5tYXNrKGFyLT5jZmdfdHhfY2hhaW5tYXNrKTsKCklzIHVzZV9jZmdfY2hhaW5z
IHJlYWxseSBuZWNlc3NhcnkgaGVyZT8gSXMgc2V0dGluZyB0eC9yeCBjaGFpbm1hc2sgdG8KMHgw
IG1ha2UgYW55IHNlbnNlIGF0IGFsbD8gU2hvdWxkbid0IHdlIGRlbnkgaXQgb3IgbWFrZSBpdCBm
YWxsYmFjayB0bwp0aGUgc3VwcG9ydGVkIHR4L3J4IGNoYWlubWFzayB2YWx1ZXM/CgoKTWljaGHF
ggoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBr
IG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
