Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-bk0-x229.google.com ([2a00:1450:4008:c01::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VTjzn-000574-Na
 for ath10k@lists.infradead.org; Wed, 09 Oct 2013 02:59:32 +0000
Received: by mail-bk0-f41.google.com with SMTP id na10so69800bkb.0
 for <ath10k@lists.infradead.org>; Tue, 08 Oct 2013 19:59:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87siwbr2sc.fsf@kamboji.qca.qualcomm.com>
References: <1380805765-31521-1-git-send-email-michal.kazior@tieto.com>
 <1380865425-3791-1-git-send-email-michal.kazior@tieto.com>
 <1380865425-3791-2-git-send-email-michal.kazior@tieto.com>
 <87mwmjsz2k.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQ=qep+rKEyLKrNjNP6K1q+FHKpvkscwXuRMR_45YnRvHA@mail.gmail.com>
 <87siwbr2sc.fsf@kamboji.qca.qualcomm.com>
Date: Tue, 8 Oct 2013 19:59:06 -0700
Message-ID: <CA+BoTQkPRAVz_2mwv7bL4SEBkQ5BT-4mBvBY7vwNadJkfv9o4w@mail.gmail.com>
Subject: Re: [PATCH/RFT v2 1/4] ath10k: fix add_interface failure handling
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

T24gOCBPY3RvYmVyIDIwMTMgMTI6MTYsIEthbGxlIFZhbG8gPGt2YWxvQHFjYS5xdWFsY29tbS5j
b20+IHdyb3RlOgo+IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGlldG8uY29tPiB3cml0
ZXM6Cj4KPj4gT24gOCBPY3RvYmVyIDIwMTMgMDU6NTQsIEthbGxlIFZhbG8gPGt2YWxvQHFjYS5x
dWFsY29tbS5jb20+IHdyb3RlOgo+Pj4gTWljaGFsIEthemlvciA8bWljaGFsLmthemlvckB0aWV0
by5jb20+IHdyaXRlczoKPj4+Cj4+Pj4gSWYgc29tZXRoaW5nIGZhaWxlZCBhbG9uZyBhZGRfaW50
ZXJmYWNlKCkgc2V0dXAgaXQKPj4+PiB3YXMgcG9zc2libGUgdG8gbGVhayBhIHZkZXYgaWQsIHZk
ZXYgYW5kIHBlZXIuCj4+Pj4KPj4+PiBUaGlzIGNvdWxkIGVuZCB1cCB3aXRoIGxlYWtlZCBGVyBz
dGF0ZSBvciBGVyBjcmFzaAo+Pj4+IChhc3N1bWluZyBhZGRfaW50ZXJmYWNlKCkgZmFpbHVyZSB3
YXNuJ3QgYSByZXN1bHQgb2YKPj4+PiBhIGNyYXNoKS4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6
IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGlldG8uY29tPgo+Pj4KPj4+IFRoZW4gSSBh
cHBseSB0aGlzIHBhdGNoIG9uIHRvcCBvZiBjdXJyZW50IGF0aC5naXQgbWFzdGVyIGJyYW5jaCAo
Y29tbWl0Cj4+PiAxOGZlMGI1M2U3NikgaW50ZXJmYWNlIHVwIGZhaWxzIG9uIHRoZSBtYW5hZ2Vk
IG1vZGU6Cj4+Pgo+Pj4gJCBzdWRvIGlwIGxpbmsgc2V0IHdsYW4xIHVwCj4+PiBSVE5FVExJTksg
YW5zd2VyczogSW52YWxpZCBhcmd1bWVudAo+Pj4KPj4+IExvZ3MgZG9uJ3QgaGF2ZSBhbnl0aGlu
ZyBzcGVjaWFsICh0aGUgVFggZW5jYXAgZXJyb3Igd2FzIGFscmVhZHkKPj4+IGJlZm9yZSk6Cj4+
Pgo+Pj4gWyAxMjU5LjgxODg2M10gYXRoMTBrOiBNU0ktWCBkaWRuJ3Qgc3VjY2VlZCAoMSksIHRy
eWluZyBNU0kKPj4+IFsgMTI1OS44MTkyOThdIGF0aDEwa19wY2kgMDAwMDowMjowMC4wOiBpcnEg
NDkgZm9yIE1TSS9NU0ktWAo+Pj4gWyAxMjU5LjgyMDA1NV0gYXRoMTBrOiBNU0kgaW50ZXJydXB0
IGhhbmRsaW5nCj4+PiBbIDEyNjAuNzQ3ODc3XSBhdGgxMGs6IFVBUlQgcHJpbnRzIGRpc2FibGVk
Cj4+PiBbIDEyNjAuODI4MjE5XSBhdGgxMGs6IGZpcm13YXJlIDEwLjEuMzg5IGJvb3RlZAo+Pj4g
WyAxMjYwLjgzNzU4NV0gYXRoMTBrOiBodHQgdGFyZ2V0IHZlcnNpb24gMi4xCj4+PiBbIDEyNjAu
ODM4NDk4XSBhdGgxMGs6IEZhaWxlZCB0byBzZXQgVFggZW5jYXA6IC0yMgo+Pgo+PiBBaC4gUmln
aHQuIEkndmUgdGVzdGVkIHRoaXMgcGF0Y2ggd2l0aCBtYWluIEZXIGJyYW5jaCB3aGljaCBzdXBw
b3J0cwo+PiBUWCBlbmNhcCBjb21tYW5kLiBUaGUgVFggZW5jYXAgaXNzdWUgc2hvdWxkIGJlIGRl
YWx0aCB3aXRoIGZpcnN0Lgo+Cj4gV2hhdCBkbyB5b3UgbWVhbj8gRGlkIEkgbWlzcyBhIHBhdGNo
PwoKWW91IGRpZG4ndCBtaXNzIGFueSBwYXRjaC4KCkkgdGhpbmsgeW91J3ZlIGFscmVhZHkgcG9p
bnRlZCBvdXQgdGhlIFRYIGVuY2FwIHdhcm5pbmcgaW4geW91ciBvdGhlciBlbWFpbC4KCkl0J3Mg
dGhlIFRYIGVuY2FwIHRoYXQgbW9zdCBsaWtlbHkgZ2V0cyB5b3UgImludmFsaWQgYXJndW1lbnQi
IHdoZW4KdHJ5aW5nIHRvIGJyaW5nIHVwIHRoZSBpbnRlcmZhY2Ugd2l0aCBteSBwYXRjaCBhcyBG
VyAxMC4xLjM4OSBkb2Vzbid0CnN1cHBvcnQgdGhlIGNvbW1hbmQuCgoKTWljaGHFggoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcg
bGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
