Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCdMQ-0004ZC-VF
 for ath10k@lists.infradead.org; Tue, 24 Sep 2019 05:27:40 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 2/4] mac80211: defer txqs removal from rbtree
References: <1568639388-27291-1-git-send-email-yiboz@codeaurora.org>
 <1568639388-27291-2-git-send-email-yiboz@codeaurora.org>
 <87pnjyiq7o.fsf@toke.dk>
 <c3ee7ece0986f1c50513cd5fdd2ee03f@codeaurora.org>
 <87sgothmpy.fsf@toke.dk>
 <8cdece5c030fd95817fb099021c38613@codeaurora.org>
 <87tv98fu6l.fsf@toke.dk>
 <1b4ab006d9b5c88035845aaac193ef48@codeaurora.org>
 <8736gre3bm.fsf@toke.dk>
 <198124204167325252fcfcd65e3f2733@codeaurora.org>
 <87ftkp7uuz.fsf@toke.dk>
 <4574cce4079f8dab2b2bf223431a6eae@codeaurora.org>
 <877e617qg2.fsf@toke.dk>
 <910d9bb5f9016b29fb2aaeb0b89bac38@codeaurora.org>
 <874l157nrt.fsf@toke.dk>
 <2935b00bf3e29ad8b2738fe98dc24a76@codeaurora.org>
 <87lfuf5ly2.fsf@toke.dk> <87r2476xy5.fsf@codeaurora.org>
 <875zlj55mh.fsf@toke.dk>
Date: Tue, 24 Sep 2019 08:27:34 +0300
In-Reply-To: <875zlj55mh.fsf@toke.dk> ("Toke \=\?utf-8\?Q\?H\=C3\=B8iland-J\?\=
 \=\?utf-8\?Q\?\=C3\=B8rgensen\=22's\?\= message of
 "Mon, 23 Sep 2019 18:39:34 +0200")
