Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCbMU-000718-Dc
 for ath10k@lists.infradead.org; Tue, 24 Sep 2019 03:19:35 +0000
MIME-Version: 1.0
Date: Tue, 24 Sep 2019 11:19:33 +0800
From: Yibo Zhao <yiboz@codeaurora.org>
Subject: Re: [PATCH V3 4/4] mac80211: Sync airtime weight sum with per AC
 synced sta airtime weight together
In-Reply-To: <87blvb5lb9.fsf@toke.dk>
References: <1569223201-1490-1-git-send-email-yiboz@codeaurora.org>
 <1569223201-1490-5-git-send-email-yiboz@codeaurora.org>
 <87blvb5lb9.fsf@toke.dk>
Message-ID: <ffe79f35d4dcb50aa31dc04035855f79@codeaurora.org>
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

T24gMjAxOS0wOS0yMyAxOTowMCwgVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIHdyb3RlOgoKPj4g
LQlpZiAocGFyYW1zLT5haXJ0aW1lX3dlaWdodCkKPj4gLQkJc3RhLT5haXJ0aW1lX3dlaWdodCA9
IHBhcmFtcy0+YWlydGltZV93ZWlnaHQ7Cj4+ICsJaWYgKHBhcmFtcy0+YWlydGltZV93ZWlnaHQg
JiYKPj4gKwkgICAgcGFyYW1zLT5haXJ0aW1lX3dlaWdodCAhPSBzdGEtPmFpcnRpbWVfd2VpZ2h0
KSB7Cj4gCj4gVGhpcyBjaGVjayBkb2Vzbid0IHdvcmsgSSB0aGluaz8gWW91J3JlIG5vdCB1c2lu
ZyB0aGUgYXJyYXktYmFzZWQKPiBzdGEtPmFpcnRpbWVfd2VpZ2h0W10sIGFuZCB0aGVyZSBhcmUg
bG9ja2luZyBpc3N1ZXMgYnkganVzdCBjaGVja2luZwo+IGxpa2UgdGhpczsgc28gbWF5YmUganVz
dCBrZWVwIHRoZSBpZigpIG9uIHBhcmFtcy0+YWlydGltZV93ZWlnaHQsIGFuZCAKPiBkbwo+IHRo
ZSBjaGVja2luZyBpbnNpZGUgdGhlIGxvb3Agd2hpbGUgaG9sZGluZyB0aGUgbG9jaz8KCkl0IHNo
b3VsZCBiZSBhcnJheS1iYXNlZCBzdGEtPmFpcnRpbWVfd2VpZ2h0W10gYW5kIEkgYW0gbWlzc2lu
ZyB0aGF0IApwYXJ0IGR1cmluZyB0aGUgcG9ydGluZy4gQnV0IHlvdSBhcmUgcmlnaHQgYWJvdXQg
d2Ugc2hvdWxkIGNoZWNrIGl0IAppbnNpZGUgdGhlIGxvb3Agd2l0aCB0aGUgbG9jay4KCj4gCj4g
T3IgY291bGQgd2UganVzdCB0dXJuIHRoZSB3ZWlnaHRzIGludG8gYXRvbWljcyB0byBhdm9pZCB0
aGUgbG9ja2luZwo+IGVudGlyZWx5PwoKQWN0dWFsbHksIHdlIHN0aWxsIG5lZWQgdGhlIGFjdGl2
ZSB0eHEgbG9ja2luZyB0byBtYWtlIHN1cmUgdGhlIHR4cSBpcyAKb24gdGhlIHJidHJlZS4gT3Ro
ZXJ3aXNlLCBubyBuZWVkIHRvIGNoYW5nZSBhaXJ0aW1lIHdlaWdodCBzdW0uCgo+IAo+PiArCQlm
b3IgKGFjID0gMDsgYWMgPCBJRUVFODAyMTFfTlVNX0FDUzsgYWMrKykgewo+PiArCQkJc3Bpbl9s
b2NrX2JoKCZsb2NhbC0+YWN0aXZlX3R4cV9sb2NrW2FjXSk7Cj4+ICsJCQlmb3IgKHRpZCA9IDA7
IHRpZCA8IElFRUU4MDIxMV9OVU1fVElEUyArIDE7IHRpZCsrKSB7Cj4+ICsJCQkJaWYgKCFzdGEt
PnN0YS50eHFbdGlkXSB8fAo+PiArCQkJCSAgICBhYyAhPSBpZWVlODAyMTFfYWNfZnJvbV90aWQo
dGlkKSkKPj4gKwkJCQkJY29udGludWU7Cj4+ICsKPj4gKwkJCQlwcmVfd2VpZ2h0ID0gc3RhLT5h
aXJ0aW1lX3dlaWdodFthY107Cj4+ICsJCQkJc3RhLT5haXJ0aW1lX3dlaWdodFthY10gPQo+PiAr
CQkJCQkJcGFyYW1zLT5haXJ0aW1lX3dlaWdodDsKPj4gKwo+PiArCQkJCXR4cWkgPSB0b190eHFf
aW5mbyhzdGEtPnN0YS50eHFbdGlkXSk7Cj4+ICsJCQkJaWYgKFJCX0VNUFRZX05PREUoJnR4cWkt
PnNjaGVkdWxlX29yZGVyKSkKPj4gKwkJCQkJY29udGludWU7Cj4+ICsKPj4gKwkJCQlsb2NhbC0+
YWlydGltZV93ZWlnaHRfc3VtW2FjXSA9IGxvY2FsLT5haXJ0aW1lX3dlaWdodF9zdW1bYWNdICsK
Pj4gKwkJCQkJCQkJcGFyYW1zLT5haXJ0aW1lX3dlaWdodCAtCj4+ICsJCQkJCQkJCXByZV93ZWln
aHQ7Cj4+ICsJCQl9Cj4+ICsJCQlzcGluX3VubG9ja19iaCgmbG9jYWwtPmFjdGl2ZV90eHFfbG9j
a1thY10pOwo+PiArCQl9Cj4+ICsJfQo+PiAKCgotLSAKWWlibwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2F0aDEwawo=
