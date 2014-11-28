Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22d.google.com ([2a00:1450:400c:c05::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XuMhi-0007Dv-1f
 for ath10k@lists.infradead.org; Fri, 28 Nov 2014 14:39:27 +0000
Received: by mail-wi0-f173.google.com with SMTP id r20so18752188wiv.6
 for <ath10k@lists.infradead.org>; Fri, 28 Nov 2014 06:39:01 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1417079481-22255-8-git-send-email-michal.kazior@tieto.com>
References: <1417079481-22255-1-git-send-email-michal.kazior@tieto.com>
 <1417079481-22255-8-git-send-email-michal.kazior@tieto.com>
Date: Fri, 28 Nov 2014 15:39:01 +0100
Message-ID: <CA+BoTQn=g8-=FEEoW7Ux+p6s=EBy_3rwCP3qXWk_8ijR6jXY+Q@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] ath10k: implement wmi-tlv backend
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

T24gMjcgTm92ZW1iZXIgMjAxNCBhdCAxMDoxMSwgTWljaGFsIEthemlvciA8bWljaGFsLmthemlv
ckB0aWV0by5jb20+IHdyb3RlOgo+IExhdGVzdCBtYWluIGZpcm13YXJlIGJyYW5jaCBpbnRyb2R1
Y2VkIGEgbmV3IFdNSQo+IEFCSSBjYWxsZWQgd21pLXRsdi4gSXQgaXMgbm90IGEgdGx2IHN0cmlj
dGx5Cj4gc3BlYWtpbmcgYnV0IHNvbWV0aGluZyB0aGF0IHJlc2VtYmxlcyBpdCBiZWNhdXNlCj4g
aXQgaXMgb3JkZXJlZCBhbmQgbWF5IGhhdmUgZHVwbGljYXRlIGlkIGVudHJpZXMuCj4KPiBUaGlz
IHByZXBhcmVzIGF0aDEwayB0byBzdXBwb3J0IG5ldyBody4KPgo+IFNpZ25lZC1vZmYtYnk6IE1p
Y2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGlldG8uY29tPgpbLi4uXQo+IEBAIC0yMTUsNiAr
MjU0LDQyIEBAIHN0YXRpYyBpbmxpbmUgY2hhciAqd21pX3NlcnZpY2VfbmFtZShpbnQgc2Vydmlj
ZV9pZCkKPiAgICAgICAgIFNWQ1NUUihXTUlfU0VSVklDRV9CVVJTVCk7Cj4gICAgICAgICBTVkNT
VFIoV01JX1NFUlZJQ0VfU01BUlRfQU5URU5OQV9TV19TVVBQT1JUKTsKPiAgICAgICAgIFNWQ1NU
UihXTUlfU0VSVklDRV9TTUFSVF9BTlRFTk5BX0hXX1NVUFBPUlQpOwo+ICsgICAgICAgU1ZDU1RS
KFdNSV9TRVJWSUNFX1JPQU1fU0NBTl9PRkZMT0FEKTsKPiArICAgICAgIFNWQ1NUUihXTUlfU0VS
VklDRV9BUF9QU19ERVRFQ1RfT1VUX09GX1NZTkMpOwo+ICsgICAgICAgU1ZDU1RSKFdNSV9TRVJW
SUNFX0VBUkxZX1JYKTsKWy4uLl0KPiArICAgICAgIFNWQ1NUUihXTUlfU0VSVklDRV9SWF9GVUxM
X1JFT1JERVIpOwo+ICsgICAgICAgU1ZDU1RSKFdNSV9TRVJWSUNFX0RIQ1BfT0ZGTE9BRCk7CgpJ
J3ZlIGFkZGVkIDMgbmV3IHNlcnZpY2UgZW51bXMgaW4gdjI6CldNSV9TRVJWSUNFX1NUQV9SWF9J
UEFfT0ZGTE9BRF9TVVBQT1JULCBXTUlfU0VSVklDRV9NRE5TX09GRkxPQUQsCldNSV9TRVJWSUNF
X1NBUF9BVVRIX09GRkxPQUQgYnV0IGFwcGFyZW50bHkgSSBmb3Jnb3QgdG8gYWRkIFNWQ1NUUigp
CmZvciB0aGF0Li4KCgpNaWNoYcWCCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
