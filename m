Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCaph-00037u-QN
 for ath10k@lists.infradead.org; Tue, 24 Sep 2019 02:45:43 +0000
MIME-Version: 1.0
Date: Tue, 24 Sep 2019 10:45:39 +0800
From: Yibo Zhao <yiboz@codeaurora.org>
Subject: Re: [PATCH 2/4] mac80211: defer txqs removal from rbtree
In-Reply-To: <87lfuf5ly2.fsf@toke.dk>
References: <1568639388-27291-1-git-send-email-yiboz@codeaurora.org>
 <1568639388-27291-2-git-send-email-yiboz@codeaurora.org>
 <87pnjyiq7o.fsf@toke.dk> <c3ee7ece0986f1c50513cd5fdd2ee03f@codeaurora.org>
 <87sgothmpy.fsf@toke.dk> <8cdece5c030fd95817fb099021c38613@codeaurora.org>
 <87tv98fu6l.fsf@toke.dk> <1b4ab006d9b5c88035845aaac193ef48@codeaurora.org>
 <8736gre3bm.fsf@toke.dk> <198124204167325252fcfcd65e3f2733@codeaurora.org>
 <87ftkp7uuz.fsf@toke.dk> <4574cce4079f8dab2b2bf223431a6eae@codeaurora.org>
 <877e617qg2.fsf@toke.dk> <910d9bb5f9016b29fb2aaeb0b89bac38@codeaurora.org>
 <874l157nrt.fsf@toke.dk> <2935b00bf3e29ad8b2738fe98dc24a76@codeaurora.org>
 <87lfuf5ly2.fsf@toke.dk>
Message-ID: <1b3eab1f2481e0102b284f133605c6c4@codeaurora.org>
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
Cc: linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

T24gMjAxOS0wOS0yMyAxODo0NywgVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIHdyb3RlOgo+IFlp
Ym8gWmhhbyA8eWlib3pAY29kZWF1cm9yYS5vcmc+IHdyaXRlczoKPj4+IFNvLCBpbnN0ZWFkIHdl
IG5lZWQgdG8ga2VlcCBuZXh0X3R4cSgpIHRoZSB3YXkgaXQgaXMsIGFuZCBqdXN0IGFkZAo+PiAK
Pj4gUmlnaHQsIHNob3VsZCBrZWVwIG5leHRfdHhxKCkgdGhlIHdheSBpdCBpcy4KPj4gCj4+PiAK
Pj4+IGxvY2FsLT5zY2hlZHVsZV9wb3NbYWNdID0gcmJfcHJldihub2RlKTsKPj4+IAo+Pj4gd2hl
bmV2ZXIgd2UgcmVtb3ZlIGEgbm9kZSAoYm90aCBpbiByZXR1cm5fdHhxKCkgYW5kIHJlc29ydF90
eHEoKSkuCj4+IAo+PiBBZ3JlZSwgYW5kIGFsc28gd2UgbWF5IG5lZWQgdG8gY29uc2lkZXIgY2Fz
ZSBsaWtlIEEgaXMgcmVtb3ZlZCBhbmQgCj4+IHNvb24KPj4gYmUgYWRkZWQgYmFjayBqdXN0IHRo
ZSBzYW1lIGFzIGlpKSwKPj4gICAgICAgICBCLT5DLT5BLT5ELT5FCj4+IHRoZW4gQiBpcyBzY2hl
ZHVsZSwgcmVtb3ZlZCBhbmQgc29vbiBhZGRlZCBiYWNrLAo+PiAgICAgICAgIEMtPkEtPkItPkQt
PkUKPj4gQSBhbmQgQiB3aWxsIGhhdmUgYSBzZWNvbmQgY2hhbmNlIHRvIGJlIHNjaGVkdWxlZCBh
bmQgdGhpcyBtYXkgaGFwcGVuIAo+PiB0bwo+PiBvdGhlcnMgYXMgd2VsbCBsZWFkaW5nIHRvIHRo
ZSBpbmZpbml0ZSBsb29wIGFzIHlvdSBoYXZlIG1lbnRpb25lZAo+PiBwcmV2aW91c2x5LCBzbyBk
byB3ZSBuZWVkIHRvIG1haW50YWluIGEgc2NoZWR1bGVfcm91bmQgbGlrZSB3ZSBkbyBpbgo+PiBE
UlI/IExpa2UsCj4+ICAgICAgLSBJZiB0aGUgbm9kZSBpcyBpbiB0aGUgc2FtZSByb3VuZCwgYnkg
cGFzcyBzY2hlZHVsZSwgZ28gdG8KPj4gcmJfbmV4dCgpLCBlaXRoZXIgY29udGludWUgbG9vcCB0
aGlzIHJvdW5kIG9yIGVuZCB0aGlzIHJvdW5kLgo+PiAgICAgIC0gSW5jcmVhc2UgdGhlIHNjaGVk
dWxlX3JvdW5kIGF0IHRoZSBzY2hlZHVsZV9zdGFydCgpIG9ubHkgd2hlbiAKPj4gdGhlCj4+IHNj
aGVkdWxlX3BvcyBpcyBOVUxMLgo+IAo+IEhtbSwgeWVhaCwgSSBndWVzcyB3ZSBjb3VsZCBlbmQg
dXAgd2l0aCBhIGxvb3AgbGlrZSB0aGF0IGFzIHdlbGwuCj4gS2VlcGluZyB0aGUgc2NoZWR1bGVf
cm91bmQgd291bGQgYmUgYSB3YXkgdG8gZml4IGl0LCBidXQgSSdtIG5vdCBzdXJlIAo+IHdlCj4g
c2hvdWxkIGp1c3Qgc2tpcCB0aGF0IHN0YXRpb247IG1heWJlIHdlIHNob3VsZCBqdXN0IGVuZCB0
aGUgcm91bmQKPiBpbnN0ZWFkPwpJIGFtIG5vdCBzdXJlLiBJIGJlbGlldmUsIGluIHNvbWUgY2Fz
ZXMsIHRoZSByZXN0IG9mIHRoZSBub2RlcyB3aGljaCAKY291bGQgYmUgbW9zdCBvZiB0aGUgbm9k
ZXMgaW4gdGhlIHRyZWUgd2lsbCBub3QgaGF2ZSB0aGUgY2hhbmNlIHRvIGJlIApzY2hlZHVsZWQg
aW4gdGhpcyByb3VuZC4KCj4gCj4+Pj4+IFdlJ2Qgc3RpbGwgbmVlZCBhIGNoZWNrIGluIHJlc29y
dF90eHEoKSB0aGVuLCBidXQgaXQgd291bGQgbWFrZSBpdAo+Pj4+PiBzYWZlCj4+Pj4+IHRvIHVu
c2NoZWR1bGUgaW4gcmV0dXJuX3R4cSgpLi4uCj4+Pj4gWWVzLCBhZ3JlZSB3aXRoIHRoYXQuCj4+
Pj4gCgoKCi0tIApZaWJvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
