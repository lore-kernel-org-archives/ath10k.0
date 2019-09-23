Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCNCO-0002Nx-D2
 for ath10k@lists.infradead.org; Mon, 23 Sep 2019 12:12:13 +0000
MIME-Version: 1.0
Date: Mon, 23 Sep 2019 20:12:11 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH v2] ath10k: add fw coredump for sdio when firmware assert
In-Reply-To: <87v9tj6y5p.fsf@codeaurora.org>
References: <1567132338-7407-1-git-send-email-wgong@codeaurora.org>
 <874l15c20j.fsf@codeaurora.org>
 <6b7927f633cb7cbe2ba0d958d7d06f9a@codeaurora.org>
 <87v9tj6y5p.fsf@codeaurora.org>
Message-ID: <e61e7cbe3fd9dfad4679bd1d686bc44d@codeaurora.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

T24gMjAxOS0wOS0yMyAxOTozNywgS2FsbGUgVmFsbyB3cm90ZToKPiBXZW4gR29uZyA8d2dvbmdA
Y29kZWF1cm9yYS5vcmc+IHdyaXRlczoKPiAKPj4gT24gMjAxOS0wOS0yMSAxOTozOCwgS2FsbGUg
VmFsbyB3cm90ZToKPj4+IAo+Pj4gV2hhdCdzIHdyb25nIHdpdGggYXRoMTBrX3NkaW9faGlmX2Rp
YWdfcmVhZCgpPyBBRkFJQ1MgdGhpcyB3aG9sZQo+Pj4gZnVuY3Rpb24gZHVwbGljYXRlcyBqdXN0
IHdoYXQgaXQgZG9lcy4KPj4gCj4+IGF0aDEwa19zZGlvX2hpZl9kaWFnX3JlYWQncyBidWZmZXIg
c2l6ZSBpcyBsaW1pdCwKPj4gYW5kIHRoZSBkdW1wIG1lbW9yeS9yZWdpc3RlcidzIGJ1ZmZlciBz
aXplIGlzIGxhcmdlciB0aGFuIHRoZSBkaWFnCj4+IHdpbmRvdydzIGxpbWl0LAo+PiBpZiB1c2Ug
aXQgZGlyZWN0bHkgd2lsbCB0cmlnZ2VyIGNyYXNoIGxpa2UgdGhpcyBmb3IgZXZlcnkgdGltZS4K
PiAKPiBZb3Ugc2hvdWxkbid0IGJsaW5kbHkgYWRkIGV4dHJhIGNvZGUgdG8gYXRoMTBrIHdvcmth
cm91bmQgaXNzdWVzLiBBbmQgCj4gaWYKPiB5b3UgcmVhbGx5IG5lZWQgdG8gdXNlIGEgd29ya2Fy
b3VuZCwgdGhlbiBpdCBuZWVkcyB0byBwcm9wZXJseSAKPiBleHBsYWluZWQKPiBpbiB0aGUgY29t
bWl0IGFuZCBhcyB3ZWxsIGFzIGNvbW1lbnRlZCBpbiB0aGUgY29kZS4gQnV0IGJlZm9yZSB0aGF0
IHRoZQo+IGlzc3VlIG5lZWRzIHRvIGJlIHRob3JvdWdobHkgaW52ZXN0aWdhdGVkIGFuZCB1bmRl
cnN0b29kIHdoZXJlIHRoZQo+IHByb2JsZW0gaXMgY29taW5nIGZyb20uIEJlY2F1c2UgaXQgbWln
aHQgYmUgZXZlbiBjb21wbGV0ZWx5IHVucmVsYXRlZCAKPiB0bwo+IGF0aDEway4KCj4gCj4+IFsg
IDE0OS45NDc2MjRdIGF0aDEwa19zZGlvIG1tYzE6MDAwMToxOiBhdGgxMGtfc2Rpb19oaWZfZGlh
Z19yZWFkCj4+IGJ1Zl9sZW4gOjQKPj4gWyAgMTQ5Ljk1NDc0MV0gYXRoMTBrX3NkaW8gbW1jMTow
MDAxOjE6IGF0aDEwa19zZGlvX2hpZl9kaWFnX3JlYWQKPj4gYnVmX2xlbiA6MjQwCj4+IFsgIDE1
MS4wMDUxNDNdIFVuYWJsZSB0byBoYW5kbGUga2VybmVsIHBhZ2luZyByZXF1ZXN0IGF0IHZpcnR1
YWwKCj4+IFsgIDE1MS4xMTQ1MzddIFByb2Nlc3Mgc3dhcHBlci8wIChwaWQ6IDAsIHN0YWNrIGxp
bWl0ID0KPj4gMHgwMDAwMDAwMGUzMGRjNjY1KQrjgIEKPiAKPiBEaWQgeW91IGludmVzdGlnYXRl
IHRoaXM/IElzIHRoZSBidWZmZXIgeW91IHJlYWRpbmcgdG8gRE1BIGFjY2Vzc2libGU/Cj4gV2hh
dCBhYm91dCB0aGUgYWxpZ25tZW50PyBJcyB0aGVyZSBhIGNlcnRhaW4gbGVuZ3RoIHdoaWNoIGlz
IHRoZSBsaW1pdAo+IGZvciBjcmFzaGVzPyBBbmQgc28gb24uLi4KdGhlIGxpbWl0IGlzIDQgYnl0
ZS4KZm9yIDUgYnl0ZXMsIGl0IHdpbGwgY3Jhc2guCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
YXRoMTBrCg==
