Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x233.google.com ([2a00:1450:400c:c05::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xdawn-00014U-Dj
 for ath10k@lists.infradead.org; Mon, 13 Oct 2014 08:25:42 +0000
Received: by mail-wi0-f179.google.com with SMTP id d1so6711952wiv.6
 for <ath10k@lists.infradead.org>; Mon, 13 Oct 2014 01:25:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87fves9z5o.fsf@kamboji.qca.qualcomm.com>
References: <1412842950-14098-1-git-send-email-michal.kazior@tieto.com>
 <1412842950-14098-6-git-send-email-michal.kazior@tieto.com>
 <87fves9z5o.fsf@kamboji.qca.qualcomm.com>
Date: Mon, 13 Oct 2014 10:25:17 +0200
Message-ID: <CA+BoTQ=HF0wCfBbC9YWFgVh2QhGzYU6uNo0hyAW4+R97bxwdHw@mail.gmail.com>
Subject: Re: [PATCH 5/5] ath10k: replace power up/down with reset callback
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

T24gMTMgT2N0b2JlciAyMDE0IDEwOjAxLCBLYWxsZSBWYWxvIDxrdmFsb0BxY2EucXVhbGNvbW0u
Y29tPiB3cm90ZToKPiBNaWNoYWwgS2F6aW9yIDxtaWNoYWwua2F6aW9yQHRpZXRvLmNvbT4gd3Jp
dGVzOgo+Cj4+IFRoZSBwb3dlciB1cC9kb3duIGRpZG4ndCBtYWtlIG11Y2ggc2Vuc2UgYW55IG1v
cmUKPj4gc2luY2UgaGlmX3N0b3AgYWxyZWFkeSBzdG9wcyB0aGUgZGV2aWNlCj4+IGNvbXBlbGV0
ZWx5LiBUaGUgdGFyZ2V0IGxpZmVjeWNsZSB3YXMgbmV2ZXIgc3ltbWV0cmljCj4+IHNvIGRvbid0
IGJvdGhlciB0cnlpbmcgdG8gbWFrZSBpdCBsb29rIGxpa2UgaXQgaXMKPj4gYW5kIGV4cG9zZSBh
IHJlc2V0IGhpZiBjYWxsYmFjayBpbnN0ZWFkIG9mIHBvd2VyCj4+IHVwL2Rvd24gY2FsbGJhY2tz
Lgo+Pgo+PiBUaGlzIHJlbW92ZXMgcmVkdW5kYW50IHJlc2V0IGNhbGxzIGFuZCB0aHVzIG1ha2Vz
Cj4+IGRldmljZSBib290L3N0b3AvcmVjb3ZlcnkgYSBiaXQgZmFzdGVyLgo+Pgo+PiBTaWduZWQt
b2ZmLWJ5OiBNaWNoYWwgS2F6aW9yIDxtaWNoYWwua2F6aW9yQHRpZXRvLmNvbT4KPgo+IEFib3V0
IHRoaXMgSSdtIG5vdCB0aGF0IHN1cmUuIFRoZSByZWFzb24gd2h5IEkgd2FudGVkIHRvIGhhdmUg
cG93ZXJfdXAoKQo+IGFuZCBwb3dlcl9kb3duKCkgaXMgdGhlIGNhc2Ugd2hlbiB3ZSBuZWVkIHRv
IGNvbnRyb2wgdGhlIHRhcmdldCBwb3dlcgo+IHZpYSBhIGdwaW8gbGluZSwgd2hpY2ggSSBhbnRp
Y2lwYXRlIHdlIHdpbGwgbmVlZCBzb29uLiBJZiB5b3UgcmVtb3ZlCj4gdGhlc2UgaG93IGNvdWxk
IHdlIGNvbnRyb2wgdGhlIGdwaW8gbGluZT8KPgo+IFdvdWxkbid0IGl0IGJlIHRoZSBzYW1lIHRo
YXQgeW91IGp1c3QgbWFrZSBoaWZfcG93ZXJfdXAoKSBkbyB0aGUgc2FtZSBhcwo+IGhpZl9yZXNl
dCgpIGFuZCBoaWZfcG93ZXJfZG93bigpIGRvZXNuJ3QgZG8gYW55dGhpbmcgKGZvciBub3cpPyBP
ciBhbSBJCj4gbWlzc2luZyBzb21ldGhpbmc/CgpIbW0uLiBJIGd1ZXNzIHRoYXQncyBmaW5lIGFz
IHdlbGwuIEknbGwgcmV3b3JrIGl0IHRvIGtlZXAgcG93ZXJfdXAKKHdoaWNoIHdpbGwgYmFzaWNh
bGx5IGRvIHJlc2V0KSBhbmQgcG93ZXJfZG93biAobm9wIGZvciBub3cpLgoKCk1pY2hhxYIKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWls
aW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
