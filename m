Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-tai-02.qualcomm.com ([103.229.16.227])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0Nje-0006UX-DA
 for ath10k@lists.infradead.org; Wed, 21 Aug 2019 10:21:01 +0000
Subject: RE: [PATCH 4/7] ath10k: disable TX complete indication of htt for sdio
From: Wen Gong <wgong@qti.qualcomm.com>
Date: Wed, 21 Aug 2019 10:20:48 +0000
Message-ID: <86d0eabcc63849efa914f2c14a3cd59f@aptaiexm02f.ap.qualcomm.com>
References: <1566302108-18219-1-git-send-email-wgong@codeaurora.org>
 <1566302108-18219-5-git-send-email-wgong@codeaurora.org>
 <87blwkt480.fsf@toke.dk>
 <00992d0991704b0fae73a500bb2eb504@aptaiexm02f.ap.qualcomm.com>
 <8736husub0.fsf@toke.dk>
In-Reply-To: <8736husub0.fsf@toke.dk>
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
ZW5zZW4gPHRva2VAcmVkaGF0LmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBBdWd1c3QgMjEsIDIw
MTkgNjoxMCBQTQ0KPiBUbzogV2VuIEdvbmcgPHdnb25nQHF0aS5xdWFsY29tbS5jb20+OyBXZW4g
R29uZw0KPiA8d2dvbmdAY29kZWF1cm9yYS5vcmc+OyBhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9y
Zw0KPiBDYzogbGludXgtd2lyZWxlc3NAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFtFWFRd
IFJFOiBbUEFUQ0ggNC83XSBhdGgxMGs6IGRpc2FibGUgVFggY29tcGxldGUgaW5kaWNhdGlvbiBv
ZiBodHQNCj4gZm9yIHNkaW8NCj4gDQo+IFdlbiBHb25nIDx3Z29uZ0BxdGkucXVhbGNvbW0uY29t
PiB3cml0ZXM6DQo+IA0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9t
OiBhdGgxMGsgPGF0aDEway1ib3VuY2VzQGxpc3RzLmluZnJhZGVhZC5vcmc+IE9uIEJlaGFsZiBP
ZiBUb2tlDQo+ID4+IEjDuGlsYW5kLUrDuHJnZW5zZW4NCj4gPj4gU2VudDogVHVlc2RheSwgQXVn
dXN0IDIwLCAyMDE5IDg6MjQgUE0NCj4gPj4gVG86IFdlbiBHb25nIDx3Z29uZ0Bjb2RlYXVyb3Jh
Lm9yZz47IGF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnDQo+ID4+IENjOiBsaW51eC13aXJlbGVz
c0B2Z2VyLmtlcm5lbC5vcmcNCj4gPj4gU3ViamVjdDogW0VYVF0gUmU6IFtQQVRDSCA0LzddIGF0
aDEwazogZGlzYWJsZSBUWCBjb21wbGV0ZSBpbmRpY2F0aW9uIG9mDQo+IGh0dA0KPiA+IFdoZW4g
dGhpcyBwYXRjaCBhcHBsaWVkLCBmaXJtd2FyZSB3aWxsIG5vdCBpbmRpY2F0ZSB0eCBjb21wbGV0
ZSBmb3IgdHgNCj4gPiBEYXRhLCBpdCBvbmx5IGluZGljYXRlIEhUVF9UMkhfTVNHX1RZUEVfVFhf
Q1JFRElUX1VQREFURV9JTkQsDQo+ID4gVGhpcyBodHQgbXNnIHdpbGwgdGVsbCBob3cgbWFueSBk
YXRhIHR4IGNvbXBsZXRlIHdpdGhvdXQgc3RhdHVzKHN0YXR1cw0KPiBtYXliZSBzdWNjZXNzL2Zh
aWwpLg0KPiANCj4gQWgsIHNvIHRoaXMgaXMgYmFzaWNhbGx5IGEgY291bnRlciBvZiBob3cgbXVj
aCBkYXRhIGlzIGN1cnJlbnRseSBxdWV1ZWQNCj4gaW4gdGhlIGZpcm13YXJlPw0KWWVzLg0KPiAN
Cj4gPj4gQW5kIGNvdWxkIHlvdSBleHBsYWluIHdoYXQgdGhlIGNyZWRpdHMgdGhpbmcgaXMgZm9y
LCBwbGVhc2U/IDopDQo+ID4gRm9yIGhpZ2ggbGF0ZW5jeSBidXMgY2hpcCwgYWxsIHRoZSB0eCBk
YXRhJ3MgY29udGVudChpbmNsdWRlIGlwL3VkcC90Y3ANCj4gaGVhZGVyDQo+ID4gYW5kIHBheWxv
YWQpIHdpbGwgYmUgdHJhbnNmZXIgdG8gZmlybXdhcmUncyBtZW1vcnkgdmlhIGJ1cy4NCj4gPiBB
bmQgZmlybXdhcmUgaGFzIGxpbWl0ZWQgbWVtb3J5IGZvciB0eCBkYXRhLCB0aGUgdHggZGF0YSdz
IGNvbnRlbnQgbXVzdA0KPiA+IFNhdmVkIGluIGZpcm13YXJlIG1lbW9yeSBiZWZvcmUgaXQgdHgg
Y29tcGxldGUsIGlmIGF0aDEwayB0cmFuc2ZlciB0eA0KPiA+IGRhdGEgbW9yZSB0aGFuIHRoZSBs
aW1pdCwgZmlybXdhcmUgd2lsbCBvY2N1ciBlcnJvci4gVGhlIGNyZWRpdCBpcyB1c2VkDQo+ID4g
dG8gYXZvaWQgYXRoMTBrIGV4Y2VlZCB0aGUgbGltaXQuDQo+IA0KPiBXaGF0J3MgYSB0eXBpY2Fs
IGxpbWl0IGluIHRoZSBmaXJtd2FyZT8NCkl0IGlzIDk2IGRhdGEgcGFja2V0IGluIG15IHRlc3Qu
IEl0IGNhbiBjaGFuZ2VkIGluIGZpcm13YXJlIGNvZGUuDQo+IA0KPiAtVG9rZQ0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlz
dAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
