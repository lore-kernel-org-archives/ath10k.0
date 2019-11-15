Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVaDh-000710-7p
 for ath10k@lists.infradead.org; Fri, 15 Nov 2019 11:56:58 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH net-next v2] ath10k: fix RX of frames with broken FCS in
 monitor mode
References: <20191115105612.8531-1-linus.luessing@c0d3.blue>
Date: Fri, 15 Nov 2019 13:56:45 +0200
In-Reply-To: <20191115105612.8531-1-linus.luessing@c0d3.blue> ("Linus
 \=\?utf-8\?Q\?L\=C3\=BCssing\=22's\?\= message of "Fri,
 15 Nov 2019 11:56:12 +0100")
Message-ID: <87a78xwdxe.fsf@codeaurora.org>
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
To: Linus =?utf-8?Q?L=C3=BCssing?= <linus.luessing@c0d3.blue>
Cc: Linus =?utf-8?Q?L=C3=BCssing?= <ll@simonwunderlich.de>, Simon Wunderlich <sw@simonwunderlich.de>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Ben Greear <greearb@candelatech.com>, "David S . Miller" <davem@davemloft.net>

TGludXMgTMO8c3NpbmcgPGxpbnVzLmx1ZXNzaW5nQGMwZDMuYmx1ZT4gd3JpdGVzOgoKPiBGcm9t
OiBMaW51cyBMw7xzc2luZyA8bGxAc2ltb253dW5kZXJsaWNoLmRlPgo+Cj4gU28gZmFyLCBmcmFt
ZXMgd2VyZSBmb3J3YXJkZWQgcmVnYXJkbGVzcyBvZiB0aGUgRkNTIGNvcnJlY3RuZXNzIGxlYWRp
bmcKPiB0byB1c2Vyc3BhY2UgYXBwbGljYXRpb25zIGxpc3RlbmluZyBvbiB0aGUgbW9uaXRvciBt
b2RlIGludGVyZmFjZSB0bwo+IHJlY2VpdmUgcG90ZW50aWFsbHkgYnJva2VuIGZyYW1lcywgZXZl
biB3aXRoIHRoZSAiZmNzZmFpbCIgZmxhZyB1bnNldC4KPgo+IEJ5IGRlZmF1bHQsIHdpdGggdGhl
ICJmY3NmYWlsIiBmbGFnIG9mIGEgbW9uaXRvciBtb2RlIGludGVyZmFjZQo+IHVuc2V0LCBmcmFt
ZXMgd2l0aCBGQ1MgZXJyb3JzIHNob3VsZCBiZSBkcm9wcGVkLiBXaXRoIHRoaXMgcGF0Y2gsIHRo
ZQo+IGZjc2ZhaWwgZmxhZyBpcyB0YWtlbiBpbnRvIGFjY291bnQgY29ycmVjdGx5Lgo+Cj4gQ2M6
IFNpbW9uIFd1bmRlcmxpY2ggPHN3QHNpbW9ud3VuZGVybGljaC5kZT4KPiBTaWduZWQtb2ZmLWJ5
OiBMaW51cyBMw7xzc2luZyA8bGxAc2ltb253dW5kZXJsaWNoLmRlPgoKYXRoMTBrIHBhdGNoZXMg
Z28gYXRoLW5leHQgYnJhbmNoLCBub3QgbmV0LW5leHQuIFNvIHRvIGF2b2lkIGNvbmZ1c2lvbgpw
bGVhc2UgZG9uJ3QgbWFyayBhdGgxMGsgcGF0Y2hlcyBhcyAibmV0LW5leHQiLCBwbGVhc2UuCgo+
IC0tLQo+IFRoaXMgd2FzIHRlc3RlZCBvbiBhbiBPcGVuIE1lc2ggQTQxIGRldmljZSwgZmVhdHVy
aW5nIGEgUUNBNDAxOS4gQW5kCj4gd2l0aCB0aGlzIGZpcm13YXJlOgo+Cj4gaHR0cHM6Ly93d3cu
Y2FuZGVsYXRlY2guY29tL2Rvd25sb2Fkcy9hdGgxMGstNDAxOS0xMC00Yi9maXJtd2FyZS01LWN0
LWZ1bGwtY29tbXVuaXR5LTEyLmJpbi1sZWRlLjAxMQoKSSdsbCBhZGQgdGhpcyB0ZXN0aW5nIGlu
Zm9ybWF0aW9uIHRvIHRoZSBjb21taXQgbG9nLiAoTm8gbmVlZCB0byByZXNlbmQKanVzdCBiZWNh
dXNlIG9mIGNvbW1pdCBsb2cgY2hhbmdlcykKCj4gQnV0IGZyb20gbG9va2luZyBhdCB0aGUgY29k
ZSBpdCBzZWVtcyB0aGF0IHRoZSB2YW5pbGxhIGF0aDEwayBoYXMgdGhlCj4gc2FtZSBpc3N1ZSwg
dGhlcmVmb3JlIHN1Ym1pdHRpbmcgaXQgaGVyZS4KClNvIHRoaXMgc2hvdWxkIHdvcmsgd2l0aCB0
aGUgUXVhbGNvbW0gZmlybXdhcmUgYXMgd2VsbCwgcmlnaHQ/CgotLSAKS2FsbGUgVmFsbwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxp
bmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
