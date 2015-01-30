Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x232.google.com ([2a00:1450:400c:c00::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YHC9O-0007zW-5W
 for ath10k@lists.infradead.org; Fri, 30 Jan 2015 14:02:22 +0000
Received: by mail-wg0-f50.google.com with SMTP id b13so26967961wgh.9
 for <ath10k@lists.infradead.org>; Fri, 30 Jan 2015 06:01:59 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1422623446.1919.20.camel@sipsolutions.net>
References: <1422607287-12289-1-git-send-email-michal.kazior@tieto.com>
 <1422621086-28970-1-git-send-email-michal.kazior@tieto.com>
 <1422621086-28970-3-git-send-email-michal.kazior@tieto.com>
 <1422622694.1919.17.camel@sipsolutions.net>
 <CA+BoTQkVuDqZVCVUB6pkDKp2tZ1sgnezju6Kg48JvnS4a_LZyA@mail.gmail.com>
 <1422623446.1919.20.camel@sipsolutions.net>
Date: Fri, 30 Jan 2015 15:01:59 +0100
Message-ID: <CA+BoTQ=pRfxreghBMNoqXfADSLntws_UZqtLHRHbdTrLJvH6bw@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] ath10k: implement chanctx API
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

T24gMzAgSmFudWFyeSAyMDE1IGF0IDE0OjEwLCBKb2hhbm5lcyBCZXJnIDxqb2hhbm5lc0BzaXBz
b2x1dGlvbnMubmV0PiB3cm90ZToKPiBPbiBGcmksIDIwMTUtMDEtMzAgYXQgMTQ6MDYgKzAxMDAs
IE1pY2hhbCBLYXppb3Igd3JvdGU6Cj4KPj4gSSdtIGEgYml0IHJlbHVjdGFudCB0byBmcmVlbHkg
dXNlIG1hYzgwMjExIG93bmVkIHN0cnVjdHVyZXMgb3V0IG9mCj4+IG1hYzgwMjExX29wcyBjYWxs
YmFjayBjb250ZXh0LCBpLmUuIGZyb20gYSB0YXNrbGV0IGZlYXJpbmcKPj4gaW5jb25zaXN0ZW5j
aWVzLiBPciBhbSBJIHdvcnJ5aW5nIHVubmVjZXNzYXJpbHk/IElmIHNvIEkgZ3Vlc3MgSSdsbAo+
PiByZWRvIHRoaXMgYW5kIHVzZSBtYWM4MDIxMSdzIHN0cnVjdHVyZXMgZGlyZWN0bHkgOi0pCj4K
PiBZZWFoIHRoYXQncyBhIGNvbmNlcm4sIHdlIHdlcmUganVzdCBsb29raW5nIGF0IHNvbWV0aGlu
ZyBzaW1pbGFyLgo+IEhvd2V2ZXIsIEkgdGhpbmsgYXQgbGVhc3Qgd2l0aCBjaGFubmVsIGNvbnRl
eHRzIHlvdSBzaG91bGQgYmUgZmluZSBzaW5jZQo+IG1hYzgwMjExIG5ldmVyIHJlYWxseSBtb2Rp
ZmllcyB0aGVtIG11Y2gsIGV4Y2VwdCBmb3IgdGhlIHdpZHRoIGFuZCAjIG9mCj4gY2hhaW5zIG5l
ZWRlZD8KCldpdGggYHdpZHRoYCB5b3UnbGwgY2hhbmdlIGBjZW50ZXJfZnJlcTFgIGluIG1hbnkg
Y2FzZXMuIFJlYWRpbmcgYQpwYWlyIG9mIG9sZC1hbmQtbmV3IG9mIGVhY2ggbWF5IG5vdCBuZWNl
c3NhcmlseSBiZSBmYXRhbCBidXQgbWF5CmludHJvZHVjZSBzdWJ0bGUgYnVncyB0aGF0IGFyZSBo
YXJkIHRvIGRlYnVnLiBFdmVuIGlmIHRoZSBjdXJyZW50IGNvZGUKZG9lc24ndCByZWFsbHkgdXNl
IHRoZXNlIHZhbHVlcyBvdXQgb2YgbWFjODAyMTEgY2FsbGJhY2sgY29udGV4dCBub3cKaXQgbWF5
IGJlY29tZSBhIHByb2JsZW0gbGF0ZXIuCgpJIGRvbid0IGtub3cuIEknbGwgdGhpbmsgYWJvdXQg
dGhpcyBhIGJpdCBtb3JlLiBZb3UgKmRvKiBoYXZlIGEgcG9pbnQuCgoKPiBXZSd2ZSByZWNlbnRs
eSBzZWVuIGEgc2ltaWxhciBpc3N1ZSB3aXRoIHZpZi0+YnNzX2NvbmYsIGFuZCBJJ20KPiBjb25z
aWRlcmluZyBtYWtpbmcgdGhhdCBhbiBSQ1UtcHJvdGVjdGVkIHBvaW50ZXIgcmF0aGVyIHRoYW4g
dGhlCj4gZW1iZWRkZWQgc3ViLXN0cnVjdCwgdGhhdCB3YXkgbWFjODAyMTEgY2FuIHJlcGxhY2Ug
aXQgYXRvbWljYWxseSB3aGVuCj4gbmVlZGVkLiBJJ3ZlIHlldCB0byBzZWUgaWYgdGhhdCdzIHBy
YWN0aWNhbCB0aG91Z2guCgpJdCdkIGJlIGxvdmVseSBpZiBJIGNvdWxkIGZyZWVseSByZWFkIG1h
YzgwMjExIHN0cnVjdHVyZXMgZnJvbQp3aGF0ZXZlciBjb250ZXh0IEkgd2FudCB3aXRob3V0IGFu
eSB3b3JyaWVzIGJ1dCBJIHRoaW5rIHlvdSdkIGhhdmUgdG8KaW50cm9kdWNlIGV4cGxpY2l0IGxv
Y2tpbmcgYmV0d2VlbiBtYWM4MDIxMSBhbmQgZHJpdmVycyBvciBnbyBoYW0gd2l0aApSQ1UgOi0p
CgoKTWljaGHFggoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
