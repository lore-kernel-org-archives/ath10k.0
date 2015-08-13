Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x234.google.com ([2a00:1450:400c:c05::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZPnN5-0007XI-Ox
 for ath10k@lists.infradead.org; Thu, 13 Aug 2015 07:56:22 +0000
Received: by wijp15 with SMTP id p15so247551631wij.0
 for <ath10k@lists.infradead.org>; Thu, 13 Aug 2015 00:55:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <55CBD3E6.9050202@candelatech.com>
References: <55CBD3E6.9050202@candelatech.com>
Date: Thu, 13 Aug 2015 09:55:52 +0200
Message-ID: <CA+BoTQkRL+bF2qGXFGbDYGugqMKd4Fp8O0_XZbgmp9HQ+BLfPQ@mail.gmail.com>
Subject: Re: Out of DMA space?
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
Cc: ath10k <ath10k@lists.infradead.org>

T24gMTMgQXVndXN0IDIwMTUgYXQgMDE6MTYsIEJlbiBHcmVlYXIgPGdyZWVhcmJAY2FuZGVsYXRl
Y2guY29tPiB3cm90ZToKPiBJJ3ZlIGJlZW4gcmVsb2FkaW5nIHRoZSBhdGgxMGsgbW9kdWxlcyBh
bGwgYWZ0ZXJub29uLCBkZWJ1Z2dpbmcgaXNzdWVzCj4gaW4gbXkgQ1QgZmlybXdhcmUuICBJJ3Zl
IGJlZW4gdW5sb2FkaW5nIGZpcm13YXJlIHdpdGggcGt0cyBxdWV1ZWQKPiBpbiB0aGUgVFggbG9n
aWMsIGFuZCB0aGV5IGNvdWxkIGVhc2lseSBub3QgYmUgZmx1c2hhYmxlIGF0IHRoaXMgcGlvbnQu
Cj4KPiBJIGp1c3Qgc2F3IHRoaXMuLi5hbmQgbWFjaGluZSBodW5nLgo+Cj4gRE1BOiBPdXQgb2Yg
U1ctSU9NTVUgc3BhY2UgZm9yIDE5ODQgYnl0ZXMgYXQgZGV2aWNlIDAwMDA6MDU6MDAuMAo+IGF0
aDEwa19wY2kgMDAwMDowNTowMC4wOiBmYWlsZWQgdG8gcmVmaWxsIGh0dCByeCByaW5nOiAtMTIK
PiBETUE6IE91dCBvZiBTVy1JT01NVSBzcGFjZSBmb3IgMTk4NCBieXRlcyBhdCBkZXZpY2UgMDAw
MDowNjowMC4wCj4gYXRoMTBrX3BjaSAwMDAwOjA2OjAwLjA6IGZhaWxlZCB0byByZWZpbGwgaHR0
IHJ4IHJpbmc6IC0xMgo+IERNQTogT3V0IG9mIFNXLUlPTU1VIHNwYWNlIGZvciAyMDQ4IGJ5dGVz
IGF0IGRldmljZSAwMDAwOjA3OjAwLjAKPiBETUE6IE91dCBvZiBTVy1JT01NVSBzcGFjZSBmb3Ig
MTYgYnl0ZXMgYXQgZGV2aWNlIDAwMDA6MDc6MDAuMAo+Cj4gSnVzdCBGWUkgcmVhbGx5Li4uSSBo
YXZlbid0IHNlZW4gdGhpcyBiZWZvcmUuCgpJIGhhdmVuJ3Qgc2VlbiBhbnl0aGluZyBsaWtlIHRo
aXMgYmVmb3JlLiBOZXZlcnRoZWxlc3MgdGhpcyBtYXkKc3VnZ2VzdCB0aGVyZSdzIGFuIHVuYmFs
YW5jZWQgRE1BIG1hcC11bm1hcCBpbiBhdGgxMGsuIEkgZ3Vlc3MKdW5iYWxhbmNlZCBkbWFfcG9v
bCBhbmQgY29ob2VyZW50IERNQSBhbGxvY2F0aW9ucyBjb21iaW5lZCB3aXRoCmttZW1sZWFrIHdv
dWxkJ3ZlIGJlZW4gZGV0ZWN0ZWQgZWFybGllci4KCgpNaWNoYcWCCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEw
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vYXRoMTBrCg==
