Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x236.google.com ([2a00:1450:400c:c05::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XJfrB-0002cw-OT
 for ath10k@lists.infradead.org; Tue, 19 Aug 2014 09:37:34 +0000
Received: by mail-wi0-f182.google.com with SMTP id d1so4969641wiv.9
 for <ath10k@lists.infradead.org>; Tue, 19 Aug 2014 02:37:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20140819082307.16842.21519.stgit@potku.adurom.net>
References: <20140819082038.16842.46876.stgit@potku.adurom.net>
 <20140819082307.16842.21519.stgit@potku.adurom.net>
Date: Tue, 19 Aug 2014 11:37:10 +0200
Message-ID: <CA+BoTQmgu_bGP6MKV8rV83jWCNONZS+eiE7PDVNy++MvHQX9RA@mail.gmail.com>
Subject: Re: [PATCH v7 4/8] ath10k: save firmware stack upon firmware crash
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

T24gMTkgQXVndXN0IDIwMTQgMTA6MjMsIEthbGxlIFZhbG8gPGt2YWxvQHFjYS5xdWFsY29tbS5j
b20+IHdyb3RlOgo+IEZyb206IEJlbiBHcmVlYXIgPGdyZWVhcmJAY2FuZGVsYXRlY2guY29tPgo+
Cj4gU2hvdWxkIGhlbHAgZGVidWcgZmlybXdhcmUgY3Jhc2hlcywgYW5kIGdpdmUgdXNlcnMgYSB3
YXkKPiB0byBwcm92aWRlIHNvbWUgdXNlZnVsIGRlYnVnIHJlcG9ydHMgdG8gZmlybXdhcmUgZGV2
ZWxvcGVycy4KPgo+IFNpZ25lZC1vZmYtYnk6IEJlbiBHcmVlYXIgPGdyZWVhcmJAY2FuZGVsYXRl
Y2guY29tPgo+IFNpZ25lZC1vZmYtYnk6IEthbGxlIFZhbG8gPGt2YWxvQHFjYS5xdWFsY29tbS5j
b20+Cj4gLS0tClsuLi5dCj4gKy8qIFNhdmUgdGhlIG1haW4gZmlybXdhcmUgc3RhY2sgKi8KPiAr
c3RhdGljIHZvaWQgYXRoMTBrX3BjaV9kdW1wX3N0YWNrKHN0cnVjdCBhdGgxMGsgKmFyLAo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgYXRoMTBrX2Z3X2NyYXNoX2Rh
dGEgKmNyYXNoX2RhdGEpCj4gK3sKPiArICAgICAgIGxvY2tkZXBfYXNzZXJ0X2hlbGQoJmFyLT5k
YXRhX2xvY2spOwo+ICsKPiArICAgICAgIEJVSUxEX0JVR19PTihBVEgxMEtfRldfU1RBQ0tfU0la
RSAlIDQpOwo+ICsKPiArICAgICAgIGF0aDEwa19wY2lfZGlhZ19yZWFkX2hpKGFyLCBjcmFzaF9k
YXRhLT5zdGFja19idWYsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBoaV9zdGFj
aywgQVRIMTBLX0ZXX1NUQUNLX1NJWkUpOwoKQ3VycmVudCBtYXN0ZXIgdHJlZSBwZXJmb3JtcyBh
biBpbXBsaWNpdCBieXRlIHN3YXAgc28gdGhlIHN0YWNrIHJlYWQKZnJvbSB0YXJnZXQgd2lsbCBi
ZSBpbiBob3N0IGVuZGlhbmVzcy4gSU9XIG9uIGJpZy1lbmRpYW4gaG9zdCB5b3UnbGwKbWVzc2Vk
IHVwIGRhdGEgYW5kIHRoZXJlJ3Mgbm8gaW5kaWNhdGlvbiBvZiBlbmRpYW5lc3MgYW55bW9yZS4K
CgpNaWNoYcWCCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
