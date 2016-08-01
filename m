Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bU9XN-0006X6-TK
 for ath10k@lists.infradead.org; Mon, 01 Aug 2016 09:29:30 +0000
Message-ID: <1470043740.3389.10.camel@sipsolutions.net>
Subject: Re: [PATCH 1/2] cfg80211: Add support to set tx power for a station
 associated
From: Johannes Berg <johannes@sipsolutions.net>
Date: Mon, 01 Aug 2016 11:29:00 +0200
In-Reply-To: <1cb3e2cc49b433fe5ed834a33adf64b6@codeaurora.org>
References: <1465926256-6463-1-git-send-email-arnagara@qti.qualcomm.com>
 <1467110918.2493.9.camel@sipsolutions.net>
 <1cb3e2cc49b433fe5ed834a33adf64b6@codeaurora.org>
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
To: Ashok Raj Nagarajan <arnagara@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>, ath10k@lists.infradead.org

Cj4gU3VyZS4uIEZpcnN0IHVzZSBjYXNlIHdpbGwgYmUgdG8gaGVscCB3aXRoIHRoZSBwcm9ibGVt
IG9mIGxlZ2FjeQo+IGNsaWVudCBkZXZpY2VzIHRoYXQgcm9hbSBhY3Jvc3MgbXVsdGlwbGUgQVBz
LiBJdCBpcyBhIGNsYXNzaWMKPiBlbnRlcnByaXNlIFdpLUZpIEFQIHByb2JsZW0sIMKgb2Z0ZW4g
bWFuYWdlZCBieSBhICJuZXR3b3JrIGNvbnRyb2xsZXIiCj4gdW5pdCB0aGF0IGlzIGNvbm5lY3Rl
ZCB0byBhbGwgdGhlIEFQcy7CoAo+IFRoZSBwcm9ibGVtIGlzIGhvdyB0byBoYW5kbGUgc2VhbWxl
c3MgaGFuZG9mZiBvZiBjbGllbnRzIGJldHdlZW4KPiBtdWx0aXBsZSDCoEFQcyB3aGlsZSBtYXhp
bWl6aW5nIHRoZSBjbGllbnQgdGhyb3VnaHB1dCBhbmQgbWluaW1pemluZwo+IGRpc3J1cHRpb24g
b2YgSVAgYXBwbGljYXRpb24gc2VydmljZXMgbGlrZSBWb0lQIGNhbGxzIGFuZCB2aWRlbwo+IHN0
cmVhbWluZy4gQSBsZWdhY3kgY2xpZW50IHdpbGwgb2Z0ZW4gwqBob2xkIG9udG8gYW4gQVAgYXNz
b2NpYXRpb24sCj4gZXZlbiBkb3duIHRvIDEgTWJwcyBhcyBpdCByb2FtcyBhd2F5LiBJbnN0ZWFk
LCDCoGlmIHRoZSBBUCBjYW4KPiByZWNvZ25pc2UgdGhhdCB0aGUgY2xpZW50IFJTU0kgKGFuZCB0
aGVyZWZvcmUgdGhyb3VnaHB1dCkgaXMgcG9vciwgaXQKPiBjYW4gImRyb3AiIHRoZSBUeCBwb3dl
ciBzaWduaWZpY2FudGx5IChqdXN0IHRvIHRoYXQgY2xpZW50KSBzdWNoIHRoYXQKPiBpdCBmb3Jj
ZXN0aGUgY2xpZW50IHRvIGxvb2sgZm9yIGEgYmV0dGVyLCBjbG9zZXIsIGFuZCB0aGVyZWZvcmUK
PiBoaWdoZXItdGhyb3VnaHB1dGFzc29jaWF0aW9uLiBJdCB3b3VsZCAiZ2l2ZSBpdCBhIGtpY2si
IHdpdGhvdXQKPiBibGFja2xpc3RpbmcgaXQuIEl0IGp1c3QgbmVlZHN0byBob2xkIHRoZSBwb3dl
ciBsb3cgZm9yIHRoZSBzbWFsbAo+IGFtb3VudCBvZiB0aW1lIGl0IHRha2VzIHRvIGNvbnZpbmNl
IGl0IHRvIGdvIGF3YXkuCgpOb3Qgc3VyZSB0aGF0ICp3b3Jrcyogc2luY2UgaW1wbGVtZW50YXRp
b25zIG1heSBqdXN0IGNvbXBhcmUgYmVhY29uCnNpZ25hbCBzdHJlbmd0aCBhbmQgaG9sZCBvbiB0
byB0aGUgQVAgYmFzZWQgb24gdGhhdCwgYnV0IGl0IGRvZXMgc2VlbQpsaWtlIGEgcmVhc29uYWJs
ZSB1c2UgY2FzZS4KCkhvdyB3b3VsZCB0aGlzIGludGVyYWN0IHdpdGggYXV0b21hdGljIGFkanVz
dG1lbnQgdGhvdWdoPwoKam9oYW5uZXMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBr
Cg==
