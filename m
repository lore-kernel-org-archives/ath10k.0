Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.toke.dk ([52.28.52.200])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gxAXH-0007YI-5a
 for ath10k@lists.infradead.org; Fri, 22 Feb 2019 13:06:41 +0000
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Subject: Re: [PATCH] mac80211: Change default tx_sk_pacing_shift to 7
In-Reply-To: <E1gx9x3-0002j0-1J@sipsolutions.net>
References: <20190221172936.21816-1-toke@redhat.com>
 <E1gx9x3-0002j0-1J@sipsolutions.net>
Date: Fri, 22 Feb 2019 14:06:35 +0100
Message-ID: <87lg28vup0.fsf@toke.dk>
MIME-Version: 1.0
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Kan Yan <kyan@google.com>, wgong@qti.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Grant Grundler <grundler@google.com>, wgong@codeaurora.org, Ben Greear <greearb@candelatech.com>, Kalle Valo <kvalo@codeaurora.org>

Sm9oYW5uZXMgQmVyZyA8am9oYW5uZXNAc2lwc29sdXRpb25zLm5ldD4gd3JpdGVzOgoKPiBUb2tl
IEjDuGlsYW5kLUrDuHJnZW5zZW4gd3JvdGU6Cj4KPj4gV2hlbiB3ZSBkaWQgdGhlIG9yaWdpbmFs
IHRlc3RzIGZvciB0aGUgb3B0aW1hbCB2YWx1ZSBvZiBza19wYWNpbmdfc2hpZnQsIHdlCj4+IGNh
bWUgdXAgd2l0aCA2IG1zIG9mIGJ1ZmZlcmluZyBhcyB0aGUgZGVmYXVsdC4gU2FkbHksIDYgaXMg
bm90IGEgcG93ZXIgb2YKPj4gdHdvLCBzbyB3aGVuIHBpY2tpbmcgdGhlIHNoaWZ0IHZhbHVlIEkg
ZXJyZWQgb24gdGhlIHNpemUgb2YgbGVzcyBidWZmZXJpbmcKPj4gYW5kIHBpY2tlZCA0IG1zIGlu
c3RlYWQgb2YgOC4gVGhpcyB3YXMgcHJvYmFibHkgd3Jvbmc7IHRob3NlIDIgbXMgb2YgZXh0cmEK
Pj4gYnVmZmVyaW5nIG1ha2VzIGEgbGFyZ2VyIGRpZmZlcmVuY2UgdGhhbiBJIHRob3VnaHQuCj4+
IAo+PiBTbywgY2hhbmdlIHRoZSBkZWZhdWx0IHBhY2luZyBzaGlmdCB0byA3LCB3aGljaCBjb3Jy
ZXNwb25kcyB0byA4IG1zIG9mCj4+IGJ1ZmZlcmluZy4gVGhlIHBvaW50IG9mIGRpbWluaXNoaW5n
IHJldHVybnMgcmVhbGx5IGtpY2tzIGluIGFmdGVyIDggbXMsIGFuZAo+PiBzbyBoYXZpbmcgdGhp
cyBhcyBhIGRlZmF1bHQgc2hvdWxkIGN1dCBkb3duIG9uIHRoZSBuZWVkIGZvciBleHRlbnNpdmUK
Pj4gcGVyLWRldmljZSB0ZXN0aW5nIGFuZCBvdmVycmlkZXMgbmVlZGVkIGluIHRoZSBkcml2ZXJz
Lgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIDx0b2tlQHJl
ZGhhdC5jb20+Cj4KPiBQYXRjaCBhcHBsaWVkIHRvIHdpcmVsZXNzLmdpdCwgdGhhbmtzLgo+Cj4g
YTQxZjU2YjlhMTdhIChIRUFEIC0+IG1hYzgwMjExKSBtYWM4MDIxMTogQ2hhbmdlIGRlZmF1bHQK
PiB0eF9za19wYWNpbmdfc2hpZnQgdG8gNwoKQ29vbCwgdGhhbmtzISBXaGF0J3MgdGhlIGVhc2ll
c3Qgd2F5IHRvIGJhY2twb3J0IHRoaXM/IEkgZmlndXJlIGl0J3MKZWFzaWVyIHRvIGp1c3QgdXBk
YXRlIHNrX3BhY2luZ19zaGlmdF91cGRhdGUoKSBpbiB0eC5jIGZvciA0LjE5ICh3aGljaApwcmVk
YXRlcyB0aGUgYWRkaXRpb24gb2YgdGhlIGRyaXZlciBvdmVycmlkZSBob29rKTsgc2hhbGwgSSBq
dXN0IHNlbmQgYQpzZXBhcmF0ZSBwYXRjaCB0byBzdGFibGUgZm9yIHRoYXQ/IE9yIGRvIHdlIG5l
ZWQgdG8gYmFja3BvcnQgdGhlIGRyaXZlcgpvdmVycmlkZSBob29rIGFzIHdlbGw/CgotVG9rZQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1h
aWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
