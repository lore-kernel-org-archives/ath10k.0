Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCMje-0001NL-KP
 for ath10k@lists.infradead.org; Mon, 23 Sep 2019 11:42:32 +0000
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
 <87lfuf5ly2.fsf@toke.dk>
Date: Mon, 23 Sep 2019 14:42:26 +0300
In-Reply-To: <87lfuf5ly2.fsf@toke.dk> ("Toke \=\?utf-8\?Q\?H\=C3\=B8iland-J\?\=
 \=\?utf-8\?Q\?\=C3\=B8rgensen\=22's\?\= message of
 "Mon, 23 Sep 2019 12:47:01 +0200")
Message-ID: <87r2476xy5.fsf@codeaurora.org>
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

VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIDx0b2tlQHJlZGhhdC5jb20+IHdyaXRlczoKCj4gWWli
byBaaGFvIDx5aWJvekBjb2RlYXVyb3JhLm9yZz4gd3JpdGVzOgo+Cj4+IE9uIDIwMTktMDktMjEg
MjI6MDAsIFRva2UgSMO4aWxhbmQtSsO4cmdlbnNlbiB3cm90ZToKPj4+IFlpYm8gWmhhbyA8eWli
b3pAY29kZWF1cm9yYS5vcmc+IHdyaXRlczoKPj4+IAo+Pj4+IE9uIDIwMTktMDktMjEgMjE6MDIs
IFRva2UgSMO4aWxhbmQtSsO4cmdlbnNlbiB3cm90ZToKPj4+Pj4gWWlibyBaaGFvIDx5aWJvekBj
b2RlYXVyb3JhLm9yZz4gd3JpdGVzOgo+Pj4+PiAKPj4+Pj4+IE9uIDIwMTktMDktMjEgMTk6Mjcs
IFRva2UgSMO4aWxhbmQtSsO4cmdlbnNlbiB3cm90ZToKPj4+Pj4+PiBZaWJvIFpoYW8gPHlpYm96
QGNvZGVhdXJvcmEub3JnPiB3cml0ZXM6Cj4+Pj4+Pj4gCj4+Pj4+Pj4+IE9uIDIwMTktMDktMjAg
MTc6MTUsIFRva2UgSMO4aWxhbmQtSsO4cmdlbnNlbiB3cm90ZToKPj4+Pj4+Pj4+IFlpYm8gWmhh
byA8eWlib3pAY29kZWF1cm9yYS5vcmc+IHdyaXRlczoKPj4+Pj4+Pj4+IAo+Pj4+Pj4+Pj4+IE9u
IDIwMTktMDktMTkgMTg6MzcsIFRva2UgSMO4aWxhbmQtSsO4cmdlbnNlbiB3cm90ZToKPj4+Pj4+
Pj4+Pj4gWWlibyBaaGFvIDx5aWJvekBjb2RlYXVyb3JhLm9yZz4gd3JpdGVzOgo+Pj4+Pj4+Pj4+
PiAKPj4+Pj4+Pj4+Pj4+IE9uIDIwMTktMDktMTggMTk6MjMsIFRva2UgSMO4aWxhbmQtSsO4cmdl
bnNlbiB3cm90ZToKPj4+Pj4+Pj4+Pj4+PiBZaWJvIFpoYW8gPHlpYm96QGNvZGVhdXJvcmEub3Jn
PiB3cml0ZXM6Cj4+Pj4+Pj4+Pj4+Pj4gCj4+Pj4+Pj4+Pj4+Pj4+IE9uIDIwMTktMDktMTggMDU6
MTAsIFRva2UgSMO4aWxhbmQtSsO4cmdlbnNlbiB3cm90ZToKPj4+Pj4+Pj4+Pj4+Pj4+IFlpYm8g
WmhhbyA8eWlib3pAY29kZWF1cm9yYS5vcmc+IHdyaXRlczoKCkd1eXMsIFBMRUFTRSBwbGVhc2Ug
Y29uc2lkZXIgdXMgcG9vciBtYWludGFpbmVycyBkcm93bmluZyBpbiBlbWFpbCBhbmQKZWRpdCB5
b3VyIHF1b3RlcyA6KSBUaGlzIHN0eWxlIG9mIGRpc2N1c3Npb24gbWFrZXMgcGF0Y2h3b3JrIHVu
dXNhYmxlOgoKaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMTE0NzAxOS8KCi0t
IApLYWxsZSBWYWxvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
