Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fkDJn-0005JV-WF
 for ath10k@lists.infradead.org; Mon, 30 Jul 2018 18:54:57 +0000
Received: by mail-ed1-x541.google.com with SMTP id k15-v6so4574009edr.3
 for <ath10k@lists.infradead.org>; Mon, 30 Jul 2018 11:54:45 -0700 (PDT)
Subject: Re: [PATCH] ath10k: Limit available channels via DT
 ieee80211-freq-limit
References: <20180730153933.3771-1-sven.eckelmann@openmesh.com>
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Message-ID: <5B5F5EF2.2050100@broadcom.com>
Date: Mon, 30 Jul 2018 20:54:42 +0200
MIME-Version: 1.0
In-Reply-To: <20180730153933.3771-1-sven.eckelmann@openmesh.com>
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
To: Sven Eckelmann <sven.eckelmann@openmesh.com>, ath10k@lists.infradead.org
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, linux-wireless@vger.kernel.org

KyBSYWZhxYIKCk9uIDcvMzAvMjAxOCA1OjM5IFBNLCBTdmVuIEVja2VsbWFubiB3cm90ZToKPiBU
cmktYmFuZCBkZXZpY2VzICgxeCAyLjRHSHogKyAyeCA1R0h6KSBvZnRlbiBpbmNvcnBvcmF0ZSBz
cGVjaWFsIGZpbHRlcnMgaW4KPiB0aGUgUlggYW5kIFRYIHBhdGguIFRoZXNlIGZpbHRlcmVkIGNo
YW5uZWwgY2FuIGluIHRoZW9yeSBzdGlsbCBiZSB1c2VkIGJ5Cj4gdGhlIGhhcmR3YXJlIGJ1dCB0
aGUgc2lnbmFsIHN0cmVuZ3RoIGlzIHJlZHVjZWQgc28gbXVjaCB0aGF0IGl0IG1ha2VzIG5vCj4g
c2Vuc2UuCj4KPiBUaGVyZSBpcyBhbHJlYWR5IGEgRFQgcHJvcGVydHkgdG8gbGltaXQgdGhlIGF2
YWlsYWJsZSBjaGFubmVscyBidXQgYXRoMTBrCj4gaGFzIHRvIG1hbnVhbGx5IGNhbGwgdGhpcyBm
dW5jdGlvbmFsaXR5IHRvIGxpbWl0IHRoZSBjdXJycmVudGx5IHNldCB3aXBoeQo+IGNoYW5uZWxz
IGZ1cnRoZXIuCgpXb25kZXJpbmcgd2hldGhlciB3ZSBjYW4gY2FsbCBpdCBpbiB3aXBoeV9yZWdp
c3RlcigpIGxpa2UgYmVsb3cuIE5vdCAKc3VyZSB3aHkgd2UgZGlkIG5vdCBleHBsb3JlIHRoYXQg
d2l0aCB0aGUgaW50cm9kdWN0aW9uIG9mIGl0IGJ5IFJhZmHFgi4gCk1heWJlIGhlIHJlbWVtYmVy
cy4gSSBkaWQgbm90IGZpbmQgc29tZXRoaW5nIGluIHRoYXQgZGlyZWN0aW9uIGluIApwYXRjaHdv
cmssIGJ1dCBtYXkgaGF2ZSBtaXNzZWQgaXQuIEkga25vdyBtdDc2IGRyb3BzIHRoZSBiYW5kIHJl
ZmVyZW5jZSAKaWYgaXQgZW5kcyB1cCB3aXRoIGFsbCBjaGFubmVscyBkaXNhYmxlZC4gTWF5YmUg
dGhhdCB3YXMgdGhlIHJlYXNvbi4KClJlZ2FyZHMsCkFyZW5kCi0tLQpkaWZmIC0tZ2l0IGEvbmV0
L3dpcmVsZXNzL2NvcmUuYyBiL25ldC93aXJlbGVzcy9jb3JlLmMKaW5kZXggYTg4NTUxZi4uMmUw
MGNiMSAxMDA2NDQKLS0tIGEvbmV0L3dpcmVsZXNzL2NvcmUuYworKysgYi9uZXQvd2lyZWxlc3Mv
Y29yZS5jCkBAIC03NDIsNiArNzQyLDggQEAgaW50IHdpcGh5X3JlZ2lzdGVyKHN0cnVjdCB3aXBo
eSAqd2lwaHkpCglpZiAocmVzKQoJCXJldHVybiByZXM7CgorCXdpcGh5X3JlYWRfb2ZfZnJlcV9s
aW1pdHMod2lwaHkpOworCgkvKiBzYW5pdHkgY2hlY2sgc3VwcG9ydGVkIGJhbmRzL2NoYW5uZWxz
ICovCglmb3IgKGJhbmQgPSAwOyBiYW5kIDwgTlVNX05MODAyMTFfQkFORFM7IGJhbmQrKykgewoJ
CXUxNiB0eXBlcyA9IDA7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
