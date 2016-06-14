Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bCokv-0000gh-IX
 for ath10k@lists.infradead.org; Tue, 14 Jun 2016 13:51:50 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix potential null dereference bugs
Date: Tue, 14 Jun 2016 13:51:24 +0000
Message-ID: <87shwf3mlh.fsf@kamboji.qca.qualcomm.com>
References: <1465563164-783-1-git-send-email-me@bobcopeland.com>
 <CA+BoTQkg+uea_YzUgrVBPhA8uRxNpd29Kd1y1tvt0a-JyOSLQw@mail.gmail.com>
 <1465808939.2434.1.camel@sipsolutions.net>	<20160613130507.GA11074@localhost>
 <1465823880.10050.3.camel@sipsolutions.net>
In-Reply-To: <1465823880.10050.3.camel@sipsolutions.net> (Johannes Berg's
 message of "Mon, 13 Jun 2016 15:18:00 +0200")
Content-Language: en-US
Content-ID: <23D56D4EC61DF54CA85F6AC481111F3E@qualcomm.com>
MIME-Version: 1.0
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Bob Copeland <me@bobcopeland.com>, "michal.kazior@tieto.com" <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Sm9oYW5uZXMgQmVyZyA8am9oYW5uZXNAc2lwc29sdXRpb25zLm5ldD4gd3JpdGVzOg0KDQo+IE9u
IE1vbiwgMjAxNi0wNi0xMyBhdCAwOTowNSAtMDQwMCwgQm9iIENvcGVsYW5kIHdyb3RlOg0KPj7C
oA0KPj4gU28gSSBkaWQganVzdCBnbyBhbmQgY2hlY2sgdGhlIGdlbmVyYXRlZCBjb2RlIGZvciBl
YWNoIG9mIHRoZXNlIGNhc2VzDQo+PiBhbmQgZ2NjIGRpZG4ndCBlbGlkZSB0aGUgc3Vic2VxdWVu
dCBpZi10ZXN0LCBhdCBsZWFzdCBvbiB4ODYtNjQgYW5kDQo+PiBteSBjb21waWxlciAvIGJ1aWxk
IGNvbmZpZy7CoMKgR2l2ZW4gaHR0cDovL2x3bi5uZXQvQXJ0aWNsZXMvMzQyMzMwLCBpdA0KPj4g
c2VlbXMgcG9zc2libGUsIHRob3VnaC4NCj4NCj4gSXQncyBub3QgY2xlYXIgdGhhdCdzIHRoZSBz
YW1lIHNpdHVhdGlvbiwgc2luY2UgdHVuLT5zayBpcyB2ZXJ5IGxpa2VseQ0KPiB0byBoYXZlIGJl
ZW4gYW4gYWN0dWFsIHBvaW50ZXIsIG5vdCBhbiBlbWJlZGRlZCB0aGluZyBsaWtlIGRydl9wcml2
Lg0KPg0KPiBIb3dldmVyLCB3aXRoIGFsbCB0aGlzLCBJIHRoaW5rIEknZCBzaW1wbHkgbm90IHRh
a2UgYW55IGNoYW5jZXMgLSB0aGUNCj4gcGF0Y2ggaXNuJ3QgZXhhY3RseSBpbnZhc2l2ZSBhbmQg
aW4gc29tZSBjYXNlcyAoZm9yIGV4YW1wbGUgdGhlIGZpcnN0DQo+IGh1bmsgb2YgdGhlIHBhdGNo
KSB3aWxsIGV2ZW4gaW1wcm92ZSB0aGUgY29kZSB0byB0aGUgcG9pbnQgd2hlcmUgdGhlDQo+IGNv
bXBpbGVyIGNvdWxkIHdhcm4gYWJvdXQgdW5pbml0aWFsaXplZCB1c2FnZSBvZiB0aGUgcG9pbnRl
ciB3aGVuIHRoZQ0KPiBjb2RlIGdldHMgbW9kaWZpZWQgdG8gdXNlIGl0IGluIGNhc2Ugb2YgIXR4
cS0+c3RhLg0KPg0KPiBJJ2QgdGFrZSBpdCwgYnV0IEkgZ3Vlc3MgaXQncyBLYWxsZSdzIGRlY2lz
aW9uIDopDQoNClllYWgsIEknbSBsZWFuaW5nIHRvd2FyZHMgSm9oYW5uZXMuIFRoZXNlIGFyZSBu
b3QgcmVhbGx5IGludmFzaXZlLg0KDQotLSANCkthbGxlIFZhbG8KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2F0aDEwawo=
