Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLRGZ-0000gq-Pn
 for ath10k@lists.infradead.org; Fri, 18 Oct 2019 12:22:01 +0000
Message-ID: <10b885b3238cede2d99c6134bebcc0c8ba6f6b10.camel@sipsolutions.net>
Subject: Re: [PATCH v2 1/4] mac80211: Rearrange ieee80211_tx_info to make
 room for tx_time_est
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 18 Oct 2019 14:21:52 +0200
In-Reply-To: <87sgnqe4wg.fsf@toke.dk>
References: <157115993755.2500430.12214017471129215800.stgit@toke.dk>
 <157115993866.2500430.13989567853855880476.stgit@toke.dk>
 <CA+iem5t6xghBocck864nDX2snWQ5O+v6_M2Jc9aCdn_hE+mFCA@mail.gmail.com>
 <87sgnqe4wg.fsf@toke.dk>
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
To: Toke =?ISO-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>, Kan Yan <kyan@google.com>
Cc: Rajkumar Manoharan <rmanohar@codeaurora.org>, Kevin Hayes <kevinhayes@google.com>, make-wifi-fast@lists.bufferbloat.net, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, John Crispin <john@phrozen.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>

T24gRnJpLCAyMDE5LTEwLTE4IGF0IDEyOjE1ICswMjAwLCBUb2tlIEjDuGlsYW5kLUrDuHJnZW5z
ZW4gd3JvdGU6Cgo+IEhvd2V2ZXIsIHRoZXJlJ3MgYSBuaWNlIGp1aWN5ICd1MTYgYWNrX2ZyYW1l
X2lkJyBhdCB0aGUgc3RhcnQgb2YKPiBpZWVlODAyMTFfdHhfaW5mby4gQ291bGQgd2UgcG90ZW50
aWFsbHkgdXNlIHRoYXQ/IFdlIGNvdWxkIHVzZSB0aGUgdG9wCj4gYml0IGFzIGEgZGlzYW1iaWd1
YXRpb24gZmxhZzsgSSB0aGluayB3ZSdyZSBmaW5lIHdpdGggMTUgYml0cyBmb3IgdGhlIFRYCj4g
dGltZSBpdHNlbGYgKGEgc2luZ2xlIHBhY2tldCB3b24ndCBleGNlZWQgOG1zIG9yIFRYIHRpbWUp
LCBzbyBpZiB3ZSBjYW4KPiBsaXZlIHdpdGggMTUgYml0cyBvZiBBQ0sgZnJhbWUgSUQgc3BhY2Us
IHRoYXQgY291bGQgYmUgYSB3YXkgZm9yd2FyZD8KCkkgd2FzIGdvaW5nIHRvIHNheSB0aGF0IHNo
b3VsZCB3b3JrIGFzIHdlIG9ubHkgZXZlciBoYXZlIGEgaGFuZGZ1bCBvZgpBQ0sgZnJhbWUgSURz
LCBidXQgLi4uIHlvdSBzdGlsbCBuZWVkIHRoZSBhaXJ0aW1lIGV2ZW4gZm9yIGEgZnJhbWUgdGhh
dAp1c2Vyc3BhY2Ugd2FudHMgdG8ga25vdyB0aGUgQUNLIHN0YXR1cyBvZiwgbm8/CgpXZSBjb3Vs
ZCBwdWxsIHRoZSBhY2tfZnJhbWVfaWQgb3V0LW9mLWxpbmUgdXNpbmcgdGhlIHNrYiBleHRlbnNp
b25zCmZyYW1ld29yaywgYnV0IEknbSBub3Qgc3VyZSB3ZSBzaG91bGQgYWxsb2NhdGUgb25lIG9m
IHRoZSBwb3NzaWJsZSA4CmV4dGVuc2lvbiBJRHMgZm9yIHRoYXQgZWl0aGVyIC4uLgoKV2hhdCB3
ZSByZWFsbHkgc2hvdWxkIGRvIGlzIGNvbnZlcnQgYWxsIChyZWxldmFudCkgZHJpdmVycyB0byB1
c2UgcmF0ZQp0YWJsZXMgaW5zdGVhZCBvZiBoYXZpbmcgYWxsIHRoZSByYXRlcyBpbiB0aGUgVFgg
aW5mbywgdGhlbiB3ZSdkIGdldCBhCmxvdCBvZiBzcGFjZSwgYnV0IHRoYXQncyBhIGxvdCBvZiB3
b3JrIC4uLgoKam9oYW5uZXMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
