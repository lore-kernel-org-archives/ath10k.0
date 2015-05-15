Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x22d.google.com ([2a00:1450:400c:c00::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YtLQk-0005Tz-IE
 for ath10k@lists.infradead.org; Fri, 15 May 2015 19:37:59 +0000
Received: by wgkx2 with SMTP id x2so4340957wgk.2
 for <ath10k@lists.infradead.org>; Fri, 15 May 2015 12:37:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQk_sg0pR+msL7jPAG8t+AUYx672pxupKeFGJEHcHiYUmw@mail.gmail.com>
References: <CACZoB6_jCMQM8t9GRVOsGOhWM-ySMkZXTtbgypYAFzjm1i8Lkw@mail.gmail.com>
 <CA+BoTQmHKfwQJjfe_6weOgFvNJeo=Zf_DLHQV_AK+Xbx2uWP=Q@mail.gmail.com>
 <CACZoB697UW-nB0imwUxOn5_2F=7rGb6uJ4NVcfnJZpLYhj=enQ@mail.gmail.com>
 <CA+BoTQk_sg0pR+msL7jPAG8t+AUYx672pxupKeFGJEHcHiYUmw@mail.gmail.com>
Date: Fri, 15 May 2015 12:37:35 -0700
Message-ID: <CACZoB6-fvKKAZC3LumNceBE4WTVK5pGiaSafdzmQ5BU=ENbckg@mail.gmail.com>
Subject: Re: [PATCH] ath10k: handle cycle count wrap around
From: Srinivasa Duvvuri <sduvvuri@google.com>
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
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

UGxlYXNlIGZpbmQgbXkgcmVzcG9uc2VzIGlubGluZS4KCgoKPgo+IEZvciBmb3JlaWduLWNoYW5u
ZWwgdmlzaXRzIHRoaXMgY2FuIGJlIGVhc2lseSBjYWxjdWxhdGVkIHNpbmNlIHRoZXkKPiBhcmUg
bmV2ZXIgbG9uZ2VyIHRoYW4gdGhlIHdyYXBhcm91bmQgdGltZS4KCkFzIGV4cGxhaW5lZCBiZWZv
cmUsIHRoZSBjb3VudGVyIHZhbHVlcyBrZWVwIGluY3JlYXNpbmcgYWNyb3NzIGFsbApjaGFubmVs
IGNoYW5nZXMKYW5kIHRoZXkgbmV2ZXIgcmVzZXQgdG8gMC4gaWYgdGhleSBoYWQgYmVlbiByZXNl
dCB0byB6ZXJvIG9uIGV2ZXJ5CmZvcmVpZ24gY2hhbm5lbCBjaGFuZ2UKdGhlbiB3ZSBkbyBub3Qg
bmVlZCB0byBoYW5kbGUgd3JhcCBhcm91bmQgYXMgeW91IHN1Z2dlc3RlZC4KU2luY2UgdGhleSBh
cmUgbm90IHJlc2V0LCB3ZSBuZWVkIHRvIGhhbmRsZSB3cmFwIGFyb3VuZCAuCj4KPiBCU1MtY2hh
bm5lbCB2aXNpdHMgKG9yIGJldHdlZW4tc2NhbnMgaWYgeW91IHdpbGwpIHNob3VsZCBiZSBqdXN0
Cj4gZGlzY2FyZGVkIHRob3VnaCBhcyB5b3Ugc3VnZ2VzdGVkLiBJJ20gbm90IGZvbmQgb2YgcmUt
dXNpbmcKPiBhci0+c3VydmV5X2xhc3RfY3ljbGVfY291bnQgdGhvdWdoIGJlY2F1c2UgaXQgYWx3
YXlzIHN0b3JlcyBhIHZhbHVlCj4gYW5kIDAgaXMganVzdCBvbmUgb2YgdGhlbS4gQWRkaW5nIGEg
c3BlY2lhbCBtZWFuaW5nIHRvIDAgbG9va3MgdWdseSB0bwo+IG1lLiBJIHdvdWxkIHN1Z2dlc3Qg
YSBkZWRpY2F0ZWQgdmFyIHdoaWNoIHRyYWNrcyB3aGV0aGVyIGNoYW5faW5mbwo+IGV2ZW50IHdp
dGhvdXQgX0ZMQUdfQ09NUExFVEUgY2FtZSBpbi4gU29tZXRoaW5nIGFsb25nIHRoZSBsb2dpYyBv
ZjoKPgo+ICBldmVudF9jaGFuX2luZm8oKToKPiAgIC4uLgo+ICAgaWYgKGZsYWdzICYgQ09NUExF
VEUpIHsKPiAgICAgIGlmIChhci0+Y2hfaW5mb19jYW5fcHJvY2VzcykKPiAgICAgICAgIHVwZGF0
ZShhci0+c3VydmV5KTsKPgo+ICAgICAgYXItPmNoX2luZm9fY2FuX3Byb2Nlc3MgPSBmYWxzZTsK
PiAgIH0gZWxzZSB7Cj4gICAgICBhci0+Y2hfaW5mb19jYW5fcHJvY2VzcyA9IHRydWU7Cj4gICB9
Cj4KPiBUaGlzIGNsZWFubHkgZW5mb3JjZXMgdGhlIGV4cGVjdGF0aW9uIHRoYXQgd2FzIGFzc3Vt
ZWQgYmVmb3JlLCBpLmUuCj4gdGhhdCBjaF9pbmZvIGNvbWVzIGluIHBhaXJzIGFsd2F5cy4KCmFn
cmVlZCB0aGlzIGlzIG11Y2ggY2xlYW5lci4gSSB3aWxsIG1ha2UgdGhlIGNoYW5nZSBhcyB5b3Ug
c3VnZ2VzdGVkLgoKPgo+Cj4gTWljaGHFggoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEw
awo=
