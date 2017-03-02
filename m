Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cjPES-00042b-7A
 for ath10k@lists.infradead.org; Thu, 02 Mar 2017 11:49:17 +0000
From: "Raja, Tamizh Chelvam" <c_traja@qti.qualcomm.com>
Subject: RE: [PATCHv2 3/4] cfg80211: Add Support set btcoex priority value
Date: Thu, 2 Mar 2017 11:48:48 +0000
Message-ID: <b55e902d1a5445feb3058cee1118ae39@aphydexm01f.ap.qualcomm.com>
References: <1488029873-14600-1-git-send-email-c_traja@qti.qualcomm.com>
 <1488029873-14600-4-git-send-email-c_traja@qti.qualcomm.com>
 <1488444659.8390.8.camel@sipsolutions.net>
In-Reply-To: <1488444659.8390.8.camel@sipsolutions.net>
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
To: Johannes Berg <johannes@sipsolutions.net>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

PiBJcyB0aGVyZSBtdWNoIHBvaW50IGluIGhhdmluZyA0IHJhdGhlciB0aGFuIGp1c3QgMiBwYXRj
aGVzPw0KPg0KW1RhbWl6aF0gWWVzLCBJIGFncmVlIHRvIGl0LiANCj4gDQo+ID4gKwlpbnTCoMKg
wqDCoMKgKCpzZXRfYnRjb2V4KShzdHJ1Y3Qgd2lwaHkgKndpcGh5LCBib29sIGVuYWJsZWQsDQo+
ID4gKwkJCcKgwqDCoMKgwqDCoGludCBidGNvZXhfcHJpb3JpdHkpOw0KPiANCj4gU2hvdWxkbid0
IHRoYXQgYmUgdTMyIGFzIGEgYml0bWFwPw0KPiANCltUYW1pemhdIFllcy4NCg0KPiA+ICsJYm9v
bCBidGNvZXhfcHJpb3JpdHlfc3VwcG9ydDsNCj4gDQo+IFdoeSBub3QgdXNlIGFuIGV4dGVuZGVk
IG5sODAyMTEgZmVhdHVyZSBmbGFnIGRpcmVjdGx5Pw0KPiANCltUYW1pemhdIE9rIHN1cmUuIEkn
bGwgdXNlIGV4dGVuZGVkIG5sODAyMTEgZmVhdHVyZSBmbGFnLg0KDQo+ID4gKyAqIEBOTDgwMjEx
X0FUVFJfQlRDT0VYX1BSSU9SSVRZOiBUaGlzIGlzIGZvciB0aGUgZHJpdmVyIHdoaWNoDQo+ID4g
KyAqwqDCoMKgwqDCoHN1cHBvcnQgYnRjb2V4IHByaW9yaXR5IGZlYXR1cmUuIEl0IHVzZWQgd2l0
aA0KPiA+ICVOTDgwMjExX0NNRF9TRVRfQlRDT0VYLg0KPiA+ICsgKsKgwqDCoMKgwqBUaGlzIHdp
bGwgaGF2ZSB1MzIgQklUTUFQIHZhbHVlIHdoaWNoIHJlcHJlc2VudHMNCj4gPiArICrCoMKgwqDC
oMKgZnJhbWUoYmssIGJlLCB2aSwgdm8sIG1nbXQsIGJlYWNvbikgdHlwZSBhbmQgdGhhdCB3aWxs
IGhhdmUNCj4gPiBtb3JlDQo+ID4gKyAqwqDCoMKgwqDCoHByaW9yaXR5IHRoYW4gYSBCVCB0cmFm
ZmljLg0KPiANCj4gSSB0aGluayB5b3UgbmVlZCB0byBkZWZpbmUgdGhlIGJpdHMgc29tZXdoZXJl
IGluIGFuIGVudW0gLSBpLmUuIHdoaWNoIG9uZSBpcyBWTywNCj4gVkksIC4uLg0KPg0KW1RhbWl6
aF0gb2sgc3VyZS4gSXMgdGhpcyBmb3IgZG9jdW1lbnRhdGlvbiBwdXJwb3NlIG9yIGRvIHlvdSB3
YW50IG1lIHRvIHVzZSB0aGF0IA0KZW51bSBmb3Igc29tZXRoaW5nIGVsc2U/DQogDQo+ID4gKwlp
bnQgYnRjb2V4X3ByaW9yaXR5ID0gLTE7DQo+IA0KPiBUaGF0IC0xIGlzIHByZXR0eSB1c2VsZXNz
LCBpZiB0aGUgZHJpdmVyIGRvZXNuJ3Qgc3VwcG9ydCBpdCwgaG9wZWZ1bGx5IGl0IHdvbid0IGxv
b2sNCj4gYXQgdGhlIHZhbHVlIGF0IGFsbD8NCj4gDQpbVGFtaXpoXSBPayBzdXJlDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBs
aXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
