Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bCNs5-0001BZ-L5
 for ath10k@lists.infradead.org; Mon, 13 Jun 2016 09:09:26 +0000
Message-ID: <1465808939.2434.1.camel@sipsolutions.net>
Subject: Re: [PATCH] ath10k: fix potential null dereference bugs
From: Johannes Berg <johannes@sipsolutions.net>
Date: Mon, 13 Jun 2016 11:08:59 +0200
In-Reply-To: <CA+BoTQkg+uea_YzUgrVBPhA8uRxNpd29Kd1y1tvt0a-JyOSLQw@mail.gmail.com>
 (sfid-20160613_074004_402825_22006851)
References: <1465563164-783-1-git-send-email-me@bobcopeland.com>
 <CA+BoTQkg+uea_YzUgrVBPhA8uRxNpd29Kd1y1tvt0a-JyOSLQw@mail.gmail.com>
 (sfid-20160613_074004_402825_22006851)
Mime-Version: 1.0
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
To: Michal Kazior <michal.kazior@tieto.com>, Bob Copeland <me@bobcopeland.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gTW9uLCAyMDE2LTA2LTEzIGF0IDA3OjM5ICswMjAwLCBNaWNoYWwgS2F6aW9yIHdyb3RlOgo+
wqAKPiBGV0lXIGFsbCBvZiB0aGVzZSBhcmUgZmFsc2UgcG9zaXRpdmVzLiBJIHRoaW5rIHRoaXMg
d2FzIGFscmVhZHkKPiBwb2ludGVkIG91dCBzb21lIHRpbWUgYWdvLiBUaGUgZHJ2X3ByaXYgc3R1
ZmYgaXMgbWVyZWx5IGFuIG9mZnNldAo+IChzZWUgaG93IGllZWU4MDIxMV92aWYgYW5kIGllZWU4
MDIxMV9zdGEgYXJlIGRlZmluZWQpIGFuZCB0aGUKPiBhY2NvcmRpbmcgc3RydWN0dXJlIGlzIGFs
d2F5cyBjaGVja2VkIGJlZm9yZWhhbmQuCj4gCgpJSVJDLCBkb2luZyBzb21ldGhpbmcgbGlrZSB0
aGF0IGNhbiAoc29tZXRpbWVzPykgc3RpbGwgZ2V0IHlvdSBpbnRvCnVuZGVmaW5lZCBiZWhhdmlv
dXIgdGVycml0b3J5LCBzbyB0aGUgY29tcGlsZXIgY291bGQgcG90ZW50aWFsbHkKIm9wdGltaXpl
IiBhd2F5IHRoZSBsYXRlciBOVUxMIGNoZWNrLgoKT3IgYW0gSSBjb25mdXNpbmcgc29tZXRoaW5n
PyBTZWVtcyBlbnRpcmVseSBwb3NzaWJsZSA6KQoKam9oYW5uZXMKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hdGgxMGsK
