Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-bk0-x232.google.com ([2a00:1450:4008:c01::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V7MXK-0004X7-Rh
 for ath10k@lists.infradead.org; Thu, 08 Aug 2013 09:29:39 +0000
Received: by mail-bk0-f50.google.com with SMTP id mz11so596226bkb.9
 for <ath10k@lists.infradead.org>; Thu, 08 Aug 2013 02:29:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <871u6435c6.fsf@kamboji.qca.qualcomm.com>
References: <1375949298-7159-1-git-send-email-michal.kazior@tieto.com>
 <1375949298-7159-4-git-send-email-michal.kazior@tieto.com>
 <87eha4363n.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQnoVmQcMnajTx3vsKwct5PLCNOt6w2qo17fyigm=gO5-w@mail.gmail.com>
 <871u6435c6.fsf@kamboji.qca.qualcomm.com>
Date: Thu, 8 Aug 2013 11:29:15 +0200
Message-ID: <CA+BoTQnsH6XxpgoBh0tTNCjXvNz-fL6OaCp=LP-Eap_4tqYNkw@mail.gmail.com>
Subject: Re: [RFC 3/3] ath10k: add support for HTT 3.0
From: Michal Kazior <michal.kazior@tieto.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

T24gOCBBdWd1c3QgMjAxMyAxMToyMiwgS2FsbGUgVmFsbyA8a3ZhbG9AcWNhLnF1YWxjb21tLmNv
bT4gd3JvdGU6Cj4gTWljaGFsIEthemlvciA8bWljaGFsLmthemlvckB0aWV0by5jb20+IHdyaXRl
czoKPgo+PiBPbiA4IEF1Z3VzdCAyMDEzIDExOjA1LCBLYWxsZSBWYWxvIDxrdmFsb0BxY2EucXVh
bGNvbW0uY29tPiB3cm90ZToKPgo+Pj4gVGhpcyBkZWJ1ZyBwcmludCBpcyBnb29kIHRvIGhhdmUs
IGJ1dCB3aXRoIHRoZSBuZXcgaHR0IHZlcnNpb24gaXQgd291bGQKPj4+IGJlIGdvb2QgdG8gcHJp
bnQgaXQgYWx3YXlzIHVzaW5nIHRoZSBpbmZvIGxldmVsLiBGb3IgZXhhbXBsZSwgY2FuIHdlIGFk
ZAo+Pj4gaXQgdG8gdGhlIHNhbWUgbGluZSB3aXRoICJmaXJtd2FyZSAlcyBib290ZWQiIHN0cmlu
Zz8KPj4KPj4gSFRUIHRhcmdldCB2ZXJzaW9uIGlzIG5vdCBrbm93biB3aGVuIGZpcm13YXJlIGJv
b3RzIHVwLiBJdCdzIG5vdCBrbm93bgo+PiB1bnRpbCBldmVyeXRoaW5nIG90aGVyIChIVEMsIFdN
SSkgaXMgc2V0IHVwLiBXZSB0aGVuIHNlbmQgYSB2ZXJzaW9uCj4+IHJlcXVlc3QgY29tbWFuZCBh
bmQgd2UgZ2V0IGEgcmVzcG9uc2UuCj4KPiBPaCwgbWlzc2VkIHRoYXQuCj4KPj4gV2UgbmVlZCB0
byBwcmludCBpdCBpbiBhIHNlcGFyYXRlIGxpbmUuCj4KPiBPciBjb3VsZCB3ZSBwcmludCB0aGUg
ImZpcm13YXJlIGJvb3RlZCIgbWVzc2FnZSBsYXRlcj8KCkknbSB3b3JyaWVkIGl0IG1heSBiZSBl
cnJvci1wcm9uZSBpbiBjYXNlIG9mIGZpcm13YXJlIGxvYWRpbmcgZmFpbHVyZQppbi1iZXR3ZWVu
IChpLmUuIGZpcm13YXJlIGlzIGJvb3RlZCwgYnV0IFdNSSBpbml0IGZhaWxzKS4gV2UnZCBuZWVk
IHRvCnByaW50IHRoZSBmaXJtd2FyZSB2ZXJzaW9uIGluIHRoZSBlcnJvciBwYXRoIHRoZW4uCgoK
Pgo+Pj4gKFBsZWFzZSB0YWtlIGludG8gYWNjb3VudCB0aGF0IHRoZSBpbmZvIG1lc3NhZ2VzIHN0
aWxsIG5lZWQgdG8gYmUKPj4+IGNvbXBhY3QsIGJ5IGRlZmF1bHQgdGhleSBzaG91bGQgbm90IGJl
IGxvbmdlciB0aGFuIGZpdmUgbGluZXMgb3Igc28uKQo+Pj4KPj4+PiArICAgICBpZiAoaHR0LT50
YXJnZXRfdmVyc2lvbl9tYWpvciAhPSAyICYmCj4+Pj4gKyAgICAgICAgIGh0dC0+dGFyZ2V0X3Zl
cnNpb25fbWFqb3IgIT0gMykgewo+Pj4+ICAgICAgICAgICAgICAgYXRoMTBrX2VycigiaHR0IG1h
am9yIHZlcnNpb25zIGFyZSBpbmNvbXBhdGlibGUhXG4iKTsKPj4+PiAgICAgICAgICAgICAgIHJl
dHVybiAtRU5PVFNVUFA7Cj4+Pj4gICAgICAgfQo+Pj4KPj4+IFByaW50IHRoZSBodHQgdmVyc2lv
biBpbiB0aGUgZXJyb3IgbWVzc2FnZSBhcyB3ZWxsPwo+Pgo+PiBUYXJnZXQgdmVyc2lvbiBpcyBw
cmludGVkIGluIGF0aDEwa19kYmcoKSBub3cuIElmIHdlIGNoYW5nZSB0aGF0IHRvCj4+IGF0aDEw
a19pbmZvKCkgSSBkb24ndCBzZWUgYW55IHJlYXNvbiB0byBwcmludCB0aGUgdmVyc2lvbiBhZ2Fp
biBvbgo+PiBlcnJvci4KPgo+IEZyZXF1ZW50bHkgdXNlcnMganVzdCBjb3B5IHRoZSBlcnJvciBt
ZXNzYWdlLCB0aGF0J3Mgd2h5IGl0J3MgYmV0dGVyIHRvCj4gaGF2ZSB0aGUgZmlybXdhcmUncyBo
dHQgdmVyc2lvbiBpbiB0aGUgZXJyb3IgbWVzc2FnZSBhcyB3ZWxsLgoKR29vZCBwb2ludC4KCgpQ
b3pkcmF3aWFtIC8gQmVzdCByZWdhcmRzLApNaWNoYcWCIEthemlvci4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRo
MTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hdGgxMGsK
