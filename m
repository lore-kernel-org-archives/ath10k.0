Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iT2Ge-0006Lm-3G
 for ath10k@lists.infradead.org; Fri, 08 Nov 2019 11:17:29 +0000
Message-ID: <300bf0146db6c0d5890699b3911d35174d28c9c0.camel@sipsolutions.net>
Subject: Re: [PATCH v6 3/4] mac80211: Implement Airtime-based Queue Limit (AQL)
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 08 Nov 2019 12:17:22 +0100
In-Reply-To: <874kzefwt3.fsf@toke.dk>
References: <157182473951.150713.7978051149956899705.stgit@toke.dk>
 <157182474287.150713.12867638269538730397.stgit@toke.dk>
 <1a2eb096119c9029e67caf797564d6511c8803a7.camel@sipsolutions.net>
 <87a796fxgd.fsf@toke.dk>
 <f395a9a971ca1a0d0438fca10dfb160c421caa7a.camel@sipsolutions.net>
 <874kzefwt3.fsf@toke.dk>
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
To: Toke =?ISO-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>
Cc: Kan Yan <kyan@google.com>, Rajkumar Manoharan <rmanohar@codeaurora.org>, Kevin Hayes <kevinhayes@google.com>, make-wifi-fast@lists.bufferbloat.net, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, John Crispin <john@phrozen.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>

T24gRnJpLCAyMDE5LTExLTA4IGF0IDEyOjEwICswMTAwLCBUb2tlIEjDuGlsYW5kLUrDuHJnZW5z
ZW4gd3JvdGU6Cgo+IFJpZ2h0LCBidWdnZXIuIEkgd2FzIHRoaW5raW5nIG1heWJlIHRoZXJlJ3Mg
YSBjYXNlIHdoZXJlIHNrYnMgY2FuIGJlCj4gY2xvbmVkIChhbmQgcmV0YWluIHRoZSB0eF90aW1l
X2VzdCBmaWVsZCkgYW5kIHRoZW4gcmVsZWFzZWQgdHdpY2U/IAoKVGhleSBjb3VsZCBiZSBjbG9u
ZWQsIGJ1dCBJIGRvbid0IHNlZSBob3cgdGhhdCdkIGJlIHdoaWxlICppbnNpZGUqIHRoZQpzdGFj
ayBhbmQgdGhlbiB0aGV5IGdldCByZXBvcnRlZCB0d2ljZSAtIHVubGVzcyB0aGUgZHJpdmVyIGRp
ZCBzb21ldGhpbmcKbGlrZSB0aGF0PwoKSSBtZWFuLCBUQ1Agc3VyZWx5IGRvZXMgdGhhdCBmb3Ig
ZXhhbXBsZSwgYnV0IGl0J3MgYmVmb3JlIHdlIGV2ZW4gZ2V0IHRvCm1hYzgwMjExLgoKPiBPcgo+
IG1heWJlIHNvbWV3aGVyZSB0aGF0IHN0ZXBzIG9uIHRoZSBza2ItPmNiIGZpZWxkIGluIHNvbWUg
b3RoZXIgd2F5Pwo+IENvdWxkbid0IGZpbmQgYW55dGhpbmcgb2J2aW91cyBvbiBhIGZpcnN0IHBl
cnVzYWwgb2YgdGhlIFRYIHBhdGggY29kZSwKPiBidXQgbWF5YmUgeW91IGNvdWxkIHRoaW5rIG9m
IHNvbWV0aGluZz8KCk5vLCBzb3JyeS4gQnV0IEkgYWxzbyBkaWRuJ3QgYWN0dWFsbHkgbG9vayBh
dCB0aGUgZHJpdmVyIGF0IGFsbC4KCj4gT3RoZXJ3aXNlIEkgZ3Vlc3Mgd2UnbGwgYmUgZm9yY2Vk
IHRvIGdvIGFuZCBkbyBzb21lIGFjdHVhbCwKPiBvbGQtZmFzaGlvbmVkIGRlYnVnZ2luZyA7KQoK
OikKCmpvaGFubmVzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
