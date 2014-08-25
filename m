Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x22f.google.com ([2a00:1450:400c:c00::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XLqYG-00042i-Ob
 for ath10k@lists.infradead.org; Mon, 25 Aug 2014 09:27:01 +0000
Received: by mail-wg0-f47.google.com with SMTP id b13so12908789wgh.30
 for <ath10k@lists.infradead.org>; Mon, 25 Aug 2014 02:26:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87tx5153lw.fsf@kamboji.qca.qualcomm.com>
References: <1408952456-3121-1-git-send-email-michal.kazior@tieto.com>
 <87tx5153lw.fsf@kamboji.qca.qualcomm.com>
Date: Mon, 25 Aug 2014 11:26:33 +0200
Message-ID: <CA+BoTQnJYK0Sf6jy+tXHrTM06gXCjTxv_JKdK=01+jz5RgZ+tQ@mail.gmail.com>
Subject: Re: [RFC] ath10k: improve logging to include dev id
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

T24gMjUgQXVndXN0IDIwMTQgMTE6MTgsIEthbGxlIFZhbG8gPGt2YWxvQHFjYS5xdWFsY29tbS5j
b20+IHdyb3RlOgo+IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGlldG8uY29tPiB3cml0
ZXM6Cj4KPj4gVGhpcyBtYWtlcyBpdCBhIGxvdCBlYXNpZXIgdG8gbG9nIGFuZCBkZWJ1Zwo+PiBt
ZXNzYWdlcyBpZiB0aGVyZSdzIG1vcmUgdGhhbiAxIGF0aDEwayBkZXZpY2Ugb24gYQo+PiBzeXN0
ZW0uCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGll
dG8uY29tPgo+Cj4gRGlkIG9ubHkgYSBxdWljayByZXZpZXcgYW5kIHRlc3QgYnV0IGxvb2tzIGdv
b2QgdG8gbWUgZXhjZXB0IG9uZSBwcm9ibGVtCj4gaW4gcGNpLmMsIHNlZSBiZWxvdy4gQnV0IHRo
ZXJlIGFyZSBzb21lIGNvbmZsaWN0cyBub3csIGNhbiB5b3UgcmViYXNlCj4gcGxlYXNlPyBJIGhv
cGUgaXQncyBub3QgdG9vIG11Y2ggd29yayB0byBmaXggdGhlbS4KCkkndmUgcmViYXNlZCB0aGlz
IGluIG15IGludGVybmFsIHRyZWUgYWxyZWFkeS4KCgo+IEknbGwgYWxzbyBzdW1tYXJpc2UgdGhl
ICJtZWF0IiBvZiB0aGUgY2hhbmdlcyBzbyB0aGF0IGl0J3MgZWFzaWVyIGZvcgo+IG90aGVycyB0
byByZXZpZXc6Cj4KWy4uLl0KPj4gQEAgLTI1NjYsMTIgKzI1NzYsMTIgQEAgc3RhdGljIGludCBh
dGgxMGtfcGNpX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LAo+PiAgICAgICBzdHJ1Y3QgYXRo
MTBrX3BjaSAqYXJfcGNpOwo+PiAgICAgICB1MzIgY2hpcF9pZDsKPj4KPj4gLSAgICAgYXRoMTBr
X2RiZyhBVEgxMEtfREJHX1BDSSwgInBjaSBwcm9iZVxuIik7Cj4+ICsgICAgIGRldl9wcmludGso
S0VSTl9ERUJVRywgJnBkZXYtPmRldiwgInBjaSBwcm9iZVxuIik7Cj4KPiBCdXQgdGhpcyBkb2Vz
bid0IGxvb2sgcmlnaHQuIEEgbGVmdG92ZXIgZnJvbSB0ZXN0aW5nLCBwZXJoYXBzPwoKQXQgdGhp
cyBwb2ludCB0aGVyZSdzIG5vICJhciIgeWV0LiBUaGUgImFyIiBpcyBhbGxvY2F0ZWQgYSBmZXcg
bGluZXMKYmVsb3cuIElmIHRoZSBhbGxvY2F0aW9uIGZhaWxzIHRoZW4gdGhlcmUncyBubyAiYXIi
IHNvIGRldl9lcnIoKSBpcwp1c2VkIGV4cGxpY2l0bHkgaW4gdGhlIGZhaWxwYXRoLgoKSSB0aGlu
ayB0aGVzZSBhcmUganVzdCAyIGV4Y2VwdGlvbnMgd2UgY2FuJ3QgZG8gZGlmZmVyZW50bHksIGNh
biB3ZT8KCgpNaWNoYcWCCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
