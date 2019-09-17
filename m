Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iA766-0004lj-0o
 for ath10k@lists.infradead.org; Tue, 17 Sep 2019 06:36:23 +0000
MIME-Version: 1.0
Date: Tue, 17 Sep 2019 14:36:20 +0800
From: Yibo Zhao <yiboz@codeaurora.org>
Subject: Re: [PATCH 3/4] mac80211: fix low throughput in push pull mode
In-Reply-To: <6684ceecde399edeb31c594f889a403440c78142.camel@sipsolutions.net>
References: <1568639388-27291-1-git-send-email-yiboz@codeaurora.org>
 <1568639388-27291-3-git-send-email-yiboz@codeaurora.org>
 (sfid-20190916_151039_049848_BE125514)
 <6684ceecde399edeb31c594f889a403440c78142.camel@sipsolutions.net>
Message-ID: <8e4cd872d082c6bce598c87411a2125f@codeaurora.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless-owner@vger.kernel.org, =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

T24gMjAxOS0wOS0xNiAyMzoyNywgSm9oYW5uZXMgQmVyZyB3cm90ZToKPiBXaXRob3V0IHJlYWxs
eSBsb29raW5nIGF0IHRoZSBjb2RlIC0KPiAKPj4gSWYgc3RhdGlvbiBpcyBpbmVsaWdpYmxlIGZv
ciB0cmFuc21pc3Npb24gaW4gCj4+IGllZWU4MDIxMV90eHFfbWF5X3RyYW5zbWl0KCksCj4+IG5v
IHBhY2tldCB3aWxsIGJlIGRlbGl2ZXJlZCB0byBGVy4gRHVyaW5nIHRoZSB0ZXN0cyBpbiBwdXNo
LXB1bGwgbW9kZSAKPj4gd2l0aAo+PiBtYW55IGNsaWVudHMsIGFmdGVyIHNldmVyYWwgc2Vjb25k
cywgbm90IGEgc2luZ2xlIHN0YXRpb24gaXMgYW4gCj4+IGVsaWdpYmxlCj4+IGNhbmRpZGF0ZSBm
b3IgdHJhbnNtaXNzaW9uIHNpbmNlIGdsb2JhbCB0aW1lIGlzIHNtYWxsZXIgdGhhbiBhbGwgdGhl
Cj4+IHN0YXRpb24ncyB2aXJ0dWFsIGFpcnRpbWUuIEFzIGEgY29uc2VxdWVuY2UsIHRoZSBUeCBo
YXMgYmVlbiBibG9ja2VkIAo+PiBhbmQKPj4gdGhyb3VnaHB1dCBpcyBxdWl0ZSBsb3cuCj4gCj4g
WW91IHNob3VsZCByZXdyaXRlIHRoaXMgdG8gYmUsIGVybSwgYSBiaXQgbW9yZSB1bmRlcnN0YW5k
YWJsZSBpbgo+IG1hYzgwMjExIGNvbnRleHQuIEkgYXNzdW1lIHlvdSdyZSBzcGVha2luZyAobW9z
dGx5PykgYWJvdXQgYXRoMTBrLCBidXQgCj4gSQo+IGhhdmUgdmVyeSBsaXR0bGUgY29udGV4dCB0
aGVyZS4gInB1c2ggcHVsbCBtb2RlIj8gImZpcm13YXJlIj8gVGhlc2UKPiB0aGluZ3MgYXJlIG5v
dCBzb21ldGhpbmcgbWFjODAyMTEga25vd3MgYWJvdXQuCkhpIEpvaGFubmVzLAoKVGhhbmtzIGZv
ciB5b3VyIGtpbmRseSByZW1pbmRlci4gV2lsbCByZXdyaXRlIHRoZSBjb21taXQgbG9nLgoKPiAK
Pj4gQ28tZGV2ZWxvcGVkLWJ5OiBZaWJvIFpoYW8gPHlpYm96QGNvZGVhdXJvcmEub3JnPgo+IAo+
IFRoYXQgYWxzbyBzZWVtcyB3cm9uZywgc2hvdWxkIGJlIFRva2UgSSBndWVzcywgdW5sZXNzIHlv
dSBpbnRlbmRlZCBmb3IgCj4gYQo+IEZyb206IFRva2UgdG8gYmUgcHJlc2VudD8KRG8geW91IG1l
YW4gaXQgc2hvdWxkIGJlIHNvbWV0aGluZyBsaWtlOgoKQ28tZGV2ZWxvcGVkLWJ5OiBUb2tlIEjD
uGlsYW5kLUrDuHJnZW5zZW4gPHRva2VAdG9rZS5kaz4KU2lnbmVkLW9mZi1ieTogWWlibyBaaGFv
IDx5aWJvekBjb2RlYXVyb3JhLm9yZz4KU2lnbmVkLW9mZi1ieTogVG9rZSBIw7hpbGFuZC1Kw7hy
Z2Vuc2VuIDx0b2tlQHRva2UuZGs+CgpBbSBJIHVuZGVyc3RhbmRpbmcgcmlnaHQ/Cj4gCj4gam9o
YW5uZXMKCi0tIApZaWJvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
