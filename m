Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iU7EN-0005vl-8A
 for ath10k@lists.infradead.org; Mon, 11 Nov 2019 10:47:36 +0000
MIME-Version: 1.0
Date: Mon, 11 Nov 2019 18:47:32 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH v6 3/3] ath10k: add workqueue for RX path of sdio
In-Reply-To: <3f3641ad49a2664d346558760e38b404@codeaurora.org>
References: <1569402639-31720-1-git-send-email-wgong@codeaurora.org>
 <1569402639-31720-4-git-send-email-wgong@codeaurora.org>
 <8736f92sfx.fsf@kamboji.qca.qualcomm.com>
 <3f3641ad49a2664d346558760e38b404@codeaurora.org>
Message-ID: <70f8f208f631a2a2c7337f45b873a16e@codeaurora.org>
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

T24gMjAxOS0xMS0wMSAxNTo0MiwgV2VuIEdvbmcgd3JvdGU6Cj4gT24gMjAxOS0xMC0zMSAxNzow
OCwgS2FsbGUgVmFsbyB3cm90ZToKPiDjgIE+IEkganVzdCByZWFsaXNlZCB0aGF0IHRoaXMgaXMg
UlggcGF0aCBzbyB3ZSBzaG91bGQgdXNlIAo+IEFUSDEwS19TS0JfUlhDQigpCj4+IGluc3RlYWQu
IEkgbWFkZSB0aGUgY2hhbmdlIGJlbG93IHRvIHRoaXMgY29tbWl0IGluIHBlbmRpbmcgYnJhbmNo
Ogo+PiAKPiBJIHdpbGwgdGVzdCB3aXRoIHRoZSBuZXcgcGF0Y2ggdG9nZXRoZXIgd2l0aCBvdGhl
ciBwZXJmb3JtYW5jZSBwYXRjaGVzLgpIaSBLYWxsZSwgSSBoYXZlIHRlc3RlZCB3aXRoIHRoZSBw
YXRjaGVzIG9mIHBlbmRpbmcgYnJhbmNoLCBpdCBpcyAKc3VjY2Vzcy4KcmVzdWx0IGlzIHNhbWUg
d2l0aCB0aGUgcHVibGljIHJldmlldyB3aGljaCBJIHRlc3RlZCBiZWZvcmUuCgp0aGUgcGF0Y2hl
cyBJIHRlc3RlZCBvbiBwZW5kaW5nIGJyYW5jaDoKCmF0aDEwazogZW5hYmxlIGFsdCBkYXRhIG9m
IFRYIHBhdGggZm9yIHNkaW8KYXRoMTBrOiBhZGQgaHR0IFRYIGJ1bmRsZSBmb3Igc2RpbwphdGgx
MGs6IGRpc2FibGUgVFggY29tcGxldGUgaW5kaWNhdGlvbiBvZiBodHQgZm9yIHNkaW8KYXRoMTBr
OiBlbmFibGUgbmFwaSBvbiBSWCBwYXRoIGZvciBzZGlvCmF0aDEwazogc2RpbzogcmVtb3ZlIHN0
cnVjdCBhdGgxMGtfc2Rpb19yeF9kYXRhOjpzdGF0dXMKYXRoMTBrOiBzZGlvOiBjb3NtZXRpYyBj
bGVhbnVwCmF0aDEwazogYWRkIHdvcmtxdWV1ZSBmb3IgUlggcGF0aCBvZiBzZGlvCmF0aDEwazog
Y2hhbmdlIG1heCBSWCBidW5kbGUgc2l6ZSBmcm9tIDggdG8gMzIgZm9yIHNkaW8KYXRoMTBrOiBl
bmFibGUgUlggYnVuZGxlIHJlY2VpdmUgZm9yIHNkaW8KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vYXRoMTBrCg==
