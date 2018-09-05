Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fxS9p-0006Rf-B4
 for ath10k@lists.infradead.org; Wed, 05 Sep 2018 07:23:23 +0000
MIME-Version: 1.0
Date: Wed, 05 Sep 2018 15:23:09 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH v2 2/2] ath10k: Set sk_pacing_shift to 6 for 11AC WiFi
 chips
In-Reply-To: <CANEJEGsm_BKM6g2x0+a7_5dBy5jkROs+jEjHmrcneGrMdDK41g@mail.gmail.com>
References: <1533724802-30944-1-git-send-email-wgong@codeaurora.org>
 <1533724802-30944-3-git-send-email-wgong@codeaurora.org>
 <87sh3pdtpg.fsf@toke.dk>
 <f185ab8722e84c959b375e606d25a29b@aptaiexm02f.ap.qualcomm.com>
 <87mutue4y8.fsf@toke.dk>
 <ef7b317006964c0fa72763bbfc5149e5@aptaiexm02f.ap.qualcomm.com>
 <CANEJEGvcj9gPT8yy++qvi3hz3t9pAXyeUves06gr+ADfn9Ouhg@mail.gmail.com>
 <1535967508.3437.31.camel@sipsolutions.net> <87in3m25uu.fsf@toke.dk>
 <1535975240.3437.61.camel@sipsolutions.net> <878t4i1z74.fsf@toke.dk>
 <CANEJEGsm_BKM6g2x0+a7_5dBy5jkROs+jEjHmrcneGrMdDK41g@mail.gmail.com>
Message-ID: <d107bcfcff90bac041596dc61fd6a666@codeaurora.org>
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
To: Grant Grundler <grundler@google.com>
Cc: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, toke@toke.dk, wgong@qti.qualcomm.com, ath10k@lists.infradead.org

T24gMjAxOC0wOS0wNSAwNzo0MywgR3JhbnQgR3J1bmRsZXIgd3JvdGU6Cj4gT24gTW9uLCBTZXAg
MywgMjAxOCBhdCA2OjM1IEFNIFRva2UgSMO4aWxhbmQtSsO4cmdlbnNlbiA8dG9rZUB0b2tlLmRr
PiAKPiB3cm90ZToKPj4gCj4+IEpvaGFubmVzIEJlcmcgPGpvaGFubmVzQHNpcHNvbHV0aW9ucy5u
ZXQ+IHdyaXRlczoKPiAuLi4uCj4+ID4gR3JhbnQncyBkYXRhIHNob3dzIGEgc2lnbmlmaWNhbnQg
ZGlmZmVyZW5jZSBiZXR3ZWVuIDYgYW5kIDcgZm9yIGJvdGgKPj4gPiBsYXRlbmN5IGFuZCB0aHJv
dWdocHV0Ogo+IAo+IE1pbm9yIG5pdDogdGhpcyBpcyB3Z29uZydzIGRhdGEgbW9yZSB0aG91Z2h0
ZnVsbHkgcHJvY2Vzc2VkLgoKPiAKPiB3Z29uZzogY2FuIHlvdSBjb25maXJtIChhKSBJJ3ZlIGVu
dGVyZWQgdGhlIGRhdGEgY29ycmVjdGx5IGluIHRoZQo+IHNwcmVhZHNoZWV0IGFuZCAoYikgeW91
J3ZlIGxhYmVsZWQgdGhlIGRhdGEgc2V0cyBjb3JyZWN0bHkgd2hlbiB5b3UKPiBnZW5lcmF0ZWQg
dGhlIGRhdGE/Cj4gSWYgZWl0aGVyIG9mIHVzIG1hZGUgYSBtaXN0YWtlLCBpdCB3b3VsZCBiZSBn
b29kIHRvIGtub3cuIDopCj4gCnllcywgdGhlIGRhdGEgaXMgdGhlIHRlc3QgcmVzdWx0IGZyb20g
ZmxlbnQgdG9vbC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
