Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22f.google.com ([2a00:1450:400c:c05::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZdvB7-0006Ls-Go
 for ath10k@lists.infradead.org; Mon, 21 Sep 2015 07:06:22 +0000
Received: by wicgb1 with SMTP id gb1so100916748wic.1
 for <ath10k@lists.infradead.org>; Mon, 21 Sep 2015 00:05:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1442389740-29053-1-git-send-email-rmanohar@qti.qualcomm.com>
References: <1442389740-29053-1-git-send-email-rmanohar@qti.qualcomm.com>
Date: Mon, 21 Sep 2015 09:05:54 +0200
Message-ID: <CA+BoTQ=FMCyHtn8BMZv_6awOuLhJNFe5RhB2eNpCQfyk+5Jhcw@mail.gmail.com>
Subject: Re: [PATCH] ath10k: fix ldpc param for fixed rate
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
To: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMTYgU2VwdGVtYmVyIDIwMTUgYXQgMDk6NDksIFJhamt1bWFyIE1hbm9oYXJhbgo8cm1hbm9o
YXJAcXRpLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4gbGRwYyBpcyBub3QgY29uZmlndXJlZCBmb3Ig
Zml4ZWQgcmF0ZXMuIFRoaXMgYmxvY2tzIGF1dG8gcmF0ZSB2cyBmaXhlZAo+IHJhdGUgcGVyZm9y
bWFuY2UgY29tcGFyaXNvbi4gU2luY2UgZmlybXdhcmUgaXMgY29uc2lkZXJpbmcgbGRwYyB2ZGV2
Cj4gcGFyYW0gZm9yIGZpeGVkIHJhdGUgc2VsZWN0aW9uLCBpdCBoYXMgdG8gYmUgY29uZmlndXJl
ZCB0byBlbmFibGUgbGRwYwo+IGZvciBmaXhlZCByYXRlcy4KPgo+IFNpZ25lZC1vZmYtYnk6IFJh
amt1bWFyIE1hbm9oYXJhbiA8cm1hbm9oYXJAcXRpLnF1YWxjb21tLmNvbT4KPiAtLS0KWy4uLl0K
PiBAQCAtNjA0MSw2ICs2MDQ5LDcgQEAgc3RhdGljIGludCBhdGgxMGtfbWFjX29wX3NldF9iaXRy
YXRlX21hc2soc3RydWN0IGllZWU4MDIxMV9odyAqaHcsCj4gICAgICAgICBiYW5kID0gZGVmLmNo
YW4tPmJhbmQ7Cj4gICAgICAgICBodF9tY3NfbWFzayA9IG1hc2stPmNvbnRyb2xbYmFuZF0uaHRf
bWNzOwo+ICAgICAgICAgdmh0X21jc19tYXNrID0gbWFzay0+Y29udHJvbFtiYW5kXS52aHRfbWNz
Owo+ICsgICAgICAgbGRwYyA9ICEhKGFyLT5odF9jYXBfaW5mbyAmIFdNSV9IVF9DQVBfTERQQyk7
CgpJcyBzdGlsbCByZWFsbHkgY29ycmVjdD8gTERQQyBtdXN0IGJlIHN1cHBvcnRlZCBvbiB0aGUg
Unggc2lkZSBvZgpkZXN0aW5hdGlvbiBzdGF0aW9ucyBoZW5jZSBJIHdvdWxkIGFzc3VtZSB5b3Ug
bmVlZCB0byBjaGVjayB3aGV0aGVyCmFsbCBzdGF0aW9ucyBhc3NvY2lhdGVkIGFyZSBMRFBDIGNh
cGFibGUgYmVmb3JlIGVuYWJsaW5nIGl0IChlLmcuIHZpYQppZWVlODAyMTFfaXRlcmF0ZV9zdGF0
aW9uc19hdG9taWMpLgoKCk1pY2hhxYIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
