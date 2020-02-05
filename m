Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.aperture-lab.de ([138.201.29.205])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izQ5I-0004Db-JA
 for ath10k@lists.infradead.org; Wed, 05 Feb 2020 19:11:38 +0000
From: =?UTF-8?q?Linus=20L=C3=BCssing?= <linus.luessing@c0d3.blue>
Subject: [PATCH] ath10k: increase rx buffer size to 2048
Date: Wed,  5 Feb 2020 20:10:43 +0100
Message-Id: <20200205191043.21913-1-linus.luessing@c0d3.blue>
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
To: ath10k@lists.infradead.org
Cc: =?UTF-8?q?Linus=20L=C3=BCssing?= <ll@simonwunderlich.de>, Simon Wunderlich <sw@simonwunderlich.de>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Ben Greear <greearb@candelatech.com>, "David S . Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>

RnJvbTogTGludXMgTMO8c3NpbmcgPGxsQHNpbW9ud3VuZGVybGljaC5kZT4KCkJlZm9yZSwgb25s
eSBmcmFtZXMgd2l0aCBhIG1heGltdW0gc2l6ZSBvZiAxNTI4IGJ5dGVzIGNvdWxkIGJlCnRyYW5z
bWl0dGVkIGJldHdlZW4gdHdvIDgwMi4xMXMgbm9kZXMuCgpGb3IgYmF0bWFuLWFkdiBmb3IgaW5z
dGFuY2UsIHdoaWNoIGFkZHMgaXRzIG93biBoZWFkZXIgdG8gZWFjaCBmcmFtZSwKd2UgdHlwaWNh
bGx5IG5lZWQgYW4gTVRVIG9mIGF0IGxlYXN0IDE1MzIgYnl0ZXMgdG8gYmUgYWJsZSB0byB0cmFu
c21pdAp3aXRob3V0IGZyYWdtZW50YXRpb24uCgpUaGlzIHBhdGNoIG5vdyBpbmNyZWFzZXMgdGhl
IG1heG1pbXVtIGZyYW1lIHNpemUgZnJvbSAxNTI4IHRvIDE2NTYKYnl0ZXMuCgpUZXN0ZWQgd2l0
aCB0d28gYXRoMTBrIGRldmljZXMgaW4gODAyLjExcyBtb2RlLCBhcyB3ZWxsIGFzIHdpdGgKYmF0
bWFuLWFkdiBvbiB0b3Agb2YgODAyLjExcyB3aXRoIGZvcndhcmRpbmcgZGlzYWJsZWQuCgpGaXgg
b3JpZ2luYWxseSBmb3VuZCBhbmQgZGV2ZWxvcGVkIGJ5IEJlbiBHcmVlYXIuCgpMaW5rOiBodHRw
czovL2dpdGh1Yi5jb20vZ3JlZWFyYi9hdGgxMGstY3QvaXNzdWVzLzg5Ckxpbms6IGh0dHBzOi8v
Z2l0aHViLmNvbS9ncmVlYXJiL2F0aDEway1jdC9jb21taXQvOWU1YWIyNTAyN2UwOTcxZmEyNGNj
ZjkzMzczMzI0YzA4YzRlOTkyZApDYzogQmVuIEdyZWVhciA8Z3JlZWFyYkBjYW5kZWxhdGVjaC5j
b20+ClNpZ25lZC1vZmYtYnk6IExpbnVzIEzDvHNzaW5nIDxsbEBzaW1vbnd1bmRlcmxpY2guZGU+
Ci0tLQogZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9odHQuaCB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvaHR0LmggYi9kcml2ZXJzL25ldC93aXJlbGVz
cy9hdGgvYXRoMTBrL2h0dC5oCmluZGV4IDRhMTI1NjRmYzMwZS4uNmEyYjVlMTBlNTY4IDEwMDY0
NAotLS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL2h0dC5oCisrKyBiL2RyaXZl
cnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvaHR0LmgKQEAgLTIyMjAsNyArMjIyMCw3IEBAIHN0
cnVjdCBodHRfcnhfY2hhbl9pbmZvIHsKICAqIFNob3VsZCBiZTogc2l6ZW9mKHN0cnVjdCBodHRf
aG9zdF9yeF9kZXNjKSArIG1heCByeCBNU0RVIHNpemUsCiAgKiByb3VuZGVkIHVwIHRvIGEgY2Fj
aGUgbGluZSBzaXplLgogICovCi0jZGVmaW5lIEhUVF9SWF9CVUZfU0laRSAxOTIwCisjZGVmaW5l
IEhUVF9SWF9CVUZfU0laRSAyMDQ4CiAjZGVmaW5lIEhUVF9SWF9NU0RVX1NJWkUgKEhUVF9SWF9C
VUZfU0laRSAtIChpbnQpc2l6ZW9mKHN0cnVjdCBodHRfcnhfZGVzYykpCiAKIC8qIFJlZmlsbCBh
IGJ1bmNoIG9mIFJYIGJ1ZmZlcnMgZm9yIGVhY2ggcmVmaWxsIHJvdW5kIHNvIHRoYXQgRlcvSFcg
Y2FuIGhhbmRsZQotLSAKMi4yNS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
