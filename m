Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x236.google.com ([2a00:1450:400c:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YaItY-00073X-Bg
 for ath10k@lists.infradead.org; Tue, 24 Mar 2015 07:05:01 +0000
Received: by wetk59 with SMTP id k59so155864601wet.3
 for <ath10k@lists.infradead.org>; Tue, 24 Mar 2015 00:04:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87lhind7p7.fsf@kamboji.qca.qualcomm.com>
References: <1427114301-18886-1-git-send-email-michal.kazior@tieto.com>
 <1427114301-18886-2-git-send-email-michal.kazior@tieto.com>
 <87lhind7p7.fsf@kamboji.qca.qualcomm.com>
Date: Tue, 24 Mar 2015 08:04:31 +0100
Message-ID: <CA+BoTQkdkNTpcyUoZ=RDNW7jsKeRpJjJt7sHruZ1QBGh8ujJSQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ath10k: share board file loading code across FW APIs
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

T24gMjMgTWFyY2ggMjAxNSBhdCAxNzowMSwgS2FsbGUgVmFsbyA8a3ZhbG9AcWNhLnF1YWxjb21t
LmNvbT4gd3JvdGU6Cj4gTWljaGFsIEthemlvciA8bWljaGFsLmthemlvckB0aWV0by5jb20+IHdy
aXRlczoKPgo+PiBUaGVyZSdzIG5vIG5lZWQgdG8gaW1wbGVtZW50IHRoZSBzYW1lIHRoaW5nIHR3
aWNlLgo+PiBSZWR1Y2UgY29kZSBkdXBsaWNhdGlvbi4KPj4KPj4gU2lnbmVkLW9mZi1ieTogTWlj
aGFsIEthemlvciA8bWljaGFsLmthemlvckB0aWV0by5jb20+Cj4KPiBbLi4uXQo+Cj4+IEBAIC03
MzAsNiArNzE2LDEyIEBAIHN0YXRpYyBpbnQgYXRoMTBrX2NvcmVfZmV0Y2hfZmlybXdhcmVfZmls
ZXMoc3RydWN0IGF0aDEwayAqYXIpCj4+ICAgICAgIC8qIGNhbGlicmF0aW9uIGZpbGUgaXMgb3B0
aW9uYWwsIGRvbid0IGNoZWNrIGZvciBhbnkgZXJyb3JzICovCj4+ICAgICAgIGF0aDEwa19mZXRj
aF9jYWxfZmlsZShhcik7Cj4+Cj4+ICsgICAgIHJldCA9IGF0aDEwa19jb3JlX2ZldGNoX2JvYXJk
X2ZpbGUoYXIpOwo+PiArICAgICBpZiAocmV0KSB7Cj4+ICsgICAgICAgICAgICAgYXRoMTBrX2Vy
cihhciwgImZhaWxlZCB0byBmZXRjaCBib2FyZCBmaWxlOiAlZFxuIiwgcmV0KTsKPj4gKyAgICAg
ICAgICAgICByZXR1cm4gcmV0Owo+PiArICAgICB9Cj4+ICsKPj4gICAgICAgYXItPmZ3X2FwaSA9
IDQ7Cj4+ICAgICAgIGF0aDEwa19kYmcoYXIsIEFUSDEwS19EQkdfQk9PVCwgInRyeWluZyBmdyBh
cGkgJWRcbiIsIGFyLT5md19hcGkpOwo+Cj4gVGhlcmUgd2FzIGEgY29uZmxpY3QgaGVyZSwgcGxl
YXNlIGNoZWNrIHRoZSByZXNvbHV0aW9uIGluIHRoZSBwZW5kaW5nCj4gYnJhbmNoLgoKTG9va3Mg
Z29vZCwgdGhhbmtzIQoKCk1pY2hhxYIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
