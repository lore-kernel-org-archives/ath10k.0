Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-f181.google.com ([209.85.212.181])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XSLfs-0002SB-5E
 for ath10k@lists.infradead.org; Fri, 12 Sep 2014 07:53:45 +0000
Received: by mail-wi0-f181.google.com with SMTP id bs8so101120wib.14
 for <ath10k@lists.infradead.org>; Fri, 12 Sep 2014 00:53:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20140911203141.12514.23469.stgit@potku.adurom.net>
References: <20140911202926.12514.79908.stgit@potku.adurom.net>
 <20140911203141.12514.23469.stgit@potku.adurom.net>
Date: Fri, 12 Sep 2014 09:53:08 +0200
Message-ID: <CA+BoTQ=9kUFXpTKwE1i8TjEPFeszih+U9FDpWRdaYguf7Xa-Gw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] ath10k: ignore diagnose pipes in
 ath10k_pci_ce_recv_data()/_send_done()
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
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMTEgU2VwdGVtYmVyIDIwMTQgMjI6MzEsIEthbGxlIFZhbG8gPGt2YWxvQHFjYS5xdWFsY29t
bS5jb20+IHdyb3RlOgo+IEFzIGF0aDEwa19wY2lfZGlhZ19yZWFkX21lbSgpIHVzZXMgcG9sbGlu
ZyB0byByZWNlaXZlIGRhdGEgZnJvbSBDRSwgdGhlIENFIGNhbGxiYWNrcwo+IGhhdmUgdG8gaWdu
b3JlIHRoZSBwaXBlIHVzZWQgZm9yIGRpYWdub3NlIHJlYWRzLiBPdGhlcndpc2UgYXRoMTBrIGNy
YXNoZXMgZHVlCj4gdG8gTlVMTCBkZXJlZmVyZW5jZSBhbmQgcG9sbGluZyByZWFkcyB0aW1lb3V0
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogS2FsbGUgVmFsbyA8a3ZhbG9AcWNhLnF1YWxjb21tLmNvbT4K
PiAtLS0KPiAgZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9wY2kuYyB8ICAgIDYgKysr
KysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3BjaS5jIGIvZHJpdmVycy9uZXQvd2lyZWxl
c3MvYXRoL2F0aDEway9wY2kuYwo+IGluZGV4IGJhZWI5OGU3OGIxZi4uMTU0NDUxYWIzZTNjIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvcGNpLmMKPiArKysg
Yi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3BjaS5jCj4gQEAgLTgxOSw2ICs4MTks
OSBAQCBzdGF0aWMgdm9pZCBhdGgxMGtfcGNpX2NlX3NlbmRfZG9uZShzdHJ1Y3QgYXRoMTBrX2Nl
X3BpcGUgKmNlX3N0YXRlKQo+ICAgICAgICAgdW5zaWduZWQgaW50IG5ieXRlczsKPiAgICAgICAg
IHVuc2lnbmVkIGludCB0cmFuc2Zlcl9pZDsKPgo+ICsgICAgICAgaWYgKGNlX3N0YXRlLT5pZCA9
PSA3KQo+ICsgICAgICAgICAgICAgICByZXR1cm47CgpJIHRoaW5rIHlvdSBjYW4gY2hlY2sgaXQg
aW4gYSBzYW5lciB3YXk6IChjZV9zdGF0ZSA9PSBhcl9wY2ktPmNlX2RpYWcpLgoKQW5vdGhlciBh
cHByb2FjaCBpcyB0byBwcmV2ZW50IHRoaXMgZnJvbSBoYXBwZW5pbmcgaW4gdGhlIGZpcnN0IHBs
YWNlCmJ5IG5ldmVyIHVubWFza2luZyB0aGUgZGlhZ25vc3RpYyB3aW5kb3cgY29weSBlbmdpbmUg
cGlwZSBpbgphdGgxMGtfY2VfZW5hYmxlX2ludGVycnVwdHMoKSBhbmQgcHJldmVudGluZwphdGgx
MGtfY2VfcGVyX2VuZ2luZV9zZXJ2aWNlKCkgZnJvbSBiZWluZyBjYWxsZWQgaW4KYXRoMTBrX3Bj
aV9oaWZfc2VuZF9jb21wbGV0ZV9jaGVjaygpIGZvciB0aGUgZGlhZ25vc3RpYyBjZSBwaXBlLgoK
Ck1pY2hhxYIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
