Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ed1-f66.google.com ([209.85.208.66])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGJmG-0006nu-D0
 for ath10k@lists.infradead.org; Tue, 16 Apr 2019 08:49:17 +0000
Received: by mail-ed1-f66.google.com with SMTP id k45so17161404edb.6
 for <ath10k@lists.infradead.org>; Tue, 16 Apr 2019 01:49:13 -0700 (PDT)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: Re: [PATCH] mac80211: Fix kernel panic due to use of txq after free
In-Reply-To: <1555399480-30537-1-git-send-email-bperumal@codeaurora.org>
References: <1555399480-30537-1-git-send-email-bperumal@codeaurora.org>
Date: Tue, 16 Apr 2019 09:49:07 +0100
Message-ID: <87sguiuygs.fsf@toke.dk>
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
To: Bhagavathi Perumal S <bperumal@codeaurora.org>, johannes@sipsolutions.net, ath10k@lists.infradead.org, linux-wireless@vger.kernel.org

QmhhZ2F2YXRoaSBQZXJ1bWFsIFMgPGJwZXJ1bWFsQGNvZGVhdXJvcmEub3JnPiB3cml0ZXM6Cgo+
IFRoZSB0eHEgb2YgdmlmIGlzIGFkZGVkIHRvIGFjdGl2ZV90eHFzIGxpc3QgZm9yIEFURiBUWFEg
c2NoZWR1bGluZwo+IGluIHRoZSBmdW5jdGlvbiBpZWVlODAyMTFfcXVldWVfc2tiKCksIGJ1dCBp
dCB3YXMgbm90IHByb3Blcmx5IHJlbW92ZWQKPiBiZWZvcmUgZnJlZWluZyB0aGUgdHhxIG9iamVj
dC4gSXQgd2FzIGNhdXNpbmcgdXNlIGFmdGVyIGZyZWUgb2YgdGhlIHR4cQo+IG9iamVjdHMgZnJv
bSB0aGUgYWN0aXZlX3R4cXMgbGlzdCwgcmVzdWx0IHdhcyBrZXJuZWwgcGFuaWMKPiBkdWUgdG8g
aW52YWxpZCBtZW1vcnkgYWNjZXNzLgo+Cj4gRml4IGtlcm5lbCBpbnZhbGlkIG1lbW9yeSBhY2Nl
c3MgYnkgcHJvcGVybHkgcmVtb3ZpbmcgdHhxIG9iamVjdAo+IGZyb20gYWN0aXZlX3R4cXMgbGlz
dCBiZWZvcmUgZnJlZSB0aGUgb2JqZWN0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQmhhZ2F2YXRoaSBQ
ZXJ1bWFsIFMgPGJwZXJ1bWFsQGNvZGVhdXJvcmEub3JnPgoKTmljZSBjYXRjaCwgdGhhbmtzIQoK
QWNrZWQtYnk6IFRva2UgSMO4aWxhbmQtSsO4cmdlbnNlbiA8dG9rZUByZWRoYXQuY29tPgoKVGhp
cyBzaG91bGQgcHJvYmFibHkgaGF2ZSBhIGZpeGVzIHRhZzoKCkZpeGVzOiAxODY2NzYwMDk2YmYg
KCJtYWM4MDIxMTogQWRkIFRYUSBzY2hlZHVsaW5nIEFQSSIpCgotVG9rZQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAph
dGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2F0aDEwawo=
