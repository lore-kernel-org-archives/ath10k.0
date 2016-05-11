Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b0RK2-00008p-9N
 for ath10k@lists.infradead.org; Wed, 11 May 2016 10:24:55 +0000
Received: by mail-wm0-x230.google.com with SMTP id n129so213185938wmn.1
 for <ath10k@lists.infradead.org>; Wed, 11 May 2016 03:24:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1462835475-11079-14-git-send-email-greearb@candelatech.com>
References: <1462835475-11079-1-git-send-email-greearb@candelatech.com>
 <1462835475-11079-14-git-send-email-greearb@candelatech.com>
Date: Wed, 11 May 2016 12:24:27 +0200
Message-ID: <CA+BoTQmg8p6AtcZ9Q79kBVUoXw7Ge3NHpYuE9XptU+eNhP-XOA@mail.gmail.com>
Subject: Re: [PATCH 13/21] ath10k: Document cycle count related counters.
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

T24gMTAgTWF5IDIwMTYgYXQgMDE6MTEsICA8Z3JlZWFyYkBjYW5kZWxhdGVjaC5jb20+IHdyb3Rl
Ogo+IEZyb206IEJlbiBHcmVlYXIgPGdyZWVhcmJAY2FuZGVsYXRlY2guY29tPgo+Cj4gVGhleSBh
cmUgbm90IG5lY2Vzc2FyaWx5IG5hbWVkIGluIGFuIGludHVpdGl2ZSBtYW5uZXIsCj4gc28gYXQg
bGVhc3QgYWRkIHNvbWUgY29tbWVudHMgdG8gaGVscCB0aGUgbmV4dCBwZXJzb24uCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBCZW4gR3JlZWFyIDxncmVlYXJiQGNhbmRlbGF0ZWNoLmNvbT4KPiAtLS0KPiAg
ZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9jb3JlLmggfCA4ICsrKystLS0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9jb3JlLmggYi9kcml2ZXJzL25l
dC93aXJlbGVzcy9hdGgvYXRoMTBrL2NvcmUuaAo+IGluZGV4IGU3YzIyOGEuLmM0ZjY0OWYgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9jb3JlLmgKPiArKysg
Yi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL2NvcmUuaAo+IEBAIC0xODksMTAgKzE4
OSwxMCBAQCBzdHJ1Y3QgYXRoMTBrX2Z3X3N0YXRzX3BkZXYgewo+Cj4gICAgICAgICAvKiBQREVW
IHN0YXRzICovCj4gICAgICAgICBzMzIgY2hfbm9pc2VfZmxvb3I7Cj4gLSAgICAgICB1MzIgdHhf
ZnJhbWVfY291bnQ7Cj4gLSAgICAgICB1MzIgcnhfZnJhbWVfY291bnQ7Cj4gLSAgICAgICB1MzIg
cnhfY2xlYXJfY291bnQ7Cj4gLSAgICAgICB1MzIgY3ljbGVfY291bnQ7Cj4gKyAgICAgICB1MzIg
dHhfZnJhbWVfY291bnQ7IC8qIGN5Y2xlcyBzcGVudCB0cmFuc21pdHRpbmcgZnJhbWVzICovCj4g
KyAgICAgICB1MzIgcnhfZnJhbWVfY291bnQ7IC8qIGN5Y2xlcyBzcGVudCByZWNlaXZpbmcgZnJh
bWVzICovCj4gKyAgICAgICB1MzIgcnhfY2xlYXJfY291bnQ7IC8qIFRvdGFsIGNoYW5uZWwgYnVz
eSB0aW1lLCBldmlkZW50bHkgKi8KPiArICAgICAgIHUzMiBjeWNsZV9jb3VudDsgLyogVG90YWwg
b24tY2hhbm5lbCB0aW1lICovCgpIbW0sIHRoZXJlIGFyZSBhbHNvIG90aGVyIGluc3RhbmNlcyBv
ZiB0aGVzZSB2YXJzIGluIHdtaS5oLiBBbHRob3VnaApyZWR1bmRhbnQgbWF5YmUgaXQncyB3b3J0
aCB0byBjb21tZW50IHRoZW0gYXMgd2VsbCAob3IgZmlyc3QgYW5kCmZvcmVtb3N0IHRoZXkgc2hv
dWxkIGJlIHRoZSBvbmVzIHRoYXQgbmVlZCBhIGNvbW1lbnQgYXMgdGhleSBhcmUgdGhlCiJzb3Vy
Y2UiKS4gSnVzdCBhbiBpZGVhLgoKKG9oLCBhbmQgbXkgc2lsbHkgT0NEIGlzIGlycml0YXRlZCBh
dCB0aGUgYmlnL3NtYWxsIGZpcnN0IGxldHRlcnMgaW4KdGhlIGNvbW1lbnRzIG5vdCBiZWluZyBj
b25zaXN0ZW50KQoKCk1pY2hhxYIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
