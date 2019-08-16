Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout2.fh-giessen.de ([212.201.18.46])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hyemR-0005NC-3N
 for ath10k@lists.infradead.org; Fri, 16 Aug 2019 16:08:45 +0000
From: Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>
Subject: regression in ath10k dma allocation
Message-ID: <8fe8b415-2d34-0a14-170b-dcb31c162e67@mni.thm.de>
Date: Fri, 16 Aug 2019 18:08:26 +0200
MIME-Version: 1.0
Content-Language: en-US
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
To: kvalo@codeaurora.org, davem@davemloft.net, ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, nicoleotsuka@gmail.com, hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com, iommu@lists.linux-foundation.org
Cc: tobias.klausmann@freenet.de

SGVsbG8gYWxsLAoKd2l0aGluIHRoZSBjdXJyZW50IGRldmVsb3BtZW50IGN5Y2xlIGkgbm90ZWQg
dGhlIGF0aDEwayBkcml2ZXIgZmFpbGluZyAKdG8gc2V0dXA6CgpbwqDCoMKgIDMuMTg1NjYwXSBh
dGgxMGtfcGNpIDAwMDA6MDI6MDAuMDogZmFpbGVkIHRvIGFsbG9jIENFIGRlc3QgcmluZyAxOiAt
MTIKW8KgwqDCoCAzLjE4NTY2NF0gYXRoMTBrX3BjaSAwMDAwOjAyOjAwLjA6IGZhaWxlZCB0byBh
bGxvY2F0ZSBjb3B5IGVuZ2luZSAKcGlwZSAxOiAtMTIKW8KgwqDCoCAzLjE4NTY2N10gYXRoMTBr
X3BjaSAwMDAwOjAyOjAwLjA6IGZhaWxlZCB0byBhbGxvY2F0ZSBjb3B5IGVuZ2luZSAKcGlwZXM6
IC0xMgpbwqDCoMKgIDMuMTg1NjY5XSBhdGgxMGtfcGNpIDAwMDA6MDI6MDAuMDogZmFpbGVkIHRv
IHNldHVwIHJlc291cmNlOiAtMTIKW8KgwqDCoCAzLjE4NTY5Ml0gYXRoMTBrX3BjaTogcHJvYmUg
b2YgMDAwMDowMjowMC4wIGZhaWxlZCB3aXRoIGVycm9yIC0xMgoKdGhlIGFjdHVhbCBmYWlsdXJl
IGNvbWVzIGZyb20gWzFdIGFuZCBpbmRlZWQgYmlzZWN0aW5nIGJyb3VnaHQgbWUgdG8gYSAKcmVs
YXRlZCBjb21taXQgImRtYS1jb250aWd1b3VzOiBhZGQgZG1hX3thbGxvYyxmcmVlfV9jb250aWd1
b3VzKCkgCmhlbHBlcnMiIFsyXS4gUmV2ZXJ0aW5nIHRoZSBjb21taXQgZml4ZXMgdGhlIHByb2Js
ZW0sIHlldCB0aGlzIG1pZ2h0IApqdXN0IGJlIHRoZSBkcml2ZXIgYWJ1c2luZyB0aGUgZG1hIGlu
ZnJhc3RydWN0dXJlLCBzbyBob3BlZnVsbHkgc29tZW9uZSAKY2FuIGhhdmUgYSBsb29rIGF0IGl0
LCBhcyBpJ20gbm90IGZhbWlsaWFyIHdpdGggdGhlIGNvZGUhCgoKWzFdOiAKaHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3Ry
ZWUvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9jZS5jP2g9djUuMy1yYzQjbjE2NTAK
ClsyXTogCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3Rv
cnZhbGRzL2xpbnV4LmdpdC9jb21taXQvP2lkPWIxZDJkYzAwOWRlY2U0Y2Q3ZTYyOTQxOWI1MjI2
NmJhNTE5NjBhNmIKCgpHcmVldGluZ3MsCgpUb2JpYXMKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vYXRoMTBrCg==
