Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22d.google.com ([2a00:1450:400c:c05::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XvMSK-0005Db-B1
 for ath10k@lists.infradead.org; Mon, 01 Dec 2014 08:35:40 +0000
Received: by mail-wi0-f173.google.com with SMTP id r20so23700785wiv.12
 for <ath10k@lists.infradead.org>; Mon, 01 Dec 2014 00:35:18 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <8761dvreui.fsf@kamboji.qca.qualcomm.com>
References: <1416838646-18801-1-git-send-email-michal.kazior@tieto.com>
 <1417418266-21974-1-git-send-email-michal.kazior@tieto.com>
 <8761dvreui.fsf@kamboji.qca.qualcomm.com>
Date: Mon, 1 Dec 2014 09:35:18 +0100
Message-ID: <CA+BoTQko3rFTsZD1M4OzBRzd-oQAauMr6fPVjzvgw17n1H2uag@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] ath10k: create a chip revision whielist
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

T24gMSBEZWNlbWJlciAyMDE0IGF0IDA4OjQ3LCBLYWxsZSBWYWxvIDxrdmFsb0BxY2EucXVhbGNv
bW0uY29tPiB3cm90ZToKPiBNaWNoYWwgS2F6aW9yIDxtaWNoYWwua2F6aW9yQHRpZXRvLmNvbT4g
d3JpdGVzOgo+Cj4+IFRoaXMgd2lsbCBtYWtlIGl0IGVhc2llciB0byBleHRlbmQgYW5kIG1haW50
YWluCj4+IGxpc3Qgb2Ygc3VwcG9ydGVkIGhhcmR3YXJlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBN
aWNoYWwgS2F6aW9yIDxtaWNoYWwua2F6aW9yQHRpZXRvLmNvbT4KPgo+IEkgZml4ZWQgYSB0eXBv
OiBzL3doaWVsaXN0L3doaXRlbGlzdC8KCk9vcHMuIFRoYW5rcyEKCgo+PiAtLS0gYS9kcml2ZXJz
L25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL2NvcmUuaAo+PiArKysgYi9kcml2ZXJzL25ldC93aXJl
bGVzcy9hdGgvYXRoMTBrL2NvcmUuaAo+PiBAQCAtNDc5LDcgKzQ3OSw2IEBAIHN0cnVjdCBhdGgx
MGsgewo+PiAgICAgICAgICAgICAgIHUzMiBpZDsKPj4gICAgICAgICAgICAgICBjb25zdCBjaGFy
ICpuYW1lOwo+PiAgICAgICAgICAgICAgIHUzMiBwYXRjaF9sb2FkX2FkZHI7Cj4+IC0KPj4gICAg
ICAgICAgICAgICBzdHJ1Y3QgYXRoMTBrX2h3X3BhcmFtc19mdyB7Cj4+ICAgICAgICAgICAgICAg
ICAgICAgICBjb25zdCBjaGFyICpkaXI7Cj4+ICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBj
aGFyICpmdzsKPgo+IEkgcmVtb3ZlZCB0aGlzIHVubmVjZXNzYXJ5IGNoYW5nZToKPgo+IGh0dHBz
Oi8vZ2l0aHViLmNvbS9rdmFsby9hdGgvY29tbWl0L2JmYTdiNzk0OGFjYWY3MDYzY2Y0ZDY2NDM5
M2I3ZjdhMWM1M2IyZTQKPgo+IEJlY2F1c2Ugb2YgbXkgY2hhbmdlIHRoZXJlIHdhcyBhbHNvIGEg
c2ltcGxlIGNvbmZsaWN0IGluIHBhdGNoIDM6Cj4KPiBodHRwczovL2dpdGh1Yi5jb20va3ZhbG8v
YXRoL2NvbW1pdC8zNDg3NjgzYzk0NDk1YjZlMGJiYjFmM2IxOWIzOTg3YjRjYTJmZjFmCgpBaCwg
bXkgb3JpZ2luYWwgaW50ZW50aW9uIHdhcyB0byBldmVudHVhbGx5IHJlbW92ZSB0aGUgYmxhbmsg
bGluZQphbG9uZyB3aXRoIHRoZXNlIHBhdGNoZXMgYnV0IHdoYXRldmVyLiBMb29rcyBnb29kIG5v
bmV0aGVsZXNzLCB0aGFua3MhCgoKTWljaGHFggoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0
aDEwawo=
