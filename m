Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x22a.google.com ([2a00:1450:400c:c00::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YVwMs-0002Cj-LG
 for ath10k@lists.infradead.org; Thu, 12 Mar 2015 06:13:15 +0000
Received: by wghn12 with SMTP id n12so14018404wgh.6
 for <ath10k@lists.infradead.org>; Wed, 11 Mar 2015 23:12:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1426090976.1904.7.camel@sipsolutions.net>
References: <1426080326-14764-1-git-send-email-michal.kazior@tieto.com>
 <1426090976.1904.7.camel@sipsolutions.net>
Date: Thu, 12 Mar 2015 07:12:49 +0100
Message-ID: <CA+BoTQ=K_vxuB7my+4W5pLgmmdd7p-srqEM9O1=gwWLqzJhCkQ@mail.gmail.com>
Subject: Re: [PATCH] ath10k: strip qos data bit always
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMTEgTWFyY2ggMjAxNSBhdCAxNzoyMiwgSm9oYW5uZXMgQmVyZyA8am9oYW5uZXNAc2lwc29s
dXRpb25zLm5ldD4gd3JvdGU6Cj4gT24gV2VkLCAyMDE1LTAzLTExIGF0IDE0OjI1ICswMTAwLCBN
aWNoYWwgS2F6aW9yIHdyb3RlOgo+PiBOYXRpdmVXaWZpIHR4IG1vZGUgZXhwZWN0cyBRb1MgRGF0
YSBmcmFtZXMgdG8gYmUKPj4gZGVsaXZlcmVkIGFzIERhdGEgZnJhbWVzIHdpdGggUW9TIHBhcnQg
KGUuZy4gdGlkKQo+PiBiZWluZyBkZWxpZXZlcmVkIG91dC1vZi1iYW5kIGluIGZ3IHR4IGNvbW1h
bmQuCj4+Cj4+IFRoZSBRb1MgYml0IHdhc24ndCBzdHJpcHBlZCBiZWZvcmUgc3VibWl0dGluZyB0
bwo+PiBmaXJtd2FyZS4KPj4KPj4gU3RyaXBwaW5nIGZpeGVzIHR3byBrbm93biBwcm9ibGVtczoK
Pj4KPj4gICogcWNhNjE3NCBJT1Qgd2l0aCBzb21lIEFQcywgZS5nLgo+PiAgICBDaXNjbyBBSVIt
QVAgMTI1MiAod2hpY2ggd291bGQgY3Jhc2ggYWZ0ZXIKPj4gICAgYXRoMTBrIGFzc29jaWF0aW9u
KS4gU29tZSBhdGg5ayBBUHMgd291bGQKPj4gICAgY3Jhc2ggYXMgd2VsbC4KPgo+IEl0IHdvdWxk
IHByb2JhYmx5IGJlIGludGVyZXN0aW5nIHRvIGZpZ3VyZSBvdXQgd2h5IGFuZCBmaXggdGhhdCAt
IHRoaXMKPiBpcyBjbGVhcmx5IGEgbWFqb3IgaXNzdWUuCgpHb29kIHBvaW50LiBUaGUgcGF0Y2gg
d2FzIG9yaWdpbmFsbHkganVzdCBhIHNtYWxsIGZpeCBmb3Igc25pZmZpbmcgYnV0Cml0IGhhcHBl
bmVkIHRvIGZpeCB0aGUgSU9UIHByb2JsZW0gdGhhdCB3ZSBzdGFydGVkIHNlZWluZyB3aXRoIHRo
ZSBuZXcKY2hpcCBmdyBhcyB3ZWxsLgoKSSBiZWxpZXZlIHRoYXQgaWYgMTFuIHdhcyBkaXNhYmxl
ZCBvbiBBUHMgdGhlIHByb2JsZW0gZGlkIG5vdApyZXByb2R1Y2UuIEkgdGhpbmsgYXRoOWsgd2Fz
IGNyYXNoaW5nIHNvbWV3aGVyZSBhbG9uZyB0aGUgQkEgc2Vzc2lvbgp0ZWFyZG93biAoYXMgcGVy
IGtlcm5lbCBjYWxsIHRyYWNlKS4gVGhlIGF0aDlrIGNvZGViYXNlIGZyb20gd2hhdCBJCmtub3cg
d2FzIHJhdGhlciBvbGQgKHNvbWUgY3VzdG9tIDMuNCBmb3JrKSBzbyBwZXJoYXBzIGl0IHdhcyBh
IHJhY2Ugb2YKc29tZSBzb3J0IHRoYXQgaGFzIGJlZW4gZml4ZWQgbG9uZyBzaW5jZS4KCkknbGwg
dHJ5IHRvIGdldCBzb21lIHNuaWZmIGxvZ3MgYW5kIHRha2UgYSBsb29rIGF0IHRoaXMgbW9yZSBj
bG9zZWx5LgoKCk1pY2hhxYIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
