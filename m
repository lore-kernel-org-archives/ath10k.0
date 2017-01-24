Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cVtVj-0002j4-Iv
 for ath10k@lists.infradead.org; Tue, 24 Jan 2017 05:19:17 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 2/3] ath10k: use dma_zalloc_coherent()
Date: Tue, 24 Jan 2017 05:18:49 +0000
Message-ID: <8737g9ox1k.fsf@qca.qualcomm.com>
References: <1485183876-27080-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1485183876-27080-2-git-send-email-srinivas.kandagatla@linaro.org>
 <1485213569.12563.32.camel@perches.com>
In-Reply-To: <1485213569.12563.32.camel@perches.com> (Joe Perches's message of
 "Mon, 23 Jan 2017 15:19:29 -0800")
Content-Language: en-US
Content-ID: <38F78C300A1A754E9111BE621A5D15A6@qualcomm.com>
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
To: Joe Perches <joe@perches.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>

Sm9lIFBlcmNoZXMgPGpvZUBwZXJjaGVzLmNvbT4gd3JpdGVzOg0KDQo+IE9uIE1vbiwgMjAxNy0w
MS0yMyBhdCAxNTowNCArMDAwMCwgU3Jpbml2YXMgS2FuZGFnYXRsYSB3cm90ZToNCj4+IHVzZSBk
bWFfemFsbG9jX2NvaGVyZW50KCkgaW5zdGVhZCBvZiBkbWFfYWxsb2NfY29oZXJlbnQgYW5kIG1l
bXNldCgpLg0KPiBbXQ0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9h
dGgxMGsvcGNpLmMgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3BjaS5jDQo+IFtd
DQo+PiBAQCAtODk2LDcgKzg5Niw3IEBAIHN0YXRpYyBpbnQgYXRoMTBrX3BjaV9kaWFnX3JlYWRf
bWVtKHN0cnVjdCBhdGgxMGsgKmFyLCB1MzIgYWRkcmVzcywgdm9pZCAqZGF0YSwNCj4+ICAJICov
DQo+PiAgCWFsbG9jX25ieXRlcyA9IG1pbl90KHVuc2lnbmVkIGludCwgbmJ5dGVzLCBESUFHX1RS
QU5TRkVSX0xJTUlUKTsNCj4+ICANCj4+IC0JZGF0YV9idWYgPSAodW5zaWduZWQgY2hhciAqKWRt
YV9hbGxvY19jb2hlcmVudChhci0+ZGV2LA0KPj4gKwlkYXRhX2J1ZiA9ICh1bnNpZ25lZCBjaGFy
ICopZG1hX3phbGxvY19jb2hlcmVudChhci0+ZGV2LA0KPj4gIAkJCQkJCSAgICAgICBhbGxvY19u
Ynl0ZXMsDQo+PiAgCQkJCQkJICAgICAgICZjZV9kYXRhX2Jhc2UsDQo+PiAgCQkJCQkJICAgICAg
IEdGUF9BVE9NSUMpOw0KPg0KPiB0cml2aWE6DQo+DQo+IE5pY2VyIHRvIHJlYWxpZ24gYXJndW1l
bnRzIGFuZCByZW1vdmUgdGhlIHVubmVjZXNzYXJ5IGNhc3QuDQo+DQo+IFBlcmhhcHM6DQo+DQo+
IAlkYXRhX2J1ZiA9IGRtYV96YWxsb2NfY29oZXJlbnQoYXItPmRldizCoGFsbG9jX25ieXRlcywg
JmNlX2RhdGFfYmFzZSwNCj4gCQkJCSAgICAgIMKgR0ZQX0FUT01JQyk7DQoNClN1cmUsIGJ1dCB0
aGF0IHNob3VsZCBiZSBpbiBhIHNlcGFyYXRlIHBhdGNoLg0KDQotLSANCkthbGxlIFZhbG8KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxp
bmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
