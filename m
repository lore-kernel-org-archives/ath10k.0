Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qv1-xf44.google.com ([2607:f8b0:4864:20::f44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7tR4-0002yG-6A
 for ath10k@lists.infradead.org; Tue, 18 Aug 2020 04:41:23 +0000
Received: by mail-qv1-xf44.google.com with SMTP id y11so8959480qvl.4
 for <ath10k@lists.infradead.org>; Mon, 17 Aug 2020 21:41:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200814144844.1920-1-tangbin@cmss.chinamobile.com>
 <87y2mdjqkx.fsf@codeaurora.org>
 <e53ee8ca-9c2b-2313-6fd7-8f73ae33e1a2@cmss.chinamobile.com>
In-Reply-To: <e53ee8ca-9c2b-2313-6fd7-8f73ae33e1a2@cmss.chinamobile.com>
From: Steve deRosier <derosier@gmail.com>
Date: Mon, 17 Aug 2020 21:40:42 -0700
Message-ID: <CALLGbRL95niReU+e1+5pO_byHdoWNuzBtHr_iz_HTAU0KwV2eg@mail.gmail.com>
Subject: Re: [PATCH] ath10k: fix the status check and wrong return
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
To: Tang Bin <tangbin@cmss.chinamobile.com>
Cc: Network Development <netdev@vger.kernel.org>, linux-wireless <linux-wireless@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org, "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>

T24gTW9uLCBBdWcgMTcsIDIwMjAgYXQgNjo0MyBQTSBUYW5nIEJpbiA8dGFuZ2JpbkBjbXNzLmNo
aW5hbW9iaWxlLmNvbT4gd3JvdGU6Cj4KPiBIaSBLYWxsZe+8mgo+Cj4g5ZyoIDIwMjAvOC8xNyAy
MjoyNiwgS2FsbGUgVmFsbyDlhpnpgZM6Cj4gPj4gSW4gdGhlIGZ1bmN0aW9uIGF0aDEwa19haGJf
Y2xvY2tfaW5pdCgpLCBkZXZtX2Nsa19nZXQoKSBkb2Vzbid0Cj4gPj4gcmV0dXJuIE5VTEwuIFRo
dXMgdXNlIElTX0VSUigpIGFuZCBQVFJfRVJSKCkgdG8gdmFsaWRhdGUKPiA+PiB0aGUgcmV0dXJu
ZWQgdmFsdWUgaW5zdGVhZCBvZiBJU19FUlJfT1JfTlVMTCgpLgo+ID4gV2h5PyBXaGF0J3MgdGhl
IGJlbmVmaXQgb2YgdGhpcyBwYXRjaD8gT3Igd2hhdCBoYXJtIGRvZXMKPiA+IElTX0VSUl9PUl9O
VUxMKCkgY3JlYXRlPwo+Cj4gVGhhbmtzIGZvciB5b3UgcmVwbHksIHRoZSBiZW5lZml0IG9mIHRo
aXMgcGF0Y2ggaXMgc2ltcGxpZnkgdGhlIGNvZGUsCj4gYmVjYXVzZSBpbgo+Cj4gdGhpcyBmdW5j
dGlvbiwgSSBkb24ndCB0aGluayB0aGUgc2l0dWF0aW9uIG9mICdkZXZtX2Nsa19nZXQoKSByZXR1
cm4KPiBOVUxMJyBleGlzdHMuCj4KCkkgYWRtaXQgSSdtIG5vdCBsb29raW5nIGF0IEhFQUQsIGJ1
dCBhdCBsZWFzdCBpbiB0aGUgdHdvIHZlcnNpb25zIEkndmUKZ290IGNoZWNrZWQgb3V0LCBkZXZt
X2Nsa19nZXQoKSBjYW4gdGhlb3JldGljYWxseSByZXR1cm4gTlVMTC4gVGhpcwpmZWVscyBsaWtl
IGEgZ3JhdHVpdG91cyBjaGFuZ2UgYW55d2F5LCBidXQgaW4gYW55IGNhc2UgaXQncyB3cm9uZyBh
bmQKY291bGQgY2F1c2Ugd3JvbmcgYmVoYXZpb3IuCgotIFN0ZXZlCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEw
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vYXRoMTBrCg==
