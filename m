Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x22c.google.com ([2a00:1450:400c:c00::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YJIZR-0006Qh-Sf
 for ath10k@lists.infradead.org; Thu, 05 Feb 2015 09:17:58 +0000
Received: by mail-wg0-f44.google.com with SMTP id z12so6407938wgg.3
 for <ath10k@lists.infradead.org>; Thu, 05 Feb 2015 01:17:31 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87zj8ut5r4.fsf@kamboji.qca.qualcomm.com>
References: <1422611452-21105-1-git-send-email-michal.kazior@tieto.com>
 <87zj8ut5r4.fsf@kamboji.qca.qualcomm.com>
Date: Thu, 5 Feb 2015 10:17:31 +0100
Message-ID: <CA+BoTQkboueomYd0JNGGtY6S0u_kULCThbX0bSrF0H8rfEZAkA@mail.gmail.com>
Subject: Re: [PATCH] ath10k: add TxBF support
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

T24gNCBGZWJydWFyeSAyMDE1IGF0IDA5OjU1LCBLYWxsZSBWYWxvIDxrdmFsb0BxY2EucXVhbGNv
bW0uY29tPiB3cm90ZToKPiBNaWNoYWwgS2F6aW9yIDxtaWNoYWwua2F6aW9yQHRpZXRvLmNvbT4g
d3JpdGVzOgo+Cj4+IElmIGZpcm13YXJlIGFkdmVydGlzZXMgc3VwcG9ydCBmb3IgVHhCRiB0aGVu
IHRoZQo+PiBkcml2ZXIgaGFzIHRvIGluc3RydWN0IHRoZSBmaXJtd2FyZSBhY2NvcmRpbmdseQo+
PiBkdXJpbmcgcnVudGltZS4gV2l0aG91dCB0aGlzIHBhdGNoIGNvbm5lY3RpbmcgdG8KPj4gYW4g
QVAgd2l0aCBiZWFtZm9ybWVyIHN1cHBvcnQgd291bGQgeWllbGQgYWJ5c21hbAo+PiBSeCBwZXJm
b3JtYW5jZS4KPj4KPj4gVGhpcyBoYXMgYmVlbiB0ZXN0ZWQgd2l0aCB3bWktdGx2IGFuZCBxY2E2
MTc0Cj4+IHdoaWxlIGFjdGluZyBhcyBhIFNUQSBiZWFtZm9ybWVlIG9ubHkuCj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGlldG8uY29tPgo+Cj4gVGhl
cmUgd2FzIGEgdHJpdmlhbCBjb25mbGljdCBpbiBhdGgxMGtfYnNzX2Rpc2Fzc29jKCksIHBsZWFz
ZSBjaGVjayBteQo+IGNvbmZsaWN0IHJlc29sdXRpb24gaW4gdGhlIHBlbmRpbmcgYnJhbmNoLgoK
TG9va3MgZ29vZCwgdGhhbmtzIQoKCk1pY2hhxYIKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
dGgxMGsK
