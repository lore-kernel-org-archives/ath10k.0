Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x22d.google.com ([2a00:1450:400c:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XAFWN-0005Rq-19
 for ath10k@lists.infradead.org; Thu, 24 Jul 2014 09:41:07 +0000
Received: by mail-we0-f173.google.com with SMTP id q58so2496425wes.32
 for <ath10k@lists.infradead.org>; Thu, 24 Jul 2014 02:40:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201407241136.08090.sw@simonwunderlich.de>
References: <87mwc0ro8i.fsf@kamboji.qca.qualcomm.com>
 <1406136773-19957-1-git-send-email-sw@simonwunderlich.de>
 <871ttbrtp8.fsf@kamboji.qca.qualcomm.com>
 <201407241136.08090.sw@simonwunderlich.de>
Date: Thu, 24 Jul 2014 11:40:39 +0200
Message-ID: <CA+BoTQn13tktL9eZi8UD+=WR8fS+FFHML2ab8huvb1QdS49tiQ@mail.gmail.com>
Subject: Re: [PATCHv3-ath-resend 2/2] ath10k: add spectral scan feature
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
To: Simon Wunderlich <sw@simonwunderlich.de>
Cc: Mathias Kretschmer <mathias.kretschmer@fokus.fraunhofer.de>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Kalle Valo <kvalo@qca.qualcomm.com>, "Giori, Kathy" <kgiori@qca.qualcomm.com>, Sven Eckelmann <sven@narfation.org>

T24gMjQgSnVseSAyMDE0IDExOjM2LCBTaW1vbiBXdW5kZXJsaWNoIDxzd0BzaW1vbnd1bmRlcmxp
Y2guZGU+IHdyb3RlOgo+PiA+IEBAIC04MDAsOCArODAwLDYgQEAgaW50IGF0aDEwa19jb3JlX3N0
YXJ0KHN0cnVjdCBhdGgxMGsgKmFyKQo+PiA+Cj4+ID4gICAgIGVsc2UKPj4gPgo+PiA+ICAgICAg
ICAgICAgIGFyLT5mcmVlX3ZkZXZfbWFwID0gKDEgPDwgVEFSR0VUX05VTV9WREVWUykgLSAxOwo+
PiA+Cj4+ID4gLSAgIElOSVRfTElTVF9IRUFEKCZhci0+YXJ2aWZzKTsKPj4gPiAtCj4+ID4KPj4g
PiAgICAgaWYgKCF0ZXN0X2JpdChBVEgxMEtfRkxBR19GSVJTVF9CT09UX0RPTkUsICZhci0+ZGV2
X2ZsYWdzKSkgewo+PiA+Cj4+ID4gICAgICAgICAgICAgYXRoMTBrX2luZm8oIiVzICgweCUwOHgs
IDB4JTA4eCkgZncgJXMgYXBpICVkIGh0dCAlZC4lZFxuIiwKPj4gPgo+PiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgIGFyLT5od19wYXJhbXMubmFtZSwKPj4gPgo+PiA+IEBAIC0xMDg0LDYgKzEw
ODIsMTIgQEAgc3RydWN0IGF0aDEwayAqYXRoMTBrX2NvcmVfY3JlYXRlKHZvaWQgKmhpZl9wcml2
LAo+PiA+IHN0cnVjdCBkZXZpY2UgKmRldiwKPj4gPgo+PiA+ICAgICBJTklUX1dPUksoJmFyLT5y
ZWdpc3Rlcl93b3JrLCBhdGgxMGtfY29yZV9yZWdpc3Rlcl93b3JrKTsKPj4gPiAgICAgSU5JVF9X
T1JLKCZhci0+cmVzdGFydF93b3JrLCBhdGgxMGtfY29yZV9yZXN0YXJ0KTsKPj4gPgo+PiA+ICsg
ICBJTklUX0xJU1RfSEVBRCgmYXItPmFydmlmcyk7Cj4+Cj4+IEknbSBhIGJpdCBzdXNwaWNpb3Vz
IGFib3V0IHRoaXMsIHdoeSBpcyBpdCBuZWVkZWQ/Cj4KPiBhdGgxMGtfc3BlY3RyYWxfaW5pdCgp
IGNsZWFycyB0aGUgc3BlY3RyYWxfZW5hYmxlZCBiaXQgZm9yIGVhY2ggdmlmLCBhbmQKPiB0aGVy
ZWZvcmUgbmVlZHMgdGhlIGxpc3QgdG8gYmUgaW5pdGlhbGl6ZWQgLi4uIGl0IGlzIGFsc28gY2Fs
bGVkIG9uIGZpcm13YXJlCj4gY3Jhc2ggYnkgYXRoMTBrX2hhbHQsIHdoZXJlIGNoZWNraW5nIHRo
ZSBsaXN0IGlzIG1vcmUgdXNlZnVsLgoKWW91IGRvbid0IHJlYWxseSBuZWVkIHRvIGNsZWFyIGFy
dmlmLT5zcGVjdHJhbF9lbmFibGVkIG9uIGNyYXNoLgphcnZpZidzIGFyZSByZS1pbnNlcnRlZCBi
eSBtYWM4MDIxMSB2aWEgYXRoMTBrX2FkZF9pbnRlcmZhY2Ugd2hpY2gKdXNlcyBtZW1zZXQoKSB0
byBjbGVhciBldmVyeXRoaW5nIGJlZm9yZSBhZGRpbmcgdG8gYXItPmFydmlmcy4KCgpNaWNoYcWC
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsg
bWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
