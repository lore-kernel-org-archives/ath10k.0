Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.toke.dk ([2001:470:dc45:1000::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIWj1-0004rE-0V
 for ath10k@lists.infradead.org; Fri, 02 Nov 2018 10:30:50 +0000
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Subject: Re: [PATCH 3/6] mac80211: Add airtime accounting and scheduling to
 TXQs
In-Reply-To: <5d8415fe50e8505eb62c5a0d1b40bb2a@codeaurora.org>
References: <1540033534-11211-1-git-send-email-rmanohar@codeaurora.org>
 <1540033534-11211-4-git-send-email-rmanohar@codeaurora.org>
 <8736ssbxp9.fsf@toke.dk> <9c2b790132a9a89fecd7dd79dc67d891@codeaurora.org>
 <87woq2843q.fsf@toke.dk> <8fd3524bfe022ccd2a8b61a3314ed32b@codeaurora.org>
 <5d8415fe50e8505eb62c5a0d1b40bb2a@codeaurora.org>
Date: Fri, 02 Nov 2018 11:30:22 +0100
Message-ID: <87h8gzpy9t.fsf@toke.dk>
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
To: Rajkumar Manoharan <rmanohar@codeaurora.org>
Cc: linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

UmFqa3VtYXIgTWFub2hhcmFuIDxybWFub2hhckBjb2RlYXVyb3JhLm9yZz4gd3JpdGVzOgoKPiBP
biAyMDE4LTEwLTI4IDE1OjAxLCBSYWprdW1hciBNYW5vaGFyYW4gd3JvdGU6Cj4+IE9uIDIwMTgt
MTAtMjggMDg6NDgsIFRva2UgSMO4aWxhbmQtSsO4cmdlbnNlbiB3cm90ZToKPj4+IFJhamt1bWFy
IE1hbm9oYXJhbiA8cm1hbm9oYXJAY29kZWF1cm9yYS5vcmc+IHdyaXRlczoKPj4+IAo+Pj4+IAo+
Pj4+IDRtcyAgICAgICAgIDIyMyAoNDAlKSAgICAgICAgIDIxNCAoNDAlKSAgICAxMDkgKDEwJSkg
ICAgICAgOTQgKDEwJSkKPj4+PiAKPj4+PiA0bXMgICAgICAgICAzMzcgKDkwJSkgICAgICAgICAx
ODIgKDglKSAgICAgIDIzICgxJSkgICAgICAgIDMwICgxJSkKPj4+IAo+Pj4gU28gdGhpcyBsb29r
cyBsaWtlIGl0J3MgZG9pbmcgKnNvbWV0aGluZyosIGJ1dCBub3QgbGlrZSBpdCdzIAo+Pj4gc3Vj
Y2VlZGluZwo+Pj4gaW4gYWNoaWV2aW5nIHRoZSBzZXQgcGVyY2VudGFnZXMuIERpZCB5b3UgY2hl
Y2sgaWYgdGhlIGFjdHVhbCBhaXJ0aW1lCj4+PiB2YWx1ZXMgKGluIGRlYnVnZnMpIGNvcnJlc3Bv
bmRzIHRvIHRoZSBjb25maWd1cmVkIHdlaWdodHM/Cj4+PiAKPj4gTm8uIFdpbGwgY2hlY2sgdGhh
dC4KPj4gCj4gVG9rZSwKPgo+ICBGcm9tIGFib3ZlIHJlc3VsdHMsIGRpZmZlcmVudCBhaXJ0aW1l
IGZvciBlYWNoIHN0YXRpb24gaXMgcmVmbGVjdGluZyBvbgo+IG91dHB1dCBwZXJmb3JtYW5jZS4g
VW5mb3J0dW5hdGVseSBJIGRvbid0IHNlZSBzdWNoIHRwdXQgZGlmZmVyZW5jZSwgd2hlbgo+IHRo
ZSB0eCBtb2RlIGlzIGZpeGVkIGluIHB1c2gtb25seS4gRXZlbiBsb3cgd2VpZ2h0IHN0YXRpb24g
aXMgZ2l2aW5nIAo+IHNhbWUKPiBwZXJmb3JtYW5jZS4gQXJlIHlvdSBhbHNvIHNlZWluZyB0aGUg
c2FtZSBiZWhhdmlvciBpbiB5b3VyIHNldHVwPyBDb3VsZAo+IHlvdSBwbGVhc2Ugc2hhcmUgeW91
ciByZXN1bHRzPwoKU29ycnksIEkndmUgYmVlbiB0cmF2ZWxsaW5nIHRoaXMgd2VlazsgSSdsbCBi
ZSBiYWNrIGluIHRoZSBvZmZpY2UgbmV4dAp3ZWVrIGFuZCBjYW4gcnVuIHNvbWUgdGVzdHMgdGhl
bi4gSSBtYXkgYWxzbyBoYXZlIGFuIGlkZWEgZm9yIGEKZGlmZmVyZW50IGFsZ29yaXRobSB0aGF0
IHdpbGwgd29yayBiZXR0ZXIgaW4gcHVsbCBtb2RlLCBidXQgbmVlZCB0byBzZWUKaWYgaXQgd29y
a3MgYXQgYWxsIGZpcnN0IDopCgpIb3cgZG8gSSBmb3JjZSBhdGgxMGsgaW50byBwdXNoIG1vZGU/
CgotVG9rZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
