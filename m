Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ie0-x22e.google.com ([2607:f8b0:4001:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z0CfB-0004KU-FQ
 for ath10k@lists.infradead.org; Wed, 03 Jun 2015 17:41:14 +0000
Received: by iesa3 with SMTP id a3so18757367ies.2
 for <ath10k@lists.infradead.org>; Wed, 03 Jun 2015 10:40:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQk+SGtFHwTMJ6c-Qzu-5NFaLTeX5Bsa_38mHiqLrxWOPw@mail.gmail.com>
References: <1433187843-20698-1-git-send-email-cfliu.tw@gmail.com>
 <CA+BoTQmhEUegGBLHv6-CZHAhAQdJUUVSRXs6S5kTW82fLFA5hQ@mail.gmail.com>
 <CAG5N3qHRtYMkKj=HcuF_Jg0-f8MxqVnEVm55jMNt=1xC_PhLUw@mail.gmail.com>
 <CA+BoTQk+SGtFHwTMJ6c-Qzu-5NFaLTeX5Bsa_38mHiqLrxWOPw@mail.gmail.com>
From: "Liu CF/TW" <cfliu.tw@gmail.com>
Date: Wed, 3 Jun 2015 10:40:11 -0700
Message-ID: <CAG5N3qGejd0z9TMHvtwBDuE7q+Ry4+_ACo6rDLwPnt8ffWc84w@mail.gmail.com>
Subject: Re: [PATCH 1/2] ath10k: add cryptmode param to support sw crypto and
 raw tx injection.
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9ody5oIGIv
ZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9ody5oCj4+Pj4gaW5kZXggODVjY2EyOS4u
MzdmZDJmODMgMTAwNjQ0Cj4+Pj4gLS0tIGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEw
ay9ody5oCj4+Pj4gKysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9ody5oCj4+
Pj4gQEAgLTI5Niw3ICsyOTYsNyBAQCBlbnVtIGF0aDEwa19od19yYXRlX2NjayB7Cj4+Pj4gICNk
ZWZpbmUgVEFSR0VUXzEwWF9SWF9TS0lQX0RFRlJBR19USU1FT1VUX0RVUF9ERVRFQ1RJT05fQ0hF
Q0sgMQo+Pj4+ICAjZGVmaW5lIFRBUkdFVF8xMFhfVk9XX0NPTkZJRyAgICAgICAgICAgICAgICAg
IDAKPj4+PiAgI2RlZmluZSBUQVJHRVRfMTBYX05VTV9NU0RVX0RFU0MgICAgICAgICAgICAgICAo
MTAyNCArIDQwMCkKPj4+PiAtI2RlZmluZSBUQVJHRVRfMTBYX01BWF9GUkFHX0VOVFJJRVMgICAg
ICAgICAgICAwCj4+Pj4gKyNkZWZpbmUgVEFSR0VUXzEwWF9NQVhfRlJBR19FTlRSSUVTICAgICAg
ICAgICAgMTAKPj4+Cj4+PiBUaGlzIGlzIHByb2JhYmx5IGVub3VnaCBhdCAiMiIgKGF0aDEwayBk
b2Vzbid0IHNlbmQgbW9yZSB0aGFuIDIgdHgKPj4+IGZyYWdtZW50cyBub3cpLiBJIGFzc3VtZSBm
dyBjcmFzaGVzIHdpdGggcmF3IHR4IGlmIHRoaXMgaXNuJ3QgZml4ZWQsCj4+PiBjb3JyZWN0Pwo+
Pj4KPj4+IFNpZGVub3RlOiBJIGd1ZXNzIFRBUkdFVF9NQVhfRlJBR19FTlRSSUVTIGNvdWxkIGJl
IGZpeGVkIGFzIHdlbGwuIEl0Cj4+PiBtaWdodCBtYWtlIHNlbnNlIGZvciBRQ0E2MVg0IGh3Mi4x
IHdoaWNoIHN0aWxsIHVzZXMgdGhlIG9sZCBSeAo+Pj4gaW5kaWNhdGlvbiBldmVudCBhbmQgbWln
aHQgYmUgYWJsZSB0byBkbyByYXcgdHhyeCArIHN3Y3J5cHRvLiBCdXQgSSdtCj4+PiBhIGJpdCBy
ZWx1Y3RhbnQgdG8gY2hhbmdlIHRoaXMgd2l0aG91dCBhbnkgdGVzdGluZy4KPj4+Cj4+Cj4+IFN1
cmUuIEkgY2hhbmdlIGl0IHRvIDEwIGJlY2F1c2UgdGhlIGRvY3VtZW50IEkgZ290IGZyb20gUUNB
IHNheXMgc28uCj4+IFNpbmNlIHRoaXMgaXMgYSBnbG9iYWwgc2V0dGluZywgSSB3aWxsIHJlbW92
ZSB0aGlzIGFuZCBrZWVwIGl0ID0wIGZvcgo+PiBub3cgc28gaXQgZG9lc24ndCBhZmZlY3QgZXhp
c3RpbmcgSFcgYmFzZWQgZGF0YXBhdGguCj4KPiBTdXJlLiBJIHJlY2FsbCAxMC54IG9uIFFDQTk4
OFggaXNuJ3QgcmVhbGx5IHBpY2t5IG9uIHRoaXMgdmFsdWUuCj4gUUNBNjFYNCB3aXRoIHdtaS10
bHYgb24gdGhlIG90aGVyIGhhbmQgbmVlZHMgYW4gYWRlcXVhdGUgdmFsdWUgZm9yCj4gdGhpcyBj
b25maWd1cmF0aW9uIHBhcmFtZXRlciBvciBpdCdsbCBjcmFzaCBob3JyaWJseS4KPgo+Cj4+IFBl
ciBRQ0EsIHRoZSBtYWluIGlzc3VlIG5vdCBjaGFuZ2luZyB0aGlzIHdvdWxkIGJlIFNXIGNyeXB0
byB0aGVuCj4+IHdvbid0IGJlIGFibGUgdG8gaGFuZGxlIGxhcmdlIFJ4IEFNU0RVLgo+PiBXaGVu
IEhXIGlzIG5vdCBkb2luZyBSeCBkZWNyeXB0aW9uLCB0aGUgd2hvbGUgQU1TRFUgbmVlZHMgdG8g
YmUgRE1BIHRvCj4+IGhvc3QgZm9yIFNXIGJhc2VkIGRlY3J5cHRpb24gJiBBTVNEVSBzdWJmcmFt
ZSBkZWFnZ3JlZ2F0aW9uLgo+Cj4gSG1tLi4gRnJvbSB3aGF0IEkga25vdyB0aGlzIHNldHRpbmcg
cmVmZXJzIHRvIHRoZSBtYXggbnVtYmVyIG9mIFR4Cj4gZnJhZ21lbnRzIHRoYXQgY2FuIGJlIHN1
Ym1pdHRlZCB2aWEgSFRUIFRYX0ZSTSBjb21tYW5kIGV2ZW50dWFsbHkgdG8KPiBIVyBNQUMsIG5v
dCBSeCBmcmFnbWVudHMuCj4KClllYWggeW91IGFyZSByaWdodC4gSSBjaGVja2VkIHRoZSBRQ0En
cyBQREYgYWdhaW4gYW5kIGluZGVlZCBpdCdzIGZvcgpUeCBub3QgZm9yIFJ4LgoKRGF2aWQKPgo+
IE1pY2hhxYIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
