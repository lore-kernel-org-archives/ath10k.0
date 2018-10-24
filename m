Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFOJV-0005Nu-My
 for ath10k@lists.infradead.org; Wed, 24 Oct 2018 18:55:31 +0000
MIME-Version: 1.0
Date: Wed, 24 Oct 2018 11:55:14 -0700
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: [PATCH 5/6] ath10k: migrate to mac80211 txq scheduling
In-Reply-To: <87a7n3u4kl.fsf@codeaurora.org>
References: <1540033534-11211-1-git-send-email-rmanohar@codeaurora.org>
 <1540033534-11211-6-git-send-email-rmanohar@codeaurora.org>
 <87a7n3u4kl.fsf@codeaurora.org>
Message-ID: <051d255c3377cd9d1724cc288df2d8c2@codeaurora.org>
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
Cc: =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

T24gMjAxOC0xMC0yNCAwMTozMywgS2FsbGUgVmFsbyB3cm90ZToKPiBSYWprdW1hciBNYW5vaGFy
YW4gPHJtYW5vaGFyQGNvZGVhdXJvcmEub3JnPiB3cml0ZXM6Cj4gCj4+IGF0aDEwayBtYWludGFp
bnMgY29tbW9uIHR4cXMgbGlzdCBmb3IgYWxsIHN0YXRpb25zLiBUaGlzIHR4cQo+PiBtYW5hZ2Vt
ZW50IGNhbiBiZSByZW1vdmVkIGJ5IG1pZ3JhdGluZyB0byBtYWM4MDIxMSB0eHEgQVBJcwo+PiBh
bmQgbGV0IG1hYzgwMjExIGhhbmRsZSB0eHFzIHJlb3JkZXJpbmcgYmFzZWQgb24gcmVwb3J0ZWQg
YWlydGltZS4KPj4gQnkgZG9pbmcgdGhpcywgdHhxIGZhaXJuZXNzIG1haW50YWluZWQgaW4gYXRo
MTBrIGkuZSBwcm9jZXNzaW5nCj4+IE4gZnJhbWVzIHBlciB0eHEgaXMgcmVtb3ZlZC4gQnkgYWRh
cHRpbmcgdG8gbWFjODAyMTEgQVBJcywKPj4gYXRoMTBrIHdpbGwgc3VwcG9ydCBtYWM4MDIxMSBi
YXNlZCBhaXJ0aW1lIGZhaXJuZXNzIGFsZ29yaXRobS4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IFRv
a2UgSMO4aWxhbmQtSsO4cmdlbnNlbiA8dG9rZUB0b2tlLmRrPgo+PiBTaWduZWQtb2ZmLWJ5OiBS
YWprdW1hciBNYW5vaGFyYW4gPHJtYW5vaGFyQGNvZGVhdXJvcmEub3JnPgo+IAo+IElzIFRva2Ug
dGhlIG9yaWdpbmFsIGF1dGhvcj8gVGhlbiB5b3Ugc2hvdWxkIGFkZCAiRnJvbToiIHRhZyB0byBt
YXJrCj4gdGhhdC4gQW5kIHlvdSBtaWdodCB3YW50IHRvIHVzZSBDby1kZXZlbG9wZWQtYnkgdG8g
bWFyayB5b3Vyc2VsZiBhcwo+IGNvLWRldmVsb3Blci4KPiAKVG9rZSBzdWJtaXR0ZWQgYXRoMTBr
IGNoYW5nZXMgaW4gUkZDIHYxIGJ1dCB0aG9zZSB3ZXJlIGRyb3BwZWQKaW4gZm9sbG93IHVwIHNl
cmllcy4gV2hlbiBJIHJld29ya2VkIG9uIGF0aDEwaywgSSByZXRhaW5pbmcgaGlzIHMtby1iLgoK
V2lsbCBmaXggaXQuCgotUmFqa3VtYXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
