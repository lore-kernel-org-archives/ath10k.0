Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x232.google.com ([2a00:1450:400c:c05::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XrlEP-0005iu-OR
 for ath10k@lists.infradead.org; Fri, 21 Nov 2014 10:14:26 +0000
Received: by mail-wi0-f178.google.com with SMTP id hi2so8256694wib.5
 for <ath10k@lists.infradead.org>; Fri, 21 Nov 2014 02:14:03 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <21615.3019.437408.992893@gargle.gargle.HOWL>
References: <1416492382-18058-1-git-send-email-sujith@msujith.org>
 <CA+BoTQnyf0tvg8ngLqsoux-A9-3J46cDuJdd-V=kS24wWS4Y1A@mail.gmail.com>
 <21615.3019.437408.992893@gargle.gargle.HOWL>
Date: Fri, 21 Nov 2014 11:14:03 +0100
Message-ID: <CA+BoTQm_X3-kpJanZu=dJ3LDPqjAfnUoyBwqzgYGX3bK+H1f2g@mail.gmail.com>
Subject: Re: [RFC] ath10k: Fix shared WEP
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
To: Sujith Manoharan <sujith@msujith.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMjEgTm92ZW1iZXIgMjAxNCAxMDo1NCwgU3VqaXRoIE1hbm9oYXJhbiA8c3VqaXRoQG1zdWpp
dGgub3JnPiB3cm90ZToKPiBNaWNoYWwgS2F6aW9yIHdyb3RlOgpbLi4uXQo+PiBSZWFkIGFjY2Vz
cyB0byBwZWVyLT5rZXlzIHNob3VsZCBiZSBwcm90ZWN0ZWQgYnkgZWl0aGVyIGRhdGFfbG9jayBv
cgo+PiBjb25mX211dGV4LiBPYnZpb3VzbHkgdGhlIGxhdHRlciBjYW4ndCBiZSB1c2VkIGJlY2F1
c2UgdGhpcyBmdW5jdGlvbgo+PiB3aWxsIGJlIGNhbGxlZCBmcm9tIGFuIGF0b21pYyBjb250ZXh0
IGxlYXZpbmcgdGhlIGRhdGFfbG9jay4gVGhlCj4+IGVudGlyZSBpc19wZWVyX3dlcF9rZXlfc2V0
KCkgc2hvdWxkIHJlcXVpcmUgZGF0YV9sb2NrIHRvIGJlIGhlbGQgd2hpbGUKPj4gaXQgaXMgY2Fs
bGVkIHRvIGF2b2lkIHJhY2VzLgo+Pgo+PiBPaCwgYW5kIGFwcGFyZW50bHkgdGhpcyBpcyBidWdn
eSBhbnl3YXkgYmVjYXVzZQo+PiBhdGgxMGtfaW5zdGFsbF9wZWVyX3dlcF9rZXlzKCkgaXMgb2Js
aXZpb3VzIHRvIHRoaXMuIE9vcHMuLgo+Cj4gSSBkb24ndCB0aGluayBpdCBjYW4gaGFwcGVuLCB0
aG91Z2ggPyBhdGgxMGtfaW5zdGFsbF9wZWVyX3dlcF9rZXlzKCkKPiB3b3VsZCBiZSBjYWxsZWQg
b25seSB3aGVuIGEgc3RhdGlvbiB0cmFuc2l0aW9ucyB0byBBU1NPQyBhbmQgbWVzc2FnZSAzCj4g
Y2FuJ3QgYmUgcmVjZWl2ZWQgd2hlbiB0aGF0IGhhcHBlbnMgPwoKR29vZCBwb2ludCwgYnV0IHdo
YXQgSSdtIHdvcnJpZWQgaXQnbGwgYmUgZWFzaWVyIHRvIG1pc3MgdGhpcyBzdWJ0bGV0eQphbmQg
aW50cm9kdWNlIHJhY2VzIGluIHRoZSBmdXR1cmUuCgoKPiAoQnV0LCBJIGRpZCBzZWUgYSBsb2Nr
ZGVwIHNwbGF0IHdoZW4gdXNpbmcgV0VQKS4KCkRvIHlvdSBoYXZlIGl0IHNhdmVkIHNvbWV3aGVy
ZT8gSWYgc28sIGNhbiB5b3UgcG9zdCBpdCwgcGxlYXNlPwoKCk1pY2hhxYIKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QK
YXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hdGgxMGsK
