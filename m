Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XxsAn-000792-Fq
 for ath10k@lists.infradead.org; Mon, 08 Dec 2014 06:51:58 +0000
Received: by mail-wi0-f170.google.com with SMTP id bs8so6233370wib.5
 for <ath10k@lists.infradead.org>; Sun, 07 Dec 2014 22:51:28 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20141203081054.31187.10953.stgit@potku.adurom.net>
References: <20141203080803.31187.85059.stgit@potku.adurom.net>
 <20141203081054.31187.10953.stgit@potku.adurom.net>
Date: Mon, 8 Dec 2014 07:51:28 +0100
Message-ID: <CA+BoTQ=MbCkF11QwqCGbtPm4veFKrUmN=3dQ_zK+APeWifCRPQ@mail.gmail.com>
Subject: Re: [PATCH v4 6/8] ath10k: introduce wmi ops
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

T24gMyBEZWNlbWJlciAyMDE0IGF0IDA5OjEwLCBLYWxsZSBWYWxvIDxrdmFsb0BxY2EucXVhbGNv
bW0uY29tPiB3cm90ZToKWy4uLl0KPiAgaW50IGF0aDEwa193bWlfYXR0YWNoKHN0cnVjdCBhdGgx
MGsgKmFyKQo+ICB7Cj4gLSAgICAgICBpZiAodGVzdF9iaXQoQVRIMTBLX0ZXX0ZFQVRVUkVfV01J
XzEwWCwgYXItPmZ3X2ZlYXR1cmVzKSkgewo+IC0gICAgICAgICAgICAgICBpZiAodGVzdF9iaXQo
QVRIMTBLX0ZXX0ZFQVRVUkVfV01JXzEwXzIsIGFyLT5md19mZWF0dXJlcykpCj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgYXItPndtaS5jbWQgPSAmd21pXzEwXzJfY21kX21hcDsKPiAtICAgICAg
ICAgICAgICAgZWxzZQo+IC0gICAgICAgICAgICAgICAgICAgICAgIGFyLT53bWkuY21kID0gJndt
aV8xMHhfY21kX21hcDsKPiAtCj4gKyAgICAgICBzd2l0Y2ggKGFyLT53bWkub3BfdmVyc2lvbikg
ewo+ICsgICAgICAgY2FzZSBBVEgxMEtfRldfV01JX09QX1ZFUlNJT05fMTBfMjoKPiArICAgICAg
ICAgICAgICAgYXItPndtaS5jbWQgPSAmd21pXzEwXzJfY21kX21hcDsKPiArICAgICAgICAgICAg
ICAgYXItPndtaS5vcHMgPSAmd21pXzEwXzJfb3BzOwo+ICAgICAgICAgICAgICAgICBhci0+d21p
LnZkZXZfcGFyYW0gPSAmd21pXzEweF92ZGV2X3BhcmFtX21hcDsKPiAgICAgICAgICAgICAgICAg
YXItPndtaS5wZGV2X3BhcmFtID0gJndtaV8xMHhfcGRldl9wYXJhbV9tYXA7Cj4gLSAgICAgICB9
IGVsc2Ugewo+ICsgICAgICAgICAgICAgICBicmVhazsKPiArICAgICAgIGNhc2UgQVRIMTBLX0ZX
X1dNSV9PUF9WRVJTSU9OXzEwXzE6Cj4gKyAgICAgICAgICAgICAgIGFyLT53bWkuY21kID0gJndt
aV8xMHhfY21kX21hcDsKPiArICAgICAgICAgICAgICAgYXItPndtaS5vcHMgPSAmd21pXzEwXzFf
b3BzOwo+ICsgICAgICAgICAgICAgICBhci0+d21pLnZkZXZfcGFyYW0gPSAmd21pXzEweF92ZGV2
X3BhcmFtX21hcDsKPiArICAgICAgICAgICAgICAgYXItPndtaS5wZGV2X3BhcmFtID0gJndtaV8x
MHhfcGRldl9wYXJhbV9tYXA7Cj4gKyAgICAgICAgICAgICAgIGJyZWFrOwo+ICsgICAgICAgY2Fz
ZSBBVEgxMEtfRldfV01JX09QX1ZFUlNJT05fTUFJTjoKPiAgICAgICAgICAgICAgICAgYXItPndt
aS5jbWQgPSAmd21pX2NtZF9tYXA7Cj4gKyAgICAgICAgICAgICAgIGFyLT53bWkub3BzID0gJndt
aV9vcHM7Cj4gICAgICAgICAgICAgICAgIGFyLT53bWkudmRldl9wYXJhbSA9ICZ3bWlfdmRldl9w
YXJhbV9tYXA7Cj4gICAgICAgICAgICAgICAgIGFyLT53bWkucGRldl9wYXJhbSA9ICZ3bWlfcGRl
dl9wYXJhbV9tYXA7Cj4gKyAgICAgICAgICAgICAgIGJyZWFrOwo+ICsgICAgICAgZGVmYXVsdDoK
CkkgdGhpbmsgd2UgZG9uJ3QgbmVlZCB0aGUgYGRlZmF1bHRgIGhlcmUgbm93LCBkbyB3ZT8gSW5z
dGVhZCBfVU5TRVQKYW5kIF9NQVggc2hvdWxkIGJlIGhhbmRsZWQuCgoKTWljaGHFggoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcg
bGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
