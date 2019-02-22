Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.toke.dk ([2a00:7660:6da:2001::664])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gxB3o-0002GT-Ek
 for ath10k@lists.infradead.org; Fri, 22 Feb 2019 13:40:19 +0000
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Subject: Re: [PATCH] mac80211: Change default tx_sk_pacing_shift to 7
In-Reply-To: <a5151441bdfe02cb11043aa0786185b8ee3c3ee9.camel@sipsolutions.net>
References: <20190221172936.21816-1-toke@redhat.com>
 <E1gx9x3-0002j0-1J@sipsolutions.net> <87lg28vup0.fsf@toke.dk>
 <a5151441bdfe02cb11043aa0786185b8ee3c3ee9.camel@sipsolutions.net>
Date: Fri, 22 Feb 2019 14:40:12 +0100
Message-ID: <87imxcvt4z.fsf@toke.dk>
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
Cc: Kan Yan <kyan@google.com>, wgong@qti.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Grant Grundler <grundler@google.com>, wgong@codeaurora.org, Ben Greear <greearb@candelatech.com>, Kalle Valo <kvalo@codeaurora.org>

Sm9oYW5uZXMgQmVyZyA8am9oYW5uZXNAc2lwc29sdXRpb25zLm5ldD4gd3JpdGVzOgoKPiBPbiBG
cmksIDIwMTktMDItMjIgYXQgMTQ6MDYgKzAxMDAsIFRva2UgSMO4aWxhbmQtSsO4cmdlbnNlbiB3
cm90ZToKPj4gSm9oYW5uZXMgQmVyZyA8am9oYW5uZXNAc2lwc29sdXRpb25zLm5ldD4gd3JpdGVz
Ogo+PiAKPj4gPiBUb2tlIEjDuGlsYW5kLUrDuHJnZW5zZW4gd3JvdGU6Cj4+ID4gCj4+ID4gPiBX
aGVuIHdlIGRpZCB0aGUgb3JpZ2luYWwgdGVzdHMgZm9yIHRoZSBvcHRpbWFsIHZhbHVlIG9mIHNr
X3BhY2luZ19zaGlmdCwgd2UKPj4gPiA+IGNhbWUgdXAgd2l0aCA2IG1zIG9mIGJ1ZmZlcmluZyBh
cyB0aGUgZGVmYXVsdC4gU2FkbHksIDYgaXMgbm90IGEgcG93ZXIgb2YKPj4gPiA+IHR3bywgc28g
d2hlbiBwaWNraW5nIHRoZSBzaGlmdCB2YWx1ZSBJIGVycmVkIG9uIHRoZSBzaXplIG9mIGxlc3Mg
YnVmZmVyaW5nCj4+ID4gPiBhbmQgcGlja2VkIDQgbXMgaW5zdGVhZCBvZiA4LiBUaGlzIHdhcyBw
cm9iYWJseSB3cm9uZzsgdGhvc2UgMiBtcyBvZiBleHRyYQo+PiA+ID4gYnVmZmVyaW5nIG1ha2Vz
IGEgbGFyZ2VyIGRpZmZlcmVuY2UgdGhhbiBJIHRob3VnaHQuCj4+ID4gPiAKPj4gPiA+IFNvLCBj
aGFuZ2UgdGhlIGRlZmF1bHQgcGFjaW5nIHNoaWZ0IHRvIDcsIHdoaWNoIGNvcnJlc3BvbmRzIHRv
IDggbXMgb2YKPj4gPiA+IGJ1ZmZlcmluZy4gVGhlIHBvaW50IG9mIGRpbWluaXNoaW5nIHJldHVy
bnMgcmVhbGx5IGtpY2tzIGluIGFmdGVyIDggbXMsIGFuZAo+PiA+ID4gc28gaGF2aW5nIHRoaXMg
YXMgYSBkZWZhdWx0IHNob3VsZCBjdXQgZG93biBvbiB0aGUgbmVlZCBmb3IgZXh0ZW5zaXZlCj4+
ID4gPiBwZXItZGV2aWNlIHRlc3RpbmcgYW5kIG92ZXJyaWRlcyBuZWVkZWQgaW4gdGhlIGRyaXZl
cnMuCj4+ID4gPiAKPj4gPiA+IFNpZ25lZC1vZmYtYnk6IFRva2UgSMO4aWxhbmQtSsO4cmdlbnNl
biA8dG9rZUByZWRoYXQuY29tPgo+PiA+IAo+PiA+IFBhdGNoIGFwcGxpZWQgdG8gd2lyZWxlc3Mu
Z2l0LCB0aGFua3MuCj4+ID4gCj4+ID4gYTQxZjU2YjlhMTdhIChIRUFEIC0+IG1hYzgwMjExKSBt
YWM4MDIxMTogQ2hhbmdlIGRlZmF1bHQKPj4gPiB0eF9za19wYWNpbmdfc2hpZnQgdG8gNwo+Cj4g
VGhpcyBtZXNzIGNhbWUgZnJvbSBLYWxsZSdzIHRvb2wgYnR3LCBzbyBJIGNhbid0IHJlYWxseSB1
c2UgaXQgeWV0IDotKQo+Cj4+IENvb2wsIHRoYW5rcyEgV2hhdCdzIHRoZSBlYXNpZXN0IHdheSB0
byBiYWNrcG9ydCB0aGlzPyBJIGZpZ3VyZSBpdCdzCj4+IGVhc2llciB0byBqdXN0IHVwZGF0ZSBz
a19wYWNpbmdfc2hpZnRfdXBkYXRlKCkgaW4gdHguYyBmb3IgNC4xOSAod2hpY2gKPj4gcHJlZGF0
ZXMgdGhlIGFkZGl0aW9uIG9mIHRoZSBkcml2ZXIgb3ZlcnJpZGUgaG9vayk7IHNoYWxsIEkganVz
dCBzZW5kIGEKPj4gc2VwYXJhdGUgcGF0Y2ggdG8gc3RhYmxlIGZvciB0aGF0PyBPciBkbyB3ZSBu
ZWVkIHRvIGJhY2twb3J0IHRoZSBkcml2ZXIKPj4gb3ZlcnJpZGUgaG9vayBhcyB3ZWxsPwo+Cj4g
SnVzdCB1cGRhdGUgdGhlIHZhbHVlLCBubyBuZWVkIHRvIGJhY2twb3J0IHRoZSBob29rLgoKQW5k
IHNlbmQgaXQgZGlyZWN0bHkgdG8gc3RhYmxlLCBvciBkb2VzIGl0IG5lZWQgdG8gZ28gdGhyb3Vn
aCB5b3U/CgotVG9rZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
