Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bCRl3-0001xi-Pi
 for ath10k@lists.infradead.org; Mon, 13 Jun 2016 13:18:27 +0000
Message-ID: <1465823880.10050.3.camel@sipsolutions.net>
Subject: Re: [PATCH] ath10k: fix potential null dereference bugs
From: Johannes Berg <johannes@sipsolutions.net>
Date: Mon, 13 Jun 2016 15:18:00 +0200
In-Reply-To: <20160613130507.GA11074@localhost>
 (sfid-20160613_150522_731750_3B82E728)
References: <1465563164-783-1-git-send-email-me@bobcopeland.com>
 <CA+BoTQkg+uea_YzUgrVBPhA8uRxNpd29Kd1y1tvt0a-JyOSLQw@mail.gmail.com>
 <1465808939.2434.1.camel@sipsolutions.net>
 <20160613130507.GA11074@localhost> (sfid-20160613_150522_731750_3B82E728)
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
To: Bob Copeland <me@bobcopeland.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gTW9uLCAyMDE2LTA2LTEzIGF0IDA5OjA1IC0wNDAwLCBCb2IgQ29wZWxhbmQgd3JvdGU6Cj7C
oAo+IFNvIEkgZGlkIGp1c3QgZ28gYW5kIGNoZWNrIHRoZSBnZW5lcmF0ZWQgY29kZSBmb3IgZWFj
aCBvZiB0aGVzZSBjYXNlcwo+IGFuZCBnY2MgZGlkbid0IGVsaWRlIHRoZSBzdWJzZXF1ZW50IGlm
LXRlc3QsIGF0IGxlYXN0IG9uIHg4Ni02NCBhbmQKPiBteSBjb21waWxlciAvIGJ1aWxkIGNvbmZp
Zy7CoMKgR2l2ZW4gaHR0cDovL2x3bi5uZXQvQXJ0aWNsZXMvMzQyMzMwLCBpdAo+IHNlZW1zIHBv
c3NpYmxlLCB0aG91Z2guCgpJdCdzIG5vdCBjbGVhciB0aGF0J3MgdGhlIHNhbWUgc2l0dWF0aW9u
LCBzaW5jZSB0dW4tPnNrIGlzIHZlcnkgbGlrZWx5CnRvIGhhdmUgYmVlbiBhbiBhY3R1YWwgcG9p
bnRlciwgbm90IGFuIGVtYmVkZGVkIHRoaW5nIGxpa2UgZHJ2X3ByaXYuCgpIb3dldmVyLCB3aXRo
IGFsbCB0aGlzLCBJIHRoaW5rIEknZCBzaW1wbHkgbm90IHRha2UgYW55IGNoYW5jZXMgLSB0aGUK
cGF0Y2ggaXNuJ3QgZXhhY3RseSBpbnZhc2l2ZSBhbmQgaW4gc29tZSBjYXNlcyAoZm9yIGV4YW1w
bGUgdGhlIGZpcnN0Cmh1bmsgb2YgdGhlIHBhdGNoKSB3aWxsIGV2ZW4gaW1wcm92ZSB0aGUgY29k
ZSB0byB0aGUgcG9pbnQgd2hlcmUgdGhlCmNvbXBpbGVyIGNvdWxkIHdhcm4gYWJvdXQgdW5pbml0
aWFsaXplZCB1c2FnZSBvZiB0aGUgcG9pbnRlciB3aGVuIHRoZQpjb2RlIGdldHMgbW9kaWZpZWQg
dG8gdXNlIGl0IGluIGNhc2Ugb2YgIXR4cS0+c3RhLgoKSSdkIHRha2UgaXQsIGJ1dCBJIGd1ZXNz
IGl0J3MgS2FsbGUncyBkZWNpc2lvbiA6KQoKam9oYW5uZXMKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hdGgxMGsK
