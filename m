Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cO0B6-0004wV-6z
 for ath10k@lists.infradead.org; Mon, 02 Jan 2017 10:49:21 +0000
Message-ID: <1483354130.4596.5.camel@sipsolutions.net>
Subject: Re: [PATCH 2/4] cfg80211: Add new NL80211_CMD_SET_BTCOEX_PRIORITY
 to support BTCOEX
From: Johannes Berg <johannes@sipsolutions.net>
Date: Mon, 02 Jan 2017 11:48:50 +0100
In-Reply-To: <ae82112880d55451342e7a6e5a47c33f@codeaurora.org>
References: <1478610932-21954-1-git-send-email-c_traja@qti.qualcomm.com>
 <1478610932-21954-3-git-send-email-c_traja@qti.qualcomm.com>
 <1480949353.31788.27.camel@sipsolutions.net>
 <5e5e8971c96293a81e7cb37bcdfbd593@codeaurora.org>
 <1481645351.20412.34.camel@sipsolutions.net>
 <134cc8e58ecb804b6dda0137c4c37be8@codeaurora.org>
 <1481881024.27953.14.camel@sipsolutions.net>
 <ae82112880d55451342e7a6e5a47c33f@codeaurora.org>
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
To: Tamizh chelvam <tamizhchelvam@codeaurora.org>
Cc: c_traja@qti.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Cj4gPiAxKSBkb2VzIGl0IGV2ZW4gbWFrZSBzZW5zZSB0byBzcGxpdCBpdCBvdXQgcGVyIEFDPyB3
b3VsZG4ndCBpdCBiZQo+ID4gd2VpcmQKPiA+IGlmIHlvdSBzdXBwb3J0ZWQgdGhpcyBvbmx5IGZv
ciBWTyBhbmQgQkssIGFuZCBub3QgdGhlIG90aGVycywgb3IKPiA+IHNvbWV0aGluZyBsaWtlIHRo
YXQ/Cj4gPiAKPiAKPiBJdCBoYXMgc3VwcG9ydCBmb3IgQkUsIFZJLCBtYW5hZ2VtZW50IGFuZCBi
ZWFjb24gZnJhbWVzIGFsc28uCj4gT3IgZG8geW91IG1lYW50IHRvIHNheSBsaWtlIHN1cHBvcnQg
b25seSBmb3IgVk8gYW5kIEJLPwoKSSBtZWFuIC0gZG9lcyBpdCBtYWtlIHNlbnNlIGZvciBhIHBp
ZWNlIG9mIGhhcmR3YXJlIHRvIHN1cHBvcnQgb25seQpWTy9CSywgd2l0aG91dCB0aGUgb3RoZXJz
PyBJIGRvbid0IHJlYWxseSBzZWUgaG93IHRoYXQgd291bGQgbWFrZQpzZW5zZSwgYnV0IG1heWJl
IEknbSBtaXNzaW5nIHNvbWV0aGluZz8KCklPVyAtIHdoeSBoYXZlIGFsbCB0aGVzZSBiaXRzIHJh
dGhlciB0aGFuIGp1c3Qgb25lPwoKPiA+IDIpIFdvdWxkbid0IGl0IG1ha2UgbW9yZSBzZW5zZSB0
byBkZWZpbmUgdGhpcyBpbiBubDgwMjExIGFuZCBqdXN0Cj4gPiBwYXNzIHRoZSBiaXRtYXAgdGhy
b3VnaCB0byB1c2Vyc3BhY2U/IFRoYXQgd291bGQgc2F2ZSBxdWl0ZSBhIGJpdAo+ID4gb2YgbmV0
bGluayBtYW5nbGluZyBjb21wbGV4aXR5Lgo+ID4gCj4gCj4gUGxlYXNlIGxldCBtZSBrbm93IGlm
IHRoZSBiZWxvdyBkZXNpZ24vdGhvdWdodCBpcyBmaW5lIHRvIHlvdS4KPiAKPiBpdyBwaHlYIHNl
dCBidGNvZXhfcHJpb3JpdHkgPFt2aSwgdm8sIGJlLCBiaywgbWdtdCwgYmVhY29uXT4KClRoYXQg
c2VlbXMgZmluZSwgYnV0IEkgZG9uJ3Qgc2VlIGhvdyB0aGUgaXcgY29tbWFuZCBsaW5lIGlzIHJl
bGV2YW50IHRvCnRoZSBxdWVzdGlvbiBvZiB3aGV0aGVyIHdlIHBhc3MgZmxhZyBhdHRyaWJ1dGVz
IG9yIGEgYml0bWFwPz8KCj4gQnkgdGhpcyBjb21tYW5kIHVzZXIgc2hvdWxkIGdpdmUgb25lIG9y
IG1vcmUgdGhhbiBvbmUgZnJhbWUgdHlwZXMKPiBmb3LCoAo+IHRoaXMgYnRjb2V4IHByaW9yaXR5
LAo+IHdlIHdpbGwgcGFyc2UgdGhhdCBpbiAiaXciIGFuZCBzZW5kIGFzIGEgc2luZ2xlIGJpdG1h
cChsZXNzIHRoYW4KPiAweDY0KcKgIHRvIHRoZSBkcml2ZXI/CgpSaWdodCwgYW5kIGFsc28gdG8g
bmw4MDIxMS4gV2h5IG5vdD8KCmpvaGFubmVzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRo
MTBrCg==
