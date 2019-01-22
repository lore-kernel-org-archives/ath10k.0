Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ed1-f67.google.com ([209.85.208.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glwvS-0004qS-Jb
 for ath10k@lists.infradead.org; Tue, 22 Jan 2019 14:21:16 +0000
Received: by mail-ed1-f67.google.com with SMTP id p6so19492639eds.0
 for <ath10k@lists.infradead.org>; Tue, 22 Jan 2019 06:21:13 -0800 (PST)
From: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: [PATCH v6 0/4] Switch ath9k and ath10k to mac80211 airtime framework
Date: Tue, 22 Jan 2019 15:20:15 +0100
Message-Id: <20190122142019.21417-1-toke@redhat.com>
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
To: linux-wireless@vger.kernel.org
Cc: make-wifi-fast@lists.bufferbloat.net, =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>, ath10k@lists.infradead.org, Rajkumar Manoharan <rmanohar@codeaurora.org>

VGhpcyBpcyBhbiB1cGRhdGVkIHJlc2VuZCBvZiB0aGUgZHJpdmVyIHBhcnQgb2YgdGhlIHByZXZp
b3VzIHBhdGNoIHNldAp0aGF0IG1vdmVzIGFpcnRpbWUgZmFpcm5lc3Mgc2NoZWR1bGluZyBpbnRv
IG1hYzgwMjExIGFuZCBlbmFibGVzIGl0IGZvcgphdGgxMGsgYXMgd2VsbC4KClRoaXMgdmVyc2lv
biBpcyBqdXN0IGEgcmVmcmVzaCBvZiB0aGUgZHJpdmVyIGNvZGUsIGFsb25nIHdpdGggYSBzbWFs
bApmaXggZm9yIHRoZSBpc3N1ZSBJIG5vdGljZWQgeWVzdGVyZGF5IHdoZXJlIGF0aDlrIHdhcyBj
YWxsaW5nCmllZWU4MDIxMV9yZXR1cm5fdHhxKCkgd2l0aG91dCBwcm9wZXIgbG9nZ2luZy4KCgpL
YW4gWWFuICgxKToKICBhdGgxMGs6IHJlcG9ydGluZyBlc3RpbWF0ZWQgdHggYWlydGltZSBmb3Ig
ZmFpcm5lc3MKClRva2UgSMO4aWxhbmQtSsO4cmdlbnNlbiAoMyk6CiAgbWFjODAyMTE6IEV4cG9z
ZSBpZWVlODAyMTFfc2NoZWR1bGVfdHhxKCkgZnVuY3Rpb24KICBhdGg5azogU3dpdGNoIHRvIG1h
YzgwMjExIFRYUSBzY2hlZHVsaW5nIGFuZCBhaXJ0aW1lIEFQSXMKICBhdGgxMGs6IG1pZ3JhdGUg
dG8gbWFjODAyMTEgdHhxIHNjaGVkdWxpbmcKCiBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRo
MTBrL2NvcmUuYyAgICAgfCAgIDIgLQogZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9j
b3JlLmggICAgIHwgICA4ICstCiBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL2h0Yy5o
ICAgICAgfCAgIDEgLQogZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9odHRfcnguYyAg
IHwgICA5ICsKIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvbWFjLmMgICAgICB8IDE1
NSArKysrKysrKy0tLS0tCiBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3R4cnguYyAg
ICAgfCAgIDQgKwogZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDlrL2F0aDlrLmggICAgIHwg
IDE0IC0tCiBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoOWsvZGVidWcuYyAgICAgfCAgIDMg
LQogZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDlrL2RlYnVnLmggICAgIHwgICA4IC0KIGRy
aXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGg5ay9kZWJ1Z19zdGEuYyB8ICA3MCAtLS0tLS0KIGRy
aXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGg5ay9pbml0LmMgICAgICB8ICAgMyArLQogZHJpdmVy
cy9uZXQvd2lyZWxlc3MvYXRoL2F0aDlrL3JlY3YuYyAgICAgIHwgICA5ICstCiBkcml2ZXJzL25l
dC93aXJlbGVzcy9hdGgvYXRoOWsveG1pdC5jICAgICAgfCAyNDQgKysrKysrLS0tLS0tLS0tLS0t
LS0tCiBpbmNsdWRlL25ldC9tYWM4MDIxMS5oICAgICAgICAgICAgICAgICAgICAgfCAgMTMgKysK
IG5ldC9tYWM4MDIxMS9kcml2ZXItb3BzLmggICAgICAgICAgICAgICAgICB8ICAgNCArLQogbmV0
L21hYzgwMjExL3R4LmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEzICsrCiAxNiBmaWxl
cyBjaGFuZ2VkLCAyMTcgaW5zZXJ0aW9ucygrKSwgMzQzIGRlbGV0aW9ucygtKQoKLS0gCjIuMjAu
MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEw
ayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
