Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from us-smtp-2.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCRNF-0005wR-Dr
 for ath10k@lists.infradead.org; Mon, 23 Sep 2019 16:39:43 +0000
Received: by mail-ed1-f71.google.com with SMTP id h12so9797795eda.19
 for <ath10k@lists.infradead.org>; Mon, 23 Sep 2019 09:39:37 -0700 (PDT)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: Re: [PATCH 2/4] mac80211: defer txqs removal from rbtree
In-Reply-To: <87r2476xy5.fsf@codeaurora.org>
References: <1568639388-27291-1-git-send-email-yiboz@codeaurora.org>
 <1568639388-27291-2-git-send-email-yiboz@codeaurora.org>
 <87pnjyiq7o.fsf@toke.dk> <c3ee7ece0986f1c50513cd5fdd2ee03f@codeaurora.org>
 <87sgothmpy.fsf@toke.dk> <8cdece5c030fd95817fb099021c38613@codeaurora.org>
 <87tv98fu6l.fsf@toke.dk> <1b4ab006d9b5c88035845aaac193ef48@codeaurora.org>
 <8736gre3bm.fsf@toke.dk> <198124204167325252fcfcd65e3f2733@codeaurora.org>
 <87ftkp7uuz.fsf@toke.dk> <4574cce4079f8dab2b2bf223431a6eae@codeaurora.org>
 <877e617qg2.fsf@toke.dk> <910d9bb5f9016b29fb2aaeb0b89bac38@codeaurora.org>
 <874l157nrt.fsf@toke.dk> <2935b00bf3e29ad8b2738fe98dc24a76@codeaurora.org>
 <87lfuf5ly2.fsf@toke.dk> <87r2476xy5.fsf@codeaurora.org>
Date: Mon, 23 Sep 2019 18:39:34 +0200
Message-ID: <875zlj55mh.fsf@toke.dk>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Yibo Zhao <yiboz@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

S2FsbGUgVmFsbyA8a3ZhbG9AY29kZWF1cm9yYS5vcmc+IHdyaXRlczoKCj4gVG9rZSBIw7hpbGFu
ZC1Kw7hyZ2Vuc2VuIDx0b2tlQHJlZGhhdC5jb20+IHdyaXRlczoKPgo+PiBZaWJvIFpoYW8gPHlp
Ym96QGNvZGVhdXJvcmEub3JnPiB3cml0ZXM6Cj4+Cj4+PiBPbiAyMDE5LTA5LTIxIDIyOjAwLCBU
b2tlIEjDuGlsYW5kLUrDuHJnZW5zZW4gd3JvdGU6Cj4+Pj4gWWlibyBaaGFvIDx5aWJvekBjb2Rl
YXVyb3JhLm9yZz4gd3JpdGVzOgo+Pj4+IAo+Pj4+PiBPbiAyMDE5LTA5LTIxIDIxOjAyLCBUb2tl
IEjDuGlsYW5kLUrDuHJnZW5zZW4gd3JvdGU6Cj4+Pj4+PiBZaWJvIFpoYW8gPHlpYm96QGNvZGVh
dXJvcmEub3JnPiB3cml0ZXM6Cj4+Pj4+PiAKPj4+Pj4+PiBPbiAyMDE5LTA5LTIxIDE5OjI3LCBU
b2tlIEjDuGlsYW5kLUrDuHJnZW5zZW4gd3JvdGU6Cj4+Pj4+Pj4+IFlpYm8gWmhhbyA8eWlib3pA
Y29kZWF1cm9yYS5vcmc+IHdyaXRlczoKPj4+Pj4+Pj4gCj4+Pj4+Pj4+PiBPbiAyMDE5LTA5LTIw
IDE3OjE1LCBUb2tlIEjDuGlsYW5kLUrDuHJnZW5zZW4gd3JvdGU6Cj4+Pj4+Pj4+Pj4gWWlibyBa
aGFvIDx5aWJvekBjb2RlYXVyb3JhLm9yZz4gd3JpdGVzOgo+Pj4+Pj4+Pj4+IAo+Pj4+Pj4+Pj4+
PiBPbiAyMDE5LTA5LTE5IDE4OjM3LCBUb2tlIEjDuGlsYW5kLUrDuHJnZW5zZW4gd3JvdGU6Cj4+
Pj4+Pj4+Pj4+PiBZaWJvIFpoYW8gPHlpYm96QGNvZGVhdXJvcmEub3JnPiB3cml0ZXM6Cj4+Pj4+
Pj4+Pj4+PiAKPj4+Pj4+Pj4+Pj4+PiBPbiAyMDE5LTA5LTE4IDE5OjIzLCBUb2tlIEjDuGlsYW5k
LUrDuHJnZW5zZW4gd3JvdGU6Cj4+Pj4+Pj4+Pj4+Pj4+IFlpYm8gWmhhbyA8eWlib3pAY29kZWF1
cm9yYS5vcmc+IHdyaXRlczoKPj4+Pj4+Pj4+Pj4+Pj4gCj4+Pj4+Pj4+Pj4+Pj4+PiBPbiAyMDE5
LTA5LTE4IDA1OjEwLCBUb2tlIEjDuGlsYW5kLUrDuHJnZW5zZW4gd3JvdGU6Cj4+Pj4+Pj4+Pj4+
Pj4+Pj4gWWlibyBaaGFvIDx5aWJvekBjb2RlYXVyb3JhLm9yZz4gd3JpdGVzOgo+Cj4gR3V5cywg
UExFQVNFIHBsZWFzZSBjb25zaWRlciB1cyBwb29yIG1haW50YWluZXJzIGRyb3duaW5nIGluIGVt
YWlsIGFuZAo+IGVkaXQgeW91ciBxdW90ZXMgOikgVGhpcyBzdHlsZSBvZiBkaXNjdXNzaW9uIG1h
a2VzIHBhdGNod29yayB1bnVzYWJsZToKPgo+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcv
cGF0Y2gvMTExNDcwMTkvCgpIZWgsIG9vcHMsIGRpZG4ndCByZWFsaXNlIHlvdSB3ZXJlIGZvbGxv
d2luZyB0aGUgZGlzY3Vzc2lvbiBmcm9tCnBhdGNod29yazsgc29ycnksIHdpbGwgYmUgc3VyZSB0
byBjdXQgdGhpbmdzIGluIHRoZSBmdXR1cmUuCgpUaGUgcXVvdGUgbWFya3MgZG8gbWFrZSBhIHZl
cnkgbmljZSAocmV2ZXJzZSkgY2hyaXN0bWFzIHRyZWUsIHRob3VnaCA7KQoKLVRva2UKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGlu
ZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
