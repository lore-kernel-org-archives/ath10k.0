Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwg9L-0005o2-O3
 for ath10k@lists.infradead.org; Thu, 21 Feb 2019 04:39:57 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v2 2/2] ath10k: Set sk_pacing_shift to 6 for 11AC WiFi
 chips
References: <1533724802-30944-1-git-send-email-wgong@codeaurora.org>
 <1533724802-30944-3-git-send-email-wgong@codeaurora.org>
 <87sh3pdtpg.fsf@toke.dk>
 <f185ab8722e84c959b375e606d25a29b@aptaiexm02f.ap.qualcomm.com>
 <87mutue4y8.fsf@toke.dk>
 <ef7b317006964c0fa72763bbfc5149e5@aptaiexm02f.ap.qualcomm.com>
 <CANEJEGvcj9gPT8yy++qvi3hz3t9pAXyeUves06gr+ADfn9Ouhg@mail.gmail.com>
 <1535967508.3437.31.camel@sipsolutions.net> <87in3m25uu.fsf@toke.dk>
 <1535975240.3437.61.camel@sipsolutions.net> <878t4i1z74.fsf@toke.dk>
 <CANEJEGsm_BKM6g2x0+a7_5dBy5jkROs+jEjHmrcneGrMdDK41g@mail.gmail.com>
 <871sa7ylmi.fsf@toke.dk>
 <CANEJEGuBoRMBJBOrFOYyPtiJSMfTahrVgTfxZ2ift6Q5uGazFA@mail.gmail.com>
