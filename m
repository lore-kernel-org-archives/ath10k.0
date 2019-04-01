Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAsxp-0006T6-Hq
 for ath10k@lists.infradead.org; Mon, 01 Apr 2019 09:10:47 +0000
Received: from mail-pg1-f198.google.com ([209.85.215.198])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <kai.heng.feng@canonical.com>)
 id 1hAsxn-00047I-4V
 for ath10k@lists.infradead.org; Mon, 01 Apr 2019 09:10:43 +0000
Received: by mail-pg1-f198.google.com with SMTP id e12so7025246pgh.2
 for <ath10k@lists.infradead.org>; Mon, 01 Apr 2019 02:10:43 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.8\))
Subject: Re: Ath10k on XPS 9380 regularly disconnects
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <877ece2kaq.fsf@kamboji.qca.qualcomm.com>
Date: Mon, 1 Apr 2019 17:10:38 +0800
Message-Id: <30006E79-02AE-40E7-9F55-5F5C29068E0D@canonical.com>
References: <042C2903-585B-47BA-8657-8819D225EEA8@canonical.com>
 <87pnqknonc.fsf@codeaurora.org>
 <8ACA9157-127E-43B8-ADD0-28D9EBBCEEB0@canonical.com>
 <BD07B681-0083-4537-87D2-099F7152C51F@canonical.com>
 <877ece2kaq.fsf@kamboji.qca.qualcomm.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"; DelSp="yes"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Anthony Wong <anthony.wong@canonical.com>, ath10k@lists.infradead.org, Stephan Fabel <stephan.fabel@canonical.com>

YXQgMTY6MzcsIEthbGxlIFZhbG8gPGt2YWxvQGNvZGVhdXJvcmEub3JnPiB3cm90ZToKCj4gS2Fp
LUhlbmcgRmVuZyA8a2FpLmhlbmcuZmVuZ0BjYW5vbmljYWwuY29tPiB3cml0ZXM6Cj4KPj4gYXQg
MjM6NDMsIEthaS1IZW5nIEZlbmcgPGthaS5oZW5nLmZlbmdAY2Fub25pY2FsLmNvbT4gd3JvdGU6
Cj4+Cj4+PiBhdCAwMTowNSwgS2FsbGUgVmFsbyA8a3ZhbG9AY29kZWF1cm9yYS5vcmc+IHdyb3Rl
Ogo+Pj4KPj4+PiArIGF0aDEwayBsaXN0Cj4+Pj4gLSBuZXRkZXYgJiBsaW51eC1rZXJuZWwKPj4+
Pgo+Pj4+IEthaS1IZW5nIEZlbmcgPGthaS5oZW5nLmZlbmdAY2Fub25pY2FsLmNvbT4gd3JpdGVz
Ogo+Pj4+Cj4+Pj4+IFRoZXJl4oCZcyBhbiBpc3N1ZSB0aGF0IGF0aDEwayBkaXNjb25uZWN0cyBh
dCByZWd1bGFyIGJhc2lzIFsxXSwgb24KPj4+Pj4gTGludXgga2VybmVsIDQuMTguCj4+Pj4+Cj4+
Pj4+IFVuZm9ydHVuYXRlbHkgSSBjYW7igJl0IHJlcHJvZHVjZSB0aGUgaXNzdWUgb24gWFBTIDkz
ODAgYXQgbXkgaGFuZC4KPj4+Pj4KPj4+Pj4gSXMgdGhlcmUgYWxyZWFkeSBhIGZpeCBpbiB1cHN0
cmVhbSBrZXJuZWw/Cj4+Pj4KPj4+PiBJJ20gbm90IGF3YXJlIG9mIGFueSBmaXhlcyByZWxhdGVk
IHRvIHRoaXMuIElzIHRoaXMgYSByZWdyZXNzaW9uPyBJbgo+Pj4+IG90aGVyIHdvcmRzLCBpcyB0
aGVyZSBhIGtub3duIHZlcnNpb24gb2YgYXRoMTBrIG9yIGZpcm13YXJlIHdoaWNoIGRpZG4ndAo+
Pj4+IGhhdmUgdGhpcyBwcm9ibGVtPwo+Pj4KPj4+IFdlIGtub3cgdGhpcyBpc3N1ZSBoYXBwZW4g
b24ga2VybmVsIHY0LjE1IGFuZCB2NC4xOCwgYnV0IGtlcm5lbHMKPj4+IGJlZm9yZSB2NC4xNSB3
ZXJlIG5vdCB0ZXN0ZWQuCj4+Pgo+Pj4gVGhlIGlzc3VlIGhhcHBlbnMgd2l0aCBHb29nbGUgTWVz
aCwgd2hpY2ggaGFzIDgwMi4xMWFjIGNhcGFiaWxpdHkuCj4+Pgo+Pj4gSSBoYXZlbuKAmXQgYmVl
biBhYmxlIHRvIHJlcHJvZHVjZSB0aGUgaXNzdWUgd2l0aCBhbiA4MDIuMTFuIHJvdXRlciAoeWV0
KS4KPj4KPj4gRG8gSSBuZWVkIGEgc3BlY2lhbCBXaUZpIHJvdXRlciB3aGljaCBzdXBwb3J0IFJY
IHJlb3JkZXIgdG8gcmVwcm9kdWNlCj4+IHRoZSBpc3N1ZT8KPj4KPj4gSXQncyBpbnRyb2R1Y2Vk
IGJ5IGNvbW1pdCBjNTQ1MDcwZTQwNGIgKOKAnGF0aDEwazogaW1wbGVtZW50IHJ4IHJlb3JkZXIK
Pj4gc3VwcG9ydOKAnSkuCj4KPiBJIGRvbid0IHVuZGVyc3RhbmQgeW91ciBxdWVzdGlvbiBhdCBh
bGwuCgpBcyBmYXIgYXMgSSB1bmRlcnN0YW5kLCB0aGUgaXNzdWUgImZhaWxlZCB0byBwb3AgcGFk
ZHIgbGlzdDogLTLigJ0gaGFwcGVucyAgCmJlY2F1c2UgYXRoMTBrX2h0dF9yeF9wb3BfcGFkZHIo
KSBmYWlscyB0byBmaW5kIHNrYiBpbiBza2JfdGFibGUsIGhlbmNlICAKdHJpZ2dlciB0aGUgd2Fy
bmluZy4KClRob3NlIGZ1bmN0aW9uIGFyZSBpbnRyb2R1Y2VkIGJ5IGNvbW1pdCAiYXRoMTBrOiBp
bXBsZW1lbnQgcnggcmVvcmRlciAgCnN1cHBvcnTigJ0uCgpTaW5jZSBJ4oCZdmUgbmV2ZXIgc2Vl
biBzdWNoIGlzc3VlIG9uIG15IFdpRmkgcm91dGVycywgd2hpbGUgaXQgaGFwcGVucyB0byAgClN0
ZXBoYW4gZnJlcXVlbnRseSwgc28gSSB3YW50IHRvIGtub3cgaWYgdGhlIOKAnFJYIHJlb3JkZXIg
c3VwcG9ydOKAnSBpcyBhICAKZmVhdHVyZSB0aGF04oCZcyBvbmx5IHN1cHBvcnRlZCBieSBjZXJ0
YWluIFdpRmkgcm91dGVycy4KCkthaS1IZW5nCgo+Cj4gLS0gCj4gS2FsbGUgVmFsbwoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGlu
ZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
