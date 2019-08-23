Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-tai-01.qualcomm.com ([103.229.16.226])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0zbD-00068x-9M
 for ath10k@lists.infradead.org; Fri, 23 Aug 2019 02:46:48 +0000
Subject: RE: [PATCH 4/7] ath10k: disable TX complete indication of htt for sdio
From: Wen Gong <wgong@qti.qualcomm.com>
Date: Fri, 23 Aug 2019 02:46:36 +0000
Message-ID: <250d064103394dfd864c1281f0da3d83@aptaiexm02f.ap.qualcomm.com>
References: <1566302108-18219-1-git-send-email-wgong@codeaurora.org>
 <1566302108-18219-5-git-send-email-wgong@codeaurora.org>
 <87blwkt480.fsf@toke.dk>
 <00992d0991704b0fae73a500bb2eb504@aptaiexm02f.ap.qualcomm.com>
 <8736husub0.fsf@toke.dk>
 <86d0eabcc63849efa914f2c14a3cd59f@aptaiexm02f.ap.qualcomm.com>
 <874l29pffy.fsf@toke.dk>
In-Reply-To: <874l29pffy.fsf@toke.dk>
Content-Language: en-US
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
To: =?utf-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>, Wen Gong <wgong@codeaurora.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBUb2tlIEjDuGlsYW5kLUrDuHJn
ZW5zZW4gPHRva2VAcmVkaGF0LmNvbT4NCj4gU2VudDogVGh1cnNkYXksIEF1Z3VzdCAyMiwgMjAx
OSA4OjEyIFBNDQo+IFRvOiBXZW4gR29uZyA8d2dvbmdAcXRpLnF1YWxjb21tLmNvbT47IFdlbiBH
b25nDQo+IDx3Z29uZ0Bjb2RlYXVyb3JhLm9yZz47IGF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3Jn
DQo+IENjOiBsaW51eC13aXJlbGVzc0B2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogW0VYVF0g
UkU6IFtQQVRDSCA0LzddIGF0aDEwazogZGlzYWJsZSBUWCBjb21wbGV0ZSBpbmRpY2F0aW9uIG9m
IGh0dA0KPiBmb3Igc2Rpbw0KPiA+PiBXaGF0J3MgYSB0eXBpY2FsIGxpbWl0IGluIHRoZSBmaXJt
d2FyZT8NCj4gPiBJdCBpcyA5NiBkYXRhIHBhY2tldCBpbiBteSB0ZXN0LiBJdCBjYW4gY2hhbmdl
ZCBpbiBmaXJtd2FyZSBjb2RlLg0KPiANCj4gUmlnaHQsIEkgc2VlLiBJcyB0aGlzIGNvdW50ZXIg
YXZhaWxhYmxlIGluIGFsbCBhdGgxMGsgZmlybXdhcmUsIG9yIGlzIGl0DQo+IFNESU8gb25seT8N
Cj4gDQpJdCBpcyBvbmx5IGZvciBTRElPLg0KRm9yIFBDSUUsIGl0IGRvZXMgbm90IGhhdmUgY3Jl
ZGl0IGxpbWl0LCBmaXJtd2FyZSBtZW1vcnkgb25seSBuZWVkIHRvIHNhdmUNClRoZSB0eCBkZXNj
cmlwdG9yLCBub3QgbmVlZCBmb3IgcGFseWxvYWQuDQo+IEknbSBhc2tpbmcgYmVjYXVzZSB0aGlz
IGNvdWxkIGFsc28gYmUgYSB3YXkgb2YgaW1wbGVtZW50aW5nIHNvbWV0aGluZw0KPiBsaWtlIEJ5
dGUgUXVldWUgTGltaXRzICh0aG91Z2ggSSdtIG5vdCBzdXJlIGhvdyBlZmZlY3RpdmUgaXQgd291
bGQgYmUpLg0KPiANCj4gLVRva2UNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
