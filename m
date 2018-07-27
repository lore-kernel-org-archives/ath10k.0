Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fj1wK-0004oR-9g
 for ath10k@lists.infradead.org; Fri, 27 Jul 2018 12:33:49 +0000
Received: by mail-qt0-x243.google.com with SMTP id b15-v6so4811809qtp.11
 for <ath10k@lists.infradead.org>; Fri, 27 Jul 2018 05:33:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <6715f59dc8e834cddd701c6f9ee9f344@codeaurora.org>
References: <1532589677-16428-1-git-send-email-wgong@codeaurora.org>
 <1532589677-16428-3-git-send-email-wgong@codeaurora.org>
 <87zhye1aqg.fsf@toke.dk>
 <CABvG-CVwRyeD5=0HqTyNQPVOV1iPtAT_GJQSmSH4=DdDca6dYw@mail.gmail.com>
 <6715f59dc8e834cddd701c6f9ee9f344@codeaurora.org>
From: =?UTF-8?Q?Micha=C5=82_Kazior?= <kazikcz@gmail.com>
Date: Fri, 27 Jul 2018 14:33:35 +0200
Message-ID: <CABvG-CUpcK=NbC1DaNw330W4YKwH7vb0ZFwPeWt20ODUa+QyXQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ath10k: Set sk_pacing_shift to 6 for 11AC WiFi chips
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
To: Wen Gong <wgong@codeaurora.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>, linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

T24gMjcgSnVseSAyMDE4IGF0IDExOjM5LCBXZW4gR29uZyA8d2dvbmdAY29kZWF1cm9yYS5vcmc+
IHdyb3RlOgo+IE9uIDIwMTgtMDctMjYgMjE6MDIsIE1pY2hhxYIgS2F6aW9yIHdyb3RlOgo+Pgo+
PiBPbiAyNiBKdWx5IDIwMTggYXQgMTM6NDUsIFRva2UgSMO4aWxhbmQtSsO4cmdlbnNlbiA8dG9r
ZUB0b2tlLmRrPiB3cm90ZToKPj4+Cj4+PiBXZW4gR29uZyA8d2dvbmdAY29kZWF1cm9yYS5vcmc+
IHdyaXRlczoKPj4+Cj4+Pj4gVXBzdHJlYW0ga2VybmVsIGhhcyBhbiBpbnRlcmZhY2UgdG8gaGVs
cCBhZGp1c3Qgc2tfcGFjaW5nX3NoaWZ0IHRvIGhlbHAKPj4+PiBpbXByb3ZlIFRDUCBVTCB0aHJv
dWdocHV0Lgo+Pj4+IFRoZSBza19wYWNpbmdfc2hpZnQgaXMgOCBpbiBtYWM4MDIxMSwgdGhpcyBp
cyBiYXNlZCBvbiB0ZXN0IHdpdGggMTFOCj4+Pj4gV2lGaSBjaGlwcyB3aXRoIGF0aDlrLiBGb3Ig
UUNBNjE3NC9RQ0E5Mzc3IFBDSSAxMUFDIGNoaXBzLCB0aGUgMTFBQwo+Pj4+IFZIVDgwIFRDUCBV
TCB0aHJvdWdocHV0IHRlc3RpbmcgcmVzdWx0IHNob3dzIDYgaXMgdGhlIG9wdGltYWwuCj4+Pj4g
T3ZlcndyaXRlIHRoZSBza19wYWNpbmdfc2hpZnQgdG8gNiBpbiBhdGgxMGsgZHJpdmVyLgo+Pj4K
Pj4+Cj4+PiBXaGVuIEkgdGVzdGVkIHRoaXMsIGEgcGFjaW5nIHNoaWZ0IG9mIDggd2FzIHF1aXRl
IGNsb3NlIHRvIG9wdGltYWwgYXMKPj4+IHdlbGwgZm9yIGF0aDEway4gV2h5IGFyZSB5b3UgZ2V0
dGluZyBkaWZmZXJlbnQgcmVzdWx0cz8KPj4+Cj4+Pj4gVGVzdGVkIHdpdGggUUNBNjE3NCBQQ0kg
d2l0aCBmaXJtd2FyZQo+Pj4+IFdMQU4uUk0uNC40LjEtMDAxMDktUUNBUk1TV1BaLTEsIGJ1dCB0
aGlzIHdpbGwgYWxzbyBhZmZlY3QgUUNBOTM3NyBQQ0kuCj4+Pj4gSXQncyBub3QgYSByZWdyZXNz
aW9uIHdpdGggbmV3IGZpcm13YXJlIHJlbGVhc2VzLgo+Pj4+Cj4+Pj4gVGhlcmUgaGF2ZSAyIHRl
c3QgcmVzdWx0IG9mIGRpZmZlcmVudCBzZXR0aW5nczoKPj4+Pgo+Pj4+IEFSTSBDUFUgYmFzZWQg
ZGV2aWNlIHdpdGggUUNBNjE3NEEgUENJIHdpdGggZGlmZmVyZW50Cj4+Pj4gc2tfcGFjaW5nX3No
aWZ0Ogo+Pgo+Pgo+PiBEaWZmZXJlbnQgZmlybXdhcmUgcmVsZWFzZXMgaGF2ZSBkaWZmZXJlbnQg
dHggYnVmZmVyaW5nCj4+IGNoYXJhY3RlcmlzdGljcy4gSW4gc29tZSAxMC4yIGZpcm13YXJlIHJ1
bm5pbmcgb24gUUNBOTg4OCB5b3UgY2FuIGhhdmUKPj4gdXAgdG8gNW1zIG9mIGRlbGF5ZWQgYWdn
cmVnYXRpb24uIElkZWFsbHkgc2tfcGFjaW5nX3NoaWZ0IHNob3VsZCBiZQo+PiBhZGp1c3RlZCBw
ZXIgZmlybXdhcmUgcmVsZWFzZS4gTWF5YmUgdGhpcyBzaG91bGQgYmVjb21lIHBhcnQgb2YgdGhl
Cj4+IGF0aDEwayBmaXJtd2FyZSB3cmFwcGluZyAiZncgZmVhdHVyZXMiIHN0dWZmPwo+Pgo+IHJl
Y2VudGx5IHdlIGRvIG5vdCB3YW50IHRvIGRvIGxpa2UgdGhpcyBzaW5jZSBubyB0ZXN0IGRhdGEg
Zm9yIGVhY2gKPiBmaXJtd2FyZS4KCkFsbCB0aGUgbW9yZSByZWFzb24gdG8gKm5vdCogY2hhbmdl
IHRoZSBwYWNpbmcgc2hpZnQgZnJvbSA4IHRvIDYgZm9yCmVudGlyZSBhdGgxMGsgYmVjYXVzZSB5
b3UgaGF2ZSBubyBpZGVhIHdoYXQgaW1wYWN0IHRoYXQgaXMgZ29pbmcgdG8KaGF2ZSBvbiBvdGhl
ciBjaGlwcy9maXJtd2FyZXMsIGUuZy4gUUNBNDAxOSwgUUNBOTg4OFgsIFFDQTk5ODQuCgoKTWlj
aGHFggoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRo
MTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
