Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iU8jY-0000DV-3a
 for ath10k@lists.infradead.org; Mon, 11 Nov 2019 12:23:53 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v6 3/3] ath10k: add workqueue for RX path of sdio
References: <1569402639-31720-1-git-send-email-wgong@codeaurora.org>
 <1569402639-31720-4-git-send-email-wgong@codeaurora.org>
 <8736f92sfx.fsf@kamboji.qca.qualcomm.com>
 <3f3641ad49a2664d346558760e38b404@codeaurora.org>
 <70f8f208f631a2a2c7337f45b873a16e@codeaurora.org>
Date: Mon, 11 Nov 2019 14:23:45 +0200
In-Reply-To: <70f8f208f631a2a2c7337f45b873a16e@codeaurora.org> (Wen Gong's
 message of "Mon, 11 Nov 2019 18:47:32 +0800")
Message-ID: <87r22ewqi6.fsf@codeaurora.org>
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
To: Wen Gong <wgong@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

V2VuIEdvbmcgPHdnb25nQGNvZGVhdXJvcmEub3JnPiB3cml0ZXM6Cgo+IE9uIDIwMTktMTEtMDEg
MTU6NDIsIFdlbiBHb25nIHdyb3RlOgo+PiBPbiAyMDE5LTEwLTMxIDE3OjA4LCBLYWxsZSBWYWxv
IHdyb3RlOgo+PiDjgIE+IEkganVzdCByZWFsaXNlZCB0aGF0IHRoaXMgaXMgUlggcGF0aCBzbyB3
ZSBzaG91bGQgdXNlCj4+IEFUSDEwS19TS0JfUlhDQigpCj4+PiBpbnN0ZWFkLiBJIG1hZGUgdGhl
IGNoYW5nZSBiZWxvdyB0byB0aGlzIGNvbW1pdCBpbiBwZW5kaW5nIGJyYW5jaDoKPj4+Cj4+IEkg
d2lsbCB0ZXN0IHdpdGggdGhlIG5ldyBwYXRjaCB0b2dldGhlciB3aXRoIG90aGVyIHBlcmZvcm1h
bmNlIHBhdGNoZXMuCj4gSGkgS2FsbGUsIEkgaGF2ZSB0ZXN0ZWQgd2l0aCB0aGUgcGF0Y2hlcyBv
ZiBwZW5kaW5nIGJyYW5jaCwgaXQgaXMKPiBzdWNjZXNzLgo+IHJlc3VsdCBpcyBzYW1lIHdpdGgg
dGhlIHB1YmxpYyByZXZpZXcgd2hpY2ggSSB0ZXN0ZWQgYmVmb3JlLgo+Cj4gdGhlIHBhdGNoZXMg
SSB0ZXN0ZWQgb24gcGVuZGluZyBicmFuY2g6Cj4KPiBhdGgxMGs6IGVuYWJsZSBhbHQgZGF0YSBv
ZiBUWCBwYXRoIGZvciBzZGlvCj4gYXRoMTBrOiBhZGQgaHR0IFRYIGJ1bmRsZSBmb3Igc2Rpbwo+
IGF0aDEwazogZGlzYWJsZSBUWCBjb21wbGV0ZSBpbmRpY2F0aW9uIG9mIGh0dCBmb3Igc2Rpbwo+
IGF0aDEwazogZW5hYmxlIG5hcGkgb24gUlggcGF0aCBmb3Igc2Rpbwo+IGF0aDEwazogc2Rpbzog
cmVtb3ZlIHN0cnVjdCBhdGgxMGtfc2Rpb19yeF9kYXRhOjpzdGF0dXMKPiBhdGgxMGs6IHNkaW86
IGNvc21ldGljIGNsZWFudXAKPiBhdGgxMGs6IGFkZCB3b3JrcXVldWUgZm9yIFJYIHBhdGggb2Yg
c2Rpbwo+IGF0aDEwazogY2hhbmdlIG1heCBSWCBidW5kbGUgc2l6ZSBmcm9tIDggdG8gMzIgZm9y
IHNkaW8KPiBhdGgxMGs6IGVuYWJsZSBSWCBidW5kbGUgcmVjZWl2ZSBmb3Igc2RpbwoKVmVyeSBn
b29kLCB0aGFua3MgZm9yIHRlc3RpbmcuCgotLSAKS2FsbGUgVmFsbwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgx
MGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2F0aDEwawo=
