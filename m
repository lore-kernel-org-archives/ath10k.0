Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cUD8x-0001XS-8o
 for ath10k@lists.infradead.org; Thu, 19 Jan 2017 13:52:50 +0000
MIME-Version: 1.0
Date: Thu, 19 Jan 2017 19:22:25 +0530
From: Tamizh chelvam <tamizhchelvam@codeaurora.org>
Subject: Re: [PATCH 2/4] cfg80211: Add new NL80211_CMD_SET_BTCOEX_PRIORITY to
 support BTCOEX
In-Reply-To: <1483958190.17582.15.camel@sipsolutions.net>
References: <1478610932-21954-1-git-send-email-c_traja@qti.qualcomm.com>
 <1478610932-21954-3-git-send-email-c_traja@qti.qualcomm.com>
 <1480949353.31788.27.camel@sipsolutions.net>
 <5e5e8971c96293a81e7cb37bcdfbd593@codeaurora.org>
 <1481645351.20412.34.camel@sipsolutions.net>
 <134cc8e58ecb804b6dda0137c4c37be8@codeaurora.org>
 <1481881024.27953.14.camel@sipsolutions.net>
 <ae82112880d55451342e7a6e5a47c33f@codeaurora.org>
 <1483354130.4596.5.camel@sipsolutions.net>
 <a5521b4e246de90ed8526891c84a97e5@codeaurora.org>
 <1483623500.4394.18.camel@sipsolutions.net>
 <6f9711ed6f6fe170b915b67a054b985b@codeaurora.org>
 <1483958190.17582.15.camel@sipsolutions.net>
Message-ID: <53738f0ff79f0cf32026b9c700059fb1@codeaurora.org>
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: c_traja@qti.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

SGkgSm9oYW5uZXMsCgpTb3JyeSBmb3IgdGhlIGxhdGUgcmVzcG9uc2U6KAoKT24gMjAxNy0wMS0w
OSAxNjowNiwgSm9oYW5uZXMgQmVyZyB3cm90ZToKPj4gSXMgaXQgZmluZSB0byBoYXZlIHNvbWV0
aGluZyBsaWtlIHRoaXMKPj4gCj4+IDEpIFdlIGNhbiBoYXZlIHRoaXMgYnRjb2V4X3ByaW9yaXR5
IHZhbHVlIGFzIGEgb3B0aW9uYWwgdmFsdWUgaW4KPj4gYnRjb2V4wqBlbmFibGUgY29tbWFuZCBs
aWtlIGJlbG93Cj4+IAo+PiBpdyBwaHlYIGJ0Y29leF9zdGF0ZSA8ZW5hYmxlfCBkaXNhYmxlPiBb
cHJpcm9yaXR5KHZlbmRvciBzcGNpZmljCj4+IHZhbHVlKV0KPj4gCj4+IDIpIE9yIHdlIGNhbiBo
YXZlIHNlcGVyYXRlIGNvbW1hbmQgZm9yIGJ0Y29leF9wcmlvcml0eSBhcyBiZWxvdwo+PiAKPj4g
aXcgcGh5WCBzZXQgYnRjb2V4X3ByaW9yaXR5IDxwcmlvcml0eSAodmVuZG9yIHNwY2lmaWMgdmFs
dWUpPgo+PiAKPj4gSG9wZWZ1bGx5IHRoaXMgd2lsbCBnZXQgcmlkIG9mZiBhbGwgdGhlIG5sODAy
MTEgYml0cy4KPiAKPiBUaGF0IG1ha2VzIG5vIHNlbnNlLgo+IAo+IElmIHRoZSBiaXRzIGFyZSB2
ZW5kb3Igc3BlY2lmaWMsIHRoZW4gdGhlcmUncyBubyB2YWx1ZSBpbiBoYXZpbmcgdGhpcwo+IGFz
IGFuIG5sODAyMTEgY29tbWFuZCAocmF0aGVyIHRoYW4gYSB2ZW5kb3IgY29tbWFuZCkgdG8gc3Rh
cnQgd2l0aC4KPiAKPiBZb3UgbmVlZCB0byB1bmRlcnN0YW5kIHRoYXQgSSdtIGRpZmZlcmVudGlh
dGluZyBiZXR3ZWVuICpjYXBhYmlsaXR5Kgo+IGJpdHMgYW5kIGFjdHVhbCAqcHJpb3JpdHkgc2V0
dGluZyogYml0cyAtIHBsZWFzZSByZS1yZWFkIHRoZSB0aHJlYWQKPiB3aXRoIHRoYXQgaW4gbWlu
ZC4KPiAKVGhvc2UgYXJlIGZvciBwcmlvcml0eSBhbmQgbm90IGZvciBjYXBhYmlsaXR5IHB1cnBv
c2UuIEhhcmR3YXJlIGlzIApjYXBhYmxlIG9mCnRyYW5zbWl0dGluZyBhbGwgdGhlIGZyYW1lcyB3
aGVuIHRoZXJlIGlzIGEgYnQgdHJhZmZpYy4gVGhpcyBpcyBqdXN0IApzZXR0aW5nIHByaW9yaXR5
IGZvciB0aGUgd2xhbgpmcmFtZSwgd2hlbiB0aGVyZSBpcyBhIGNvbnRlbnRpb24gd2l0aCBCVCB0
cmFmZmljIHdoaWNoIG9uZSBoYXMgdG8gZ28gCm91dCBmaXJzdC4KT3RoZXIgdGhhbiB0aGF0IGhh
cmR3YXJlIGhhcyB0aGUgY2FwYWJpbGl0eSBvZiBzZW5kaW5nIGFsbCB0aGUgZnJhbWVzLgoKVGhp
cyBwcmlvcml0eSBmaWVsZCBpcyBvcHRpb25hbCwgaWYgdXNlcnMgZG9lcyBub3Qgd2FudCB0byBz
ZXQgYW55IApwcmlvcml0eSB0aGVuIGRyaXZlciB3aWxsIGZvcmNlIHRoZQpkZWZhdWx0IHByaW9y
aXRpZXMgd2hlbiBidF9jb2V4IGlzIGVuYWJsZWQKCml3IHBoeVggYnRjb2V4X3N0YXRlIDxlbmFi
bGV8IGRpc2FibGU+IFtwcmlyb3JpdHldCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBr
Cg==
