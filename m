Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-bk0-x22c.google.com ([2a00:1450:4008:c01::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VP7U5-0007jE-FJ
 for ath10k@lists.infradead.org; Thu, 26 Sep 2013 09:03:42 +0000
Received: by mail-bk0-f44.google.com with SMTP id mz10so296870bkb.17
 for <ath10k@lists.infradead.org>; Thu, 26 Sep 2013 02:03:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87ob7grmhv.fsf@kamboji.qca.qualcomm.com>
References: <1380101891-18312-1-git-send-email-bartosz.markowski@tieto.com>
 <1380101891-18312-2-git-send-email-bartosz.markowski@tieto.com>
 <87ob7grmhv.fsf@kamboji.qca.qualcomm.com>
Date: Thu, 26 Sep 2013 11:03:17 +0200
Message-ID: <CA+BoTQk98WwdqyVtyHy9A1Z5kWgmkC6sHVjgaQNbrRLfm8YSiA@mail.gmail.com>
Subject: Re: [PATCH 01/13] ath10k: introduce dynamic WMI structures
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org, Bartosz Markowski <bartosz.markowski@tieto.com>

T24gMjYgU2VwdGVtYmVyIDIwMTMgMTA6NTQsIEthbGxlIFZhbG8gPGt2YWxvQHFjYS5xdWFsY29t
bS5jb20+IHdyb3RlOgo+IEJhcnRvc3ogTWFya293c2tpIDxiYXJ0b3N6Lm1hcmtvd3NraUB0aWV0
by5jb20+IHdyaXRlczoKPgo+PiBUaGlzIGlzIHRoZSBpbml0aWFsIGZyYW1ld29yayB0byBpbXBs
ZW1lbnQgZHluYW1pYwo+PiBXTUkgQVBJIGluIG9yZGVyIHRvIHN1cHBvcnQgbmV3IGZpcm13YXJl
IChmcm9tIHNvCj4+IGNhbGxlZCAxMC5YIGJyYW5jaCkKPj4KPj4gVGhlIHJlYWxpemF0aW9uIGlz
IHRvIGhhdmUgYSBzdGF0aWMgV01JIGNtZCBtYXAgZm9yCj4+IGVhY2ggb2YgdGhlIGZpcm13YXJl
cywgcmVnaXN0ZXJlZCB1cG9tIHdtaSBpbml0Lgo+Pgo+PiBUaGlzIHBhdGNoIGNyZWF0ZXMgc3Vj
aCBtYXAgZm9yIE1BSU4gRlcsIHVwZGF0ZXMKPj4gd21pX2NtZF9zZW5kKCkgY2FsbHMgdG8gdGFr
ZSBhcyBhIHBhcmFtZXRlcgo+PiB0aGUgbWFwIHZhbHVlIGluc3RlYWQgb2YgZGlyZWN0IFdNSSBl
bnVtLgo+Pgo+PiBBcyBzb29uIGFzIGNvbXBsZXRlIDEwLlggQVBJIHdpbGwgYmUgb24gcGxhY2Us
Cj4+IHdlIHdpbGwgaW50cm9kdWNlIHRoZSBGVyBJRSBtZWNoYW5pY3MgdG8gZHluYW1pY2FseQo+
PiBpZGVudGlmeSB3aGljaCBGVyBpcyBiZWluZyB1c2VkIGFuZCBiYXNlZCBvbiB0aGF0Cj4+IHdl
IHdpbGwgdXNlIGNvcnJlY3QgbWFwLCBBUEksIHN0cnVjdHVyZXMsIGV0Yy4KPj4KPj4gU2lnbmVk
LW9mZi1ieTogQmFydG9zeiBNYXJrb3dza2kgPGJhcnRvc3oubWFya293c2tpQHRpZXRvLmNvbT4K
Pj4gLS0tCj4KPiBbLi4uXQo+Cj4+IEBAIC0xMjkzLDcgKzE0MzgsOCBAQCBpbnQgYXRoMTBrX3dt
aV9wZGV2X3Jlc3VtZV90YXJnZXQoc3RydWN0IGF0aDEwayAqYXIpCj4+ICAgICAgIGlmIChza2Ig
PT0gTlVMTCkKPj4gICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsKPj4KPj4gLSAgICAgcmV0
dXJuIGF0aDEwa193bWlfY21kX3NlbmQoYXIsIHNrYiwgV01JX1BERVZfUkVTVU1FX0NNRElEKTsK
Pj4gKyAgICAgcmV0dXJuIGF0aDEwa193bWlfY21kX3NlbmQoYXIsIHNrYiwKPj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgYXItPndtaS5jbWQtPndtaV9wZGV2X3Jlc3VtZV9jbWRp
ZCk7Cj4+ICB9Cj4KPiBJIHdhcyB0aGlua2luZyBvZiBhZGRpbmcgYSBtYWNybyBXTUlfUERFVl9S
RVNVTUVfQ01ESUQoYXIpIGZvciBhbGwKPiBkeW5hbWljIHdtaSBpZHMsIHRoYXQgd2F5IGl0IHdv
dWxkIGxvb2sgYXMgY2xvc2VseSBhcyBwb3NzaWJsZSB3aXRoIHRoZQo+IG9yaWdpbmFsIGNvZGUu
IEJ1dCBJJ20gbm90IHN1cmUgaWYgdGhhdCBtYWtlcyBzZW5zZSBhbnltb3JlLiBUaG91Z2h0cz8K
ClNlZW1zIGxpa2UgYW4gdW5uZWNlc3NhcnkgaW5kaXJlY3Rpb24gdG8gbWUuIFlvdSBzdGlsbCBu
ZWVkIHRvIGhhdmUKdGhlIG1hcHBpbmcgc3RydWN0dXJlLCB1bmxlc3MgeW91IHdhbnQgdG8gdXNl
IG1hY3JvIGNvbmNhdGVuYXRpb24gKCMjKQppbnN0ZWFkLgoKCk1pY2hhxYIuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0
CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
