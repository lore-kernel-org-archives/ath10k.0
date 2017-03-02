Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cjMSK-0007RL-D0
 for ath10k@lists.infradead.org; Thu, 02 Mar 2017 08:51:26 +0000
Message-ID: <1488444659.8390.8.camel@sipsolutions.net>
Subject: Re: [PATCHv2 3/4] cfg80211: Add Support set btcoex priority value
From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 02 Mar 2017 09:50:59 +0100
In-Reply-To: <1488029873-14600-4-git-send-email-c_traja@qti.qualcomm.com>
References: <1488029873-14600-1-git-send-email-c_traja@qti.qualcomm.com>
 <1488029873-14600-4-git-send-email-c_traja@qti.qualcomm.com>
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
To: c_traja@qti.qualcomm.com, linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org

SXMgdGhlcmUgbXVjaCBwb2ludCBpbiBoYXZpbmcgNCByYXRoZXIgdGhhbiBqdXN0IDIgcGF0Y2hl
cz8KCgo+ICsJaW50wqDCoMKgwqDCoCgqc2V0X2J0Y29leCkoc3RydWN0IHdpcGh5ICp3aXBoeSwg
Ym9vbCBlbmFibGVkLAo+ICsJCQnCoMKgwqDCoMKgwqBpbnQgYnRjb2V4X3ByaW9yaXR5KTsKClNo
b3VsZG4ndCB0aGF0IGJlIHUzMiBhcyBhIGJpdG1hcD8KCj4gKwlib29sIGJ0Y29leF9wcmlvcml0
eV9zdXBwb3J0OwoKV2h5IG5vdCB1c2UgYW4gZXh0ZW5kZWQgbmw4MDIxMSBmZWF0dXJlIGZsYWcg
ZGlyZWN0bHk/Cgo+ICsgKiBATkw4MDIxMV9BVFRSX0JUQ09FWF9QUklPUklUWTogVGhpcyBpcyBm
b3IgdGhlIGRyaXZlciB3aGljaAo+ICsgKsKgwqDCoMKgwqBzdXBwb3J0IGJ0Y29leCBwcmlvcml0
eSBmZWF0dXJlLiBJdCB1c2VkIHdpdGgKPiAlTkw4MDIxMV9DTURfU0VUX0JUQ09FWC4KPiArICrC
oMKgwqDCoMKgVGhpcyB3aWxsIGhhdmUgdTMyIEJJVE1BUCB2YWx1ZSB3aGljaCByZXByZXNlbnRz
Cj4gKyAqwqDCoMKgwqDCoGZyYW1lKGJrLCBiZSwgdmksIHZvLCBtZ210LCBiZWFjb24pIHR5cGUg
YW5kIHRoYXQgd2lsbCBoYXZlCj4gbW9yZQo+ICsgKsKgwqDCoMKgwqBwcmlvcml0eSB0aGFuIGEg
QlQgdHJhZmZpYy4KCkkgdGhpbmsgeW91IG5lZWQgdG8gZGVmaW5lIHRoZSBiaXRzIHNvbWV3aGVy
ZSBpbiBhbiBlbnVtIC0gaS5lLiB3aGljaApvbmUgaXMgVk8sIFZJLCAuLi4KCj4gKwlpbnQgYnRj
b2V4X3ByaW9yaXR5ID0gLTE7CgpUaGF0IC0xIGlzIHByZXR0eSB1c2VsZXNzLCBpZiB0aGUgZHJp
dmVyIGRvZXNuJ3Qgc3VwcG9ydCBpdCwgaG9wZWZ1bGx5Cml0IHdvbid0IGxvb2sgYXQgdGhlIHZh
bHVlIGF0IGFsbD8KCmpvaGFubmVzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
