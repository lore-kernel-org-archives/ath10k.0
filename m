Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:72ef::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eKnW3-0000b4-LI
 for ath10k@lists.infradead.org; Fri, 01 Dec 2017 15:46:17 +0000
Message-ID: <1512143142.25588.17.camel@sipsolutions.net>
Subject: Re: [PATCH 2/2] ath10k: add per peer tx stats support for 10.2.4
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 01 Dec 2017 16:45:42 +0100
In-Reply-To: <87d13y31r0.fsf@toke.dk> (sfid-20171201_162958_526202_5A4E3A79)
References: <1512046701-14435-1-git-send-email-akolli@qti.qualcomm.com>
 <1512046701-14435-3-git-send-email-akolli@qti.qualcomm.com>
 <87k1y7zqtj.fsf@kamboji.qca.qualcomm.com>
 <DAB5EBB8-C820-4056-8AAB-063D05F38BD5@toke.dk>
 <87bmjjzppd.fsf@kamboji.qca.qualcomm.com>
 <5080a68538fd2d883e15bacaa969661b@codeaurora.org> <87r2se36rq.fsf@toke.dk>
 <87k1y6y04i.fsf@kamboji.qca.qualcomm.com> <87d13y31r0.fsf@toke.dk>
 (sfid-20171201_162958_526202_5A4E3A79)
Mime-Version: 1.0
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
To: Toke =?ISO-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@toke.dk>, Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "linux-wireless-owner@vger.kernel.org" <linux-wireless-owner@vger.kernel.org>, Anilkumar Kolli <akolli@qti.qualcomm.com>, "akolli@codeaurora.org" <akolli@codeaurora.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gRnJpLCAyMDE3LTEyLTAxIGF0IDE2OjI5ICswMTAwLCBUb2tlIEjDuGlsYW5kLUrDuHJnZW5z
ZW4gd3JvdGU6Cj4gCj4gWWVhaCwgZmlndXJlcy4gV2VsbCwgbWF5YmUgd2UnbGwganVzdCBoYXZl
IHRvIHN1cHBvcnQgYW4gYXN5bmNocm9ub3VzCj4gY2FsbGJhY2sgaW50byBtYWM4MDIxMSB0byBy
ZWdpc3RlciBhaXJ0aW1lIHVzYWdlLiBXaWxsIHByb2JhYmx5IGhhdmUgdG8KPiBhZGQgc29tZSBh
c3luY2hyb25pY2l0eSBhbnl3YXkgdG8gYXZvaWQgZG9pbmcgdG9vIG11Y2ggd29yayBpbiB0aGUg
ZmFzdAo+IHBhdGguCgpJIHJlYWxseSB0aGluayB3ZSBzaG91bGQgaGF2ZSB0aGF0IGFueXdheS4g
SW4gZmFjdCwgcGVyaGFwcyB3ZSBzaG91bGQKanVzdCBlbmZvcmNlIGl0IHRoYXQgd2F5PyBUaGVu
IGF0aDlrIHdvdWxkIGhhdmUgdG8gZG8gYSBiaXQgbW9yZSB3b3JrLApidXQgaXQncyBhbHNvIHRo
ZSBzbG93ZXIgb2YgdGhlIGRldmljZXMgOi0pCgpCdXQgdGhpcyBwbGF5cyBpbiB3aXRoIHRoZSB3
aG9sZSBtdWx0aS1xdWV1ZSBSWCB3ZSBkaXNjdXNzZWQgYmVmb3JlLgoKam9oYW5uZXMKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5n
IGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
