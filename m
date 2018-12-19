Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZbqI-0000NE-Fj
 for ath10k@lists.infradead.org; Wed, 19 Dec 2018 13:24:55 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v5 5/6] ath10k: migrate to mac80211 txq scheduling
References: <1545181331-5288-1-git-send-email-rmanohar@codeaurora.org>
 <1545181331-5288-6-git-send-email-rmanohar@codeaurora.org>
Date: Wed, 19 Dec 2018 15:24:37 +0200
In-Reply-To: <1545181331-5288-6-git-send-email-rmanohar@codeaurora.org>
 (Rajkumar Manoharan's message of "Tue, 18 Dec 2018 17:02:10 -0800")
Message-ID: <87o99hvecq.fsf@kamboji.qca.qualcomm.com>
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
To: Rajkumar Manoharan <rmanohar@codeaurora.org>
Cc: make-wifi-fast@lists.bufferbloat.net, Toke =?utf-8?Q?H=C3=B8iland-J?= =?utf-8?Q?=C3=B8rgensen?= <toke@toke.dk>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

UmFqa3VtYXIgTWFub2hhcmFuIDxybWFub2hhckBjb2RlYXVyb3JhLm9yZz4gd3JpdGVzOgoKPiBG
cm9tOiBUb2tlIEjDuGlsYW5kLUrDuHJnZW5zZW4gPHRva2VAdG9rZS5kaz4KPgo+IGF0aDEwayBt
YWludGFpbnMgY29tbW9uIHR4cXMgbGlzdCBmb3IgYWxsIHN0YXRpb25zLiBUaGlzIHR4cQo+IG1h
bmFnZW1lbnQgY2FuIGJlIHJlbW92ZWQgYnkgbWlncmF0aW5nIHRvIG1hYzgwMjExIHR4cSBBUElz
Cj4gYW5kIGxldCBtYWM4MDIxMSBoYW5kbGUgdHhxcyByZW9yZGVyaW5nIGJhc2VkIG9uIHJlcG9y
dGVkIGFpcnRpbWUuCj4gQnkgZG9pbmcgdGhpcywgdHhxIGZhaXJuZXNzIG1haW50YWluZWQgaW4g
YXRoMTBrIGkuZSBwcm9jZXNzaW5nCj4gTiBmcmFtZXMgcGVyIHR4cSBpcyByZW1vdmVkLiBCeSBh
ZGFwdGluZyB0byBtYWM4MDIxMSBBUElzLAo+IGF0aDEwayB3aWxsIHN1cHBvcnQgbWFjODAyMTEg
YmFzZWQgYWlydGltZSBmYWlybmVzcyBhbGdvcml0aG0uCj4KPiBUZXN0ZWQtYnk6IFZlbmthdGVz
d2FyYSBOYXJhbGFzZXR0eSA8dm5hcmFsYXNAY29kZWF1cm9yYS5vcmc+Cj4gQ28tZGV2ZWxvcGVk
LWJ5OiBSYWprdW1hciBNYW5vaGFyYW4gPHJtYW5vaGFyQGNvZGVhdXJvcmEub3JnPgo+IFNpZ25l
ZC1vZmYtYnk6IFRva2UgSMO4aWxhbmQtSsO4cmdlbnNlbiA8dG9rZUB0b2tlLmRrPgo+IFNpZ25l
ZC1vZmYtYnk6IFJhamt1bWFyIE1hbm9oYXJhbiA8cm1hbm9oYXJAY29kZWF1cm9yYS5vcmc+CgpQ
bGVhc2UgYWx3YXlzIGFkZCBoYXJkd2FyZSBhbmQgZmlybXdhcmUgdmVyc2lvbnMgdXNlZCBmb3Ig
dGVzdGluZy4gQnV0IEkKY2FuIGFkZCB0aGF0LCBzbyBubyBuZWVkIHRvIHJlc2VuZCBiZWNhdXNl
IG9mIHRoaXMuIEp1c3QgbGV0IG1lIGtub3cKd2hhdCB0byBhZGQuCgotLSAKS2FsbGUgVmFsbwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1h
aWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
