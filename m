Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x22c.google.com ([2a00:1450:400c:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WnlRB-0003CN-8Z
 for ath10k@lists.infradead.org; Fri, 23 May 2014 09:06:49 +0000
Received: by mail-we0-f172.google.com with SMTP id k48so4631659wev.17
 for <ath10k@lists.infradead.org>; Fri, 23 May 2014 02:06:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87bnuovq6x.fsf@kamboji.qca.qualcomm.com>
References: <1399637749-13489-1-git-send-email-michal.kazior@tieto.com>
 <1400143324-14911-1-git-send-email-michal.kazior@tieto.com>
 <1400143324-14911-4-git-send-email-michal.kazior@tieto.com>
 <87oayovr1m.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQmJTsh3Kcwmqx19WAzoBhYrhkQaPT_S=JFVPptkVaaKyw@mail.gmail.com>
 <87bnuovq6x.fsf@kamboji.qca.qualcomm.com>
Date: Fri, 23 May 2014 11:06:25 +0200
Message-ID: <CA+BoTQn_V5zGA18qGMNrWYy_-fBQzBi1=EmzMs=0SLvk1LBVJQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] ath10k: drain tx before restarting hw
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMjMgTWF5IDIwMTQgMTA6NDUsIEthbGxlIFZhbG8gPGt2YWxvQHFjYS5xdWFsY29tbS5jb20+
IHdyb3RlOgo+IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGlldG8uY29tPiB3cml0ZXM6
Cj4KPj4gT24gMjMgTWF5IDIwMTQgMTA6MjcsIEthbGxlIFZhbG8gPGt2YWxvQHFjYS5xdWFsY29t
bS5jb20+IHdyb3RlOgo+Pj4gTWljaGFsIEthemlvciA8bWljaGFsLmthemlvckB0aWV0by5jb20+
IHdyaXRlczoKPj4+Cj4+Pj4gK3N0YXRpYyB2b2lkIGF0aDEwa19kcmFpbl90eChzdHJ1Y3QgYXRo
MTBrICphcikKPj4+PiArewo+Pj4+ICsgICAgIC8qIHdvcmtlcnMgY2FuIGhvbGQgY29uZl9tdXRl
eCAtLSBhdm9pZCBkZWFkbG9jayAqLwo+Pj4+ICsgICAgIFdBUk5fT04obG9ja2RlcF9pc19oZWxk
KCZhci0+Y29uZl9tdXRleCkpOwo+Pj4KPj4+IElmIENPTkZJR19MT0NLREVQIGlzIGRpc2FibGVk
IHRoaXMgd2lsbCBmYWlsIHdpdGg6Cj4+Pgo+Pj4gZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0
aDEway9tYWMuYzoyMzAxOjI6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlv
biAnbG9ja2RlcF9pc19oZWxkJyBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlv
bl0KPj4+Cj4+PiBJIHdhc24ndCBhYmxlIHRvIGNvbWUgdXAgd2l0aCBhbnkgb3RoZXIgd2F5IHRo
YW4gYWRkaW5nICcjaWZkZWYKPj4+IENPTkZJR19MT0NLREVQJyB3aGljaCBpcyBxdWl0ZSB1Z2x5
LiBXaGF0IHNob3VsZCB3ZSBkbz8KPj4KPj4gSSBndWVzcyB3ZSBjb3VsZCBkZWZpbmUgbG9ja2Rl
cF9hc3NlcnRfbm90X2hlbGQoKSBpbiBkZWJ1Zy5oPwo+Cj4gU3VyZSwgYnV0IEkgc3RpbGwgdGhp
bmsgaXQncyBhIGJpdCB1Z2x5LiBUaGUgcmlnaHQgd2F5IHRvIGZpeCB0aGlzIHdvdWxkCj4gYmUg
dG8gYWRkIGl0IHRvIGluY2x1ZGUvbG9ja2RlcC5oLCBpbnN0ZWFkIG9mIGFkZGluZyBjdXN0b20g
Y2hlY2tzIHRvIGEKPiBkcml2ZXIuCgpHb29kIHBvaW50LiBJIHdvbmRlciBpZiBpdCdzIGdlbmVy
aWMgZW5vdWdoIHRvIGp1c3RpZnkuCgoKPiBCdXQgZG9lcyB0aGlzIGNoZWNrIGV2ZW4gbWFrZSBz
ZW5zZT8gVGhlcmUncyBub3RoaW5nIHByZXZlbnRpbmcKPiB0byBhbm90aGVyIHRocmVhZCB0byB0
YWtlIGxvY2sganVzdCBhZnRlciB0aGUgV0FSTl9PTigpLCByaWdodD8KClRoZXJlJ3Mgbm90aGlu
ZyB3cm9uZyB3aXRoIG90aGVyIHRocmVhZCBob2xkaW5nIGl0LiBBY3R1YWxseSB0aGF0J3MKdGhl
IHJlYXNvbiBmb3IgdGhpcyB2ZXJ5IGNoZWNrLgoKVGhlIHBvaW50IGlzIHRvIHByZXZlbnQgYXRo
MTBrX2RyYWluX3R4KCkgYmVpbmcgY2FsbGVkIHdoaWxlIGNhbGxlcgooY3VycmVudCB0aHJlYWQp
IGhvbGRzIGNvbmZfbXV0ZXguIElmIGl0IHdlcmUgdG8gaG9sZCBjb25mX211dGV4IHRoZW4KY2Fu
Y2VsX3dvcmtfc3luYygpIGNhbiBkZWFkbG9jayBhcyBib3RoIHdvcmtlcnMgaXQgdHJpZXMgdG8g
c3RvcCB0cnkKdG8gZ2V0IGEgaG9sZCBvZiB0aGUgbG9jayB0b28uCgoKPiBPaCwgYW5kIGlmIHdl
IGFkZCBpdCB0byBkZWJ1Zy5oIHdlIHNob3VsZCBuYW1lIGF0aDEwa19hc3NlcnRfbm90X2hlbGQo
KS4KPiBXZSBzaG91bGQgbm90IHVzZSBsb2NrZGVwJ3MgbmFtZXNwYWNlIGZvciBhbnl0aGluZyBp
bnNpZGUgYXRoMTBrLgoKR29vZCBwb2ludC4KCgpNaWNoYcWCCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vYXRoMTBrCg==
