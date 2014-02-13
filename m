Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-bk0-x229.google.com ([2a00:1450:4008:c01::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDxcI-0001SL-Rf
 for ath10k@lists.infradead.org; Thu, 13 Feb 2014 14:50:19 +0000
Received: by mail-bk0-f41.google.com with SMTP id na10so3146013bkb.0
 for <ath10k@lists.infradead.org>; Thu, 13 Feb 2014 06:49:55 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <8738jn9ijt.fsf@kamboji.qca.qualcomm.com>
References: <1391676841-11107-1-git-send-email-michal.kazior@tieto.com>
 <1392042915-11648-1-git-send-email-michal.kazior@tieto.com>
 <8738jn9ijt.fsf@kamboji.qca.qualcomm.com>
Date: Thu, 13 Feb 2014 15:49:55 +0100
Message-ID: <CA+BoTQmGWuQe=zjk0eeftE0R-i=+f0ZHoGcCdebc1W69FWRNWw@mail.gmail.com>
Subject: Re: [PATCH v2] ath10k: implement sta_rc_update()
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMTMgRmVicnVhcnkgMjAxNCAxNTo0NiwgS2FsbGUgVmFsbyA8a3ZhbG9AcWNhLnF1YWxjb21t
LmNvbT4gd3JvdGU6Cj4gTWljaGFsIEthemlvciA8bWljaGFsLmthemlvckB0aWV0by5jb20+IHdy
aXRlczoKPgo+PiBUaGlzIGFsbG93cyBkeW5hbWljIGNoYW5nZXMgb2YgYmFuZHdpZHRoL25zcy9z
bXBzLAo+PiBlLmcuIHZpYSBodC92aHQgb3BlcmF0aW9uIG1vZGUgY2hhbmdlCj4+IG5vdGlmaWNh
dGlvbi4KPj4KPj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIEthemlvciA8bWljaGFsLmthemlvckB0
aWV0by5jb20+Cj4KPiBbLi4uXQo+Cj4+IC0tLSBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9h
dGgxMGsvY29yZS5oCj4+ICsrKyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvY29y
ZS5oCj4+IEBAIC0yMjgsNiArMjI4LDE3IEBAIHN0cnVjdCBhdGgxMGtfcGVlciB7Cj4+ICAgICAg
IHN0cnVjdCBpZWVlODAyMTFfa2V5X2NvbmYgKmtleXNbV01JX01BWF9LRVlfSU5ERVggKyAxXTsK
Pj4gIH07Cj4+Cj4+ICtzdHJ1Y3QgYXRoMTBrX3N0YSB7Cj4+ICsgICAgIHN0cnVjdCBhdGgxMGtf
dmlmICphcnZpZjsKPj4gKwo+PiArICAgICB1MzIgY2hhbmdlZDsgLyogSUVFRTgwMjExX1JDXyog
Ki8KPj4gKyAgICAgdTMyIGJ3Owo+PiArICAgICB1MzIgbnNzOwo+PiArICAgICB1MzIgc21wczsK
Pj4gKwo+PiArICAgICBzdHJ1Y3Qgd29ya19zdHJ1Y3QgdXBkYXRlX3drOwo+PiArfTsKPgo+IEFw
cGFyZW50bHkgdGhpcyBzdHJ1Y3R1cmUgaXMgcHJvdGVjdGVkIHdpdGggZGF0YV9sb2NrLCBidXQg
aXQgd291bGQgYmUKPiBnb29kIHRvIGRvY3VtZW50IHRoYXQgaW4gdGhlIGNvZGUgdG8gbWFrZSBp
dCBjbGVhci4KCkdvb2QgcG9pbnQuCgoKCj4+ICsgICAgICAgICAgICAgY2FzZSBJRUVFODAyMTFf
U1RBX1JYX0JXXzE2MDoKPj4gKyAgICAgICAgICAgICAgICAgICAgIGF0aDEwa193YXJuKCJ1bnN1
cHBvcnRlZCBTVEEgQlc6ICVkXG4iLCBzdGEtPmJhbmR3aWR0aCk7Cj4+ICsgICAgICAgICAgICAg
ICAgICAgICBidyA9IFdNSV9QRUVSX0NIV0lEVEhfMjBNSFo7Cj4+ICsgICAgICAgICAgICAgICAg
ICAgICBicmVhazsKPgo+IEkgdGhpbmsgaXQgd291bGQgYmUgYWxzbyB1c2VmdWwgdG8gcHJpbnQg
U1RBJ3MgYWRkcmVzcyBpbiB0aGUgd2FybmluZy4KPgoKWy4uLl0KCj4+ICsgICAgICAgICAgICAg
Y2FzZSBJRUVFODAyMTFfU01QU19OVU1fTU9ERVM6Cj4+ICsgICAgICAgICAgICAgICAgICAgICBh
dGgxMGtfd2FybigiaW52YWxpZCBzbXBzIG1vZGU6ICVkXG4iLCBzdGEtPnNtcHNfbW9kZSk7Cj4+
ICsgICAgICAgICAgICAgICAgICAgICBzbXBzID0gV01JX1BFRVJfU01QU19QU19OT05FOwo+PiAr
ICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4KPiBNYXliZSBoZXJlIGFzIHdlbGw/CgpTb3Vu
ZHMgZ29vZC4gSSdsbCBzZW5kIGEgdjMgd2l0aCBhbGwgdGhlc2UgdGhpbmdzIGZpeGVkLgoKCk1p
Y2hhxYIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0
aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
