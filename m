Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihWJp-0002mJ-43
 for ath10k@lists.infradead.org; Wed, 18 Dec 2019 10:12:41 +0000
MIME-Version: 1.0
Date: Wed, 18 Dec 2019 18:12:32 +0800
From: yiboz@codeaurora.org
Subject: Re: [PATCH 2/4] mac80211: fix issue in loop scenario
In-Reply-To: <94471b2381bee394f9708eae8ba47129f3facd03.camel@sipsolutions.net>
References: <1576221593-1086-1-git-send-email-yiboz@codeaurora.org>
 <1576221593-1086-3-git-send-email-yiboz@codeaurora.org>
 (sfid-20191213_082426_564220_0827923D)
 <94471b2381bee394f9708eae8ba47129f3facd03.camel@sipsolutions.net>
Message-ID: <6f092bd44cfc581a219bd0f0506cc636@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

5ZyoIDIwMTktMTItMTMgMTc6NTbvvIxKb2hhbm5lcyBCZXJnIOWGmemBk++8mgo+IE9uIEZyaSwg
MjAxOS0xMi0xMyBhdCAxNToxOSArMDgwMCwgWWlibyBaaGFvIHdyb3RlOgo+PiBJbiBhIGxvb3Ag
dHhxcyBkZXF1ZXVlIHNjZW5hcmlvLCBpZiB0aGUgZmlyc3QgdHhxIGluIHRoZSByYnRyZWUgZ2V0
cwo+PiByZW1vdmVkIGZyb20gcmJ0cmVlIGltbWVkaWF0ZWx5IGluIHRoZSBpZWVlODAyMTFfcmV0
dXJuX3R4cSgpLCB0aGUKPj4gbG9vcCB3aWxsIGJyZWFrIHNvb24gaW4gdGhlIGllZWU4MDIxMV9u
ZXh0X3R4cSgpIGR1ZSB0byBzY2hlZHVsZV9wb3MKPj4gbm90IGxlYWRpbmcgdG8gdGhlIHNlY29u
ZCB0eHEgaW4gdGhlIHJidHJlZS4gVGh1cyB1cGRhdGUgc2NoZWR1bGVfcG9zCj4+IHRvIHByZXZp
b3VzIG5vZGUgb25jZSB0aGUgbm9kZSBvZiBzY2hlZHVsZV9wb3MgaXMgZWl0aGVyIHJlbW92ZWQg
ZnJvbQo+PiByYnRyZWUgb3IgbW92ZSB0byBvdGhlciBsb2NhdGlvbiBpbiByYnRyZWUgZHVlIHRv
IGFpcnRpbWUgdXBkYXRlLgo+IAo+IEZvciBteSB1bmRlcnN0YW5kaW5nIC0gdGhpcyBpcyBhIGZp
eCB0byB0aGUgZmlyc3QgcGF0Y2ggaW4gdGhlIHNlcmllcz8KPiAKPiBJIGd1ZXNzIHlvdSBkaWRu
J3Qgc3F1YXNoIGl0IGJlY2F1c2UgdGhhdCdzIFRva2UncyBwYXRjaCBvciBzb21ldGhpbmc/Cj4g
Cj4gSSB0ZW5kIHRvIHRoaW5rIHlvdSBzdGlsbCBzaG91bGQsIGFuZCBhbm5vdGF0ZSB0aGUgY2hh
bmdlcywgYnV0IEkgCj4gd2FudGVkCj4gdG8gdW5kZXJzdGFuZCBpdCBmaXJzdC4KCkhpIEpvaGFu
bmVzLAoKWWVzLCB0aGlzIGlzIGEgZml4IHRvIHRoZSBmaXJzdCBwYXRjaC4gQWN0dWFsbHksIHRo
ZSByZXN0IG9mIHR3byBwYXRjaGVzIAphcmUgYWxzbyBzZXJ2ZSB0aGUgc2FtZS4gU28sIGFyZSB5
b3Ugc3VnZ2VzdGluZyB0byBtZXJnZSB0aGVtIHRvIHRoZSAKZmlyc3QgcGF0Y2g/CgpQcmV2aW91
bHksIEkgaGFkIGFkZGVkIFRva2UncyBzaWduYXR1cmUgaW4gdGhpcyBwYXRjaCBidXQgVG9rZSBh
ZHZpc2VkIAp0byBkZWxldGUgaXQuIEkgZmVlbCBhIGxpdHRsZSBiaXQgY29uZnVzZWQgYWJvdXQg
aG93IHRvIGhhbmRsZSBpdC4gCkFwcHJlY2lhdGUgYW55IGRldGFpbCBndWlkZS4KPiAKPiBqb2hh
bm5lcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRo
MTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
