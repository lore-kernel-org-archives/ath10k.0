Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x230.google.com ([2a00:1450:400c:c05::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WafYi-0003A2-D3
 for ath10k@lists.infradead.org; Thu, 17 Apr 2014 06:12:29 +0000
Received: by mail-wi0-f176.google.com with SMTP id r20so2412865wiv.15
 for <ath10k@lists.infradead.org>; Wed, 16 Apr 2014 23:12:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1397695357-14028-1-git-send-email-greearb@candelatech.com>
References: <1397695357-14028-1-git-send-email-greearb@candelatech.com>
Date: Thu, 17 Apr 2014 08:12:06 +0200
Message-ID: <CA+BoTQ=Q3s6_9tXq02_3S0=q5qv4U4V1F_qHoN1X1pfWV9CKBA@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Hold tx-lock while detaching htt.
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
To: Ben Greear <greearb@candelatech.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMTcgQXByaWwgMjAxNCAwMjo0MiwgIDxncmVlYXJiQGNhbmRlbGF0ZWNoLmNvbT4gd3JvdGU6
Cj4gRnJvbTogQmVuIEdyZWVhciA8Z3JlZWFyYkBjYW5kZWxhdGVjaC5jb20+Cj4KPiBBbmQgY2hl
Y2sgZm9yIG51bGwgcG9vbCBpbiB0aGUgdHggcGF0aCAod2hpY2ggd291bGQKPiBpbmRpY2F0ZSB3
ZSBhcmUgZGV0YWNoaW5nKS4KClNob3VsZG4ndCB3ZSBqdXN0IG1ha2Ugc3VyZSB0eCBpcyBzdG9w
cGVkIGJlZm9yZSB3ZSB0cnkgdG8gZGV0YWNoIGh0dD8KU3RvcGluZyBtYWM4MDIxMSBxdWV1ZXMg
YW5kIHN5bmNocm9uaXplX25ldCgpIHNob3VsZCBiZSBzdWZmaWNpZW50IEkKdGhpbmsuCgoKPiBA
QCAtNDAzLDYgKzQxMiwxMyBAQCBpbnQgYXRoMTBrX2h0dF90eChzdHJ1Y3QgYXRoMTBrX2h0dCAq
aHR0LCBzdHJ1Y3Qgc2tfYnVmZiAqbXNkdSkKPiAgICAgICAgICAgICAgICAgZ290byBlcnI7Cj4K
PiAgICAgICAgIHNwaW5fbG9ja19iaCgmaHR0LT50eF9sb2NrKTsKPiArCj4gKyAgICAgICAvKiBD
aGVjayBpZiB3ZSBhcmUgZGV0YWNoZWQuLi4gKi8KPiArICAgICAgIGlmICghIGh0dC0+dHhfcG9v
bCkgewo+ICsgICAgICAgICAgICAgICBzcGluX3VubG9ja19iaCgmaHR0LT50eF9sb2NrKTsKClNl
dHRpbmcgYHJlc2Agd291bGQgYmUgbmljZSB0byBpbmRpY2F0ZSBhbiBlcnJvci4gQW5kIHRoZXJl
J3MgYSBzcGFjZSBhZnRlciAhLgoKCk1pY2hhxYIKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
dGgxMGsK
