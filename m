Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cHoxJ-00047g-1d
 for ath10k@lists.infradead.org; Fri, 16 Dec 2016 09:37:34 +0000
Message-ID: <1481881024.27953.14.camel@sipsolutions.net>
Subject: Re: [PATCH 2/4] cfg80211: Add new NL80211_CMD_SET_BTCOEX_PRIORITY
 to support BTCOEX
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 16 Dec 2016 10:37:04 +0100
In-Reply-To: <134cc8e58ecb804b6dda0137c4c37be8@codeaurora.org>
References: <1478610932-21954-1-git-send-email-c_traja@qti.qualcomm.com>
 <1478610932-21954-3-git-send-email-c_traja@qti.qualcomm.com>
 <1480949353.31788.27.camel@sipsolutions.net>
 <5e5e8971c96293a81e7cb37bcdfbd593@codeaurora.org>
 <1481645351.20412.34.camel@sipsolutions.net>
 <134cc8e58ecb804b6dda0137c4c37be8@codeaurora.org>
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
To: Tamizh chelvam <tamizhchelvam@codeaurora.org>
Cc: c_traja@qti.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

PiA+ID4gaXMgaXQgZmluZSB0byBoYXZlIGFzIFdJUEhZX0JUQ09FWF9CRV9QUkVGRVJSRUQgPwo+
ID4gCj4gPiBJdCdzIG5vdCByZWFsbHkgY2xlYXIgdG8gbWUgd2hhdCB5b3UgaW50ZW5kIHRvIGRv
IHRoaXMgLSBpZiBpdCdzCj4gPiByZWFsbHkgc3VwcG9ydCBmbGFncyB0aGVuIHlvdSByZWFsbHkg
c2hvdWxkIG5hbWUgdGhvc2UgYmV0dGVyLgo+ID4gCj4gCj4gVGhpcyBpcyBzdXBwb3J0IGZsYWdz
IGFuZCBpdCB1c2VkIGJ5IHRoZSBkcml2ZXIgdG8gaW50aW1hdGUgZHJpdmVywqAKPiBzdXBwb3J0
ZWQgZnJhbWUgdHlwZSBmb3IgdGhlIEJUQ09FWCB0byBjZmcgbGlrZQo+ICJ3aXBoeV93b3dsYW5f
c3VwcG9ydF9mbGFncyIgaW1wbGVtZW50YXRpb24uIFBsZWFzZSBzdWdnZXN0IGlmIHRoaXMKPiBp
cyBvayA/IEkgd2lsbCBiZSB0aGFua2Z1bCBpZiB5b3UgY2FuIHN1Z2dlc3QgYcKgIGJldHRlciBv
bmUgaWYgdGhpcwo+IGlzIG5vdCBvayAiV0lQSFlfQlRDT0VYX1NVUFBPUlRTX0JFIgoKV2VsbCwg
SSBzZWUgYSBmZXcgdGhpbmdzIGhlcmU6CgoxKSBkb2VzIGl0IGV2ZW4gbWFrZSBzZW5zZSB0byBz
cGxpdCBpdCBvdXQgcGVyIEFDPyB3b3VsZG4ndCBpdCBiZSB3ZWlyZAppZiB5b3Ugc3VwcG9ydGVk
IHRoaXMgb25seSBmb3IgVk8gYW5kIEJLLCBhbmQgbm90IHRoZSBvdGhlcnMsIG9yCnNvbWV0aGlu
ZyBsaWtlIHRoYXQ/CgoyKSBXb3VsZG4ndCBpdCBtYWtlIG1vcmUgc2Vuc2UgdG8gZGVmaW5lIHRo
aXMgaW4gbmw4MDIxMSBhbmQganVzdCBwYXNzCnRoZSBiaXRtYXAgdGhyb3VnaCB0byB1c2Vyc3Bh
Y2U/IFRoYXQgd291bGQgc2F2ZSBxdWl0ZSBhIGJpdCBvZiBuZXRsaW5rCm1hbmdsaW5nIGNvbXBs
ZXhpdHkuCgozKSBJIHRoaW5rIHRoZSBuYW1pbmcgaXMgY29uZnVzaW5nIC0gIldJUEhZX0JUQ09F
WF9TVVBQT1JUU19CRV9QUkVGIiBvcgpzbyBtaWdodCBiZSBtb3JlIGFwcHJvcHJpYXRlPwoKPiBE
byB5b3UgbWVhbiB0byBzYXksIHNlbmRpbmcgYSB2YWx1ZSBmcm9tIHVzZXIgc3BhY2UgYW5kIHBh
cnNlIHRoYXQKPiBpbsKgIHRoZSBkcml2ZXI/CgpJIHdhcyBtb3JlIHRoaW5raW5nIG9mIHRoZSBj
YXBhYmlsaXR5IGFkdmVydGlzZW1lbnQsIGJ1dCB5ZWFoLCBib3RoCndheXMgc2VlbXMgcmVhc29u
YWJsZS4KCmpvaGFubmVzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
