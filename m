Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x236.google.com ([2a00:1450:400c:c05::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YPtsa-0002wK-SN
 for ath10k@lists.infradead.org; Mon, 23 Feb 2015 14:21:01 +0000
Received: by mail-wi0-f182.google.com with SMTP id l15so17271533wiw.3
 for <ath10k@lists.infradead.org>; Mon, 23 Feb 2015 06:20:38 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <54EB2ED5.8040104@sophos.com>
References: <54EB264D.5040805@sophos.com>
 <CA+BoTQnaNmRs9NcXUtJddhD1SfxAy+Ct-s-hD4mvsi9cqh1eSw@mail.gmail.com>
 <54EB2ED5.8040104@sophos.com>
Date: Mon, 23 Feb 2015 15:20:38 +0100
Message-ID: <CA+BoTQm01wMzdB1-1V6OE=oNRuCcrrAoRU5LtxYiQt+TmSEfxA@mail.gmail.com>
Subject: Re: ath10k + INTEL_IDLE aka. cstates == firmware crash
From: Michal Kazior <michal.kazior@tieto.com>
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
To: Fabian Wittenberg <Fabian.Wittenberg@sophos.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMjMgRmVicnVhcnkgMjAxNSBhdCAxNDo0NCwgRmFiaWFuIFdpdHRlbmJlcmcKPEZhYmlhbi5X
aXR0ZW5iZXJnQHNvcGhvcy5jb20+IHdyb3RlOgo+IEhpIE1pY2hhbCwKPgo+IEkgdXNlZCBmaXJt
d2FyZSB2ZXJzaW9uIDEwLjEgYW5kIDEwLjIgZnJvbSBoZXJlOgo+IGh0dHBzOi8vZ2l0aHViLmNv
bS9rdmFsby9hdGgxMGstZmlybXdhcmUuIEJvdGggc2hvdyB0aGUgc2FtZSBiZWhhdmlvci4KPgo+
IFlvdSBhcmUgcmlnaHQuIFRoZXJlIGFyZSBzb21lIEJJT1MgdGhhdCBkbyBzdHJhbmdlIGhhbmRs
aW5nIG9mIHRoaXMKPiBjc3RhdGUgc3R1ZmYgYnV0IHdlIGhhdmUgbm8gaW5mbHVlbmNlIG9uIHRo
ZSBCSU9TIGFzIHRoaXMgaXMgZG9uZSBieQo+IG91ciBoYXJkd2FyZSB2ZW5kb3IuIFdlIGV4cGVy
aW1lbnRlZCBhIGxvdCB3aXRoIHRoZSBNU0kgbWFza2luZyBiaXQgb2YKPiB0aGUgcGNpLWUgcm9v
dCBicmlkZ2Ugd2hlcmUgdGhlIGFjLWNhcmQgaXMgY29ubmVjdGVkIHRvLgo+IFRoZXJlIHdlcmUg
bm8gcmVtYXJrYWJsZSBpbXByb3ZlbWVudHMgcGxheWluZyBhcm91bmQgd2l0aCB0aGlzIGJpdC4K
CklmIHlvdSBkb24ndCBoYXZlIEJJT1MvVUVGSSB1cGdyYWRlIGF2YWlsYWJsZSB5b3UgY2FuIHRy
eSBhcHBlbmRpbmcKYGludGVsX2lkbGUubWF4X2NzdGF0ZT0wYCB0byBrZXJuZWwgYm9vdCBwYXJh
bWV0ZXJzLiBLZWVwIGluIG1pbmQgdGhpcwp3aWxsIGRpc2FibGUgQ1BVIHBvd2VyIG1hbmFnZW1l
bnQuCgoKPiBXZSBoYXZlIHRlc3RlZCB0aGUgc2FtZSBib2FyZHMgd2l0aCBjYXJkcyB0aGF0IG5l
ZWQgYXRoOWsgYXMgd2VsbC4gVGhleQo+IGFyZSB3b3JraW5nIGp1c3QgZmluZS4gV2l0aCBhbmQg
d2l0aG91dCBlbmFibGVkIElOVEVMX0lETEUuLi4KCkkgcnVuIHdpdGggbXkgbGFwdG9wcyAoaTUt
MzMyME0gYW5kICBpNS0yNTIwTSkgd2l0aCBJTlRFTF9JRExFIGFuZCBRQ0E5ODh4IGZpbmUuCgpJ
J20gbm90IHJlYWxseSBhbiBleHBlcnQgb24gdGhpcyBzdHVmZiBidXQgc2luY2UgQy1zdGF0ZSBh
bHRlciBzb21lCnZvbHRhZ2VzIHBlcmhhcHMgdGhlIEF0b20gU29DIGhhcyBzb21lIGRldmlhdGlv
bnMvaW5zdGFiaWxpdGllcyBpbgp2b2x0YWdlcyB3aGljaCBwcmV2ZW50IHNvbWUgcXVpcmt5IGRl
dmljZXMgbGlrZSBRQ0E5ODh4IGZyb20gd29ya2luZwpyZWxpYWJseS4KCgpNaWNoYcWCCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGlu
ZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
