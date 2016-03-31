Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22a.google.com ([2a00:1450:400c:c09::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1alWAL-0006uA-SG
 for ath10k@lists.infradead.org; Thu, 31 Mar 2016 06:33:14 +0000
Received: by mail-wm0-x22a.google.com with SMTP id 20so99541970wmh.1
 for <ath10k@lists.infradead.org>; Wed, 30 Mar 2016 23:32:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <56FC52F5.7080407@candelatech.com>
References: <56F5F38A.2070602@candelatech.com>
 <CA+BoTQmwGONqJ0MgccrMzzx9UsGuRCZpdy1RSqdgkcNm_te0xQ@mail.gmail.com>
 <56FC52F5.7080407@candelatech.com>
Date: Thu, 31 Mar 2016 08:32:52 +0200
Message-ID: <CA+BoTQ=ZPA87-5iK7YtxQSAW-SeXaaBU1j+9gVMC-5c7cpTwrA@mail.gmail.com>
Subject: Re: Deadlock on (faked) firmware crash, CUS239,
 modified 10.4.3 firmware.
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

T24gMzEgTWFyY2ggMjAxNiBhdCAwMDoyOCwgQmVuIEdyZWVhciA8Z3JlZWFyYkBjYW5kZWxhdGVj
aC5jb20+IHdyb3RlOgo+Cj4+IEhtbS4uIElmIGl0IHN0aWxsIHJlcHJvZHVjZXMgY2FuIHlvdSB0
cnkgdGhlIGZvbGxvd2luZyBkaWZmPwo+Pgo+PiAtLS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9h
dGgvYXRoMTBrL21hYy5jCj4+ICsrKyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsv
bWFjLmMKPj4gQEAgLTM3ODAsNiArMzc4MCw4IEBAIHZvaWQgYXRoMTBrX21hY190eF9wdXNoX3Bl
bmRpbmcoc3RydWN0IGF0aDEwayAqYXIpCj4+ICAgICAgICAgICAgICAgICAgbGlzdF9kZWxfaW5p
dCgmYXJ0eHEtPmxpc3QpOwo+PiAgICAgICAgICAgICAgICAgIGlmIChyZXQgIT0gLUVOT0VOVCkK
Pj4gICAgICAgICAgICAgICAgICAgICAgICAgIGxpc3RfYWRkX3RhaWwoJmFydHhxLT5saXN0LCAm
YXItPnR4cXMpOwo+PiArICAgICAgICAgICAgICAgZWxzZSBpZiAoYXJ0eHEgPT0gbGFzdCkKPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgbGFzdCA9IGxpc3RfbGFzdF9lbnRyeSgmYXItPnR4cXMs
IHN0cnVjdAo+PiBhdGgxMGtfdHhxLCBsaXN0KTsKPj4KPj4gICAgICAgICAgICAgICAgICBhdGgx
MGtfaHR0X3R4X3R4cV91cGRhdGUoaHcsIHR4cSk7Cj4KPgo+IE9rLCBJIGFkZGVkIHRoaXMgY29k
ZSwgYW5kIGNhbiBzdGlsbCByZXByb2R1Y2UgdGhlIGNvZGUuCj4KPiBGaXJtd2FyZSBpcyBjcmFz
aGluZyBtdWx0aXBsZSB0aW1lcyBhIG1pbnV0ZSBpbiB0aGlzIG1hY2hpbmUgaW4gaXQncwo+IGN1
cnJlbnQgY29uZmlndXJhdGlvbi4gIFJpZ2h0IGJlZm9yZSBpdCBodW5nLCBmaXJtd2FyZSBjcmFz
aGVkIGFuZAo+IHdhcyByZXN0YXJ0ZWQsIGFuZCB0aGVuIEkgZ2V0IHRoZSBoYW5nIG5vdGlmaWNh
dGlvbi4KPgo+IEkgZG9uJ3Qgc2VlIGFueSBvYnZpb3VzIGJhaWwtb3V0IGluIHRoZSB0eF9wdXNo
X3BlbmRpbmcgbG9naWMKPiBpZiB0aGUgZmlybXdhcmUgY3Jhc2hlcz8KClRoZXJlJ3Mgbm8gZXhw
bGljaXQgYmFpbC1vdXQsIHllcy4gSXQgc2hvdWxkIGJhaWwgb3V0IGlmCmF0aDEwa19tYWNfdHhf
cHVzaF90eHEoKSBmYWlscyB0aG91Z2ggKGV4Y2VwdCAtRU5PRU5ULCB3aGljaCBpcwp0cmVhdGVk
IHNsaWdodGx5IGRpZmZlcmVudGx5IGJ1dCBzaG91bGQgcmVzdWx0IGluIGJhaWwtb3V0IGV2ZW50
dWFsbHkKYXMgd2VsbCBhcyBhci0+dHhxcyB3aWxsIGRyYWluIHVudGlsIGl0J3MgZW1wdHkpLgoK
SFRULXR4IGRvZXNuJ3QgY2hlY2sgZm9yIEZXIGNyYXNoIGJ1dCBpdCBzaG91bGQgYmUgdWx0aW1h
dGVseSBsaW1pdGVkCmJ5IGVpdGhlciBDRSByaW5nIHNpemUgYW5kIEhUVCdzIG51bS1wZW5kaW5n
LXR4IChib3RoIHNob3VsZCBub3QgYmUKcmVwbGVuaXNoZWQgYXMgRlcgY3Jhc2hlZCBhbmQgaW50
ZXJydXB0cyBzaG91bGQgbm90IGNvbWUgaW4gYW55bW9yZSkuCldoaWNoZXZlciB0aGUgY2FzZSBh
IDwwIHJldHZhbCBzaG91bGQgcmVzdWx0IGluIGEgYmFpbG91dC4KCgpNaWNoYcWCCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBs
aXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
