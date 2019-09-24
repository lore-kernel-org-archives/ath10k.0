Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCgE5-0008Pc-IS
 for ath10k@lists.infradead.org; Tue, 24 Sep 2019 08:31:14 +0000
MIME-Version: 1.0
Date: Tue, 24 Sep 2019 16:31:12 +0800
From: Yibo Zhao <yiboz@codeaurora.org>
Subject: Re: [PATCH 2/4] mac80211: defer txqs removal from rbtree
In-Reply-To: <87r24640kb.fsf@toke.dk>
References: <1568639388-27291-1-git-send-email-yiboz@codeaurora.org>
 <1568639388-27291-2-git-send-email-yiboz@codeaurora.org>
 <87pnjyiq7o.fsf@toke.dk> <c3ee7ece0986f1c50513cd5fdd2ee03f@codeaurora.org>
 <87sgothmpy.fsf@toke.dk> <8cdece5c030fd95817fb099021c38613@codeaurora.org>
 <87tv98fu6l.fsf@toke.dk> <1b4ab006d9b5c88035845aaac193ef48@codeaurora.org>
 <8736gre3bm.fsf@toke.dk> <198124204167325252fcfcd65e3f2733@codeaurora.org>
 <87ftkp7uuz.fsf@toke.dk> <4574cce4079f8dab2b2bf223431a6eae@codeaurora.org>
 <877e617qg2.fsf@toke.dk> <910d9bb5f9016b29fb2aaeb0b89bac38@codeaurora.org>
 <874l157nrt.fsf@toke.dk> <2935b00bf3e29ad8b2738fe98dc24a76@codeaurora.org>
 <87lfuf5ly2.fsf@toke.dk> <1b3eab1f2481e0102b284f133605c6c4@codeaurora.org>
 <87r24640kb.fsf@toke.dk>
Message-ID: <4cb086a2ec62b6bb127d933d2dcfb17c@codeaurora.org>
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

T24gMjAxOS0wOS0yNCAxNToyNiwgVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIHdyb3RlOgo+Pj4g
SG1tLCB5ZWFoLCBJIGd1ZXNzIHdlIGNvdWxkIGVuZCB1cCB3aXRoIGEgbG9vcCBsaWtlIHRoYXQg
YXMgd2VsbC4KPj4+IEtlZXBpbmcgdGhlIHNjaGVkdWxlX3JvdW5kIHdvdWxkIGJlIGEgd2F5IHRv
IGZpeCBpdCwgYnV0IEknbSBub3Qgc3VyZQo+Pj4gd2UKPj4+IHNob3VsZCBqdXN0IHNraXAgdGhh
dCBzdGF0aW9uOyBtYXliZSB3ZSBzaG91bGQganVzdCBlbmQgdGhlIHJvdW5kCj4+PiBpbnN0ZWFk
Pwo+PiBJIGFtIG5vdCBzdXJlLiBJIGJlbGlldmUsIGluIHNvbWUgY2FzZXMsIHRoZSByZXN0IG9m
IHRoZSBub2RlcyB3aGljaAo+PiBjb3VsZCBiZSBtb3N0IG9mIHRoZSBub2RlcyBpbiB0aGUgdHJl
ZSB3aWxsIG5vdCBoYXZlIHRoZSBjaGFuY2UgdG8gYmUKPj4gc2NoZWR1bGVkIGluIHRoaXMgcm91
bmQuCj4gCj4gTXkgZ3Vlc3Mgd291bGQgYmUgdGhhdCBpdCBkb2Vzbid0IHJlYWxseSBtYXR0ZXIs
IGJlY2F1c2UgaW4gbW9zdCBjYXNlcwo+IGVhY2ggc2NoZWR1bGUgcm91bmQgd2lsbCBvbmx5IGFj
dHVhbGx5IGVuZCB1cCBxdWV1ZWluZyBwYWNrZXRzIGZyb20gb25lCj4gb3IgdHdvIHN0YXRpb25z
OyBhcyB0aGUgZHJpdmVyIHdpbGwgcHVsbCBtdWx0aXBsZSBwYWNrZXRzIGZyb20gdGhhdCBvbmUK
PiBzdGF0aW9uIHdoaWNoIHdpbGwgb2Z0ZW4gZmlsbCB1cCB0aGUgZmlybXdhcmUgcXVldWVzIChl
c3BlY2lhbGx5IG9uY2UgCj4gd2UKPiBzdGFydCB0aHJvdHRsaW5nIHRoYXQgd2l0aCB0aGUgQVFM
IHN0dWZmKS4KPiAKPiBTbyBJIGd1ZXNzIHdlIGNhbiBqdXN0IHNraXAgVFhRcyB0aGF0IHdlJ3Zl
IGFscmVhZHkgc2VlbiB0aGlzIAo+IHNjaGVkdWxpbmcKPiByb3VuZCwgYW5kIGxldCB0aGUgdl90
IGNvbXBhcmUgZGV0ZXJtaW5lIHRyYW5zbWl0IGVsaWdpYmlsaXR5IDopCgpJIGFtIGEgbGl0dGxl
IGNvbmZ1c2VkLiBTbyBkbyB5b3UgbWVhbiBpdCBpcyBmaW5lIGZvciB5b3UgdG8gc2tpcCB0aGUg
ClRYUXMgd2UgbWV0IGluIHRoaXMgcm91bmQgYmVmb3JlIGFuZCBjb250aW51ZSB0aGUgbG9vcCB1
bnRpbCB0aGUgZW5kIG9yIAp2dCBjb21wYXJpc29uIGZhaWx1cmU/Cgo+IAo+IC1Ub2tlCgotLSAK
WWlibwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRo
MTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
