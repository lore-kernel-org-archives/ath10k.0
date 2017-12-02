Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.toke.dk ([52.28.52.200])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eL4Uy-00027g-CJ
 for ath10k@lists.infradead.org; Sat, 02 Dec 2017 09:54:18 +0000
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Subject: Re: [PATCH 2/2] ath10k: add per peer tx stats support for 10.2.4
In-Reply-To: <1512143881.25588.18.camel@sipsolutions.net>
References: <1512046701-14435-1-git-send-email-akolli@qti.qualcomm.com>
 <1512046701-14435-3-git-send-email-akolli@qti.qualcomm.com>
 <87k1y7zqtj.fsf@kamboji.qca.qualcomm.com>
 <DAB5EBB8-C820-4056-8AAB-063D05F38BD5@toke.dk>
 <87bmjjzppd.fsf@kamboji.qca.qualcomm.com>
 <5080a68538fd2d883e15bacaa969661b@codeaurora.org> <87r2se36rq.fsf@toke.dk>
 <87k1y6y04i.fsf@kamboji.qca.qualcomm.com> <87d13y31r0.fsf@toke.dk>
 <1512143142.25588.17.camel@sipsolutions.net> <87a7z230m3.fsf@toke.dk>
 <1512143881.25588.18.camel@sipsolutions.net>
Date: Sat, 02 Dec 2017 10:53:48 +0100
Message-ID: <87374t3177.fsf@toke.dk>
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
To: Johannes Berg <johannes@sipsolutions.net>, Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "linux-wireless-owner@vger.kernel.org" <linux-wireless-owner@vger.kernel.org>, Anilkumar Kolli <akolli@qti.qualcomm.com>, "akolli@codeaurora.org" <akolli@codeaurora.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Sm9oYW5uZXMgQmVyZyA8am9oYW5uZXNAc2lwc29sdXRpb25zLm5ldD4gd3JpdGVzOgoKPiBPbiBG
cmksIDIwMTctMTItMDEgYXQgMTY6NTQgKzAxMDAsIFRva2UgSMO4aWxhbmQtSsO4cmdlbnNlbiB3
cm90ZToKPgo+PiBCdXQgc2luY2Ugd2UnbGwgaGF2ZSB0byBkbyB0aGF0IGZvciBhdGg5ayBhbnl3
YXkgaXQKPj4gYmVjb21lcyBtb3JlIGEgcXVlc3Rpb24gb2Ygd2hldGhlciBpdCdzIHNvbWV0aGlu
ZyB0aGF0IHNob3VsZCBiZQo+PiBzdXBwb3J0ZWQgaW4gbWFjODAyMTEgb3IgaWYgaXQgc2hvdWxk
IGJlIGltcGxlbWVudGVkIGluIGVhY2ggZHJpdmVyLgo+PiBCdXQgc2luY2UgdGhhdCBsb2dpYyB3
aWxsIGhhdmUgdG8gYmUgd3JpdHRlbiBmcm9tIHNjcmF0Y2ggYW55d2F5LCBpcwo+PiB0aGVyZSBh
bnkgcmVhc29uIHRvIG5vdCBqdXN0IGRvIGl0IGluIG1hYzgwMjExIGZyb20gdGhlIGJlZ2lubmlu
Zz8KPgo+IEkgd2FzIHRoaW5raW5nIGluIHRoZSBkcml2ZXIgc28gdGhhdCB0aGVyZSdzIG5vIG92
ZXJoZWFkIGZvciB0aGUgb3RoZXIKPiBkcml2ZXJzIHRoYXQgZG9uJ3Qgd2FudCBpdCB0aGF0IHdh
eS4KPgo+IER1bm5vLiBJdCBwcm9iYWJseSBkb2Vzbid0IHJlYWxseSBtYXR0ZXIuCgpJJ2xsIHBy
b3RvdHlwZSBzb21ldGhpbmcsIHRoZW4gd2UgY2FuIHJldmlzaXQgdGhpcyBiYXNlZCBvbiBhY3R1
YWwgY29kZSA6KQoKLVRva2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
