Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.taht.net ([2a01:7e00::f03c:91ff:feae:7028])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZc0T-0005b7-Vd
 for ath10k@lists.infradead.org; Wed, 19 Dec 2018 13:35:27 +0000
From: Dave Taht <dave@taht.net>
Subject: Re: [Make-wifi-fast] [PATCH v5 0/6] Move TXQ scheduling and airtime
 fairness into mac80211
References: <1545181331-5288-1-git-send-email-rmanohar@codeaurora.org>
 <877eg5hd8k.fsf@toke.dk>
Date: Wed, 19 Dec 2018 05:34:59 -0800
In-Reply-To: <877eg5hd8k.fsf@toke.dk> ("Toke \=\?utf-8\?Q\?H\=C3\=B8iland-J\?\=
 \=\?utf-8\?Q\?\=C3\=B8rgensen\=22's\?\= message of
 "Wed, 19 Dec 2018 14:12:27 +0100")
Message-ID: <87mup1od18.fsf@taht.net>
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
To: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: make-wifi-fast@lists.bufferbloat.net, Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Rajkumar Manoharan <rmanohar@codeaurora.org>

VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIDx0b2tlQHRva2UuZGs+IHdyaXRlczoKCj4gUmFqa3Vt
YXIgTWFub2hhcmFuIDxybWFub2hhckBjb2RlYXVyb3JhLm9yZz4gd3JpdGVzOgo+Cj4+IEFsbCwK
Pj4KPj4gU29ycnkgZm9yIHRoZSBsb25nIGRlbGF5LiBIZXJlIGlzIHRoZSBjb25zb2xpZGF0ZWQg
c2VyaWVzIG9mIG1hYzgwMjExLAo+PiBhdGg5ayBhbmQgYXRoMTBrIGNoYW5nZXMgZm9yIG1vdmlu
ZyBUWFEgc2NoZWR1bGluZyBhbmQgYWlydGltZSBmYWlybmVzcwo+PiBpbnRvIG1hYzgwMjExIGFu
ZCBzdXBwb3J0IGFpcnRpbWUgZmFpcm5lc3MuCj4KPiBUaGFua3MgZm9yIHRha2luZyBjYXJlIG9m
IHRoZSByZXNwaW4hCj4KPiBKb2hhbm5lcywgSSB0aGluayBpdCdzIHNhZmUgZm9yIHlvdSB0byBy
ZXZpZXcgdGhpcyB2ZXJzaW9uLiBJIGhhdmUKPiBzdGFydGVkIHdvcmtpbmcgb24gYW5vdGhlciBh
cHByb2FjaCBmb3IgdGhlIHNjaGVkdWxlciBhbGdvcml0aG0gaXRzZWxmLAo+IGJ1dCBpdCBpcyBm
aW5lIHRvIGRvIGFzIGFuIGluY3JlbWVudGFsIHBhdGNoIG9uIHRvcCBvZiB0aGlzIGFzIGl0Cj4g
c2hvdWxkbid0IGltcGFjdCB0aGUgQVBJLiBIYXZpbmcgYSBzZXBhcmF0ZSBwYXRjaCBhbHNvIG1h
a2VzIHRlc3RpbmcKPiBlYXNpZXIgYW55d2F5LiBJJ2xsIHNlZSBpZiBJIGNhbid0IGdldCBpdCB0
byBhIHdvcmtpbmcgc3RhdGUgb3ZlciB0aGUKPiBob2xpZGF5cy4uLgoKVGhlcmUgY29tZXMgYSB0
aW1lIGluIGFsbCBwYXRjaCBzZXJpZXMgd2hlcmUgdGhlIGJlc3QgdGhpbmcgdG8gZG8gaXMKY29t
bWl0IGl0LCBhbmQgaW5mbGljdCBpdCBvbiBvdGhlcnMuIE5vdyBtYXkgYmUgdGhhdCB0aW1lLgoK
QWNrZWQtYnk6IERhdmUgVGFodCA8ZGF2ZS50YWh0QGdtYWlsLmNvbT4KCj4KPiAtVG9rZQo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTWFrZS13aWZp
LWZhc3QgbWFpbGluZyBsaXN0Cj4gTWFrZS13aWZpLWZhc3RAbGlzdHMuYnVmZmVyYmxvYXQubmV0
Cj4gaHR0cHM6Ly9saXN0cy5idWZmZXJibG9hdC5uZXQvbGlzdGluZm8vbWFrZS13aWZpLWZhc3QK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBt
YWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