Message-ID: <87h8525kmx.fsf@codeaurora.org>
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
To: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Cc: Yibo Zhao <yiboz@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIDx0b2tlQHJlZGhhdC5jb20+IHdyaXRlczoKCj4gS2Fs
bGUgVmFsbyA8a3ZhbG9AY29kZWF1cm9yYS5vcmc+IHdyaXRlczoKPgo+PiBUb2tlIEjDuGlsYW5k
LUrDuHJnZW5zZW4gPHRva2VAcmVkaGF0LmNvbT4gd3JpdGVzOgo+Pgo+Pj4gWWlibyBaaGFvIDx5
aWJvekBjb2RlYXVyb3JhLm9yZz4gd3JpdGVzOgo+Pj4KPj4+PiBPbiAyMDE5LTA5LTIxIDIyOjAw
LCBUb2tlIEjDuGlsYW5kLUrDuHJnZW5zZW4gd3JvdGU6Cj4+Pj4+IFlpYm8gWmhhbyA8eWlib3pA
Y29kZWF1cm9yYS5vcmc+IHdyaXRlczoKPj4+Pj4gCj4+Pj4+PiBPbiAyMDE5LTA5LTIxIDIxOjAy
LCBUb2tlIEjDuGlsYW5kLUrDuHJnZW5zZW4gd3JvdGU6Cj4+Pj4+Pj4gWWlibyBaaGFvIDx5aWJv
ekBjb2RlYXVyb3JhLm9yZz4gd3JpdGVzOgo+Pj4+Pj4+IAo+Pj4+Pj4+PiBPbiAyMDE5LTA5LTIx
IDE5OjI3LCBUb2tlIEjDuGlsYW5kLUrDuHJnZW5zZW4gd3JvdGU6Cj4+Pj4+Pj4+PiBZaWJvIFpo
YW8gPHlpYm96QGNvZGVhdXJvcmEub3JnPiB3cml0ZXM6Cj4+Pj4+Pj4+PiAKPj4+Pj4+Pj4+PiBP
biAyMDE5LTA5LTIwIDE3OjE1LCBUb2tlIEjDuGlsYW5kLUrDuHJnZW5zZW4gd3JvdGU6Cj4+Pj4+
Pj4+Pj4+IFlpYm8gWmhhbyA8eWlib3pAY29kZWF1cm9yYS5vcmc+IHdyaXRlczoKPj4+Pj4+Pj4+
Pj4gCj4+Pj4+Pj4+Pj4+PiBPbiAyMDE5LTA5LTE5IDE4OjM3LCBUb2tlIEjDuGlsYW5kLUrDuHJn
ZW5zZW4gd3JvdGU6Cj4+Pj4+Pj4+Pj4+Pj4gWWlibyBaaGFvIDx5aWJvekBjb2RlYXVyb3JhLm9y
Zz4gd3JpdGVzOgo+Pj4+Pj4+Pj4+Pj4+IAo+Pj4+Pj4+Pj4+Pj4+PiBPbiAyMDE5LTA5LTE4IDE5
OjIzLCBUb2tlIEjDuGlsYW5kLUrDuHJnZW5zZW4gd3JvdGU6Cj4+Pj4+Pj4+Pj4+Pj4+PiBZaWJv
IFpoYW8gPHlpYm96QGNvZGVhdXJvcmEub3JnPiB3cml0ZXM6Cj4+Pj4+Pj4+Pj4+Pj4+PiAKPj4+
Pj4+Pj4+Pj4+Pj4+PiBPbiAyMDE5LTA5LTE4IDA1OjEwLCBUb2tlIEjDuGlsYW5kLUrDuHJnZW5z
ZW4gd3JvdGU6Cj4+Pj4+Pj4+Pj4+Pj4+Pj4+IFlpYm8gWmhhbyA8eWlib3pAY29kZWF1cm9yYS5v
cmc+IHdyaXRlczoKPj4KPj4gR3V5cywgUExFQVNFIHBsZWFzZSBjb25zaWRlciB1cyBwb29yIG1h
aW50YWluZXJzIGRyb3duaW5nIGluIGVtYWlsIGFuZAo+PiBlZGl0IHlvdXIgcXVvdGVzIDopIFRo
aXMgc3R5bGUgb2YgZGlzY3Vzc2lvbiBtYWtlcyBwYXRjaHdvcmsgdW51c2FibGU6Cj4+Cj4+IGh0
dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTExNDcwMTkvCj4KPiBIZWgsIG9vcHMs
IGRpZG4ndCByZWFsaXNlIHlvdSB3ZXJlIGZvbGxvd2luZyB0aGUgZGlzY3Vzc2lvbiBmcm9tCj4g
cGF0Y2h3b3JrOyBzb3JyeSwgd2lsbCBiZSBzdXJlIHRvIGN1dCB0aGluZ3MgaW4gdGhlIGZ1dHVy
ZS4KClRvIGJlIGhvbmVzdCwgSSdtIG5vdCBzdXJlIGhvdyBtdWNoIEpvaGFubmVzIHVzZXMgcGF0
Y2h3b3JrLiBCdXQgSSBjaGVjawpldmVyeXRoaW5nIGZyb20gcGF0Y2h3b3JrIDk1JSBvZiB0aGUg
dGltZSBhbmQgdHJ5IHRvIGtlZXAgbXkgZW1haWwgYm94ZXMKY2xlYW4uCgo+IFRoZSBxdW90ZSBt
YXJrcyBkbyBtYWtlIGEgdmVyeSBuaWNlIChyZXZlcnNlKSBjaHJpc3RtYXMgdHJlZSwgdGhvdWdo
IDspCgpJdCBkaWQhIEkgaGFkIHRvIGluY2x1ZGUgdGhhdCB0byBteSByYW50IDopCgotLSAKS2Fs
bGUgVmFsbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
