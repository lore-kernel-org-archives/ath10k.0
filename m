Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zx8wC-0005LL-By
 for ath10k@lists.infradead.org; Fri, 13 Nov 2015 07:38:26 +0000
Message-ID: <1447400275.3271.2.camel@sipsolutions.net>
Subject: Re: [PATCH v2] cfg80211: add VHT support for Mesh
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 13 Nov 2015 08:37:55 +0100
In-Reply-To: <56451B2F.3060704@codeaurora.org>
References: <ab294ba62856f00c06dde10b1bf57f5f341a7198.1447351137.git.poh@qca.qualcomm.com>
 <1447358605.2131.3.camel@sipsolutions.net>
 <564505A6.9030001@codeaurora.org>
 <1447364413.2131.5.camel@sipsolutions.net>
 <56451294.9060205@codeaurora.org>
 <1447367523.2131.6.camel@sipsolutions.net>
 <56451B2F.3060704@codeaurora.org>
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
To: Peter Oh <poh@codeaurora.org>, Peter Oh <poh@qca.qualcomm.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

T24gVGh1LCAyMDE1LTExLTEyIGF0IDE1OjA1IC0wODAwLCBQZXRlciBPaCB3cm90ZToKPiBPbiAx
MS8xMi8yMDE1IDAyOjMyIFBNLCBKb2hhbm5lcyBCZXJnIHdyb3RlOgo+ID4gT24gVGh1LCAyMDE1
LTExLTEyIGF0IDE0OjI4IC0wODAwLCBQZXRlciBPaCB3cm90ZToKPiA+ID4gwqAgCj4gPiA+IEV4
YWN0bHkgdGhlIHNhbWUgY29tbXVuaWNhdGlvbiBtZWNoYW5pc20gYW5kIHB1cnBvc2UgYXJlIHVz
ZWQKPiA+ID4gd2l0aAo+ID4gPiBOTDgwMjExX0VYVF9GRUFUVVJFX1ZIVF9JQlNTIHdoaWNoIGlz
IGFscmVhZHkgYSBwYXJ0IG9mIE5MODAyMTEKPiA+ID4gZmVhdHVyZQo+ID4gPiBmbGFnLgo+ID4g
PiBUaGUgbmV3IGZlYXR1cmUgZmxhZywgTkw4MDIxMV9FWFRfRkVBVFVSRV9WSFRfTUVTSCwgZm9s
bG93cyB0aGUKPiA+ID4gc2FtZQo+ID4gPiBwdXJwb3NlIGFuZCB1c2FnZS4KPiA+IE5vLCBpdCBk
b2Vzbid0LiBDaGVjayBob3cgdGhlIF9JQlNTIG9uZSBpcyB1c2VkIGluIHRoZSBjb2RlIHRvCj4g
PiBhY3R1YWxseQo+ID4gKmRvKiBzb21ldGhpbmcuCj4gdGhhdCdzIHJpZ2h0LiBzbyB0YWtlIGEg
bG9vayByZXNldCBvZiBleHBsYW5hdGlvbiBmb3IgdGhpcyBwYXRjaC4KPiAKClN0aWxsIG5vdCBt
YWtpbmcgc2Vuc2UuCgpJICpzdXNwZWN0KiB0aGF0IHlvdSB0aGluayB0aGF0IHRoZSBleGlzdGlu
ZyBjb2RlIGlzIGJyb2tlbiwgYW5kIGNhbid0CnVzZSBWSFQgbWVzaCBhbmQgcmVxdWlyZXMgZHJp
dmVyIGNoYW5nZXMgZm9yIGl0LCBidXQgdGhhdCdzIG5vdCB3aGF0CnlvdXIgYXRoMTBrIGNoYW5n
ZSBzaG93cyBzaW5jZSBpdCBhbHNvIGRvZXMgbm90aGluZyBhdCBhbGwuCgpSaWdodCBub3csIEkg
c2VlIG5vIHJlYXNvbiB3aGF0c29ldmVyIHRvIGFwcGx5IGVpdGhlciBvbmUgb2YgdGhvc2UgdHdv
CnBhdGNoZXMuIFRoZXJlIGFyZSBubyBmdW5jdGlvbmFsIGNoYW5nZXMsIHNvIHdwYV9zdXBwbGlj
YW50IGNvdWxkCmVuYWJsZSBWSFQgbWVzaCBieSBjaGVja2luZyBWSFQgY2FwYWJpbGl0aWVzIG9y
IHNvIGluc3RlYWQgb2YgYSBzcGVjaWFsCmZlYXR1cmUgZmxhZy4KCkkgYWxzbyBzdXNwZWN0IHRo
YXQgcGVyaGFwcyBtZXNoICpzaG91bGQqIGJlIGNoZWNraW5nIGxpa2UgSUJTUyBkb2VzLAphbHRo
b3VnaCBJIGFsc28gd291bGQgYWN0dWFsbHkgKnByZWZlciogdGhhdCB3ZSBjYW4gYXNzdW1lIFZI
VCBtZXNoCndvcmtzIGlmIHRoZSBkcml2ZXIgYWR2ZXJ0aXNlcyBWSFQgc3VwcG9ydCBhbmQgbWVz
aCBzdXBwb3J0IHNlcGFyYXRlbHksCmkuZS4gYSBuZXcgZmVhdHVyZSBmbGFnIHJlYWxseSBpc24n
dCBuZWNlc3NhcnkuCgpJbiBhbnkgY2FzZSwgdGhlIGFyZ3VtZW50cyBmb3IgdGhpcyBwYXRjaCBo
YXZlbid0IGNvbnZpbmNlZCBtZS4gSSdtIG5vdApnb2luZyB0byBhcHBseSB0aGlzIHdpdGhvdXQg
bXVjaCBiZXR0ZXIgb25lcy4KCmpvaGFubmVzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRo
MTBrCg==
