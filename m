Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22c.google.com ([2a00:1450:400c:c05::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtCKK-0006j9-TT
 for ath10k@lists.infradead.org; Tue, 25 Nov 2014 09:22:29 +0000
Received: by mail-wi0-f172.google.com with SMTP id n3so8413766wiv.11
 for <ath10k@lists.infradead.org>; Tue, 25 Nov 2014 01:22:06 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87egsr1wj7.fsf@kamboji.qca.qualcomm.com>
References: <1416839648-31803-1-git-send-email-michal.kazior@tieto.com>
 <87egsr1wj7.fsf@kamboji.qca.qualcomm.com>
Date: Tue, 25 Nov 2014 10:22:04 +0100
Message-ID: <CA+BoTQnk+40Pxkxfcu47Z-3j=8h2iMP8tKqXKf2GhAY3WkQxCw@mail.gmail.com>
Subject: Re: [PATCH] ath10k: don't drop corrupted mgmt frames
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

T24gMjUgTm92ZW1iZXIgMjAxNCBhdCAxMDowNCwgS2FsbGUgVmFsbyA8a3ZhbG9AcWNhLnF1YWxj
b21tLmNvbT4gd3JvdGU6Cj4gTWljaGFsIEthemlvciA8bWljaGFsLmthemlvckB0aWV0by5jb20+
IHdyaXRlczoKWy4uLl0KPj4gQEAgLTEzOTQsMTIgKzEzOTYsMTkgQEAgc3RhdGljIGJvb2wgYXRo
MTBrX2h0dF9yeF9hbXNkdV9hbGxvd2VkKHN0cnVjdCBhdGgxMGsgKmFyLAo+PiAgICAgICAgICAg
ICAgIHJldHVybiBmYWxzZTsKPj4gICAgICAgfQo+Pgo+PiArICAgICBpc19tZ210ID0gISEocnhk
LT5hdHRlbnRpb24uZmxhZ3MgJgo+PiArICAgICAgICAgICAgICAgICAgX19jcHVfdG9fbGUzMihS
WF9BVFRFTlRJT05fRkxBR1NfTUdNVF9UWVBFKSk7Cj4+ICsgICAgIGhhc19mY3NfZXJyID0gISEo
cnhkLT5hdHRlbnRpb24uZmxhZ3MgJgo+PiArICAgICAgICAgICAgICAgICAgICAgIF9fY3B1X3Rv
X2xlMzIoUlhfQVRURU5USU9OX0ZMQUdTX0ZDU19FUlIpKTsKPgo+IEkgdGhpbmsgSSBhc2tlZCB0
aGlzIGJlZm9yZSBpbiBzb21lIG90aGVyIHBhdGNoLCBidXQgaXNuJ3QgJyEhJyBvcGVyYXRvcgo+
IHVzZWxlc3MgaGVyZT8gaXNfbWdtdCBpcyBhIGJvb2xlYW4gc28gdGhlIGNvbXBpbGVyIHNob3Vs
ZCBjb252ZXJ0IGl0Cj4gY29ycmVjdGx5IHdpdGhvdXQgJyEhJyBhbnl3YXksIHJpZ2h0PwoKSWYg
SSByZW1vdmUgYCEhYCBJIGdldDoKCiB3YXJuaW5nOiBpbmNvcnJlY3QgdHlwZSBpbiBhc3NpZ25t
ZW50IChkaWZmZXJlbnQgYmFzZSB0eXBlcykKICAgIGV4cGVjdGVkIGJvb2wgW3Vuc2lnbmVkXSBb
dXNlcnR5cGVdIGlzX21nbXQKICAgIGdvdCByZXN0cmljdGVkIF9fbGUzMgoKSSBjb3VsZCBkbyBh
IHRlbXBvcmFyeSBgdTMyIGF0dGVudGlvbmAgdG8gZ2V0IHJpZCBvZiB0aGUgYCEhYC4gWW91Cndh
bnQgbWUgdG8gdXBkYXRlIGl0PwoKCk1pY2hhxYIKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
dGgxMGsK
