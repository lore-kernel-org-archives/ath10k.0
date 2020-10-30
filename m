Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vk1-xa44.google.com ([2607:f8b0:4864:20::a44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYOlB-0003vh-SO
 for ath10k@lists.infradead.org; Fri, 30 Oct 2020 07:23:42 +0000
Received: by mail-vk1-xa44.google.com with SMTP id k125so1264010vka.11
 for <ath10k@lists.infradead.org>; Fri, 30 Oct 2020 00:23:40 -0700 (PDT)
MIME-Version: 1.0
References: <20201022172113.GA1367233@capeo.gueux.org>
 <CANe27jKpYm29QOjYOZ_jwHiRxuWx66J+th8-zgbXK4geiCU0_Q@mail.gmail.com>
 <20201029140616.GG515433@capeo.gueux.org>
In-Reply-To: <20201029140616.GG515433@capeo.gueux.org>
From: Jouni Malinen <jkmalinen@gmail.com>
Date: Fri, 30 Oct 2020 09:20:30 +0200
Message-ID: <CANe27j+fur52HydqqzLc2hBV3QwC2La8+RTJcV=5W5LkUr=PqQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "ath: add support for special 0x0 regulatory
 domain"
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
To: =?UTF-8?B?RsOpbGl4IFNpcG1h?= <felix+kernel@gueux.org>
Cc: ath10k@lists.infradead.org

T24gVGh1LCBPY3QgMjksIDIwMjAgYXQgNDowNiBQTSBGw6lsaXggU2lwbWEgPGZlbGl4K2tlcm5l
bEBndWV1eC5vcmc+IHdyb3RlOgo+IEkgbWFkZSBhIGRldGFpbGVkIHJlcG9ydCwgd2l0aCBkbWVz
ZyBvdXRwdXRzIG9mIGRpZmZlcmVudAo+IGtlcm5lbC9maXJtd2FyZS1hdGhlcm9zIGFuZCB3aXJl
bGVzcy1yZWdkYiBjb21iaW5hdGlvbnMgYXQKPiBodHRwczovL2J1Z3MuZGViaWFuLm9yZy9jZ2kt
YmluL2J1Z3JlcG9ydC5jZ2k/YnVnPTk3MDY3OQoKU28gdGhlIGlzc3VlIGlzIGluIG5vdCBiZWlu
ZyBhYmxlIHRvIG9wZXJhdGUgYW4gQVAgb24gdGhlIDUgR0h6IGJhbmQ/ClRoYXQgc291bmRzIGxp
a2UgdGhlIGV4cGVjdGVkIGJlaGF2aW9yIGZvciBhbnkgZGV2aWNlIHRoYXQgaGFzIG5vdApiZWVu
IGNhbGlicmF0ZWQgYW5kIHByb3Zpc2lvbmVkIGZvciBhIHNwZWNpZmljIGNvdW50cnkgd2hlcmUK
cmVndWxhdG9yeSBydWxlcyBhbGxvdyBvcGVyYXRpb24gb24gdGhlIDUgR0h6IGJhbmQuIEkgdW5k
ZXJzdGFuZCB0aGF0CnRoaXMgbWF5IGxvb2sgbGlrZSBhIHJlZ3Jlc3Npb24gc2luY2UgdGhlIGNv
bW1pdCByZW1vdmVkCmZ1bmN0aW9uYWxpdHksIGJ1dCBpdCBmZWVscyBsaWtlIGEgYnVnIGZpeCB0
byBtZSBzaW5jZSB0aGF0CmZ1bmN0aW9uYWxpdHkgc2hvdWxkIG5vdCBoYXZlIGJlZW4gZW5hYmxl
ZCBieSBkZWZhdWx0IGluIHRoZSBmaXJzdApwbGFjZS4gVGhlIGdvYWwgaGVyZSBpcyB0byBhdm9p
ZCBpbmFwcHJvcHJpYXRlIG9wZXJhdGlvbiBvbiB0aGUgYmFuZAp3aXRob3V0IGV4cGxpY2l0IGNv
bmZpZ3VyYXRpb24gdG8gZW5hYmxlIHN1Y2ggb3BlcmF0aW9uLiBJbiBBUApkZXZpY2VzLCB0aGUg
ZGV2aWNlIHNob3VsZCBoYXZlIGJlZW4gcHJvdmlzaW9uZWQgZm9yIGEgc3BlY2lmaWMKY291bnRy
eSB0byBiZSBhYmxlIHRvIGVuZm9yY2UgdGhlIGNvcnJlY3QgZnJlcXVlbmN5IHJhbmdlCnJlc3Ry
aWN0aW9ucy4gVGhlIHNhZmUgZGVmYXVsdCBmb3IgYSBkZXZpY2UgdGhhdCBkb2VzIG5vdCBoYXZl
IHN1Y2gKZXhwbGljaXQgY29uZmlndXJhdGlvbiB3aXRoaW4gdGhlIFdMQU4gY29tcG9uZW50IGl0
c2VsZiBpcyB0byB1c2UgdGhlCndvcmxkIHJvYW1pbmcgbW9kZSB3aGljaCBwcmV2ZW50cyBpbml0
aWFsaXphdGlvbiBvZiByYWRpYXRpb24gKGkuZS4sCmRvZXMgbm90IGFsbG93IEFQIG1vZGUgdG8g
YmUgc3RhcnRlZCBidXQgYWxsb3dzIHN0YXRpb24gbW9kZSBvcGVyYXRpb24KdG8gY29ubmVjdCB0
byBhbiBhbHJlYWR5IHN0YXJ0ZWQgQVApIG9uIHRoZSA1IEdIeiBiYW5kLgoKLSBKb3VuaQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxp
bmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
