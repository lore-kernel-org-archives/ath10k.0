Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from [2001:470:dc45:1000::1] (helo=mail.toke.dk)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eKneA-0005pI-Ex
 for ath10k@lists.infradead.org; Fri, 01 Dec 2017 15:54:41 +0000
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Subject: Re: [PATCH 2/2] ath10k: add per peer tx stats support for 10.2.4
In-Reply-To: <1512143142.25588.17.camel@sipsolutions.net>
References: <1512046701-14435-1-git-send-email-akolli@qti.qualcomm.com>
 <1512046701-14435-3-git-send-email-akolli@qti.qualcomm.com>
 <87k1y7zqtj.fsf@kamboji.qca.qualcomm.com>
 <DAB5EBB8-C820-4056-8AAB-063D05F38BD5@toke.dk>
 <87bmjjzppd.fsf@kamboji.qca.qualcomm.com>
 <5080a68538fd2d883e15bacaa969661b@codeaurora.org> <87r2se36rq.fsf@toke.dk>
 <87k1y6y04i.fsf@kamboji.qca.qualcomm.com> <87d13y31r0.fsf@toke.dk>
 <1512143142.25588.17.camel@sipsolutions.net>
Date: Fri, 01 Dec 2017 16:54:12 +0100
Message-ID: <87a7z230m3.fsf@toke.dk>
MIME-Version: 1.0
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
To: Johannes Berg <johannes@sipsolutions.net>, Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "linux-wireless-owner@vger.kernel.org" <linux-wireless-owner@vger.kernel.org>, Anilkumar Kolli <akolli@qti.qualcomm.com>, "akolli@codeaurora.org" <akolli@codeaurora.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Sm9oYW5uZXMgQmVyZyA8am9oYW5uZXNAc2lwc29sdXRpb25zLm5ldD4gd3JpdGVzOgoKPiBPbiBG
cmksIDIwMTctMTItMDEgYXQgMTY6MjkgKzAxMDAsIFRva2UgSMO4aWxhbmQtSsO4cmdlbnNlbiB3
cm90ZToKPj4gCj4+IFllYWgsIGZpZ3VyZXMuIFdlbGwsIG1heWJlIHdlJ2xsIGp1c3QgaGF2ZSB0
byBzdXBwb3J0IGFuIGFzeW5jaHJvbm91cwo+PiBjYWxsYmFjayBpbnRvIG1hYzgwMjExIHRvIHJl
Z2lzdGVyIGFpcnRpbWUgdXNhZ2UuIFdpbGwgcHJvYmFibHkgaGF2ZSB0bwo+PiBhZGQgc29tZSBh
c3luY2hyb25pY2l0eSBhbnl3YXkgdG8gYXZvaWQgZG9pbmcgdG9vIG11Y2ggd29yayBpbiB0aGUg
ZmFzdAo+PiBwYXRoLgo+Cj4gSSByZWFsbHkgdGhpbmsgd2Ugc2hvdWxkIGhhdmUgdGhhdCBhbnl3
YXkuIEluIGZhY3QsIHBlcmhhcHMgd2Ugc2hvdWxkCj4ganVzdCBlbmZvcmNlIGl0IHRoYXQgd2F5
PyBUaGVuIGF0aDlrIHdvdWxkIGhhdmUgdG8gZG8gYSBiaXQgbW9yZSB3b3JrLAo+IGJ1dCBpdCdz
IGFsc28gdGhlIHNsb3dlciBvZiB0aGUgZGV2aWNlcyA6LSkKPgo+IEJ1dCB0aGlzIHBsYXlzIGlu
IHdpdGggdGhlIHdob2xlIG11bHRpLXF1ZXVlIFJYIHdlIGRpc2N1c3NlZCBiZWZvcmUuCgpZZWFo
LCB0aGF0J3Mgd2hhdCBJIG1lYW50IGJ5ICdhZGQgc29tZSBhc3luY2hyb25pY2l0eSBhbnl3YXkn
IDopCgpJIGd1ZXNzIHRoYXQgb25jZSB3ZSBoYXZlIGFuIGFzeW5jaHJvbm91cyBzY2hlZHVsZXIg
dGFzayBvZiBzb21lIGtpbmQsCnN1cHBvcnRpbmcgdGhlIGNhbGxiYWNrIGlzIGVhc3ksIGJ1dCBw
dWxsaW5nIHRoZSBkYXRhIG91dCBvZiBlYWNoIHBhY2tldApuZWVkcyBtb3JlIHdvcmsuIEJ1dCBz
aW5jZSB3ZSdsbCBoYXZlIHRvIGRvIHRoYXQgZm9yIGF0aDlrIGFueXdheSBpdApiZWNvbWVzIG1v
cmUgYSBxdWVzdGlvbiBvZiB3aGV0aGVyIGl0J3Mgc29tZXRoaW5nIHRoYXQgc2hvdWxkIGJlCnN1
cHBvcnRlZCBpbiBtYWM4MDIxMSBvciBpZiBpdCBzaG91bGQgYmUgaW1wbGVtZW50ZWQgaW4gZWFj
aCBkcml2ZXIuCkJ1dCBzaW5jZSB0aGF0IGxvZ2ljIHdpbGwgaGF2ZSB0byBiZSB3cml0dGVuIGZy
b20gc2NyYXRjaCBhbnl3YXksIGlzCnRoZXJlIGFueSByZWFzb24gdG8gbm90IGp1c3QgZG8gaXQg
aW4gbWFjODAyMTEgZnJvbSB0aGUgYmVnaW5uaW5nPwoKLVRva2UKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hdGgxMGsK
