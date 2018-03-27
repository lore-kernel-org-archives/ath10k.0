Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f0i2W-0001xk-LL
 for ath10k@lists.infradead.org; Tue, 27 Mar 2018 06:25:02 +0000
Received: by mail-lf0-x244.google.com with SMTP id u3-v6so10676156lff.5
 for <ath10k@lists.infradead.org>; Mon, 26 Mar 2018 23:24:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <c3d2bae3da74abf969072eb7ce001a07@codeaurora.org>
References: <1519634437-6672-1-git-send-email-mkenna@codeaurora.org>
 <CAKmTU=ptKUweW-WgoJiZRPS=6X+8q60XX2nHQwsqf=A1j-18iQ@mail.gmail.com>
 <c3d2bae3da74abf969072eb7ce001a07@codeaurora.org>
From: Joshua Zhao <swzhao@gmail.com>
Date: Mon, 26 Mar 2018 23:24:47 -0700
Message-ID: <CAKmTU=q2ybEAdu5KsUkAeBHdprQ2WtjP94kYRZb4Nm7JM8mozg@mail.gmail.com>
Subject: Re: [PATCH v2] ath10k: debugfs support to get final TPC stats for
 10.4 variants
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
To: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

V2hhdCBleGFjdGx5ICJjb250cm9sIHBvd2VyIiBtZWFucz8gQ2FuIHlvdSBpbGx1c3RyYXRlIG9y
IGdpdmUgZXhhbXBsZXM/ClRoYW5rcyEKCk9uIE1vbiwgRmViIDI2LCAyMDE4IGF0IDk6MzMgUE0s
IE1haGFyYWphIEtlbm5hZHlyYWphbgo8bWtlbm5hQGNvZGVhdXJvcmEub3JnPiB3cm90ZToKPiBP
biAyMDE4LTAyLTI3IDE6MTkgYW0sIEpvc2h1YSBaaGFvIHdyb3RlOgo+Pgo+PiBhcyB5b3Ugc2Fp
ZDoKPj4gICAgICAgICBUaGUgZXhpc3RpbmcgdHBjX3N0YXRzIGRlYnVnZnMgZmlsZSBwcm92aWRl
cyB0aGUgZHVtcCB3aGljaCBpcwo+PiBtaW5pbXVtIG9mIHRhcmdldCBwb3dlciBhbmQgcmVndWxh
dG9yeSBkb21haW4uCj4+ICAgICAgICAgICAgICAgICAgICAgICAgIGNhdAo+PiAvc3lzL2tlcm5l
bC9kZWJ1Zy9pZWVlODAyMTEvcGh5WC9hdGgxMGsvdHBjX3N0YXRzCj4+Cj4+IEnigJltIGN1cmlv
dXMgd2hhdOKAmXMgZXhhY3QgZGlmZmVyZW5jZSB3LyB0aGlzIG5ldyBhZGRpdGlvbjoKPj4gICAg
ICAgICBFeHBvcnQgdGhlIGZpbmFsIFRyYW5zbWl0IFBvd2VyIENvbnRyb2wgKFRQQykgdmFsdWUs
IHdoaWNoIGlzCj4+IHRoZSBtaW5pbXVtIG9mIGNvbnRyb2wgcG93ZXIgYW5kIGV4aXN0aW5nIFRQ
QyB2YWx1ZSB0byB1c2VyIHNwYWNlIHZpYQo+PiBhIG5ldyBkZWJ1Z2ZzIGZpbGUgInRwY19zdGF0
c19maW5hbCIgdG8gaGVscCB3aXRoIGRlYnVnZ2luZy4KPj4KPj4gQ2FuIHlvdSBjbGFyaWZ5IG9y
IGdpdmUgZXhhbXBsZXMgb24gdGhlIGRpZmZlcmVuY2U/Cj4+Cj4+IFRoYW5rcyEKPgo+Cj4gVGhl
IGV4aXN0aW5nIHRwY19zdGF0cyBpcyB0aGUgbWluaW11bSBvZiAidGFyZ2V0IHBvd2VyIGFuZCBy
ZWd1bGF0b3J5Cj4gZG9tYWluIi4KPiBUaGUgbmV3IGFkZGl0aW9uIGlzIHRoZSBtaW5pbXVtIG9m
ICJleGlzdGluZyB0cGNfc3RhdHMgYW5kIGNvbnRyb2wgcG93ZXIiCj4gd2hpY2ggbWVhbnMgbWlu
aW11bSBvZiAiY29udHJvbCBwb3dlciwgdGFyZ2V0IHBvd2VyIGFuZCByZWd1bGF0b3J5IGRvbWFp
biIuCj4KPiAtLQo+IFJlZ2FyZHMsCj4gTWFoYQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0
aDEwawo=
