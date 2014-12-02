Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x235.google.com ([2a00:1450:400c:c05::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XvhPu-0005AS-2z
 for ath10k@lists.infradead.org; Tue, 02 Dec 2014 06:58:34 +0000
Received: by mail-wi0-f181.google.com with SMTP id r20so19895261wiv.2
 for <ath10k@lists.infradead.org>; Mon, 01 Dec 2014 22:58:11 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20141201144458.18248.28568.stgit@potku.adurom.net>
References: <20141201144400.18248.62714.stgit@potku.adurom.net>
 <20141201144458.18248.28568.stgit@potku.adurom.net>
Date: Tue, 2 Dec 2014 07:58:09 +0100
Message-ID: <CA+BoTQkrqeWcr2vrd-b18HezZhyBkfvOYE3SgF39oYu54BX-Fw@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] ath10k: create ath10k_core_init_features()
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMSBEZWNlbWJlciAyMDE0IGF0IDE1OjQ0LCBLYWxsZSBWYWxvIDxrdmFsb0BxY2EucXVhbGNv
bW0uY29tPiB3cm90ZToKWy4uLl0KPiAgaW50IGF0aDEwa19jb3JlX3N0YXJ0KHN0cnVjdCBhdGgx
MGsgKmFyLCBlbnVtIGF0aDEwa19maXJtd2FyZV9tb2RlIG1vZGUpCj4gQEAgLTEwNDYsNyArMTA0
NywxMiBAQCBzdGF0aWMgaW50IGF0aDEwa19jb3JlX3Byb2JlX2Z3KHN0cnVjdCBhdGgxMGsgKmFy
KQo+ICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ICAgICAgICAgfQo+Cj4gLSAgICAgICBh
dGgxMGtfY29yZV9pbml0X21heF9zdGFfY291bnQoYXIpOwo+ICsgICAgICAgcmV0ID0gYXRoMTBr
X2NvcmVfaW5pdF9maXJtd2FyZV9mZWF0dXJlcyhhcik7Cj4gKyAgICAgICBpZiAocmV0KSB7Cj4g
KyAgICAgICAgICAgICAgIGF0aDEwa19lcnIoYXIsICJmYXRhbCBwcm9ibGVtIHdpdGggZmlybXdh
cmUgZmVhdHVyZXM6ICVkXG4iLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIHJldCk7Cj4g
KyAgICAgICAgICAgICAgIHJldHVybiByZXQ7CgpJIHRoaW5rIHlvdSBzaG91bGQgY2FsbCBhdGgx
MGtfY29yZV9mcmVlX2Zpcm13YXJlX2ZpbGVzKCkgYW5kCmF0aDEwa19oaWZfcG93ZXJfZG93bigp
IGJlZm9yZSByZXR1cm5pbmcgKHNpbWlsYXIgdG8gaG93CmF0aDEwa19jb3JlX3N0YXJ0KCkgZmFp
bHVyZSBpcyBoYW5kbGVkKS4KCgpNaWNoYcWCCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRo
MTBrCg==
