Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zwzbm-00061P-3E
 for ath10k@lists.infradead.org; Thu, 12 Nov 2015 21:40:43 +0000
Message-ID: <1447364413.2131.5.camel@sipsolutions.net>
Subject: Re: [PATCH v2] cfg80211: add VHT support for Mesh
From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 12 Nov 2015 22:40:13 +0100
In-Reply-To: <564505A6.9030001@codeaurora.org>
References: <ab294ba62856f00c06dde10b1bf57f5f341a7198.1447351137.git.poh@qca.qualcomm.com>
 <1447358605.2131.3.camel@sipsolutions.net>
 <564505A6.9030001@codeaurora.org>
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

T24gVGh1LCAyMDE1LTExLTEyIGF0IDEzOjMzIC0wODAwLCBQZXRlciBPaCB3cm90ZToKPsKgCj4g
QXQgdGhpcyBtb21lbnQgTWVzaCBQb2ludCBpcyBub3QgYWJsZSB0byBiZSBicm91Z2h0IHVwIGJ5
IHVzZXJzcGFjZQo+IHN1Y2ggCj4gYXMgd2FwX3N1cHBsaWNhbnQgYXQgVkhUIGRhdGEgcmF0ZXMg
YmVjYXVzZSB0aGVyZSBpcyBubwo+IGV2ZW50cy9OTDgwMjExIAo+IGRlZmluZWQgdGhhdCB1c2Vy
c3BhY2UgY2FuIGNoZWNrIG91dCBpZiBkcml2ZXJzIGNhbiBzdXBwb3J0IE1lc2gKPiBQb2ludCAK
PiAoODAyLjExcykgYXQgVkhUIGRhdGEgcmF0ZXMgb3Igbm90LCBoZW5jZSBvbmx5IEhUIGRhdGEg
cmF0ZXMgY2FuIGJlCj4gdXNlZCAKPiBmb3IKPiBNZXNoIFBvaW50IGJ5IHVzZXJzcGFjZSBub3cu
Cj4gVGhpcyBwYXRjaCBpcyBpbnRyb2R1Y2luZyBOTDgwMjExIGV2ZW50IHRvIGNvdmVyIHRoZSBp
c3N1ZS4KCk5vLi4uIHRoaXMgcGF0Y2ggZG9lc24ndCBpbnRyb2R1Y2UgYW4gbmw4MDIxMSBldmVu
dC4gSXQgaW50cm9kdWNlcyBhCmZlYXR1cmUgZmxhZywgYnV0IEknbSBhcmd1aW5nIGl0J3MgdXNl
bGVzcy4KCkxvb2sgLSB3aGF0J3MgdGhlIGRpZmZlcmVuY2UgdGhhdCB1c2Vyc3BhY2Ugd291bGQg
ZG8gYmFzZWQgb24gdGhpcwpmbGFnPyBDbGVhcmx5LCBzZXR0aW5nIHRoZSBmbGFnIGluIHRoZSBk
cml2ZXIgaGFzIG5vIGVmZmVjdCBvbiBrZXJuZWwKY29kZSB3aGF0c29ldmVyLCBzbyB5b3VyICJp
cyBub3QgYWJsZSB0byBiZSBicm91Z2h0IHVwIiBtYWtlcyBubyBzZW5zZS4KClBlcmhhcHMgaXQn
bGwgYmVjb21lIGNsZWFyZXIgb25jZSB5b3UgcG9zdCB0aGUgd3BhX3N1cHBsaWNhbnQgY29kZSwg
YnV0CnlvdSBzaG91bGQgc3RpbGwgY29oZXJlbnRseSBleHBsYWluIGluIHRoZSBjb21taXQgbWVz
c2FnZSB3aHkgdGhpcyBpcwpuZWNlc3NhcnkuIFNvIGZhciwgSSBkb24ndCBzZWUgaXQsIHNpbmNl
IG5vIGtlcm5lbCBjb2RlIGV2ZXIgZGVwZW5kcyBvbgp0aGlzIGZsYWcuCgpqb2hhbm5lcwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxp
bmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
