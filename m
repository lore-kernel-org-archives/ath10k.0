Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c1jI3-0001h7-Cg
 for ath10k@lists.infradead.org; Wed, 02 Nov 2016 00:20:29 +0000
Received: by mail-wm0-x233.google.com with SMTP id a197so108523796wmd.0
 for <ath10k@lists.infradead.org>; Tue, 01 Nov 2016 17:20:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAJ-Vmo=K3xS7D27TC+VFjEse4sj2DjJvfH_ScrDfYRpOgBz4gA@mail.gmail.com>
References: <9af68587-603e-2fa9-5ce9-1dc373238b71@candelatech.com>
 <CA+BoTQkxsrGsGTOzxrNvmTOrdOqL1STG4i1ke0Lei6gMP5VZwA@mail.gmail.com>
 <4ab2ca16-37ac-7cb2-fa2f-1c7e5eb7e3b8@candelatech.com>
 <CAJ-Vmo=K3xS7D27TC+VFjEse4sj2DjJvfH_ScrDfYRpOgBz4gA@mail.gmail.com>
From: Michal Kazior <michal.kazior@tieto.com>
Date: Wed, 2 Nov 2016 01:20:02 +0100
Message-ID: <CA+BoTQmMVBDnP1ZF1ZiDoV0F4YvccSf72zsZ=FeeZbwbxmqpAw@mail.gmail.com>
Subject: Re: Question on 10.4 firmware and fetch-indication logic.
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
To: Adrian Chadd <adrian@freebsd.org>
Cc: Ben Greear <greearb@candelatech.com>, ath10k <ath10k@lists.infradead.org>

T24gMSBOb3ZlbWJlciAyMDE2IGF0IDE5OjEyLCBBZHJpYW4gQ2hhZGQgPGFkcmlhbkBmcmVlYnNk
Lm9yZz4gd3JvdGU6Cj4gT24gMSBOb3ZlbWJlciAyMDE2IGF0IDExOjA0LCBCZW4gR3JlZWFyIDxn
cmVlYXJiQGNhbmRlbGF0ZWNoLmNvbT4gd3JvdGU6Cj4KPj4KPj4gSSBkbyBub3Qga25vdyB0aGUg
Y29kZSB3ZWxsIGFyb3VuZCB0aGUgZmV0Y2gtaW5kIGxvZ2ljOiAgVGhpcyBpcyBob3cgdGhlCj4+
IGZpcm13YXJlIHRlbGxzIHRoZSBkcml2ZXIgdGhhdCBpdCBoYXMgZnVsbHkgdHJhbnNtaXR0ZWQg
YSBmcmFtZSBhbmQgaXMKPj4gcmVwb3J0aW5nCj4+IHR4IHN0YXR1cz8gIENhbiBpdCBiZSBhbnl0
aGluZyBlbHNlPwo+Cj4gSXNuJ3QgdGhpcyB0aGUgbmV3aXNoIHN0dWZmIGFkZGVkIHNvIHBlci1w
ZWVyIHF1ZXVlcyBjYW4gYmUgbWFuYWdlZCBhbmQgZHJhaW5lZD8KClllcy4gMTAuNCBjYW4gc3Vw
cG9ydCBvcGVyYXRpb25hbCBtb2RlIHdoZXJlIGl0IGRvZXNuJ3QgZXhwZWN0IGhvc3QgdG8KYmUg
cHVzaGluZyBmcmFtZXMgYXQgaXRzIG93biBkaXNjcmV0aW9uIGFuZCBpbnN0ZWFkIGlzc3Vlcwpm
ZXRjaC1pbmRpY2F0aW9uIGV2ZW50cyB0byBhc2sgaG9zdCB0byBzdWJtaXQgZnJhbWVzIGZyb20g
Z2l2ZW4Kc3RhdGlvbi90aWQgd2l0aGluIGdpdmVuIHBhY2tldC9ieXRlIGNvbnN0cmFpbnRzLgoK
QWZ0ZXIgbG9va2luZyBhdCB0aGUgY29kZSBJIGd1ZXNzIHRoaXMgY291bGQgaGFwcGVuIGJlY2F1
c2UKdHhfZmV0Y2hfaW5kX3EgaXMgcHJvY2Vzc2VkIGluIGEgc2VwYXJhdGUgdGFza2xldC4gWW91
J2QgcHJvYmFibHkgbmVlZAp0byBmbHVzaCB0aGUgdGFza2xldC9ldmVudCBxdWV1ZXMgdG8gcHJl
dmVudCB0aGlzIHByb2JsZW0gZnJvbQpoYXBwZW5pbmcuCgoKTWljaGHFggoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAph
dGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2F0aDEwawo=
