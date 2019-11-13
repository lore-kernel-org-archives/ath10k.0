Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUjTl-0002qE-4H
 for ath10k@lists.infradead.org; Wed, 13 Nov 2019 03:38:02 +0000
MIME-Version: 1.0
Date: Wed, 13 Nov 2019 11:37:57 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH v6 3/3] ath10k: add workqueue for RX path of sdio
In-Reply-To: <87r22ewqi6.fsf@codeaurora.org>
References: <1569402639-31720-1-git-send-email-wgong@codeaurora.org>
 <1569402639-31720-4-git-send-email-wgong@codeaurora.org>
 <8736f92sfx.fsf@kamboji.qca.qualcomm.com>
 <3f3641ad49a2664d346558760e38b404@codeaurora.org>
 <70f8f208f631a2a2c7337f45b873a16e@codeaurora.org>
 <87r22ewqi6.fsf@codeaurora.org>
Message-ID: <ee6539c50cff626968984df3b511a5a8@codeaurora.org>
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

T24gMjAxOS0xMS0xMSAyMDoyMywgS2FsbGUgVmFsbyB3cm90ZToKPiBXZW4gR29uZyA8d2dvbmdA
Y29kZWF1cm9yYS5vcmc+IHdyaXRlczoKPiAKPj4gT24gMjAxOS0xMS0wMSAxNTo0MiwgV2VuIEdv
bmcgd3JvdGU6Cj4+PiBPbiAyMDE5LTEwLTMxIDE3OjA4LCBLYWxsZSBWYWxvIHdyb3RlOgo+Pj4g
44CBPiBJIGp1c3QgcmVhbGlzZWQgdGhhdCB0aGlzIGlzIFJYIHBhdGggc28gd2Ugc2hvdWxkIHVz
ZQo+Pj4gQVRIMTBLX1NLQl9SWENCKCkKPj4+PiBpbnN0ZWFkLiBJIG1hZGUgdGhlIGNoYW5nZSBi
ZWxvdyB0byB0aGlzIGNvbW1pdCBpbiBwZW5kaW5nIGJyYW5jaDoKPj4+PiAKPj4+IEkgd2lsbCB0
ZXN0IHdpdGggdGhlIG5ldyBwYXRjaCB0b2dldGhlciB3aXRoIG90aGVyIHBlcmZvcm1hbmNlIAo+
Pj4gcGF0Y2hlcy4KPj4gSGkgS2FsbGUsIEkgaGF2ZSB0ZXN0ZWQgd2l0aCB0aGUgcGF0Y2hlcyBv
ZiBwZW5kaW5nIGJyYW5jaCwgaXQgaXMKPj4gc3VjY2Vzcy4KPj4gcmVzdWx0IGlzIHNhbWUgd2l0
aCB0aGUgcHVibGljIHJldmlldyB3aGljaCBJIHRlc3RlZCBiZWZvcmUuCj4+IAo+PiB0aGUgcGF0
Y2hlcyBJIHRlc3RlZCBvbiBwZW5kaW5nIGJyYW5jaDoKPj4gCj4+IGF0aDEwazogZW5hYmxlIGFs
dCBkYXRhIG9mIFRYIHBhdGggZm9yIHNkaW8KPj4gYXRoMTBrOiBhZGQgaHR0IFRYIGJ1bmRsZSBm
b3Igc2Rpbwo+PiBhdGgxMGs6IGRpc2FibGUgVFggY29tcGxldGUgaW5kaWNhdGlvbiBvZiBodHQg
Zm9yIHNkaW8KPj4gYXRoMTBrOiBlbmFibGUgbmFwaSBvbiBSWCBwYXRoIGZvciBzZGlvCj4+IGF0
aDEwazogc2RpbzogcmVtb3ZlIHN0cnVjdCBhdGgxMGtfc2Rpb19yeF9kYXRhOjpzdGF0dXMKPj4g
YXRoMTBrOiBzZGlvOiBjb3NtZXRpYyBjbGVhbnVwCj4+IGF0aDEwazogYWRkIHdvcmtxdWV1ZSBm
b3IgUlggcGF0aCBvZiBzZGlvCj4+IGF0aDEwazogY2hhbmdlIG1heCBSWCBidW5kbGUgc2l6ZSBm
cm9tIDggdG8gMzIgZm9yIHNkaW8KPj4gYXRoMTBrOiBlbmFibGUgUlggYnVuZGxlIHJlY2VpdmUg
Zm9yIHNkaW8KPiAKPiBWZXJ5IGdvb2QsIHRoYW5rcyBmb3IgdGVzdGluZy4KSGkgS2FsbGUsCgp0
aGlzIHBhdGNoIHdpbGwgdHJpZ2dlciBjb25uZWN0IGZhaWwgZm9yIFBTSyBtb2RlIEFQOgphdGgx
MGs6IGFkZCB3b3JrcXVldWUgZm9yIFJYIHBhdGggb2Ygc2RpbwoKSSBoYXZlIHNlbnQgcGF0Y2gg
dG8gZml4IGl0OgphdGgxMGs6IGNsZWFyIGllZWU4MDIxMV9yeF9zdGF0dXMgZm9yIHNkaW8KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWls
aW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
