Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0NZX-0008In-2d
 for ath10k@lists.infradead.org; Wed, 21 Aug 2019 10:10:32 +0000
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B2CE43D96B
 for <ath10k@lists.infradead.org>; Wed, 21 Aug 2019 10:10:30 +0000 (UTC)
Received: by mail-ed1-f69.google.com with SMTP id r25so1092088edp.20
 for <ath10k@lists.infradead.org>; Wed, 21 Aug 2019 03:10:30 -0700 (PDT)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: RE: [PATCH 4/7] ath10k: disable TX complete indication of htt for sdio
In-Reply-To: <00992d0991704b0fae73a500bb2eb504@aptaiexm02f.ap.qualcomm.com>
References: <1566302108-18219-1-git-send-email-wgong@codeaurora.org>
 <1566302108-18219-5-git-send-email-wgong@codeaurora.org>
 <87blwkt480.fsf@toke.dk>
 <00992d0991704b0fae73a500bb2eb504@aptaiexm02f.ap.qualcomm.com>
Date: Wed, 21 Aug 2019 12:10:27 +0200
Message-ID: <8736husub0.fsf@toke.dk>
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
To: Wen Gong <wgong@qti.qualcomm.com>, Wen Gong <wgong@codeaurora.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

V2VuIEdvbmcgPHdnb25nQHF0aS5xdWFsY29tbS5jb20+IHdyaXRlczoKCj4+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tCj4+IEZyb206IGF0aDEwayA8YXRoMTBrLWJvdW5jZXNAbGlzdHMuaW5m
cmFkZWFkLm9yZz4gT24gQmVoYWxmIE9mIFRva2UKPj4gSMO4aWxhbmQtSsO4cmdlbnNlbgo+PiBT
ZW50OiBUdWVzZGF5LCBBdWd1c3QgMjAsIDIwMTkgODoyNCBQTQo+PiBUbzogV2VuIEdvbmcgPHdn
b25nQGNvZGVhdXJvcmEub3JnPjsgYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKPj4gQ2M6IGxp
bnV4LXdpcmVsZXNzQHZnZXIua2VybmVsLm9yZwo+PiBTdWJqZWN0OiBbRVhUXSBSZTogW1BBVENI
IDQvN10gYXRoMTBrOiBkaXNhYmxlIFRYIGNvbXBsZXRlIGluZGljYXRpb24gb2YgaHR0Cj4+IGZv
ciBzZGlvCj4+IAo+PiBXZW4gR29uZyA8d2dvbmdAY29kZWF1cm9yYS5vcmc+IHdyaXRlczoKPj4g
Cj4+ID4gVHggY29tcGxldGUgbWVzc2FnZSBmcm9tIGZpcm13YXJlIGNvc3QgYnVzIGJhbmR3aWR0
aCBvZiBzZGlvLCBhbmQgYnVzCj4+ID4gYmFuZHdpZHRoIGlzIHRoZSBib2xsdGVuZWNrIG9mIHRo
cm91Z2hwdXQsIGl0IHdpbGwgZWZmZWN0IHRoZSBiYW5kd2lkdGgKPj4gPiBvY2N1cGFuY3kgb2Yg
ZGF0YSBwYWNrZXQgb2YgVFggYW5kIFJYLgo+PiA+Cj4+ID4gVGhpcyBwYXRjaCBkaXNhYmxlIFRY
IGNvbXBsZXRlIGluZGljYXRpb24gZnJvbSBmaXJtd2FyZSBmb3IgaHR0IGRhdGEKPj4gPiBwYWNr
ZXQsIGl0IHJlc3VsdHMgaW4gc2lnbmlmaWNhbnQgcGVyZm9ybWFuY2UgaW1wcm92ZW1lbnQgb24g
VFggcGF0aC4KPj4gCj4+IFdhaXQsIGhvdyBkb2VzIHRoYXQgd29yaz8gQW0gSSB1bmRlcnN0YW5k
aW5nIGl0IGNvcnJlY3RseSB0aGF0IHRoaXMKPj4gcmVwbGFjZXMgYSBwZXItcGFja2V0IFRYIGNv
bXBsZXRpb24gd2l0aCBhIHBlcmlvZGljIG9uZSBzZW50IG91dCBvZgo+PiBiYW5kPwo+IFdoZW4g
dGhpcyBwYXRjaCBhcHBsaWVkLCBmaXJtd2FyZSB3aWxsIG5vdCBpbmRpY2F0ZSB0eCBjb21wbGV0
ZSBmb3IgdHgKPiBEYXRhLCBpdCBvbmx5IGluZGljYXRlIEhUVF9UMkhfTVNHX1RZUEVfVFhfQ1JF
RElUX1VQREFURV9JTkQsCj4gVGhpcyBodHQgbXNnIHdpbGwgdGVsbCBob3cgbWFueSBkYXRhIHR4
IGNvbXBsZXRlIHdpdGhvdXQgc3RhdHVzKHN0YXR1cyBtYXliZSBzdWNjZXNzL2ZhaWwpLgoKQWgs
IHNvIHRoaXMgaXMgYmFzaWNhbGx5IGEgY291bnRlciBvZiBob3cgbXVjaCBkYXRhIGlzIGN1cnJl
bnRseSBxdWV1ZWQKaW4gdGhlIGZpcm13YXJlPwoKPj4gQW5kIGNvdWxkIHlvdSBleHBsYWluIHdo
YXQgdGhlIGNyZWRpdHMgdGhpbmcgaXMgZm9yLCBwbGVhc2U/IDopCj4gRm9yIGhpZ2ggbGF0ZW5j
eSBidXMgY2hpcCwgYWxsIHRoZSB0eCBkYXRhJ3MgY29udGVudChpbmNsdWRlIGlwL3VkcC90Y3Ag
aGVhZGVyCj4gYW5kIHBheWxvYWQpIHdpbGwgYmUgdHJhbnNmZXIgdG8gZmlybXdhcmUncyBtZW1v
cnkgdmlhIGJ1cy4KPiBBbmQgZmlybXdhcmUgaGFzIGxpbWl0ZWQgbWVtb3J5IGZvciB0eCBkYXRh
LCB0aGUgdHggZGF0YSdzIGNvbnRlbnQgbXVzdAo+IFNhdmVkIGluIGZpcm13YXJlIG1lbW9yeSBi
ZWZvcmUgaXQgdHggY29tcGxldGUsIGlmIGF0aDEwayB0cmFuc2ZlciB0eAo+IGRhdGEgbW9yZSB0
aGFuIHRoZSBsaW1pdCwgZmlybXdhcmUgd2lsbCBvY2N1ciBlcnJvci4gVGhlIGNyZWRpdCBpcyB1
c2VkCj4gdG8gYXZvaWQgYXRoMTBrIGV4Y2VlZCB0aGUgbGltaXQuCgpXaGF0J3MgYSB0eXBpY2Fs
IGxpbWl0IGluIHRoZSBmaXJtd2FyZT8KCi1Ub2tlCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
YXRoMTBrCg==
