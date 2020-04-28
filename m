Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTOxG-0002tk-Vt
 for ath10k@lists.infradead.org; Tue, 28 Apr 2020 12:03:25 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: increase rx buffer size to 2048
In-Reply-To: <3097447.aZuNXRJysd@sven-edge> (Sven Eckelmann's message of "Sat, 
 25 Apr 2020 13:14:42 +0200")
References: <20200205191043.21913-1-linus.luessing@c0d3.blue>
 <3300912.TRQvxCK2vZ@bentobox> <3097447.aZuNXRJysd@sven-edge>
Date: Tue, 28 Apr 2020 15:01:28 +0300
Message-ID: <87blnblsyv.fsf@codeaurora.org>
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
To: Sven Eckelmann <sven@narfation.org>
Cc: Linus =?utf-8?Q?L=C3=BCssing?= <linus.luessing@c0d3.blue>, Simon Wunderlich <sw@simonwunderlich.de>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, mail@adrianschmutzler.de, Ben Greear <greearb@candelatech.com>, "David S . Miller" <davem@davemloft.net>, Linus =?utf-8?Q?L=C3=BCssing?= <ll@simonwunderlich.de>

U3ZlbiBFY2tlbG1hbm4gPHN2ZW5AbmFyZmF0aW9uLm9yZz4gd3JpdGVzOgoKPiBPbiBXZWRuZXNk
YXksIDEgQXByaWwgMjAyMCAwOTowMDo0OSBDRVNUIFN2ZW4gRWNrZWxtYW5uIHdyb3RlOgo+PiBP
biBXZWRuZXNkYXksIDUgRmVicnVhcnkgMjAyMCAyMDoxMDo0MyBDRVNUIExpbnVzIEzDvHNzaW5n
IHdyb3RlOgo+PiA+IEZyb206IExpbnVzIEzDvHNzaW5nIDxsbEBzaW1vbnd1bmRlcmxpY2guZGU+
Cj4+ID4gCj4+ID4gQmVmb3JlLCBvbmx5IGZyYW1lcyB3aXRoIGEgbWF4aW11bSBzaXplIG9mIDE1
MjggYnl0ZXMgY291bGQgYmUKPj4gPiB0cmFuc21pdHRlZCBiZXR3ZWVuIHR3byA4MDIuMTFzIG5v
ZGVzLgo+PiA+IAo+PiA+IEZvciBiYXRtYW4tYWR2IGZvciBpbnN0YW5jZSwgd2hpY2ggYWRkcyBp
dHMgb3duIGhlYWRlciB0byBlYWNoIGZyYW1lLAo+PiA+IHdlIHR5cGljYWxseSBuZWVkIGFuIE1U
VSBvZiBhdCBsZWFzdCAxNTMyIGJ5dGVzIHRvIGJlIGFibGUgdG8gdHJhbnNtaXQKPj4gPiB3aXRo
b3V0IGZyYWdtZW50YXRpb24uCj4+ID4gCj4+ID4gVGhpcyBwYXRjaCBub3cgaW5jcmVhc2VzIHRo
ZSBtYXhtaW11bSBmcmFtZSBzaXplIGZyb20gMTUyOCB0byAxNjU2Cj4+ID4gYnl0ZXMuCj4+IFsu
Li5dCj4+IAo+PiBAS2FsbGUsIEkgc2F3IHRoYXQgdGhpcyBwYXRjaCB3YXMgbWFya2VkIGFzIGRl
ZmVycmVkIFsxXSBidXQgSSBjb3VsZG4ndCBmaW5kIAo+PiBhbnkgbWFpbCB3aHkgaXQgd2FzIGRv
bmUgc28uIEl0IHNlZW1zIGxpa2UgdGhpcyBjdXJyZW50bHkgY3JlYXRlcyByZWFsIHdvcmxkIAo+
PiBwcm9ibGVtcyAtIHNvIHdvdWxkIGJlIG5pY2UgaWYgeW91IGNvdWxkIGV4cGxhaW4gc2hvcnRs
eSB3aGF0IGlzIGN1cnJlbnRseSAKPj4gYmxvY2tpbmcgaXRzIGFjY2VwdGFuY2UuCj4KPiBQaW5n
PwoKU29ycnkgZm9yIHRoZSBkZWxheSwgbXkgcGxhbiB3YXMgdG8gZmlyc3Qgd3JpdGUgc29tZSBk
b2N1bWVudGF0aW9uIGFib3V0CmRpZmZlcmVudCBoYXJkd2FyZSBmYW1pbGllcyBidXQgaGF2ZW4n
dCBtYW5hZ2VkIHRvIGRvIHRoYXQgeWV0LgoKTXkgcHJvYmxlbSB3aXRoIHRoaXMgcGF0Y2ggaXMg
dGhhdCBJIGRvbid0IGtub3cgd2hhdCBoYXJkd2FyZSBhbmQKZmlybXdhcmUgdmVyc2lvbnMgd2Vy
ZSB0ZXN0ZWQsIHNvIGl0IG5lZWRzIGFuYWx5c2lzIGJlZm9yZSBJIGZlZWwgc2FmZQp0byBhcHBs
eSBpdC4gVGhlIGF0aDEwayBoYXJkd2FyZSBmYW1pbGllcyBhcmUgdmVyeSBkaWZmZXJlbnQgdGhh
dCBldmVuCmlmIGEgcGF0Y2ggd29ya3MgcGVyZmVjdGx5IG9uIG9uZSBhdGgxMGsgaGFyZHdhcmUg
aXQgY291bGQgc3RpbGwgYnJlYWsKYmFkbHkgb24gYW5vdGhlciBvbmUuCgpXaGF0IG1ha2VzIG1l
IGZhc3RlciB0byBhcHBseSBhdGgxMGsgcGF0Y2hlcyBpcyB0byBoYXZlIGNvbXByZWhlbnNpdmUK
YW5hbHlzaXMgaW4gdGhlIGNvbW1pdCBsb2cuIFRoaXMgc2hvd3MgbWUgdGhlIHBhdGNoIGF1dGhv
ciBoYXMKY29uc2lkZXJlZCBhYm91dCBhbGwgaGFyZHdhcmUgZmFtaWxpZXMsIG5vdCBqdXN0IHRo
ZSBvbmUgaGUgaXMgdGVzdGluZwpvbiwgYW5kIHRoYXQgSSBkb24ndCBuZWVkIHRvIGRvIHRoZSBh
bmFseXNpcyBteXNlbGYuCgotLSAKaHR0cHM6Ly93aXJlbGVzcy53aWtpLmtlcm5lbC5vcmcvZW4v
ZGV2ZWxvcGVycy9kb2N1bWVudGF0aW9uL3N1Ym1pdHRpbmdwYXRjaGVzCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0
aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vYXRoMTBrCg==
