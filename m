Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCfAh-0001aV-5e
 for ath10k@lists.infradead.org; Tue, 24 Sep 2019 07:23:41 +0000
Received: by mail-lj1-f200.google.com with SMTP id b90so155070ljf.11
 for <ath10k@lists.infradead.org>; Tue, 24 Sep 2019 00:23:35 -0700 (PDT)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: Re: [PATCH 2/4] mac80211: defer txqs removal from rbtree
In-Reply-To: <87h8525kmx.fsf@codeaurora.org>
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
 <875zlj55mh.fsf@toke.dk> <87h8525kmx.fsf@codeaurora.org>
Date: Tue, 24 Sep 2019 09:23:32 +0200
Message-ID: <87tv9240p7.fsf@toke.dk>
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
ZC1Kw7hyZ2Vuc2VuIDx0b2tlQHJlZGhhdC5jb20+IHdyaXRlczoKPgo+PiBLYWxsZSBWYWxvIDxr
dmFsb0Bjb2RlYXVyb3JhLm9yZz4gd3JpdGVzOgo+Pgo+Pj4gVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vu
c2VuIDx0b2tlQHJlZGhhdC5jb20+IHdyaXRlczoKPj4+Cj4+Pj4gWWlibyBaaGFvIDx5aWJvekBj
b2RlYXVyb3JhLm9yZz4gd3JpdGVzOgo+Pj4+Cj4+Pj4+IE9uIDIwMTktMDktMjEgMjI6MDAsIFRv
a2UgSMO4aWxhbmQtSsO4cmdlbnNlbiB3cm90ZToKPj4+Pj4+IFlpYm8gWmhhbyA8eWlib3pAY29k
ZWF1cm9yYS5vcmc+IHdyaXRlczoKPj4+Pj4+IAo+Pj4+Pj4+IE9uIDIwMTktMDktMjEgMjE6MDIs
IFRva2UgSMO4aWxhbmQtSsO4cmdlbnNlbiB3cm90ZToKPj4+Pj4+Pj4gWWlibyBaaGFvIDx5aWJv
ekBjb2RlYXVyb3JhLm9yZz4gd3JpdGVzOgo+Pj4+Pj4+PiAKPj4+Pj4+Pj4+IE9uIDIwMTktMDkt
MjEgMTk6MjcsIFRva2UgSMO4aWxhbmQtSsO4cmdlbnNlbiB3cm90ZToKPj4+Pj4+Pj4+PiBZaWJv
IFpoYW8gPHlpYm96QGNvZGVhdXJvcmEub3JnPiB3cml0ZXM6Cj4+Pj4+Pj4+Pj4gCj4+Pj4+Pj4+
Pj4+IE9uIDIwMTktMDktMjAgMTc6MTUsIFRva2UgSMO4aWxhbmQtSsO4cmdlbnNlbiB3cm90ZToK
Pj4+Pj4+Pj4+Pj4+IFlpYm8gWmhhbyA8eWlib3pAY29kZWF1cm9yYS5vcmc+IHdyaXRlczoKPj4+
Pj4+Pj4+Pj4+IAo+Pj4+Pj4+Pj4+Pj4+IE9uIDIwMTktMDktMTkgMTg6MzcsIFRva2UgSMO4aWxh
bmQtSsO4cmdlbnNlbiB3cm90ZToKPj4+Pj4+Pj4+Pj4+Pj4gWWlibyBaaGFvIDx5aWJvekBjb2Rl
YXVyb3JhLm9yZz4gd3JpdGVzOgo+Pj4+Pj4+Pj4+Pj4+PiAKPj4+Pj4+Pj4+Pj4+Pj4+IE9uIDIw
MTktMDktMTggMTk6MjMsIFRva2UgSMO4aWxhbmQtSsO4cmdlbnNlbiB3cm90ZToKPj4+Pj4+Pj4+
Pj4+Pj4+PiBZaWJvIFpoYW8gPHlpYm96QGNvZGVhdXJvcmEub3JnPiB3cml0ZXM6Cj4+Pj4+Pj4+
Pj4+Pj4+Pj4gCj4+Pj4+Pj4+Pj4+Pj4+Pj4+IE9uIDIwMTktMDktMTggMDU6MTAsIFRva2UgSMO4
aWxhbmQtSsO4cmdlbnNlbiB3cm90ZToKPj4+Pj4+Pj4+Pj4+Pj4+Pj4+IFlpYm8gWmhhbyA8eWli
b3pAY29kZWF1cm9yYS5vcmc+IHdyaXRlczoKPj4+Cj4+PiBHdXlzLCBQTEVBU0UgcGxlYXNlIGNv
bnNpZGVyIHVzIHBvb3IgbWFpbnRhaW5lcnMgZHJvd25pbmcgaW4gZW1haWwgYW5kCj4+PiBlZGl0
IHlvdXIgcXVvdGVzIDopIFRoaXMgc3R5bGUgb2YgZGlzY3Vzc2lvbiBtYWtlcyBwYXRjaHdvcmsg
dW51c2FibGU6Cj4+Pgo+Pj4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMTE0
NzAxOS8KPj4KPj4gSGVoLCBvb3BzLCBkaWRuJ3QgcmVhbGlzZSB5b3Ugd2VyZSBmb2xsb3dpbmcg
dGhlIGRpc2N1c3Npb24gZnJvbQo+PiBwYXRjaHdvcms7IHNvcnJ5LCB3aWxsIGJlIHN1cmUgdG8g
Y3V0IHRoaW5ncyBpbiB0aGUgZnV0dXJlLgo+Cj4gVG8gYmUgaG9uZXN0LCBJJ20gbm90IHN1cmUg
aG93IG11Y2ggSm9oYW5uZXMgdXNlcyBwYXRjaHdvcmsuIEJ1dCBJCj4gY2hlY2sgZXZlcnl0aGlu
ZyBmcm9tIHBhdGNod29yayA5NSUgb2YgdGhlIHRpbWUgYW5kIHRyeSB0byBrZWVwIG15Cj4gZW1h
aWwgYm94ZXMgY2xlYW4uCgpOb3RlZC4gSSdsbCB0cnkgdG8gYmUgbmljZSB0byBwYXRjaHdvcmss
IHRoZW4gOikKCj4+IFRoZSBxdW90ZSBtYXJrcyBkbyBtYWtlIGEgdmVyeSBuaWNlIChyZXZlcnNl
KSBjaHJpc3RtYXMgdHJlZSwgdGhvdWdoIDspCj4KPiBJdCBkaWQhIEkgaGFkIHRvIGluY2x1ZGUg
dGhhdCB0byBteSByYW50IDopCgo6RAoKLVRva2UKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
YXRoMTBrCg==
