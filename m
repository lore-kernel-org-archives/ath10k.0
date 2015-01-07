Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x234.google.com ([2a00:1450:400c:c05::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y8n7X-0003UC-Fv
 for ath10k@lists.infradead.org; Wed, 07 Jan 2015 09:41:44 +0000
Received: by mail-wi0-f180.google.com with SMTP id n3so1179464wiv.7
 for <ath10k@lists.infradead.org>; Wed, 07 Jan 2015 01:41:21 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <54AAE04A.4060000@candelatech.com>
References: <54AAE04A.4060000@candelatech.com>
Date: Wed, 7 Jan 2015 10:41:21 +0100
Message-ID: <CA+BoTQkPcC2pVYe5mWnXE3CAUsZKiVpm3+r-+1UL-i36O1PbSQ@mail.gmail.com>
Subject: Re: Clean up scan when start fails?
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

T24gNSBKYW51YXJ5IDIwMTUgYXQgMjA6MDQsIEJlbiBHcmVlYXIgPGdyZWVhcmJAY2FuZGVsYXRl
Y2guY29tPiB3cm90ZToKPiBTaG91bGQgd2UgaGF2ZSBzb21ldGhpbmcgbGlrZSB0aGlzIHRvIGNs
ZWFuIHVwIHRoZSBzY2FuCj4gc3RhdGUgbWFjaGluZSB3aGVuIGZpcm13YXJlIGZhaWxzIHRvIHN0
YXJ0IHRoZSBzY2FuPwo+Cj4gW2dyZWVhcmJAYmVuLWR0MiBsaW51eC0zLjE5LmRldi55XSQgZ2l0
IGRpZmYKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway93bWku
YyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvd21pLmMKPiBpbmRleCA2ZTRlY2Uw
Li45MDIwMjA0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsv
d21pLmMKPiArKysgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3dtaS5jCj4gQEAg
LTEwNTcsNiArMTA1Nyw3IEBAIHN0YXRpYyBpbnQgYXRoMTBrX3dtaV9ldmVudF9zY2FuKHN0cnVj
dCBhdGgxMGsgKmFyLCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiKQo+ICAgICAgICAgICAgICAgICBicmVh
azsKPiAgICAgICAgIGNhc2UgV01JX1NDQU5fRVZFTlRfU1RBUlRfRkFJTEVEOgo+ICAgICAgICAg
ICAgICAgICBhdGgxMGtfd2FybihhciwgInJlY2VpdmVkIHNjYW4gc3RhcnQgZmFpbHVyZSBldmVu
dFxuIik7Cj4gKyAgICAgICAgICAgICAgIGF0aDEwa193bWlfZXZlbnRfc2Nhbl9jb21wbGV0ZWQo
YXIpOwo+ICAgICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAgIGNhc2UgV01JX1NDQU5fRVZF
TlRfREVRVUVVRUQ6Cj4gICAgICAgICBjYXNlIFdNSV9TQ0FOX0VWRU5UX1BSRUVNUFRFRDoKCkht
bS4uIEkgYXNzdW1lIHlvdSBzdGlsbCBnZXQgdGhlIF9TVEFSVF9GQUlMRUQgc29tZXRpbWVzPwoK
SW4gd2hhdCBzdGF0ZSBkbyB5b3UgZ2V0IGl0PwoKSWYgeW91IGdldCBpdCBiZWZvcmUgX1NUQVJU
RUQgeW91J2xsIGhpdCBhIHdhcm5pbmcgaW4Kc2Nhbl9jb21wbGV0ZWQoKS4gSXQgZG9lc24ndCBt
YWtlIHNlbnNlIHRvIGNhbGwgaXQgc2luY2UgYWxsIHNjYW4KdXNlcnMgd2lsbCBmYWlsIHRvIHdh
aXQgZm9yIGFyLT5zY2FuLnN0YXJ0ZWQgY29tcGxldGlvbiBhbmQgY2xlYW4gdXAKYW55d2F5LgoK
SWYgeW91IGdldCBpdCBhZnRlciBfU1RBUlRFRCB0aGVuIEkgZ3Vlc3MgaXQgZG9lcyBzZW5zZSB0
byBjbGVhbiB1cC4KCgpNaWNoYcWCCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
