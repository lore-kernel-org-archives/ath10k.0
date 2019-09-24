Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCazP-0006rv-Pi
 for ath10k@lists.infradead.org; Tue, 24 Sep 2019 02:55:45 +0000
MIME-Version: 1.0
Date: Tue, 24 Sep 2019 10:55:42 +0800
From: Yibo Zhao <yiboz@codeaurora.org>
Subject: Re: [PATCH V3 2/4] mac80211: defer txqs removal from rbtree
In-Reply-To: <87ef075lit.fsf@toke.dk>
References: <1569223201-1490-1-git-send-email-yiboz@codeaurora.org>
 <1569223201-1490-3-git-send-email-yiboz@codeaurora.org>
 <87ef075lit.fsf@toke.dk>
Message-ID: <5dadc4a130c2ba3d6548969f47c5f85c@codeaurora.org>
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
To: =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

T24gMjAxOS0wOS0yMyAxODo1NiwgVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIHdyb3RlOgo+IFlp
Ym8gWmhhbyA8eWlib3pAY29kZWF1cm9yYS5vcmc+IHdyaXRlczoKPiAKPj4gSW4gYSBsb29wIHR4
cXMgZGVxdWV1ZSBzY2VuYXJpbywgaWYgdGhlIGZpcnN0IHR4cSBpbiB0aGUgcmJ0cmVlIGdldHMK
Pj4gcmVtb3ZlZCBmcm9tIHJidHJlZSBpbW1lZGlhdGVseSBpbiB0aGUgaWVlZTgwMjExX3JldHVy
bl90eHEoKSwgdGhlCj4+IGxvb3Agd2lsbCBicmVhayBzb29uIGluIHRoZSBpZWVlODAyMTFfbmV4
dF90eHEoKSBkdWUgdG8gc2NoZWR1bGVfcG9zCj4+IG5vdCBsZWFkaW5nIHRvIHRoZSBzZWNvbmQg
dHhxIGluIHRoZSByYnRyZWUuIFRodXMsIGRlZmVyaW5nIHRoZQo+PiByZW1vdmFsIHJpZ2h0IGJl
Zm9yZSB0aGUgZW5kIG9mIHRoaXMgc2NoZWR1bGUgcm91bmQuCj4gCj4gRGlkbid0IHdlIGFncmVl
IHRoYXQgd2UgY291bGQgZml4IHRoaXMgYnkgbWFraW5nIF9fdW5zY2hlZHVsZV90eHEoKQo+IGF3
YXJlIG9mIHNjaGVkdWxlX3BvcyBpbnN0ZWFkIG9mIHRoaXMgZGVmZXJyZWQgcmVtb3ZhbCBtZWNo
YW5pc20/CgpZZXMsIFYzIGlzIGFjdHVhbGx5IHVzZWQgdG8gdXBkYXRlIHRoZSBjb21taXQgbG9n
IG9mIFtQQVRDSCBWMyAzLzRdIHNvIAp0aGF0IHdlIGNhbiBkaXNjdXNzIGluIHBhcmFsbGVsIHdp
dGggb3RoZXJzLCBhbmQgW1BBVENIIFYzIDQvNF0gZm9yIApkaXNjdXNzaW9uLiBQbGVhc2UgaWdu
b3JlIFtQQVRDSCBWMyAyLzRdLiB3ZSBjYW4ga2VlcCBvdXIgZGlzY3Vzc2lvbiBpbiAKVjIgdW50
aWwgd2UgY29uY2x1ZGUgdGhlIGZpbmFsIG9uZSBhbmQgdGhlbiBhIG5ldyB2ZXJzaW9uIHdpbGwg
YmUgc2VudCAKb3V0IGFsb25nIHdpdGggW21hYzgwMjExOiBTd2l0Y2ggdG8gYSB2aXJ0dWFsIHRp
bWUtYmFzZWQgYWlydGltZSAKc2NoZWR1bGVyXSB3aGljaCBpbmNsdWRlcyB0aGUgcmVkdWNpbmcg
bG9jayBmaXguCgpTb3JyeSBmb3IgdGhlIGNvbmZ1c2lvbiwgOykuCgo+IAo+IC1Ub2tlCgotLSAK
WWlibwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRo
MTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
