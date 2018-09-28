Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g61Xf-000708-A3
 for ath10k@lists.infradead.org; Fri, 28 Sep 2018 22:47:25 +0000
MIME-Version: 1.0
Date: Fri, 28 Sep 2018 15:47:07 -0700
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: [RFC 2/2] ath10k: reporting estimated tx airtime for fairness
In-Reply-To: <25469b4a-219d-f941-15ad-a1c95308dd69@candelatech.com>
References: <1538008874-11692-1-git-send-email-rmanohar@codeaurora.org>
 <1538008874-11692-2-git-send-email-rmanohar@codeaurora.org>
 <87lg7lfxtw.fsf@toke.dk> <34bac7851e6c9d3194cef87bd952c388@codeaurora.org>
 <25469b4a-219d-f941-15ad-a1c95308dd69@candelatech.com>
Message-ID: <df1c4f9bde7682646c901305d1c0ab5d@codeaurora.org>
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
To: Ben Greear <greearb@candelatech.com>
Cc: Kan Yan <kyan@google.com>, linux-wireless-owner@vger.kernel.org, =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

T24gMjAxOC0wOS0yOCAxMjo1NywgQmVuIEdyZWVhciB3cm90ZToKPiBPbiAwOS8yOC8yMDE4IDEy
OjQ3IFBNLCBSYWprdW1hciBNYW5vaGFyYW4gd3JvdGU6Cj4+IE9uIDIwMTgtMDktMjggMDg6MjUs
IFRva2UgSMO4aWxhbmQtSsO4cmdlbnNlbiB3cm90ZToKPj4gCj4+PiBTbyB0aGlzIGp1c3QgdXNl
cyB0aGUgY2FsY3VsYXRlZCBhaXJ0aW1lIGJhc2VkIG9uIHJhdGUgYW5kIHNpemU/IAo+Pj4gV2Fz
bid0Cj4+PiB0aGVyZSBzdXBwb3NlZCB0byBiZSBhbiBhaXJ0aW1lIHVzYWdlIHZhbHVlIHJlcG9y
dGVkIGJ5IHRoZSBmaXJtd2FyZT8gCj4+PiA6KQo+Pj4gCj4+IEZpcm13YXJlIGludGVyZmFjZSBj
aGFuZ2VzIGFyZSBpbiBwcm9ncmVzcy4gQWlydGltZSBmb3Igc3RhL3RpZCB3aWxsIAo+PiBiZSBy
ZXBvcnRlZCB2aWEKPj4gaHR0IHR4LWNvbXBsIGFuZCByeCBpbmQgbWVzc2FnZXMuIE1lYW50aW1l
IEkgdGhvdWdodCBpdCB3b3VsZCBiZSAKPj4gdXNlZnVsIHRvIHVzZSBLYW4ncyBjaGFuZ2VzCj4+
IGZvciBBVEYgdmFsaWRhdGlvbiBpbiBhdGgxMGsgdXNpbmcgZXhpc3RpbmcgZmlybXdhcmUuIDop
Cj4gCj4gTWF5YmUgeW91IGNhbiBnZXQgdGhlIGZpcm13YXJlIGd1eXMgdG8gcmVwb3J0IHRoZSB0
eCByYXRlIGluIHRoZSAKPiB0eC1jb21wbGV0aW9uCj4gKGxpa2UgSSBoYXZlIGJlZW4gZG9pbmcg
Zm9yIHllYXJzIGluIG15IGF0aDEway1jdCBmaXJtd2FyZSk/ICBUaGVuIGxldCAKPiB0aGUgaG9z
dAo+IGRvIHRoZSBhaXItdGltZSBjYWxjdWxhdGluZz8KPiAKPiBJJ2xsIGdpdmUgdGhlbSBmaXJt
d2FyZSBwYXRjaGVzIGlmIHRoZSB3YW50IDopCj4gCkJlbiwKCkFzIHlvdSBrbm93LCBpdCBuZWVk
cyBjbGVhbnVwIGluIGZpcm13YXJlIHRvIGZyZWUgdXAgc3BhY2UgZm9yIG5ldyAKaW50ZXJmYWNl
CmNoYW5nZXMuIE1vc3Qgb2YgdGltZSB3ZSB0cnkgdG8gbGV2ZXJhZ2UgcnN2ZC91bnVzZWQgc2xv
dHMuIEkgYW0gYXdhcmUgCm9mIHRoYXQKeW91IGRpZCBhIGxvdCBvZiBjbGVhbiB1cCBpbiBDVCBm
aXJtd2FyZSB3aGljaCBpcyBxdWl0ZSBoYXJkIGluIG9mZmljaWFsCmZpcm13YXJlIGFzIGl0IGFs
c28gaGFzIHRvIHN1cHBvcnQgcHJvcC4gcmVsZWFzZXMuIEthbGxlIGNhbiBhbnN3ZXIgbXVjaCAK
YmV0dGVyLgoKLVJhamt1bWFyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
