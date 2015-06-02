Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22b.google.com ([2a00:1450:400c:c05::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YzgWP-0008Tb-G3
 for ath10k@lists.infradead.org; Tue, 02 Jun 2015 07:22:02 +0000
Received: by wiwd19 with SMTP id d19so9723864wiw.0
 for <ath10k@lists.infradead.org>; Tue, 02 Jun 2015 00:21:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1433229267-11314-1-git-send-email-rmani@qti.qualcomm.com>
References: <1433229267-11314-1-git-send-email-rmani@qti.qualcomm.com>
Date: Tue, 2 Jun 2015 09:21:36 +0200
Message-ID: <CA+BoTQkfNB=fR=Vak729qFU2TOSC_8_fMfgRc1RJ1UO0t9XwRQ@mail.gmail.com>
Subject: Re: [PATCH] ath10k: remove unused variable 'id' in
 ath10k_pci_tx_pipe_cleanup()
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
To: Raja Mani <rmani@qti.qualcomm.com>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMiBKdW5lIDIwMTUgYXQgMDk6MTQsIFJhamEgTWFuaSA8cm1hbmlAcXRpLnF1YWxjb21tLmNv
bT4gd3JvdGU6Cj4gbWV0ZV9kYXRhIGlzIGV4dHJhY3RlZCBmcm9tIGNlIGRlc2NyaXB0b3IgYW5k
IHN0b3JlZCBpbiB2YXJpYWJsZSAnaWQnLgo+IGxhdGVyLCBpZCBpcyBub3QgdXNlZCBhbnl3aGVy
ZSBpbiB0aGUgc2FtZSBmdW5jdGlvbi4KPgo+IFNpZ25lZC1vZmYtYnk6IFJhamEgTWFuaSA8cm1h
bmlAcXRpLnF1YWxjb21tLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0
aDEway9wY2kuYyB8ICAgIDMgLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQo+
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvcGNpLmMgYi9k
cml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3BjaS5jCj4gaW5kZXggOTY5YTEyMy4uYmJj
MzQ5YSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3BjaS5j
Cj4gKysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9wY2kuYwo+IEBAIC0xMjc1
LDcgKzEyNzUsNiBAQCBzdGF0aWMgdm9pZCBhdGgxMGtfcGNpX3R4X3BpcGVfY2xlYW51cChzdHJ1
Y3QgYXRoMTBrX3BjaV9waXBlICpwY2lfcGlwZSkKPiAgICAgICAgIHN0cnVjdCBhdGgxMGtfY2Vf
cmluZyAqY2VfcmluZzsKPiAgICAgICAgIHN0cnVjdCBjZV9kZXNjICpjZV9kZXNjOwo+ICAgICAg
ICAgc3RydWN0IHNrX2J1ZmYgKnNrYjsKPiAtICAgICAgIHVuc2lnbmVkIGludCBpZDsKPiAgICAg
ICAgIGludCBpOwo+Cj4gICAgICAgICBhciA9IHBjaV9waXBlLT5oaWZfY2Vfc3RhdGU7Cj4gQEAg
LTEyOTksOCArMTI5OCw2IEBAIHN0YXRpYyB2b2lkIGF0aDEwa19wY2lfdHhfcGlwZV9jbGVhbnVw
KHN0cnVjdCBhdGgxMGtfcGNpX3BpcGUgKnBjaV9waXBlKQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIGNvbnRpbnVlOwo+Cj4gICAgICAgICAgICAgICAgIGNlX3JpbmctPnBlcl90cmFuc2Zlcl9j
b250ZXh0W2ldID0gTlVMTDsKPiAtICAgICAgICAgICAgICAgaWQgPSBNUyhfX2xlMTZfdG9fY3B1
KGNlX2Rlc2NbaV0uZmxhZ3MpLAo+IC0gICAgICAgICAgICAgICAgICAgICAgIENFX0RFU0NfRkxB
R1NfTUVUQV9EQVRBKTsKPgo+ICAgICAgICAgICAgICAgICBhcl9wY2ktPm1zZ19jYWxsYmFja3Nf
Y3VycmVudC50eF9jb21wbGV0aW9uKGFyLCBza2IpOwoKR29vZCBjYXRjaC4gSSBmb3Jnb3QgdG8g
cmVtb3ZlIHRoaXMuIEkgZ3Vlc3Mgb25lIGNvdWxkIHNheSB0aGlzIHF1YWxpZmllcyBhczoKCiBG
aXhlczogZDg0YTUxMmRjYTIzICgiYXRoMTBrOiByZW1vdmUgdHJhbnNmZXJfaWQgZnJvbQphdGgx
MGtfaGlmX2NiOjp0eF9jb21wbGV0aW9uIikKCgpNaWNoYcWCCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vYXRoMTBrCg==
