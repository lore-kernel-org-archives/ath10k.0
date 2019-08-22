Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0lwk-0000k0-Kd
 for ath10k@lists.infradead.org; Thu, 22 Aug 2019 12:12:08 +0000
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0F3DF81F01
 for <ath10k@lists.infradead.org>; Thu, 22 Aug 2019 12:12:05 +0000 (UTC)
Received: by mail-ed1-f69.google.com with SMTP id n7so3276344edr.5
 for <ath10k@lists.infradead.org>; Thu, 22 Aug 2019 05:12:04 -0700 (PDT)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: RE: [PATCH 4/7] ath10k: disable TX complete indication of htt for sdio
In-Reply-To: <86d0eabcc63849efa914f2c14a3cd59f@aptaiexm02f.ap.qualcomm.com>
References: <1566302108-18219-1-git-send-email-wgong@codeaurora.org>
 <1566302108-18219-5-git-send-email-wgong@codeaurora.org>
 <87blwkt480.fsf@toke.dk>
 <00992d0991704b0fae73a500bb2eb504@aptaiexm02f.ap.qualcomm.com>
 <8736husub0.fsf@toke.dk>
 <86d0eabcc63849efa914f2c14a3cd59f@aptaiexm02f.ap.qualcomm.com>
Date: Thu, 22 Aug 2019 14:12:01 +0200
Message-ID: <874l29pffy.fsf@toke.dk>
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
YWwgTWVzc2FnZS0tLS0tCj4+IEZyb206IFRva2UgSMO4aWxhbmQtSsO4cmdlbnNlbiA8dG9rZUBy
ZWRoYXQuY29tPgo+PiBTZW50OiBXZWRuZXNkYXksIEF1Z3VzdCAyMSwgMjAxOSA2OjEwIFBNCj4+
IFRvOiBXZW4gR29uZyA8d2dvbmdAcXRpLnF1YWxjb21tLmNvbT47IFdlbiBHb25nCj4+IDx3Z29u
Z0Bjb2RlYXVyb3JhLm9yZz47IGF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCj4+IENjOiBsaW51
eC13aXJlbGVzc0B2Z2VyLmtlcm5lbC5vcmcKPj4gU3ViamVjdDogW0VYVF0gUkU6IFtQQVRDSCA0
LzddIGF0aDEwazogZGlzYWJsZSBUWCBjb21wbGV0ZSBpbmRpY2F0aW9uIG9mIGh0dAo+PiBmb3Ig
c2Rpbwo+PiAKPj4gV2VuIEdvbmcgPHdnb25nQHF0aS5xdWFsY29tbS5jb20+IHdyaXRlczoKPj4g
Cj4+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4+ID4+IEZyb206IGF0aDEwayA8YXRo
MTBrLWJvdW5jZXNAbGlzdHMuaW5mcmFkZWFkLm9yZz4gT24gQmVoYWxmIE9mIFRva2UKPj4gPj4g
SMO4aWxhbmQtSsO4cmdlbnNlbgo+PiA+PiBTZW50OiBUdWVzZGF5LCBBdWd1c3QgMjAsIDIwMTkg
ODoyNCBQTQo+PiA+PiBUbzogV2VuIEdvbmcgPHdnb25nQGNvZGVhdXJvcmEub3JnPjsgYXRoMTBr
QGxpc3RzLmluZnJhZGVhZC5vcmcKPj4gPj4gQ2M6IGxpbnV4LXdpcmVsZXNzQHZnZXIua2VybmVs
Lm9yZwo+PiA+PiBTdWJqZWN0OiBbRVhUXSBSZTogW1BBVENIIDQvN10gYXRoMTBrOiBkaXNhYmxl
IFRYIGNvbXBsZXRlIGluZGljYXRpb24gb2YKPj4gaHR0Cj4+ID4gV2hlbiB0aGlzIHBhdGNoIGFw
cGxpZWQsIGZpcm13YXJlIHdpbGwgbm90IGluZGljYXRlIHR4IGNvbXBsZXRlIGZvciB0eAo+PiA+
IERhdGEsIGl0IG9ubHkgaW5kaWNhdGUgSFRUX1QySF9NU0dfVFlQRV9UWF9DUkVESVRfVVBEQVRF
X0lORCwKPj4gPiBUaGlzIGh0dCBtc2cgd2lsbCB0ZWxsIGhvdyBtYW55IGRhdGEgdHggY29tcGxl
dGUgd2l0aG91dCBzdGF0dXMoc3RhdHVzCj4+IG1heWJlIHN1Y2Nlc3MvZmFpbCkuCj4+IAo+PiBB
aCwgc28gdGhpcyBpcyBiYXNpY2FsbHkgYSBjb3VudGVyIG9mIGhvdyBtdWNoIGRhdGEgaXMgY3Vy
cmVudGx5IHF1ZXVlZAo+PiBpbiB0aGUgZmlybXdhcmU/Cj4gWWVzLgo+PiAKPj4gPj4gQW5kIGNv
dWxkIHlvdSBleHBsYWluIHdoYXQgdGhlIGNyZWRpdHMgdGhpbmcgaXMgZm9yLCBwbGVhc2U/IDop
Cj4+ID4gRm9yIGhpZ2ggbGF0ZW5jeSBidXMgY2hpcCwgYWxsIHRoZSB0eCBkYXRhJ3MgY29udGVu
dChpbmNsdWRlIGlwL3VkcC90Y3AKPj4gaGVhZGVyCj4+ID4gYW5kIHBheWxvYWQpIHdpbGwgYmUg
dHJhbnNmZXIgdG8gZmlybXdhcmUncyBtZW1vcnkgdmlhIGJ1cy4KPj4gPiBBbmQgZmlybXdhcmUg
aGFzIGxpbWl0ZWQgbWVtb3J5IGZvciB0eCBkYXRhLCB0aGUgdHggZGF0YSdzIGNvbnRlbnQgbXVz
dAo+PiA+IFNhdmVkIGluIGZpcm13YXJlIG1lbW9yeSBiZWZvcmUgaXQgdHggY29tcGxldGUsIGlm
IGF0aDEwayB0cmFuc2ZlciB0eAo+PiA+IGRhdGEgbW9yZSB0aGFuIHRoZSBsaW1pdCwgZmlybXdh
cmUgd2lsbCBvY2N1ciBlcnJvci4gVGhlIGNyZWRpdCBpcyB1c2VkCj4+ID4gdG8gYXZvaWQgYXRo
MTBrIGV4Y2VlZCB0aGUgbGltaXQuCj4+IAo+PiBXaGF0J3MgYSB0eXBpY2FsIGxpbWl0IGluIHRo
ZSBmaXJtd2FyZT8KPiBJdCBpcyA5NiBkYXRhIHBhY2tldCBpbiBteSB0ZXN0LiBJdCBjYW4gY2hh
bmdlZCBpbiBmaXJtd2FyZSBjb2RlLgoKUmlnaHQsIEkgc2VlLiBJcyB0aGlzIGNvdW50ZXIgYXZh
aWxhYmxlIGluIGFsbCBhdGgxMGsgZmlybXdhcmUsIG9yIGlzIGl0ClNESU8gb25seT8KCkknbSBh
c2tpbmcgYmVjYXVzZSB0aGlzIGNvdWxkIGFsc28gYmUgYSB3YXkgb2YgaW1wbGVtZW50aW5nIHNv
bWV0aGluZwpsaWtlIEJ5dGUgUXVldWUgTGltaXRzICh0aG91Z2ggSSdtIG5vdCBzdXJlIGhvdyBl
ZmZlY3RpdmUgaXQgd291bGQgYmUpLgoKLVRva2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
dGgxMGsK
