Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22a.google.com ([2a00:1450:400c:c09::22a])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkUmL-0008KK-Ey
 for ath10k@lists.infradead.org; Thu, 15 Sep 2016 11:24:31 +0000
Received: by mail-wm0-x22a.google.com with SMTP id b187so90596055wme.1
 for <ath10k@lists.infradead.org>; Thu, 15 Sep 2016 04:24:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAOiWkA9xXSc2t9WGTXSvh9KNPDBd1M2ZwEcm-rTMvRVWr0C82Q@mail.gmail.com>
References: <CAOiWkA-VhhARncY-E9XnKXm=XmUraCgjDsM+eDLJW2Wx7Jn4Qw@mail.gmail.com>
 <CAJ-VmonT9SNipiMQdmgN4__4QMxgGKYg_-SwH4bieWKwfwdX5A@mail.gmail.com>
 <CAOiWkA8NSv1VskZi4AnTgjt6p-NsRoTMzHqyAPwCsMKU-c9ujg@mail.gmail.com>
 <CA+BoTQn5L58sPyE=u79GACoMEXSrdfmJi-OGv3K3kEX46k6sxA@mail.gmail.com>
 <CAOiWkA8P-qR6HHyMFNszmc7CcypuN1+RLSXPrmH6Q6EeYCa4aw@mail.gmail.com>
 <87lgywjcwi.fsf@kamboji.qca.qualcomm.com>
 <CAOiWkA_Xm3pXGzHEWnCO9JKhahJkKQ6yEVt8DXaHi1cFvoFzew@mail.gmail.com>
 <87mvjbhy7b.fsf@kamboji.qca.qualcomm.com>
 <CAOiWkA9xXSc2t9WGTXSvh9KNPDBd1M2ZwEcm-rTMvRVWr0C82Q@mail.gmail.com>
From: Michal Kazior <michal.kazior@tieto.com>
Date: Thu, 15 Sep 2016 13:24:01 +0200
Message-ID: <CA+BoTQk6tjSemQjipc9QtTm8eLSnjiNGE8er0t-OjsmVikd7ZA@mail.gmail.com>
Subject: Re: accessing ath10k calibration data
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
To: Marty Faltesek <mfaltesek@google.com>
Cc: "Valo, Kalle" <kvalo@qca.qualcomm.com>, Adrian Chadd <adrian@freebsd.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMTUgU2VwdGVtYmVyIDIwMTYgYXQgMDE6NTQsIE1hcnR5IEZhbHRlc2VrIDxtZmFsdGVzZWtA
Z29vZ2xlLmNvbT4gd3JvdGU6Cj4gSSBzZW50IG91dCB0aGUgcGF0Y2guCj4KPiBJIHJhbiBpbnRv
IGFub3RoZXIgcmVsYXRlZCBpc3N1ZS4gTGV0IG1lIGV4cGxhaW4gd2hhdCB3ZSBhcmUgdHJ5aW5n
IHRvIGRvOgo+Cj4gV2Ugd2FudCB0byBleGFtaW5lIGNhbF9kYXRhIGZvciBhIHBvc3NpYmx5IG1p
cy1jYWxpYnJhdGVkIE9UUCwgYW5kIGlmCj4gc28sIHBhdGNoIGl0IGFuZCBzdG9yZQo+IHRoZSBy
ZXN1bHQgaW4gL3RtcCAoY3JlYXRpbmcgYSBzeW1saW5rIGZyb20KPiAvaWxiL2Zpcm13YXJlL2F0
aDEway9jYWwtcGNpLTAwMDE6MDE6MDAuMC5iaW4gdG8gL3RtcCkuCj4KPiBCdXQgYXRoMTBrX2Zl
dGNoX2NhbF9maWxlKCkgaXMgb25seSByZWFkIG9uY2UgYXQgbG9hZCB0aW1lLCBzbyBJJ3ZlCj4g
bW9kaWZpZWQgdGhlIGNvZGUgdG8gY2FsbCB0aGlzIGZ1bmN0aW9uIGZyb20KPiBhdGgxMGtfZG93
bmxvYWRfY2FsX2ZpbGUoKQo+IHNvIHRoYXQgdGhlIGRyaXZlciBjYXRjaGVzIHRoZSBtb2RpZmll
ZCBjYWxfZGF0YS4gVGhpcyBzZWVtcyB0byB3b3JrCj4gYmFzZWQgb24gdGhlIHJlYWQgYmFjayBv
ZiB0aGUgcGF0Y2hlZCBjYWxfZGF0YSwgYnV0IGlzIGl0IHRoZSByaWdodAo+IGFwcHJvYWNoLCBv
ciBpcyB0aGVyZSBhIGJldHRlciBvciBjbGVhbmVyIHdheT8KClRoZSByZWFzb24gd2h5IGZpcm13
YXJlIGZpbGVzIChpbmNsdWRpbmcgY2FsLCBldCBhbCkgaW4gbWVtb3J5IGlzIHRvCmd1YXJhbnRl
ZSBmaXJtd2FyZSByZWxvYWRzIHJlc3VsdCBpbiB0aGUgc2FtZSBzZXQgb2YgaHcgY2FwYWJpbGl0
aWVzCndoaWNoIGNhbiBiZSBhZHZlcnRpc2VkIGR1cmluZyBtYWM4MDIxMSByZWdpc3RlciB0aW1l
LiBDaGFuZ2luZyB0aGVtCmluIHJ1bnRpbWUgaXMgbm90IHJlYWxseSBjbGVhbi4KCkkgZG9uJ3Qg
cmVhbGx5IGhhdmUgYSBjbGVhbiBhbnN3ZXIgZm9yIHlvdS4KCkRvIHlvdSByZWFsbHkgbmVlZCB0
byBrZWVwIGdpdmVuIGRyaXZlciBpbnN0YW5jZSBydW5uaW5nIHdpdGhvdXQKaW50ZXJydXB0aW9u
PyBBdCB3aGF0IHBvaW50IGRvIHlvdSB2ZXJpZnkgY2FsZGF0YT8gSWYgaXQncyBiZWZvcmUKdXBw
aW5nIGludGVyZmFjZXMgeW91IGNvdWxkIGVpdGhlciB1bmxvYWQvbG9hZCB0aGUgZHJpdmVyIG9y
CnVuYmluZC9iaW5kIHRoZSBkZXZpY2UgaXRzZWxmIHRvIGZvcmNlIGl0IHRvIHJlYWQgZmlybXdh
cmUgZmlsZXMgYW5ldy4KCgpNaWNoYcWCCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBr
Cg==
