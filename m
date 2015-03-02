Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x22e.google.com ([2a00:1450:400c:c00::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSP8c-00082Q-VU
 for ath10k@lists.infradead.org; Mon, 02 Mar 2015 12:07:55 +0000
Received: by wghb13 with SMTP id b13so32967385wgh.0
 for <ath10k@lists.infradead.org>; Mon, 02 Mar 2015 04:07:29 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1425295680-2269-2-git-send-email-vthiagar@qti.qualcomm.com>
References: <1425295680-2269-1-git-send-email-vthiagar@qti.qualcomm.com>
 <1425295680-2269-2-git-send-email-vthiagar@qti.qualcomm.com>
Date: Mon, 2 Mar 2015 13:07:29 +0100
Message-ID: <CA+BoTQkJbshivUL304juyS6JdwGu0n_NPeMNa=qDtsdRjVvd6Q@mail.gmail.com>
Subject: Re: [PATCH V4 2/2] ath10k: Fix interrupt storm
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
To: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMiBNYXJjaCAyMDE1IGF0IDEyOjI4LCBWYXNhbnRoYWt1bWFyIFRoaWFnYXJhamFuCjx2dGhp
YWdhckBxdGkucXVhbGNvbW0uY29tPiB3cm90ZToKWy4uLl0KPiArc3RhdGljIGJvb2wgYXRoMTBr
X21hY19zaG91bGRfZGlzYWJsZV9wcm9taXNjKHN0cnVjdCBhdGgxMGsgKmFyKQo+ICt7Cj4gKyAg
ICAgICBzdHJ1Y3QgYXRoMTBrX3ZpZiAqYXJ2aWY7Cj4gKwo+ICsgICAgICAgaWYgKCEoYXItPmZp
bHRlcl9mbGFncyAmIEZJRl9QUk9NSVNDX0lOX0JTUykpCj4gKyAgICAgICAgICAgICAgIHJldHVy
biB0cnVlOwo+ICsKPiArICAgICAgIGlmICghYXItPm51bV9zdGFydGVkX3ZkZXZzKQo+ICsgICAg
ICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gKwo+ICsgICAgICAgbGlzdF9mb3JfZWFjaF9lbnRy
eShhcnZpZiwgJmFyLT5hcnZpZnMsIGxpc3QpCj4gKyAgICAgICAgICAgICAgIGlmIChhcnZpZi0+
dmRldl90eXBlICE9IFdNSV9WREVWX1RZUEVfQVApCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
cmV0dXJuIGZhbHNlOwo+ICsKPiArICAgICAgIGF0aDEwa19kYmcoYXIsIEFUSDEwS19EQkdfTUFD
LAo+ICsgICAgICAgICAgICAgICAgICAibWFjIGRpc2FibGluZyBwcm9taXNjdW91cyBtb2RlIGJl
Y2F1c2UgdmRldiBpcyBzdGFydGVkXG4iKTsKPiArICAgICAgIGFyLT5maWx0ZXJfZmxhZ3MgJj0g
fkZJRl9QUk9NSVNDX0lOX0JTUzsKCmFyLT5maWx0ZXJfZmxhZ3Mgc2hvdWxkbid0IGJlIGNoYW5n
ZWQuIEVzcGVjaWFsbHkgaW4gYSBmdW5jdGlvbiB3aGljaApzaG91bGRuJ3QgaGF2ZSBzaWRlLWVm
ZmVjdHMuCgoKTWljaGHFggoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
