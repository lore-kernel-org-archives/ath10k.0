Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fSiIo-00028Q-5C
 for ath10k@lists.infradead.org; Tue, 12 Jun 2018 12:21:35 +0000
Received: by mail-wr0-x243.google.com with SMTP id w10-v6so23855687wrk.9
 for <ath10k@lists.infradead.org>; Tue, 12 Jun 2018 05:21:23 -0700 (PDT)
Message-ID: <411d1d752811ce2b701d9f3a0d20f05050dc2e09.camel@gmail.com>
Subject: Re: [PATCH v2] ath10k: Update the phymode along with bandwidth
 change request
From: Timur =?ISO-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
Date: Tue, 12 Jun 2018 14:21:20 +0200
In-Reply-To: <87muw0cjwq.fsf@kamboji.qca.qualcomm.com>
References: <1528482759-12604-1-git-send-email-ryanhsu@codeaurora.org>
 <944989ec907b98716f252524cf55e41807965253.camel@gmail.com>
 <87muw0cjwq.fsf@kamboji.qca.qualcomm.com>
Mime-Version: 1.0
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Ryan Hsu <ryanhsu@codeaurora.org>

T24gVHVlLCAyMDE4LTA2LTEyIGF0IDE0OjQwICswMzAwLCBLYWxsZSBWYWxvIHdyb3RlOgo+IFRp
bXVyIEtyaXN0w7NmIDx0aW11ci5rcmlzdG9mQGdtYWlsLmNvbT4gd3JpdGVzOgo+IAo+ID4gT24g
RnJpLCAyMDE4LTA2LTA4IGF0IDExOjMyIC0wNzAwLCBSeWFuIEhzdSB3cm90ZToKPiA+ID4gSW4g
dGhlIGNhc2Ugb2YgU3RhdGlvbiBjb25uZWN0cyB0byBBUCB3aXRoIG5hcnJvd2VyIGJhbmR3aWR0
aCBhdAo+ID4gPiBiZWdpbm5pbmcuCj4gPiA+IEFuZCBsYXRlciB0aGUgQVAgY2hhbmdlcyB0aGUg
YmFuZHdpZHRoIHRvIHdpbmRlciBiYW5kd2lkdGgsIHRoZQo+ID4gPiBBUAo+ID4gPiB3aWxsCj4g
PiA+IGJlYWNvbiB3aXRoIHdpZGVyIGJhbmR3aWR0aCBJRSwgZWcgVkhUMjAtPlZIVDQwLT5WSFQ4
MCBvciBWSFQ0MC0KPiA+ID4gPiBWSFQ4MC4KPiA+ID4gCj4gPiA+IFNpbmNlIHRoZSBzdXBwb3J0
ZWQgQkFORFdJRFRIIHdpbGwgYmUgbGltaXRlZCBieSB0aGUgUEhZTU9ERSwgc28KPiA+ID4gd2hp
bGUKPiA+ID4gU3RhdGlvbiByZWNlaXZlcyB0aGUgYmFuZHdpZHRoIGNoYW5nZSByZXF1ZXN0LCBp
dCB3aWxsIGFsc28gbmVlZAo+ID4gPiB0bwo+ID4gPiByZWNvbmZpZ3VyZSB0aGUgUEhZTU9ERSBz
ZXR0aW5nIHRvIGZpcm13YXJlIGluc3RlYWQgb2YganVzdAo+ID4gPiBjb25maWd1cmluZwo+ID4g
PiB0aGUgQkFORFdJRFRIIGluZm8sIG90aGVyd2lzZSBpdCdsbCB0cmlnZ2VyIGEgZmlybXdhcmUg
Y3Jhc2ggd2l0aAo+ID4gPiBub24tc3VwcG9ydCBiYW5kd2lkdGguCj4gPiA+IAo+ID4gPiBUaGUg
aXNzdWUgd2FzIG9ic2VydmVkIGluIFdMQU4uUk0uNC40LjEtMDAwNTEtUUNBUk1TV1AtMSwgUUNB
NjE3NAo+ID4gPiB3aXRoCj4gPiA+IGJlbG93IHNjZW5hcmlvLgo+IAo+IFsuLi5dCj4gCj4gPiBJ
IGNhbiBjb25maXJtIHRoYXQgdGhpcyBwYXRjaCB3b3JrcyBvbiBteSBtYWNoaW5lLCBhbmQgcHJl
dmVudHMgdGhlCj4gPiBjcmFzaCBwcmV2aW91c2x5IGNhdXNlZCBieSBjaGFuZ2luZyB0aGUgYmFu
ZHdpZHRoLgo+IAo+IEdyZWF0LCB0aGFua3MgYSBsb3QgZm9yIHdvcmtpbmcgb24gdGhpcy4gSSds
bCBhZGQgeW91ciBUZXN0ZWQtYnkgdG8KPiB0aGUKPiBjb21taXQgbG9nLgoKVGhhbmtzIQoKPiA+
IENhbiBpdCBiZSBhY2NlcHRlZCwgb3IgaXMgdGhlcmUgYW55dGhpbmcgSSBjYW4gaGVscCB3aXRo
LCB0byBnZXQgaXQKPiA+IGFjY2VwdGVkPwo+IAo+IFN0cmFuZ2VseSBJIGNhbid0IGZpbmQgVGlt
dXIncyB2ZXJzaW9uIG9mIHRoZSBwYXRjaCBmcm9tIHBhdGNod29yazoKPiAKPiBodHRwczovL3Bh
dGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtd2lyZWxlc3MvbGlzdC8/c3RhdGU9Kgo+
IAo+IE1heWJlIGl0IGdvdCBkcm9wcGVkIGR1ZSB0byBzb21lIFVURi04IHByb2JsZW1zPyBwYXRj
aHdvcmsgaXMga25vd24KPiB0bwo+IGJlIHByb2JsZW1hdGljIHdpdGggVVRGLTguCgpOb3Qgc3Vy
ZS4gSXQgZG9lc24ndCByZWFsbHkgbWF0dGVyIG5vdywgUnlhbidzIHZlcnNpb24gaXMgZmluZSB0
b28uCgo+IEFueXdheSwgSSdsbCBxdWV1ZSBSeWFuJ3MgdjIgdG8gNC4xOC4gSXQgZmlyc3QgZ29l
cyB0byB0aGUgcGVuZGluZwo+IGJyYW5jaCBmb3IgYnVpbGQgdGVzdGluZyBhbmQgZnJvbSB0aGVy
ZSB0byBhdGgtY3VycmVudCBicmFuY2guCgpBd2Vzb21lLCB0aGFuayB5b3UgS2FsbGUhCgpCZXN0
IHJlZ2FyZHMsClRpbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
