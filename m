Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x231.google.com ([2a00:1450:400c:c05::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XcU8H-0004oE-Cx
 for ath10k@lists.infradead.org; Fri, 10 Oct 2014 06:56:58 +0000
Received: by mail-wi0-f177.google.com with SMTP id fb4so1042423wid.10
 for <ath10k@lists.infradead.org>; Thu, 09 Oct 2014 23:56:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1412847527-25983-4-git-send-email-michal.kazior@tieto.com>
References: <1412847527-25983-1-git-send-email-michal.kazior@tieto.com>
 <1412847527-25983-4-git-send-email-michal.kazior@tieto.com>
Date: Fri, 10 Oct 2014 08:56:31 +0200
Message-ID: <CA+BoTQkrhuBLae6+sKt36haEFUOQcch_sKz6qrK35N51-qAdPw@mail.gmail.com>
Subject: Re: [PATCH 3/3] ath10k: speed up hw recovery
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Michal Kazior <michal.kazior@tieto.com>

T24gOSBPY3RvYmVyIDIwMTQgMTE6MzgsIE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGll
dG8uY29tPiB3cm90ZToKPiBJbiBzb21lIGNhc2VzIGh3IHJlY292ZXJ5IHdhcyB0YWtpbmcgYW4g
YWJzdXJkbHkKPiBsb25nIHRpbWUgZHVlIHRvIGF0aDEwayB3YWl0aW5nIGZvciB0aGluZ3MgdGhh
dAo+IHdvdWxkIG5ldmVyIHJlYWxseSBjb21wbGV0ZS4KPgo+IEluc3RlYWQgb2Ygd2FpdGluZyBm
b3IgaW5ldml0YWJsZSB0aW1lb3V0cyBwb2tlCj4gYWxsIGNvbXBsZXRpb25zIGFuZCB3YWtlcXVl
dWVzIGFuZCBjaGVjayBpZiBpdCdzCj4gc3RpbGwgd29ydGggd2FpdGluZy4KPgo+IFNpZ25lZC1v
ZmYtYnk6IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGlldG8uY29tPgo+IC0tLQpbLi4u
XQo+IEBAIC02ODUsNiArNjg1LDIwIEBAIHN0YXRpYyB2b2lkIGF0aDEwa19jb3JlX3Jlc3RhcnQo
c3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgYXRoMTBrICph
ciA9IGNvbnRhaW5lcl9vZih3b3JrLCBzdHJ1Y3QgYXRoMTBrLCByZXN0YXJ0X3dvcmspOwo+Cj4g
KyAgICAgICBzZXRfYml0KEFUSDEwS19GTEFHX0NSQVNIX0ZMVVNILCAmYXItPmRldl9mbGFncyk7
Cj4gKyAgICAgICBiYXJyaWVyKCk7Cj4gKyAgICAgICBpZWVlODAyMTFfc3RvcF9xdWV1ZXMoYXIt
Pmh3KTsKPiArICAgICAgIGF0aDEwa19kcmFpbl90eChhcik7Cj4gKyAgICAgICBjb21wbGV0ZV9h
bGwoJmFyLT5zY2FuLnN0YXJ0ZWQpOwo+ICsgICAgICAgY29tcGxldGVfYWxsKCZhci0+c2Nhbi5j
b21wbGV0ZWQpOwo+ICsgICAgICAgY29tcGxldGVfYWxsKCZhci0+c2Nhbi5vbl9jaGFubmVsKTsK
PiArICAgICAgIGNvbXBsZXRlX2FsbCgmYXItPm9mZmNoYW5fdHhfY29tcGxldGVkKTsKPiArICAg
ICAgIGNvbXBsZXRlX2FsbCgmYXItPmluc3RhbGxfa2V5X2RvbmUpOwo+ICsgICAgICAgY29tcGxl
dGVfYWxsKCZhci0+dmRldl9zZXR1cF9kb25lKTsKCj4gKyAgICAgICB3YWtlX3VwKCZhci0+aHR0
LmVtcHR5X3R4X3dxKTsKPiArICAgICAgIHdha2VfdXAoJmFyLT53bWkudHhfY3JlZGl0c193cSk7
Cj4gKyAgICAgICB3YWtlX3VwKCZhci0+cGVlcl9tYXBwaW5nX3dxKTsKCkphbnVzeiBmb3VuZCBh
IHByb2JsZW0gd2l0aCB3YWl0cXVldWVzLiBJJ2xsIG5lZWQgdG8gbW92ZSB3YWl0cXVldWUKaW5p
dGlhbGl6YXRpb24gdG8gY29yZV9jcmVhdGUgb3IgZWxzZSBpZiwgZS5nLiBmdyBwcm9iaW5nIGZh
aWxzCnRoZXJlJ3MgYSBjaGFuY2UgYSBzcHVyaW91cyBpbnRlcnJ1cHQgd2lsbCBjYXVzZSB0aGUg
a2VybmVsIHRvIGRlcmVmCmFuIGludmFsaWQgcG9pbnRlci4KCkknbGwgcG9zdCBhIHYyIGxhdGVy
LgoKCk1pY2hhxYIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
