Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x22b.google.com ([2a00:1450:4010:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMqji-0006w1-5J
 for ath10k@lists.infradead.org; Wed, 05 Aug 2015 04:55:31 +0000
Received: by labsr2 with SMTP id sr2so20861034lab.2
 for <ath10k@lists.infradead.org>; Tue, 04 Aug 2015 21:55:05 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: initialize fw_features var
Date: Wed,  5 Aug 2015 06:55:37 +0200
Message-Id: <1438750537-27781-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

SWYgZmlybXdhcmUgZGlkIG5vdCBoYXZlIGFueSBmZWF0dXJlIGZsYWdzIHNldCB0aGUKdmFyIHdv
dWxkIGJlIGxlZnQgd2l0aCB2YWx1ZXMgZm91bmQgb24gdGhlIHN0YWNrCihpLmUuIGdhcmJhZ2Up
IHlpZWxkaW5nIHByaW50IHN0cmluZyBsaWtlIHRoaXM6CgogICguLi4pIGZlYXR1cmVzIFx4ZmZm
ZmZmYTZtOl5SXHhmZmZmZmZmYtSCXHhmZmZmZmZjNF5FCgpGaXhlczogYjI3YmM1YTQwZjkxICgi
YXRoMTBrOiBkdW1wIGZ3IGZlYXR1cmVzIGR1cmluZyBwcm9iaW5nIikKU2lnbmVkLW9mZi1ieTog
TWljaGFsIEthemlvciA8bWljaGFsLmthemlvckB0aWV0by5jb20+Ci0tLQogZHJpdmVycy9uZXQv
d2lyZWxlc3MvYXRoL2F0aDEway9kZWJ1Zy5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvd2lyZWxl
c3MvYXRoL2F0aDEway9kZWJ1Zy5jIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9k
ZWJ1Zy5jCmluZGV4IDFhMzNiZjA0YjdiNy4uZjdhYTFjNzNiNDgxIDEwMDY0NAotLS0gYS9kcml2
ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL2RlYnVnLmMKKysrIGIvZHJpdmVycy9uZXQvd2ly
ZWxlc3MvYXRoL2F0aDEway9kZWJ1Zy5jCkBAIC0xMjQsNyArMTI0LDcgQEAgRVhQT1JUX1NZTUJP
TChhdGgxMGtfaW5mbyk7CiAKIHZvaWQgYXRoMTBrX3ByaW50X2RyaXZlcl9pbmZvKHN0cnVjdCBh
dGgxMGsgKmFyKQogewotCWNoYXIgZndfZmVhdHVyZXNbMTI4XTsKKwljaGFyIGZ3X2ZlYXR1cmVz
WzEyOF0gPSB7fTsKIAogCWF0aDEwa19jb3JlX2dldF9md19mZWF0dXJlc19zdHIoYXIsIGZ3X2Zl
YXR1cmVzLCBzaXplb2YoZndfZmVhdHVyZXMpKTsKIAotLSAKMi4xLjQKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0
aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vYXRoMTBrCg==
