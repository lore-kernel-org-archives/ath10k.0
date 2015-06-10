Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from lanada.kaist.ac.kr ([143.248.57.170])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2kH0-0002ql-AV
 for ath10k@lists.infradead.org; Wed, 10 Jun 2015 17:58:47 +0000
Received: from localhost (lanada.kaist.ac.kr [127.0.0.1])
 by lanada.kaist.ac.kr (Postfix) with ESMTP id 4A0F413FDED2
 for <ath10k@lists.infradead.org>; Thu, 11 Jun 2015 03:04:40 +0900 (KST)
Received: from lanada.kaist.ac.kr ([127.0.0.1])
 by localhost (lanada.kaist.ac.kr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KXDVLGCCP1CY for <ath10k@lists.infradead.org>;
 Thu, 11 Jun 2015 03:04:39 +0900 (KST)
MIME-Version: 1.0
Date: Thu, 11 Jun 2015 03:04:31 +0900
From: Sangwoo Moon <swmoon@lanada.kaist.ac.kr>
Subject: Re: [PATCH v2] ath10k: enable VHT for IBSS
In-Reply-To: <1433913284-18444-1-git-send-email-janusz.dziedzic@tieto.com>
References: <1433913284-18444-1-git-send-email-janusz.dziedzic@tieto.com>
Message-ID: <911fece613ad9dd7975e53ac808fd495@lanada.kaist.ac.kr>
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
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

SGVsbG8sCgpUaGFua3MgbXVjaCBmb3IgeW91ciBoZWxwLgpIb3dldmVyLCBJIGhhdmUgbG9va2Vk
IGF0IG15IGRyaXZlciBjb2RlIGFuZApkaWQgbm90IGZpbmQgYW55IGltcGxlbWVudGF0aW9ucyBz
dWNoIGFzIHdpcGh5X2V4dF9mZWF0dXJlX3NldCgpCm9yIE5MODAyMTFfRVhUX0ZFQVRVUkVfVkhU
X0lCU1MuCkl0IHNlZW1zIG5vdCBzaW1wbGUgdG8gYXBwbHkgeW91ciBwYXRjaCBpbnRvIG15IHZl
cnNpb24gb2YgYXRoMTBrIGRldmljZSAKZHJpdmVyLgpJIGFtIGN1cnJlbnRseSB1c2luZyBiYWNr
cG9ydHMtMy4xNi1yYzEtMSBmb3IgYXRoMTBrIGRldmljZSBkcml2ZXIgY29kZQppbiBvcmRlciB0
byBtYXRjaCB0aGUga2VybmVsIHZlcnNpb24gdjMuMTYgZm9yIFVidW50dSAxNC4wNC4wMi4KCkNv
dWxkIHlvdSB0ZWxsIG1lIHRoZSB2ZXJzaW9uIG9mIGtlcm5lbCBhbmQgYXRoMTBrIGRldmljZSBk
cml2ZXIgb2YgeW91cgp0ZXN0IGNvbmZpZ3VyYXRpb24/Ck9yIGlzIHRoZXJlIGFueSB3YXkgdG8g
YXBwbHkgeW91ciB2ZXJzaW9uIG9mIHBhdGNoIGNvZGUgaW50byBsaW51eCAKa2VybmVsIHYzLjE2
PwooSSBleHBlY3QgdGhlIHZlcnNpb24gd2lsbCBiZSBtdWNoIG1vcmUgcmVjZW50IG9uZSB0aGFu
IG1pbmUpCgpUaGFua3MsCi0tU2FuZ3dvbyBNb29uCgoyMDE1LTA2LTEwIDE0OjE07JeQIEphbnVz
eiBEemllZHppY+ydtCjqsIApIOyekeyEse2VnCDrgrTsmqk6Cj4gRW5hYmxlIFZIVCBzdXBwb3J0
IGZvciBJQlNTLCB3aGlsZSBtYWM4MDIxMS9jZmc4MDIxMSBhbmQKPiB3cGFfc3VwcGxpY2FudCBh
bHJlYWR5IHN1cHBvcnQgdGhpcy4KPiAKPiBJbiBteSB0ZXN0IGVudiwgYXRoMTBrIDJ4MiBJIGdl
dDoKPiAodWRwKSBhdGgxMGstMSA+Pj4+IGF0aDEway0yIChzZXJ2ZXIpIC0gIHNwZWVkOiA0MTkg
TWJpdHMvc2VjCj4gKHRjcCkgYXRoMTBrLTEgPj4+PiBhdGgxMGstMiAoc2VydmVyKSAtICBzcGVl
ZDogNDA0IE1iaXRzL3NlYwo+IAo+IER1cmluZyB0ZXN0cyBJIHVzZWQgd3BhX3N1cHBsaWNhbnQg
KGN1cnJlbnQgdmVyc2lvbiksIHdoaWNoCj4gYWxyZWFkeSBzdXBwb3J0IElCU1MgVkhULCBhbmQg
Y2hvb3NlIGhpZ2hlc3QgYXZhaWxhYmxlIEJXLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbnVzeiBE
emllZHppYyA8amFudXN6LmR6aWVkemljQHRpZXRvLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9uZXQv
d2lyZWxlc3MvYXRoL2F0aDEway9tYWMuYyB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRo
MTBrL21hYy5jCj4gYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL21hYy5jCj4gaW5k
ZXggZjRkZTcxNy4uMTRhOGYyNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9h
dGgvYXRoMTBrL21hYy5jCj4gKysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9t
YWMuYwo+IEBAIC02OTQ5LDYgKzY5NDksOCBAQCBpbnQgYXRoMTBrX21hY19yZWdpc3RlcihzdHJ1
Y3QgYXRoMTBrICphcikKPiAgCQlnb3RvIGVycl9mcmVlOwo+ICAJfQo+IAo+ICsJd2lwaHlfZXh0
X2ZlYXR1cmVfc2V0KGFyLT5ody0+d2lwaHksIE5MODAyMTFfRVhUX0ZFQVRVUkVfVkhUX0lCU1Mp
Owo+ICsKPiAgCS8qCj4gIAkgKiBvbiBMTCBoYXJkd2FyZSBxdWV1ZXMgYXJlIG1hbmFnZWQgZW50
aXJlbHkgYnkgdGhlIEZXCj4gIAkgKiBzbyB3ZSBvbmx5IGFkdmVydGlzZSB0byBtYWMgd2UgY2Fu
IGRvIHRoZSBxdWV1ZXMgdGhpbmcKCi0tIApTYW5nd29vIE1vb24sIFBoLkQuIENhbmRpZGF0ZQpE
ZXB0LiBvZiBFRSwgS0FJU1QsIEtvcmVhCihPZmZpY2UpICs4Mi00Mi0zNTAtNTQ4NiwgTjEtIzgx
OQooRS1tYWlsKSBzd21vb24gYXQgbGFuYWRhLmthaXN0LmFjLmtyCihVUkwpIGh0dHA6Ly9sYW5h
ZGEua2Fpc3QuYWMua3IKR3dhaGFuZ25vIDMzNSwgWXVzZW9uZy1HdSBEYWVqZW9uLCBTLiBLb3Jl
YSAzMDUtNzAxCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
