Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oa0-x22d.google.com ([2607:f8b0:4003:c02::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQt1J-0001zz-4e
 for ath10k@lists.infradead.org; Fri, 21 Mar 2014 06:33:34 +0000
Received: by mail-oa0-f45.google.com with SMTP id eb12so1764751oac.18
 for <ath10k@lists.infradead.org>; Thu, 20 Mar 2014 23:33:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1395360324-20433-1-git-send-email-greearb@candelatech.com>
References: <1395360324-20433-1-git-send-email-greearb@candelatech.com>
Date: Fri, 21 Mar 2014 07:33:10 +0100
Message-ID: <CA+BoTQn1B6g19Ks41kzcoVyhYbHAcJGTNAyucmPMupbRAy1SNg@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Fix getting stats from firmware.
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
To: Ben Greear <greearb@candelatech.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMjEgTWFyY2ggMjAxNCAwMTowNSwgIDxncmVlYXJiQGNhbmRlbGF0ZWNoLmNvbT4gd3JvdGU6
Cj4gRnJvbTogQmVuIEdyZWVhciA8Z3JlZWFyYkBjYW5kZWxhdGVjaC5jb20+Cj4KPiBNYWtlIHRo
ZSByZXF1ZXN0IGNvbW1hbmQgb2JqZWN0IHRoZSByaWdodCBzaXplIHNvIHRoYXQKPiBmaXJtd2Fy
ZSB3aWxsIG5vdCBqdXN0IHRocm93IGl0IGF3YXkuCj4gVGVzdGVkIGN1c3RvbWl6ZWQgYW5kIHVw
c3RyZWFtIGZpcm13YXJlLgoKRGlkIHlvdSB0ZXN0IDYzNiBhcyB3ZWxsPyA2MzYgZG9lc24ndCBz
ZWVtIHRvIHN1cHBvcnQgbW9yZSB0aGFuIGp1c3QgYHN0YXRzX2lkYC4KCgo+IFNpZ25lZC1vZmYt
Ynk6IEJlbiBHcmVlYXIgPGdyZWVhcmJAY2FuZGVsYXRlY2guY29tPgo+IC0tLQo+ICBkcml2ZXJz
L25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3dtaS5oIHwgMTEgKysrKysrKysrKysKPiAgMSBmaWxl
IGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC93
aXJlbGVzcy9hdGgvYXRoMTBrL3dtaS5oIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEw
ay93bWkuaAo+IGluZGV4IGZhMWI5ZTAuLjQ5NDY0NzEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9u
ZXQvd2lyZWxlc3MvYXRoL2F0aDEway93bWkuaAo+ICsrKyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNz
L2F0aC9hdGgxMGsvd21pLmgKPiBAQCAtMjc2Niw2ICsyNzY2LDExIEBAIGVudW0gd21pX3N0YXRz
X2lkIHsKPiAgICAgICAgIFdNSV9SRVFVRVNUX0FQX1NUQVQgICAgID0gMHgwMgo+ICB9Owo+Cj4g
K3N0cnVjdCB3bGFuX2luc3RfcnNzaV9hcmdzIHsKPiArICAgICAgIF9fbGUxNiBjZmdfcmV0cnlf
Y291bnQ7Cj4gKyAgICAgICBfX2xlMTYgcmV0cnlfY291bnQ7Cj4gK307Cj4gKwo+ICBzdHJ1Y3Qg
d21pX3JlcXVlc3Rfc3RhdHNfY21kIHsKPiAgICAgICAgIF9fbGUzMiBzdGF0c19pZDsKPgo+IEBA
IC0yNzczLDYgKzI3NzgsMTIgQEAgc3RydWN0IHdtaV9yZXF1ZXN0X3N0YXRzX2NtZCB7Cj4gICAg
ICAgICAgKiBTcGFjZSB0byBhZGQgcGFyYW1ldGVycyBsaWtlCj4gICAgICAgICAgKiBwZWVyIG1h
YyBhZGRyCj4gICAgICAgICAgKi8KCllvdSBjYW4gcHJvYmFibHkgcmVtb3ZlIHRoZSBjb21tZW50
IG5vdyA6LSkKCgo+ICsgICAgICAgX19sZTMyIHZkZXZfaWQ7Cj4gKyAgICAgICAvKiBwZWVyIE1B
QyBhZGRyZXNzICovCj4gKyAgICAgICBzdHJ1Y3Qgd21pX21hY19hZGRyIHBlZXJfbWFjYWRkcjsK
PiArCj4gKyAgICAgICAvKiBJbnN0YW50YW5lb3VzIFJTU0kgYXJndW1lbnRzICovCj4gKyAgICAg
ICBzdHJ1Y3Qgd2xhbl9pbnN0X3Jzc2lfYXJncyBpbnN0X3Jzc2lfYXJnczsKPiAgfSBfX3BhY2tl
ZDsKCgpNaWNoYcWCCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
