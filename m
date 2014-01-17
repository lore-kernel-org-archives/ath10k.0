Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-bk0-x22f.google.com ([2a00:1450:4008:c01::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W49cu-0000j8-MW
 for ath10k@lists.infradead.org; Fri, 17 Jan 2014 13:38:25 +0000
Received: by mail-bk0-f47.google.com with SMTP id d7so498024bkh.6
 for <ath10k@lists.infradead.org>; Fri, 17 Jan 2014 05:38:02 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1389345564-21042-1-git-send-email-yeohchunyeow@gmail.com>
References: <1389345564-21042-1-git-send-email-yeohchunyeow@gmail.com>
Date: Fri, 17 Jan 2014 14:38:00 +0100
Message-ID: <CA+BoTQmexjQy-+Bv-uofBa2Ndcu56yYOAEeNzdBSE3yMCQdZKw@mail.gmail.com>
Subject: Re: [PATCH v2] ath10k: fix the MAC address of peer statistic
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
To: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMTAgSmFudWFyeSAyMDE0IDEwOjE5LCBDaHVuLVllb3cgWWVvaCA8eWVvaGNodW55ZW93QGdt
YWlsLmNvbT4gd3JvdGU6Cj4gRml4IHRoZSBNQUMgYWRkcmVzcyBvZiB3bWlfcGVlcl9zdGF0cyBz
byB0aGF0IGl0IGlzCj4gcHJpbnRlZCBjb3JyZWN0bHkuIFRoaXMgaXMgdGVzdGVkIGFuZCB2ZXJp
ZmllZCB1c2luZwo+IGZpcm13YXJlIHZlcnNpb24gOTk5Ljk5OS4wLjYzNi4KPgo+IEJhc2VkIG9u
IHRoZSB2ZXJpZmljYXRpb24sIG1heGltdW0gb25seSAzIHBlZXIgc3RhdGlzdGljcyBpbmNsdWRp
bmcKPiBzZWxmIFNUQSBhYmxlIHRvIGJlIHByaW50ZWQgb3V0Lgo+Cj4gU2lnbmVkLW9mZi1ieTog
Q2h1bi1ZZW93IFllb2ggPHllb2hjaHVueWVvd0BnbWFpbC5jb20+Cj4gLS0tCj4gdjI6IG9mZnNl
dCB0aGUgc3RhdHMgdG8gaWdub3JlIHRoZSBmaXJzdCBwZWVyIChDaHVuLVllb3cpCj4KPiAgZHJp
dmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9kZWJ1Zy5jIHwgICAgNCArKysrCj4gIGRyaXZl
cnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvd21pLmggICB8ICAgMTQgKysrKysrKy0tLS0tLS0K
PiAgMiBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+Cgpb
Li4uXQoKPiBAQCAtMjgyMCw5ICsyODIwLDkgQEAgc3RydWN0IHdtaV92ZGV2X3N0YXRzIHsKPiAg
ICogVE9ETzogYWRkIG1vcmUgc3RhdHMKPiAgICovCj4gIHN0cnVjdCB3bWlfcGVlcl9zdGF0cyB7
Cj4gKyAgICAgICBfX2xlMzIgcGVlcl90eF9yYXRlOyAgICAvKiBUQkEgKi8KPiAgICAgICAgIHN0
cnVjdCB3bWlfbWFjX2FkZHIgcGVlcl9tYWNhZGRyOwo+ICAgICAgICAgX19sZTMyIHBlZXJfcnNz
aTsKPiAtICAgICAgIF9fbGUzMiBwZWVyX3R4X3JhdGU7Cj4gIH0gX19wYWNrZWQ7CgpUaGlzIGxv
b2tzIHdyb25nIHRvby4gSSd2ZSBqdXN0IGNoZWNrZWQgaXQgYW5kIGl0IHNlZW1zIHRoZQpgd2Fs
X2RiZ190eF9zdGF0c2AgaXMgb3V0IG9mIGRhdGUuIEl0J3MgbWlzc2luZyBhIGBfX2xlMzIKc3Rh
dGVsZXNzX3RpZF9hbGxvY19mYWlsdXJlYCB0aGF0IGhhcyBiZWVuIGluc2VydGVkIGF0IHNvbWUg
cG9pbnQgaW4KdGltZSBpbiB0aGUgZmlybXdhcmUgYmV0d2VlbiBgcGRldl9yZXNldHNgIGFuZCBg
cGh5X3VuZGVycnVuYC4gWW91CnNob3VsZCBhZGQgdGhpcyBtaXNzaW5nIGZpZWxkIGluc3RlYWQg
b2YgbW92aW5nIGBwZWVyX3R4X3JhdGVgLgoKVW5mb3J0dW5hdGVseSBBUCBmaXJtd2FyZSBoYXMg
ZXZlbiBtb3JlIGZpZWxkcyBpbnNlcnRlZCBpbgpgd21pX3BkZXZfc3RhdHNgLiBNYWtpbmcgdGhp
cyB3b3JrIHdpdGggYm90aCBmaXJtd2FyZXMgaXMgYSBtZXNzLgoKCk1pY2hhxYIKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxp
c3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
