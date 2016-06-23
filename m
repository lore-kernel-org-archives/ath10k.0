Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bG4fX-0001Ph-Gs
 for ath10k@lists.infradead.org; Thu, 23 Jun 2016 13:27:44 +0000
Received: by mail-wm0-x22b.google.com with SMTP id r190so3773724wmr.0
 for <ath10k@lists.infradead.org>; Thu, 23 Jun 2016 06:27:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <57doa6skql6.fsf@cerise.info9.net>
References: <57dtwgmmwmr.fsf@cerise.info9.net>
 <87y45xiuts.fsf@kamboji.qca.qualcomm.com>
 <57dd1n9mks5.fsf@cerise.info9.net> <87r3bpfh94.fsf@kamboji.qca.qualcomm.com>
 <57doa6skql6.fsf@cerise.info9.net>
From: Tomasz Skapski <tomasz.skapski@tieto.com>
Date: Thu, 23 Jun 2016 15:27:00 +0200
Message-ID: <CABkMH_rZNhxHtfaD3pz0ymSjvEKGxDycjDcwxKBZFKj8j2P_Jg@mail.gmail.com>
Subject: Re: Cannot initialize Compex WLE600VX for 802.11ac?
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
To: Tom Marble <tmarble@info9.net>
Cc: "Valo, Kalle" <kvalo@qca.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

SW4geW91ciBjb25maWcgZmlsZSBzZXQgJ2ZyYWdtX3RocmVzaG9sZD0tMScsIG9yIGNvbW1lbnQg
aXQuClJlZ2FyZHMsClRvbWFzeiBTa8SFcHNraQoKCk9uIDIzIEp1bmUgMjAxNiBhdCAxNTowMCwg
VG9tIE1hcmJsZSA8dG1hcmJsZUBpbmZvOS5uZXQ+IHdyb3RlOgo+ICJWYWxvLCBLYWxsZSIgPGt2
YWxvQHFjYS5xdWFsY29tbS5jb20+IHdyaXRlczoKPj4gVG9tIE1hcmJsZSA8dG1hcmJsZUBpbmZv
OS5uZXQ+IHdyaXRlczoKPj4+ICJWYWxvLCBLYWxsZSIgPGt2YWxvQHFjYS5xdWFsY29tbS5jb20+
IHdyaXRlczoKPj4+PiBEbyB5b3UgaGF2ZSBDT05GSUdfQVRIMTBLX0RGU19DRVJUSUZJRUQgZW5h
YmxlZD8KPj4+Cj4+PiBOby4uIHRoZSBvcHRpb24gaXNuJ3QgZXZlbiBjb21tZW50ZWQgb3V0IGlu
IG15IC5jb25maWc/Pwo+Pgo+PiBJdCBkZXBlbmRzIG9uIENGRzgwMjExX0NFUlRJRklDQVRJT05f
T05VUyBzbyB5b3UgbmVlZCB0byBlbmFibGUgdGhhdAo+PiBmaXJzdC4KPgo+IE9rYXksIEkndmUg
cmVidWlsZCB0aGUga2VybmVsIHdpdGggdGhhdCBvcHRpb24uIEhlcmUncyB0aGUgbGF0ZXN0IGlu
Zm86Cj4KPiByb290QHNpeDovIyB1bmFtZSAtYQo+IExpbnV4IHNpeCA0LjcuMC1yYzMtd3QtYXRo
LXRtMiAjNCBTTVAgV2VkIEp1biAyMiAxMTo0NzoxMiBDRFQgMjAxNiB4ODZfNjQgR05VL0xpbnV4
Cj4gcm9vdEBzaXg6LyMgaXcgcmVnIGdldAo+IGNvdW50cnkgVVM6IERGUy1GQ0MKPiAgICAgICAg
ICgyNDAyIC0gMjQ3MiBAIDQwKSwgKE4vQSwgMzApLCAoTi9BKQo+ICAgICAgICAgKDUxNzAgLSA1
MjUwIEAgODApLCAoTi9BLCAxNyksIChOL0EpCj4gICAgICAgICAoNTI1MCAtIDUzMzAgQCA4MCks
IChOL0EsIDIzKSwgKDAgbXMpLCBERlMKPiAgICAgICAgICg1NzM1IC0gNTgzNSBAIDgwKSwgKE4v
QSwgMzApLCAoTi9BKQo+ICAgICAgICAgKDU3MjQwIC0gNjM3MjAgQCAyMTYwKSwgKE4vQSwgNDAp
LCAoTi9BKQo+IHJvb3RAc2l4Oi8jIGl3IHBoeTAgaW5mbwo+ICAgU0VFIGh0dHA6Ly9wYXN0ZS5k
ZWJpYW4ubmV0Lzc0Nzk4Ni8KPgo+IFNldHRpbmcgY2hhbm5lbD0wIHRvIGVuYWJsZSBzY2Fubmlu
ZyByZXN1bHRzIHN0aWxsIGZhaWxzCj4gIyBob3N0YXBkIC1kZCAvZXRjL2hvc3RhcGQvd2xhbjAu
Y29uZiB8IHRlZSAvdG1wL3dsYW4wLmxvZwo+ICAgU0VFIGh0dHA6Ly9wYXN0ZS5kZWJpYW4ubmV0
Lzc0Nzk4OC8KPgo+ICAgbmw4MDIxMTogRmFpbGVkIHRvIHNldCBmcmFnbWVudGF0aW9uIHRocmVz
aG9sZCAyMzQ2OiAtOTUgKE9wZXJhdGlvbiBub3Qgc3VwcG9ydGVkKQo+ICAgQ291bGQgbm90IHNl
dCBmcmFnbWVudGF0aW9uIHRocmVzaG9sZCBmb3Iga2VybmVsIGRyaXZlcgo+ICAgSW50ZXJmYWNl
IGluaXRpYWxpemF0aW9uIGZhaWxlZAo+Cj4gU2VlbXMgdG8gaGF2ZSBtYWRlIGl0IGEgbGl0dGxl
IGZ1cnRoZXIuLi4gV2hhdCBzaG91bGQgSSB0cnkgbm93Pwo+Cj4gLS1Ub20KPgo+Cj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhdGgxMGsgbWFpbGlu
ZyBsaXN0Cj4gYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2F0aDEwawo=
