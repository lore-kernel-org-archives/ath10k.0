Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHHJG-0003g5-6p
 for ath10k@lists.infradead.org; Mon, 29 Oct 2018 23:51:08 +0000
MIME-Version: 1.0
Date: Mon, 29 Oct 2018 16:50:50 -0700
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: [PATCH 3/6] mac80211: Add airtime accounting and scheduling to
 TXQs
In-Reply-To: <8fd3524bfe022ccd2a8b61a3314ed32b@codeaurora.org>
References: <1540033534-11211-1-git-send-email-rmanohar@codeaurora.org>
 <1540033534-11211-4-git-send-email-rmanohar@codeaurora.org>
 <8736ssbxp9.fsf@toke.dk> <9c2b790132a9a89fecd7dd79dc67d891@codeaurora.org>
 <87woq2843q.fsf@toke.dk> <8fd3524bfe022ccd2a8b61a3314ed32b@codeaurora.org>
Message-ID: <5d8415fe50e8505eb62c5a0d1b40bb2a@codeaurora.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

T24gMjAxOC0xMC0yOCAxNTowMSwgUmFqa3VtYXIgTWFub2hhcmFuIHdyb3RlOgo+IE9uIDIwMTgt
MTAtMjggMDg6NDgsIFRva2UgSMO4aWxhbmQtSsO4cmdlbnNlbiB3cm90ZToKPj4gUmFqa3VtYXIg
TWFub2hhcmFuIDxybWFub2hhckBjb2RlYXVyb3JhLm9yZz4gd3JpdGVzOgo+PiAKPj4+IAo+Pj4g
NG1zICAgICAgICAgMjIzICg0MCUpICAgICAgICAgMjE0ICg0MCUpICAgIDEwOSAoMTAlKSAgICAg
ICA5NCAoMTAlKQo+Pj4gCj4+PiA0bXMgICAgICAgICAzMzcgKDkwJSkgICAgICAgICAxODIgKDgl
KSAgICAgIDIzICgxJSkgICAgICAgIDMwICgxJSkKPj4gCj4+IFNvIHRoaXMgbG9va3MgbGlrZSBp
dCdzIGRvaW5nICpzb21ldGhpbmcqLCBidXQgbm90IGxpa2UgaXQncyAKPj4gc3VjY2VlZGluZwo+
PiBpbiBhY2hpZXZpbmcgdGhlIHNldCBwZXJjZW50YWdlcy4gRGlkIHlvdSBjaGVjayBpZiB0aGUg
YWN0dWFsIGFpcnRpbWUKPj4gdmFsdWVzIChpbiBkZWJ1Z2ZzKSBjb3JyZXNwb25kcyB0byB0aGUg
Y29uZmlndXJlZCB3ZWlnaHRzPwo+PiAKPiBOby4gV2lsbCBjaGVjayB0aGF0Lgo+IApUb2tlLAoK
IEZyb20gYWJvdmUgcmVzdWx0cywgZGlmZmVyZW50IGFpcnRpbWUgZm9yIGVhY2ggc3RhdGlvbiBp
cyByZWZsZWN0aW5nIG9uCm91dHB1dCBwZXJmb3JtYW5jZS4gVW5mb3J0dW5hdGVseSBJIGRvbid0
IHNlZSBzdWNoIHRwdXQgZGlmZmVyZW5jZSwgd2hlbgp0aGUgdHggbW9kZSBpcyBmaXhlZCBpbiBw
dXNoLW9ubHkuIEV2ZW4gbG93IHdlaWdodCBzdGF0aW9uIGlzIGdpdmluZyAKc2FtZQpwZXJmb3Jt
YW5jZS4gQXJlIHlvdSBhbHNvIHNlZWluZyB0aGUgc2FtZSBiZWhhdmlvciBpbiB5b3VyIHNldHVw
PyBDb3VsZAp5b3UgcGxlYXNlIHNoYXJlIHlvdXIgcmVzdWx0cz8KCk5vdCBzdXJlIHdoeSBsb3cg
d2VpZ2h0IHN0YXRpb24gKDI2dXMpIGlzIGNvbnN1bWluZyBtb3JlIGFpcnRpbWUgdGhhbgpoaWdo
ZXIgYWlydGltZSBzdGF0aW9uLiBCZWxvdyByZXN1bHQgaXMgdGFrZW4gaW4gcHVzaC1vbmx5IG1v
ZGUgdGhhdAptZWFucyBvbmx5IG5leHRfdHhxKCkgb3JkZXJpbmcgaXMgZm9sbG93ZWQuCgpjYXQg
L3N5cy9rZXJuZWwvZGVidWcvaWVlZTgwMjExL3BoeTAvbmV0ZGV2XDp3bGFuMC9zdGF0aW9ucy8q
L2FpcnRpbWUKUlg6IDAgdXMKVFg6IDk4MDQ0MyB1cwpXZWlnaHQ6IDE3NgpEZWZpY2l0OiBWTzog
MjU2IHVzIFZJOiAyNTYgdXMgQkU6IC05MSB1cyBCSzogMjU2IHVzClJYOiAwIHVzClRYOiAyMDA4
NTEyIHVzCldlaWdodDogMjYKRGVmaWNpdDogVk86IDIzOCB1cyBWSTogMjU2IHVzIEJFOiAyNCB1
cyBCSzogMjU2IHVzClJYOiAwIHVzClRYOiA1MTMyODcgdXMKV2VpZ2h0OiAyNgpEZWZpY2l0OiBW
TzogMjU2IHVzIFZJOiAyNTYgdXMgQkU6IDEgdXMgQks6IDI1NiB1cwpSWDogMCB1cwpUWDogNTc2
NzQ2IHVzCldlaWdodDogMjYKRGVmaWNpdDogVk86IDI1NiB1cyBWSTogMjU2IHVzIEJFOiAxMCB1
cyBCSzogMjU2IHVzCgotUmFqa3VtYXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