Date: Thu, 21 Feb 2019 06:39:35 +0200
In-Reply-To: <CANEJEGuBoRMBJBOrFOYyPtiJSMfTahrVgTfxZ2ift6Q5uGazFA@mail.gmail.com>
 (Grant Grundler's message of "Wed, 20 Feb 2019 11:15:02 -0800")
Message-ID: <87ftshpxfc.fsf@kamboji.qca.qualcomm.com>
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
To: Grant Grundler <grundler@google.com>
Cc: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>, wgong@qti.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, wgong@codeaurora.org, Johannes Berg <johannes@sipsolutions.net>

R3JhbnQgR3J1bmRsZXIgPGdydW5kbGVyQGdvb2dsZS5jb20+IHdyaXRlczoKCj4gT24gVGh1LCBT
ZXAgNiwgMjAxOCBhdCAzOjE4IEFNIFRva2UgSMO4aWxhbmQtSsO4cmdlbnNlbiA8dG9rZUB0b2tl
LmRrPiB3cm90ZToKPj4KPj4gR3JhbnQgR3J1bmRsZXIgPGdydW5kbGVyQGdvb2dsZS5jb20+IHdy
aXRlczoKPj4KPj4gPj4gQW5kLCB3ZWxsLCBHcmFudCdzIGRhdGEgaXMgZnJvbSBhIHNpbmdsZSB0
ZXN0IGluIGEgbm9pc3kKPj4gPj4gZW52aXJvbm1lbnQgd2hlcmUgdGhlIHRpbWUgc2VyaWVzIGdy
YXBoIHNob3dzIHRoYXQgdGhyb3VnaHB1dCBpcyBhbGwgb3Zlcgo+PiA+PiB0aGUgcGxhY2UgZm9y
IHRoZSBkdXJhdGlvbiBvZiB0aGUgdGVzdDsgc28gaXQncyBoYXJkIHRvIGRyYXcgc29saWQKPj4g
Pj4gY29uY2x1c2lvbnMgZnJvbSAoZm9yIGluc3RhbmNlLCBmb3IgdGhlIDUtc3RyZWFtIHRlc3Qs
IHRoZSBhdmVyYWdlCj4+ID4+IHRocm91Z2hwdXQgZm9yIDYgaXMgMzMxIGFuZCAzNzkgTWJwcyBm
b3IgdGhlIHR3byByZXBldGl0aW9ucywgYW5kIGZvciA3Cj4+ID4+IGl0J3MgMzI2IGFuZCAzNzEg
TWJwcykgLiBVbmZvcnR1bmF0ZWx5IEkgZG9uJ3QgaGF2ZSB0aGUgc2FtZSBoYXJkd2FyZQo+PiA+
PiB1c2VkIGluIHRoaXMgdGVzdCwgc28gSSBjYW4ndCBnbyB2ZXJpZnkgaXQgbXlzZWxmOyBzbyB0
aGUgb25seSB0aGluZyBJCj4+ID4+IGNhbiBkbyBpcyBncnVtYmxlIGFib3V0IGl0IGhlcmUuLi4g
OikKPj4gPgo+PiA+IEl0J3MgYSBmYWlyIGNvbXBsYWludCBhbmQgSSBhZ3JlZSB3aXRoIGl0LiBN
eSBjb3VudGVyIGFyZ3VtZW50IGlzIHRoZQo+PiA+IG9wcG9zaXRlIGlzIHRydWUgdG9vOiBtb3N0
IGlkZWFsIGJlbmNobWFya3MgZG9uJ3QgbWVhc3VyZSB3aGF0IG1vc3QKPj4gPiB1c2VycyBzZWUu
IFdoaWxlIHRoZSBkYXRhIHdnb25nIHByb3ZpZGVkIGFyZSB3YXkgbW9yZSBub2lzeSB0aGFuIEkK
Pj4gPiBsaWtlLCBteSBvdmVyYWxsICJjb25maWRlbmNlIiBpbiB0aGUgImNvbmNsdXNpb24iIEkg
b2ZmZXJlZCBpcyBzdGlsbAo+PiA+IHBvc2l0aXZlLgo+Pgo+PiBSaWdodC4gSSBndWVzcyBJIHdv
dWxkIGp1c3QgcHJlZmVyIGEgc2xpZ2h0bHkgbW9yZSBjb21wcmVoZW5zaXZlCj4+IGV2YWx1YXRp
b24gdG8gYmFzZSBhIDR4IGluY3JlYXNlIGluIGJ1ZmZlciBzaXplIG9uLi4uCj4KPiBLYWxsZSwg
aXMgdGhpcyB3aHkgeW91IGRpZG4ndCBhY2NlcHQgdGhpcyBwYXRjaD8gT3RoZXIgcmVhc29ucz8K
Ckp1c3QgZm9yIHJlZmVyZW5jZSwgaGVyZSBhcmUgcGF0Y2h3b3JrIGxpbmtzOgoKaHR0cHM6Ly9w
YXRjaHdvcmsua2VybmVsLm9yZy9jb3Zlci8xMDU1OTcyOS8KaHR0cHM6Ly9wYXRjaHdvcmsua2Vy
bmVsLm9yZy9wYXRjaC8xMDU1OTczMS8KaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRj
aC8xMDU1OTczMy8KClRoZSBtYWM4MDIxMSBwYXRjaCBpcyBhY2NlcHRlZCBhbmQgdGhlIGF0aDEw
ayBwYXRjaCBpcyBkZWZlcnJlZC4gSUlSQyBJCnB1dCBpdCBkZWZlcnJlZCBhcyBJIGRpZG4ndCBz
ZWUgYSByZWFsIGNvbnNlbnN1cyBhYm91dCB0aGUgcGF0Y2ggYW5kIHdhcwpzdXBwb3NlZCB0byBs
b29rIGF0IGl0IGxhdGVyLCBidXQgaGF2ZW4ndCBkb25lIHlldC4gSSBkb24ndCBoYXZlIGFueQpp
c3N1ZXMgd2l0aCB0aGUgcGF0Y2gsIGV4Y2VwdCBtYXliZSByZW1vdmluZyB0aGUgZHVwbGljYXRl
IGRlZmluZSBmb3IKOTM3NyAod2hpY2ggSSBjYW4gZWFzaWx5IGZpeCBpbiB0aGUgcGVuZGluZyBi
cmFuY2gpLgoKLS0gCkthbGxlIFZhbG8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
