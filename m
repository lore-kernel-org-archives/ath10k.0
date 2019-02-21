Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwqvS-0005UC-US
 for ath10k@lists.infradead.org; Thu, 21 Feb 2019 16:10:20 +0000
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
 <87r2c1i1vj.fsf@toke.dk>
Date: Thu, 21 Feb 2019 18:10:10 +0200
In-Reply-To: <87r2c1i1vj.fsf@toke.dk> ("Toke \=\?utf-8\?Q\?H\=C3\=B8iland-J\?\=
 \=\?utf-8\?Q\?\=C3\=B8rgensen\=22's\?\= message of
 "Thu, 21 Feb 2019 16:42:56 +0100")
Message-ID: <871s41nmvx.fsf@kamboji.qca.qualcomm.com>
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
To: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: Kan Yan <kyan@google.com>, wgong@qti.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Grant Grundler <grundler@google.com>, wgong@codeaurora.org, Johannes Berg <johannes@sipsolutions.net>

VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIDx0b2tlQHRva2UuZGs+IHdyaXRlczoKCj4gR3JhbnQg
R3J1bmRsZXIgPGdydW5kbGVyQGdvb2dsZS5jb20+IHdyaXRlczoKPgo+PiBPbiBUaHUsIFNlcCA2
LCAyMDE4IGF0IDM6MTggQU0gVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIDx0b2tlQHRva2UuZGs+
IHdyb3RlOgo+Pj4KPj4+IEdyYW50IEdydW5kbGVyIDxncnVuZGxlckBnb29nbGUuY29tPiB3cml0
ZXM6Cj4+Pgo+Pj4gPj4gQW5kLCB3ZWxsLCBHcmFudCdzIGRhdGEgaXMgZnJvbSBhIHNpbmdsZSB0
ZXN0IGluIGEgbm9pc3kKPj4+ID4+IGVudmlyb25tZW50IHdoZXJlIHRoZSB0aW1lIHNlcmllcyBn
cmFwaCBzaG93cyB0aGF0IHRocm91Z2hwdXQgaXMgYWxsIG92ZXIKPj4+ID4+IHRoZSBwbGFjZSBm
b3IgdGhlIGR1cmF0aW9uIG9mIHRoZSB0ZXN0OyBzbyBpdCdzIGhhcmQgdG8gZHJhdyBzb2xpZAo+
Pj4gPj4gY29uY2x1c2lvbnMgZnJvbSAoZm9yIGluc3RhbmNlLCBmb3IgdGhlIDUtc3RyZWFtIHRl
c3QsIHRoZSBhdmVyYWdlCj4+PiA+PiB0aHJvdWdocHV0IGZvciA2IGlzIDMzMSBhbmQgMzc5IE1i
cHMgZm9yIHRoZSB0d28gcmVwZXRpdGlvbnMsIGFuZCBmb3IgNwo+Pj4gPj4gaXQncyAzMjYgYW5k
IDM3MSBNYnBzKSAuIFVuZm9ydHVuYXRlbHkgSSBkb24ndCBoYXZlIHRoZSBzYW1lIGhhcmR3YXJl
Cj4+PiA+PiB1c2VkIGluIHRoaXMgdGVzdCwgc28gSSBjYW4ndCBnbyB2ZXJpZnkgaXQgbXlzZWxm
OyBzbyB0aGUgb25seSB0aGluZyBJCj4+PiA+PiBjYW4gZG8gaXMgZ3J1bWJsZSBhYm91dCBpdCBo
ZXJlLi4uIDopCj4+PiA+Cj4+PiA+IEl0J3MgYSBmYWlyIGNvbXBsYWludCBhbmQgSSBhZ3JlZSB3
aXRoIGl0LiBNeSBjb3VudGVyIGFyZ3VtZW50IGlzIHRoZQo+Pj4gPiBvcHBvc2l0ZSBpcyB0cnVl
IHRvbzogbW9zdCBpZGVhbCBiZW5jaG1hcmtzIGRvbid0IG1lYXN1cmUgd2hhdCBtb3N0Cj4+PiA+
IHVzZXJzIHNlZS4gV2hpbGUgdGhlIGRhdGEgd2dvbmcgcHJvdmlkZWQgYXJlIHdheSBtb3JlIG5v
aXN5IHRoYW4gSQo+Pj4gPiBsaWtlLCBteSBvdmVyYWxsICJjb25maWRlbmNlIiBpbiB0aGUgImNv
bmNsdXNpb24iIEkgb2ZmZXJlZCBpcyBzdGlsbAo+Pj4gPiBwb3NpdGl2ZS4KPj4+Cj4+PiBSaWdo
dC4gSSBndWVzcyBJIHdvdWxkIGp1c3QgcHJlZmVyIGEgc2xpZ2h0bHkgbW9yZSBjb21wcmVoZW5z
aXZlCj4+PiBldmFsdWF0aW9uIHRvIGJhc2UgYSA0eCBpbmNyZWFzZSBpbiBidWZmZXIgc2l6ZSBv
bi4uLgo+Pgo+PiBLYWxsZSwgaXMgdGhpcyB3aHkgeW91IGRpZG4ndCBhY2NlcHQgdGhpcyBwYXRj
aD8gT3RoZXIgcmVhc29ucz8KPj4KPj4gVG9rZSwgd2hhdCBlbHNlIHdvdWxkIHlvdSBsaWtlIHRv
IHNlZSBldmFsdWF0ZWQ/Cj4+Cj4+IEkgZ2VuZXJhbGx5IHdhbnQgdG8gc2VlIHRocmVlIHRoaW5n
cyBtZWFzdXJlZCB3aGVuICJiZW5jaG1hcmtpbmciCj4+IHRlY2hub2xvZ2llczogdGhyb3VnaHB1
dCwgbGF0ZW5jeSwgY3B1IHV0aWxpemF0aW9uCj4+IFdlJ3ZlIGNvdmVyZWQgdGhvc2UgdGhyZWUg
SSB0aGluayAicmVhc29uYWJseSIuCj4KPiBIbW0sIGdvaW5nIGJhY2sgYW5kIGxvb2tpbmcgYXQg
dGhpcyAoSSdkIGNvbXBsZXRlbHkgZm9yZ290dGVuIGFib3V0IHRoaXMKPiBwYXRjaCksIEkgdGhp
bmsgSSBoYWQgdHdvIG1haW4gY29uY2VybnM6Cj4KPiAxLiBXaGF0IGhhcHBlbnMgaW4gYSBkZWdy
YWRlZCBzaWduYWwgc2l0dWF0aW9uLCB3aGVyZSB0aGUgdGhyb3VnaHB1dCBpcwo+ICAgIGxpbWl0
ZWQgYnkgdGhlIHNpZ25hbCBjb25kaXRpb25zLCBvciBieSBjb250ZW50aW9uIHdpdGggb3RoZXIg
ZGV2aWNlcy4KPiAgICBCb3RoIG9mIHRoZXNlIGhhcHBlbiByZWd1bGFybHksIGFuZCBJIHdvcnJ5
IHRoYXQgbGF0ZW5jeSB3aWxsIGJlCj4gICAgYmFkbHkgYWZmZWN0ZWQgdW5kZXIgdGhvc2UgY29u
ZGl0aW9ucy4KPgo+IDIuIFdoYXQgaGFwcGVucyB3aXRoIG9sZCBoYXJkd2FyZSB0aGF0IGhhcyB3
b3JzZSBidWZmZXIgbWFuYWdlbWVudCBpbgo+ICAgIHRoZSBkcml2ZXItPmZpcm13YXJlIHBhdGgg
KGVzcGVjaWFsbHkgZHJpdmVycyB3aXRob3V0IHB1c2gvcHVsbCBtb2RlCj4gICAgc3VwcG9ydCk/
IEZvciB0aGVzZSwgdGhlIGxvd2VyLWxldmVsIHF1ZXVlaW5nIHN0cnVjdHVyZSBpcyBsZXNzCj4g
ICAgZWZmZWN0aXZlIGF0IGNvbnRyb2xsaW5nIHF1ZXVlaW5nIGxhdGVuY3kuCgpEbyBub3RlIHRo
YXQgdGhpcyBwYXRjaCBjaGFuZ2VzIGJlaGF2aW91ciBfb25seV8gZm9yIFFDQTYxNzQgYW5kIFFD
QTkzNzcKUENJIGRldmljZXMsIHdoaWNoIElJUkMgZG8gbm90IGV2ZW4gc3VwcG9ydCBwdXNoL3B1
bGwgbW9kZS4gQWxsIHRoZQpyZXN0LCBpbmNsdWRpbmcgUUNBOTg4WCBhbmQgUUNBOTk4NCBhcmUg
dW5hZmZlY3RlZC4KCi0tIApLYWxsZSBWYWxvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRo
MTBrCg==
