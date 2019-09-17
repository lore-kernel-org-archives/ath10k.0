Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iA7Of-0003ur-I2
 for ath10k@lists.infradead.org; Tue, 17 Sep 2019 06:55:34 +0000
Message-ID: <dd8ee4a2e5cffa1bb6ab4176a57c2b66d495d3ac.camel@sipsolutions.net>
Subject: Re: [PATCH 3/4] mac80211: fix low throughput in push pull mode
From: Johannes Berg <johannes@sipsolutions.net>
Date: Tue, 17 Sep 2019 08:55:01 +0200
In-Reply-To: <8e4cd872d082c6bce598c87411a2125f@codeaurora.org>
References: <1568639388-27291-1-git-send-email-yiboz@codeaurora.org>
 <1568639388-27291-3-git-send-email-yiboz@codeaurora.org>
 (sfid-20190916_151039_049848_BE125514)
 <6684ceecde399edeb31c594f889a403440c78142.camel@sipsolutions.net>
 <8e4cd872d082c6bce598c87411a2125f@codeaurora.org>
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
To: Yibo Zhao <yiboz@codeaurora.org>
Cc: linux-wireless-owner@vger.kernel.org, Toke =?ISO-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@toke.dk>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

T24gVHVlLCAyMDE5LTA5LTE3IGF0IDE0OjM2ICswODAwLCBZaWJvIFpoYW8gd3JvdGU6Cj4gCj4g
RG8geW91IG1lYW4gaXQgc2hvdWxkIGJlIHNvbWV0aGluZyBsaWtlOgo+IAo+IENvLWRldmVsb3Bl
ZC1ieTogVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIDx0b2tlQHRva2UuZGs+Cj4gU2lnbmVkLW9m
Zi1ieTogWWlibyBaaGFvIDx5aWJvekBjb2RlYXVyb3JhLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBU
b2tlIEjDuGlsYW5kLUrDuHJnZW5zZW4gPHRva2VAdG9rZS5kaz4KClllcywgSSB0aGluayB5b3Ug
bWVhbiB0aGUgcmlnaHQgdGhpbmcuIEZvciB0aGUgcmVjb3JkLCBpdCBzZWVtcyB0byBtZSBpdApz
aG91bGQgYmUKCkZyb206IEEgPC4uLj4KClsuLi5dCgpDby1kZXZlbG9wZWQtYnk6IEIgPC4uLj4K
U2lnbmVkLW9mZi1ieTogQiA8Li4uPgpTaWduZWQtb2ZmLWJ5OiBBIDwuLi4+CgpvciBzby4KCklP
VywgSSB0aGluayBoYXZpbmcgdGhlIHNhbWUgIkZyb206IiAod2hpY2ggZ2V0cyBwcmVzZXJ2ZWQg
aW4gZ2l0IGFzCiJBdXRob3IiKSBhbmQgIkNvLWRldmVsb3BlZC1ieSIgbWFrZXMgbm8gc2Vuc2U/
CgpZb3VyICJGcm9tIiBsaW5lIHdhcyBpbXBsaWVkLCBidXQgSSBzdXBwb3NlIHlvdSBkaWQgbWVh
biB0aGF0IEZyb20gd291bGQKYmUgeW91cnNlbGYgKGFzIGl0IHdhcyBpbiB0aGUgcGF0Y2gpIGFu
ZCB0aGVuIHRoZSBhYm92ZSBzZWVtcyByaWdodC4KCk9yIHlvdSBjYW4gYWRkIGEgIkZyb206IFRv
a2UgLi4uIiB0byB5b3VyIHBhdGNoIG1lc3NhZ2UgYW5kIGxlYXZlIHRoZQoiQ28tZGV2ZWxvcGVk
LWJ5OiB5b3Vyc2VsZiIgSSBzdXBwb3NlLCB0aGUgZGlmZmVyZW5jZSBpcyBpbiBob3cgZ2l0IHdp
bGwKcmVjb3JkIGl0LgoKam9oYW5uZXMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBr
Cg==
