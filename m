Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from us-smtp-1.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCgQZ-0003zF-O9
 for ath10k@lists.infradead.org; Tue, 24 Sep 2019 08:44:09 +0000
Received: by mail-ed1-f71.google.com with SMTP id o92so623657edb.9
 for <ath10k@lists.infradead.org>; Tue, 24 Sep 2019 01:44:04 -0700 (PDT)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: Re: [PATCH 2/4] mac80211: defer txqs removal from rbtree
In-Reply-To: <4cb086a2ec62b6bb127d933d2dcfb17c@codeaurora.org>
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
 <87r24640kb.fsf@toke.dk> <4cb086a2ec62b6bb127d933d2dcfb17c@codeaurora.org>
Date: Tue, 24 Sep 2019 10:44:01 +0200
Message-ID: <87ftkm3wz2.fsf@toke.dk>
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
Cc: linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

WWlibyBaaGFvIDx5aWJvekBjb2RlYXVyb3JhLm9yZz4gd3JpdGVzOgoKPiBPbiAyMDE5LTA5LTI0
IDE1OjI2LCBUb2tlIEjDuGlsYW5kLUrDuHJnZW5zZW4gd3JvdGU6Cj4+Pj4gSG1tLCB5ZWFoLCBJ
IGd1ZXNzIHdlIGNvdWxkIGVuZCB1cCB3aXRoIGEgbG9vcCBsaWtlIHRoYXQgYXMgd2VsbC4KPj4+
PiBLZWVwaW5nIHRoZSBzY2hlZHVsZV9yb3VuZCB3b3VsZCBiZSBhIHdheSB0byBmaXggaXQsIGJ1
dCBJJ20gbm90IHN1cmUKPj4+PiB3ZQo+Pj4+IHNob3VsZCBqdXN0IHNraXAgdGhhdCBzdGF0aW9u
OyBtYXliZSB3ZSBzaG91bGQganVzdCBlbmQgdGhlIHJvdW5kCj4+Pj4gaW5zdGVhZD8KPj4+IEkg
YW0gbm90IHN1cmUuIEkgYmVsaWV2ZSwgaW4gc29tZSBjYXNlcywgdGhlIHJlc3Qgb2YgdGhlIG5v
ZGVzIHdoaWNoCj4+PiBjb3VsZCBiZSBtb3N0IG9mIHRoZSBub2RlcyBpbiB0aGUgdHJlZSB3aWxs
IG5vdCBoYXZlIHRoZSBjaGFuY2UgdG8gYmUKPj4+IHNjaGVkdWxlZCBpbiB0aGlzIHJvdW5kLgo+
PiAKPj4gTXkgZ3Vlc3Mgd291bGQgYmUgdGhhdCBpdCBkb2Vzbid0IHJlYWxseSBtYXR0ZXIsIGJl
Y2F1c2UgaW4gbW9zdCBjYXNlcwo+PiBlYWNoIHNjaGVkdWxlIHJvdW5kIHdpbGwgb25seSBhY3R1
YWxseSBlbmQgdXAgcXVldWVpbmcgcGFja2V0cyBmcm9tIG9uZQo+PiBvciB0d28gc3RhdGlvbnM7
IGFzIHRoZSBkcml2ZXIgd2lsbCBwdWxsIG11bHRpcGxlIHBhY2tldHMgZnJvbSB0aGF0IG9uZQo+
PiBzdGF0aW9uIHdoaWNoIHdpbGwgb2Z0ZW4gZmlsbCB1cCB0aGUgZmlybXdhcmUgcXVldWVzIChl
c3BlY2lhbGx5IG9uY2UgCj4+IHdlCj4+IHN0YXJ0IHRocm90dGxpbmcgdGhhdCB3aXRoIHRoZSBB
UUwgc3R1ZmYpLgo+PiAKPj4gU28gSSBndWVzcyB3ZSBjYW4ganVzdCBza2lwIFRYUXMgdGhhdCB3
ZSd2ZSBhbHJlYWR5IHNlZW4gdGhpcyAKPj4gc2NoZWR1bGluZwo+PiByb3VuZCwgYW5kIGxldCB0
aGUgdl90IGNvbXBhcmUgZGV0ZXJtaW5lIHRyYW5zbWl0IGVsaWdpYmlsaXR5IDopCj4KPiBJIGFt
IGEgbGl0dGxlIGNvbmZ1c2VkLiBTbyBkbyB5b3UgbWVhbiBpdCBpcyBmaW5lIGZvciB5b3UgdG8g
c2tpcCB0aGUgCj4gVFhRcyB3ZSBtZXQgaW4gdGhpcyByb3VuZCBiZWZvcmUgYW5kIGNvbnRpbnVl
IHRoZSBsb29wIHVudGlsIHRoZSBlbmQgb3IgCj4gdnQgY29tcGFyaXNvbiBmYWlsdXJlPwoKWWVh
aC4gSW4gbW9zdCBjYXNlcyBpdCB3b24ndCBtYWtlIGFueSBkaWZmZXJlbmNlOyBidXQgaXQnbGwg
bWFrZSBzdXJlIHdlCnZpc2l0IGFsbCBlbGlnaWJsZSBUWFFzIGluIGFsbCBjYXNlcywgc28gd2Ug
bWlnaHQgYXMgd2VsbCBkbyB0aGF0IGlmCndlJ3JlIHRyYWNraW5nIHRoZSBzY2hlZHVsaW5nIHJv
dW5kIGFueXdheS4KCi1Ub2tlCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
