Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x231.google.com ([2a00:1450:400c:c00::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XWM1b-0006Tw-Ly
 for ath10k@lists.infradead.org; Tue, 23 Sep 2014 09:04:44 +0000
Received: by mail-wg0-f49.google.com with SMTP id x12so4047968wgg.32
 for <ath10k@lists.infradead.org>; Tue, 23 Sep 2014 02:04:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1411149890-12618-1-git-send-email-greearb@candelatech.com>
References: <1411149890-12618-1-git-send-email-greearb@candelatech.com>
Date: Tue, 23 Sep 2014 11:04:21 +0200
Message-ID: <CA+BoTQmMuwz54ExCCBvScfUAzSHmGhGvDi-Xb268eAfsNyUxfQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] ath10k: use 64-bit vdev map.
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

T24gMTkgU2VwdGVtYmVyIDIwMTQgMjA6MDQsICA8Z3JlZWFyYkBjYW5kZWxhdGVjaC5jb20+IHdy
b3RlOgo+IEZyb206IEJlbiBHcmVlYXIgPGdyZWVhcmJAY2FuZGVsYXRlY2guY29tPgo+Cj4gVGhp
cyBjYW4gYWxsb3cgbW9yZSB0aGFuIDMyIHN0YXRpb25zIHRvIGJlIHN1cHBvcnRlZAo+IHdpdGhv
dXQgb3Zlci1ydW5uaW5nIHRoZSBiaXRtYXAuCj4KPiBTaWduZWQtb2ZmLWJ5OiBCZW4gR3JlZWFy
IDxncmVlYXJiQGNhbmRlbGF0ZWNoLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9uZXQvd2lyZWxlc3Mv
YXRoL2F0aDEway9jb3JlLmMgfCAgNCArKy0tCj4gIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9h
dGgxMGsvY29yZS5oIHwgIDIgKy0KPiAgZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9t
YWMuYyAgfCAyMSArKysrKysrKysrKystLS0tLS0tLS0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAxNSBp
bnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25l
dC93aXJlbGVzcy9hdGgvYXRoMTBrL2NvcmUuYyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9h
dGgxMGsvY29yZS5jCj4gaW5kZXggY2VlMThjOC4uMzdlMzE2NiAxMDA2NDQKWy4uLl0KPiBAQCAt
Mjc3Miw5ICsyNzcyLDEyIEBAIHN0YXRpYyBpbnQgYXRoMTBrX2FkZF9pbnRlcmZhY2Uoc3RydWN0
IGllZWU4MDIxMV9odyAqaHcsCj4gICAgICAgICAgICAgICAgIHJldCA9IC1FQlVTWTsKPiAgICAg
ICAgICAgICAgICAgZ290byBlcnI7Cj4gICAgICAgICB9Cj4gLSAgICAgICBiaXQgPSBmZnMoYXIt
PmZyZWVfdmRldl9tYXApOwo+ICsgICAgICAgYml0ID0gX19mZnM2NChhci0+ZnJlZV92ZGV2X21h
cCk7Cj4KPiAtICAgICAgIGFydmlmLT52ZGV2X2lkID0gYml0IC0gMTsKPiArICAgICAgIGF0aDEw
a193YXJuKGFyLCAiQ3JlYXRpbmcgdmRldiBpZDogJWkgIG1hcDogJWxsdVxuIiwKPiArICAgICAg
ICAgICAgICAgICAgIGJpdCwgYXItPmZyZWVfdmRldl9tYXApOwoKU2hvdWxkbid0IHRoaXMgYmUg
YSBhdGgxMGtfZGJnKCk/IEl0IHByb2JhYmx5IG1ha2VzIHNlbnNlIHRvIHByaW50IHRoZQptYXAg
YXMgaGV4IGluc3RlYWQgb2YgYSBkZWNpbWFsIHRvby4gUHJpbnRzIHNob3VsZCBiZSBsb3dlciBj
YXNlIGFuZApkZWJ1ZyBuZWVkcyBhIHByZWZpeCwgaS5lLgoKICJtYWMgY3JlYXRlIHZkZXYgJWkg
bWFwICVsbHgiCgoKTWljaGHFggoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
