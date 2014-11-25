Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x231.google.com ([2a00:1450:400c:c05::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtBeJ-0007ql-Ib
 for ath10k@lists.infradead.org; Tue, 25 Nov 2014 08:39:04 +0000
Received: by mail-wi0-f177.google.com with SMTP id l15so584645wiw.4
 for <ath10k@lists.infradead.org>; Tue, 25 Nov 2014 00:38:41 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87d28b3dzg.fsf@kamboji.qca.qualcomm.com>
References: <1416834909-7130-1-git-send-email-michal.kazior@tieto.com>
 <1416834909-7130-3-git-send-email-michal.kazior@tieto.com>
 <87d28b3dzg.fsf@kamboji.qca.qualcomm.com>
Date: Tue, 25 Nov 2014 09:38:41 +0100
Message-ID: <CA+BoTQmf6+U20083pHxMdDPMDZf=MNoup+CxBTn=azLZupQYPw@mail.gmail.com>
Subject: Re: [PATCH 3/3] ath10k: fix station count enforcement
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

T24gMjUgTm92ZW1iZXIgMjAxNCBhdCAwOTowMSwgS2FsbGUgVmFsbyA8a3ZhbG9AcWNhLnF1YWxj
b21tLmNvbT4gd3JvdGU6Cj4gTWljaGFsIEthemlvciA8bWljaGFsLmthemlvckB0aWV0by5jb20+
IHdyaXRlczoKPgo+PiBUaGUgbnVtYmVyIG9mIHBlZXJzIGlzbid0IGRpcmVjdGx5IHRyYW5zbGF0
YWJsZSB0bwo+PiB0aGUgbnVtYmVyIG9mIHN0YXRpb25zIGJlY2F1c2UgYXRoMTBrIG5lZWRzIHRv
Cj4+IHJlc2VydmUgYSBmZXcgZXh0cmEgcGVlcnMgZm9yIHNwZWNpYWwgY2FzZXMgbGlrZQo+PiBt
dWx0aS12aWYgY29uY3VycmVuY3kuCj4+Cj4+IFRoZSBwcmV2aW91cyBsaW1pdCB3YXMgMTI2IGFu
ZCAxNSBzdGF0aW9ucyBpbiBBUAo+PiBtb2RlIGZvciAxMC54IGFuZCBtYWluIGZpcm13YXJlIGJy
YW5jaGVzCj4+IHJlc3BlY3RpdmVseS4gVGhlIGxpbWl0IGlzIG5vdyAxMjggYW5kIDE2IHdoaWNo
Cj4+IHdhcyB0aGUgb3JpZ2luYWwgaW50ZW50aW9uLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBNaWNo
YWwgS2F6aW9yIDxtaWNoYWwua2F6aW9yQHRpZXRvLmNvbT4KPgo+IFsuLi5dCj4KPj4gK3N0YXRp
YyB2b2lkIGF0aDEwa19jb3JlX2luaXRfbWF4X3N0YV9jb3VudChzdHJ1Y3QgYXRoMTBrICphcikK
Pj4gK3sKPj4gKyAgICAgaWYgKHRlc3RfYml0KEFUSDEwS19GV19GRUFUVVJFX1dNSV8xMFgsIGFy
LT5md19mZWF0dXJlcykpIHsKPj4gKyAgICAgICAgICAgICBhci0+bWF4X251bV9wZWVycyA9IFRB
UkdFVF8xMFhfTlVNX1BFRVJTOwo+PiArICAgICAgICAgICAgIGFyLT5tYXhfbnVtX3N0YXRpb25z
ID0gVEFSR0VUXzEwWF9OVU1fU1RBVElPTlM7Cj4+ICsgICAgIH0gZWxzZSB7Cj4+ICsgICAgICAg
ICAgICAgYXItPm1heF9udW1fcGVlcnMgPSBUQVJHRVRfTlVNX1BFRVJTOwo+PiArICAgICAgICAg
ICAgIGFyLT5tYXhfbnVtX3N0YXRpb25zID0gVEFSR0VUX05VTV9TVEFUSU9OUzsKPj4gKyAgICAg
fQo+PiArfQo+PiArCj4+ICBpbnQgYXRoMTBrX2NvcmVfc3RhcnQoc3RydWN0IGF0aDEwayAqYXIs
IGVudW0gYXRoMTBrX2Zpcm13YXJlX21vZGUgbW9kZSkKPj4gIHsKPj4gICAgICAgaW50IHN0YXR1
czsKPj4gQEAgLTkzOSw2ICs5NTAsOCBAQCBpbnQgYXRoMTBrX2NvcmVfc3RhcnQoc3RydWN0IGF0
aDEwayAqYXIsIGVudW0gYXRoMTBrX2Zpcm13YXJlX21vZGUgbW9kZSkKPj4gICAgICAgZWxzZQo+
PiAgICAgICAgICAgICAgIGFyLT5mcmVlX3ZkZXZfbWFwID0gKDFMTCA8PCBUQVJHRVRfTlVNX1ZE
RVZTKSAtIDE7Cj4+Cj4+ICsgICAgIGF0aDEwa19jb3JlX2luaXRfbWF4X3N0YV9jb3VudChhcik7
Cj4KPiBJIGRvbid0IHNlZSB0aGUgbmVlZCB0byBjYWxsIHRoaXMgZHVyaW5nIGV2ZXJ5IGZpcm13
YXJlIHN0YXJ0IGFzIHRoZXNlCj4gYXJlIG5vdCBjaGFuZ2VkIGFmdGVyd2FyZHMuIEkgdGhpbmsg
aXQgd291bGQgYmUgYmV0dGVyIHRvIGNhbGwgdGhpcyBvbmNlCj4ganVzdCBhZnRlciBhdGgxMGtf
Y29yZV9mZXRjaF9maXJtd2FyZV9maWxlcygpIGlzIGNhbGxlZC4KCkhtbS4uIEl0IG1ha2VzIHNl
bnNlIGJ1dCBub3cgdGhhdCBJIHRoaW5rIGFib3V0IGl0IHRoZSBtYXggbnVtYmVyIG9mCnBlZXJz
IHNob3VsZCBhY3R1YWxseSBkZXBlbmQgb24gV01JX1NFUlZJQ0VfSVJBTV9USURTIHdoaWNoIGlz
IGtub3duCmFmdGVyIGJvb3RpbmcgZmlybXdhcmUuIEhvd2V2ZXIgc2luY2Ugb25seSAxMC54IHdh
cyByZWxlYXNlZCB3aXRoIHRoZQpzZXJ2aWNlIGVuYWJsZWQgd2UgdXNlZCBmd19mZWF0dXJlcy4g
U28uLiB5ZWFoLiBJIGNhbiBtb3ZlIHRoZQpmdW5jdGlvbiBjYWxsIGlmIHlvdSB3YW50IHRob3Vn
aC4KCgpNaWNoYcWCCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
