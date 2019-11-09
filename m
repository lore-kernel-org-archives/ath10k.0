Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iTFSn-0005qt-QH
 for ath10k@lists.infradead.org; Sat, 09 Nov 2019 01:22:55 +0000
Received: by mail-lf1-x143.google.com with SMTP id o65so2161595lff.13
 for <ath10k@lists.infradead.org>; Fri, 08 Nov 2019 17:22:53 -0800 (PST)
MIME-Version: 1.0
References: <157182473951.150713.7978051149956899705.stgit@toke.dk>
 <157182474287.150713.12867638269538730397.stgit@toke.dk>
 <1a2eb096119c9029e67caf797564d6511c8803a7.camel@sipsolutions.net>
 <87a796fxgd.fsf@toke.dk>
 <f395a9a971ca1a0d0438fca10dfb160c421caa7a.camel@sipsolutions.net>
 <874kzefwt3.fsf@toke.dk>
 <300bf0146db6c0d5890699b3911d35174d28c9c0.camel@sipsolutions.net>
In-Reply-To: <300bf0146db6c0d5890699b3911d35174d28c9c0.camel@sipsolutions.net>
From: Kan Yan <kyan@google.com>
Date: Fri, 8 Nov 2019 17:22:38 -0800
Message-ID: <CA+iem5saT0ntxnSV1ZatFuRRcaBzivkQ_MU66ZdV1kfb1dC6Qg@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] mac80211: Implement Airtime-based Queue Limit (AQL)
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
Cc: Rajkumar Manoharan <rmanohar@codeaurora.org>, Kevin Hayes <kevinhayes@google.com>, Make-Wifi-fast <make-wifi-fast@lists.bufferbloat.net>, =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, John Crispin <john@phrozen.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>

SXQgaXMgbW9zdCBsaWtlbHkganVzdCBpbnN1ZmZpY2llbnQgbG9ja2luZy4gYWN0aXZlX3R4cV9s
b2NrIGlzIHBlcgpBQywgY2FuJ3QgcHJvdGVjdCBsb2NhbC0+YXFsX3RvdGFsX3BlbmRpbmdfYWly
dGltZSBhZ2FpbnN0IHJhY2luZwpjb25kaXRpb25zOgp2b2lkIGllZWU4MDIxMV9zdGFfdXBkYXRl
X3BlbmRpbmdfYWlydGltZSguLi4pCnsKICAgICAgICBzcGluX2xvY2tfYmgoJmxvY2FsLT5hY3Rp
dmVfdHhxX2xvY2tbYWNdKTsKICAgICAgICAuLi4KICAgICAgICBsb2NhbC0+YXFsX3RvdGFsX3Bl
bmRpbmdfYWlydGltZSAtPSB0eF9haXJ0aW1lOwogICAgICAgIC4uLgogICAgICAgIHNwaW5fdW5s
b2NrX2JoKCZsb2NhbC0+YWN0aXZlX3R4cV9sb2NrW2FjXSk7Cn0KCkFmdGVyIGNoYW5naW5nIGl0
IHRvIGF0b21pY190LCBubyBtb3JlIGFxbF90b3RhbF9wZW5kaW5nX2FpcnRpbWUKdW5kZXJmbG93
IHNvIGZhciA6KS4gVXNpbmcgYXRvbWljIG9wZXJhdGlvbiBzaG91bGQgYWxzbyBoZWxwIHJlZHVj
ZQpDUFUgb3ZlcmhlYWQgZHVlIHRvIGxvY2sgY29udGVudGlvbiwgYXMKaWVlZTgwMjExX3N0YV91
cGRhdGVfcGVuZGluZ19haXJ0aW1lKCkgaXMgb2Z0ZW4gY2FsbGVkIGZyb20gdGhlIHR4CmNvbXBs
ZXRpb24gcm91dGluZSB0cmlnZ2VyZWQgYnkgaW50ZXJydXB0cywgb2Z0ZW4gaW4gYSBkaWZmZXJl
bnQgY29yZQp0aGFuIHdoZXJlIF9faWVlZTgwMjExX3NjaGVkdWxlX3R4cSgpIGlzIHJ1bm5pbmcu
CgpJIHdpbGwgcG9zdCBhIG5ldyB2ZXJzaW9uIGEgYml0IGxhdGVyIGlmIHRoZSB0ZXN0IGdvZXMg
d2VsbC4KClJlZ2FyZHMsCkthbgoKCk9uIEZyaSwgTm92IDgsIDIwMTkgYXQgMzoxNyBBTSBKb2hh
bm5lcyBCZXJnIDxqb2hhbm5lc0BzaXBzb2x1dGlvbnMubmV0PiB3cm90ZToKPgo+IE9uIEZyaSwg
MjAxOS0xMS0wOCBhdCAxMjoxMCArMDEwMCwgVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIHdyb3Rl
Ogo+Cj4gPiBSaWdodCwgYnVnZ2VyLiBJIHdhcyB0aGlua2luZyBtYXliZSB0aGVyZSdzIGEgY2Fz
ZSB3aGVyZSBza2JzIGNhbiBiZQo+ID4gY2xvbmVkIChhbmQgcmV0YWluIHRoZSB0eF90aW1lX2Vz
dCBmaWVsZCkgYW5kIHRoZW4gcmVsZWFzZWQgdHdpY2U/Cj4KPiBUaGV5IGNvdWxkIGJlIGNsb25l
ZCwgYnV0IEkgZG9uJ3Qgc2VlIGhvdyB0aGF0J2QgYmUgd2hpbGUgKmluc2lkZSogdGhlCj4gc3Rh
Y2sgYW5kIHRoZW4gdGhleSBnZXQgcmVwb3J0ZWQgdHdpY2UgLSB1bmxlc3MgdGhlIGRyaXZlciBk
aWQgc29tZXRoaW5nCj4gbGlrZSB0aGF0Pwo+Cj4gSSBtZWFuLCBUQ1Agc3VyZWx5IGRvZXMgdGhh
dCBmb3IgZXhhbXBsZSwgYnV0IGl0J3MgYmVmb3JlIHdlIGV2ZW4gZ2V0IHRvCj4gbWFjODAyMTEu
Cj4KPiA+IE9yCj4gPiBtYXliZSBzb21ld2hlcmUgdGhhdCBzdGVwcyBvbiB0aGUgc2tiLT5jYiBm
aWVsZCBpbiBzb21lIG90aGVyIHdheT8KPiA+IENvdWxkbid0IGZpbmQgYW55dGhpbmcgb2J2aW91
cyBvbiBhIGZpcnN0IHBlcnVzYWwgb2YgdGhlIFRYIHBhdGggY29kZSwKPiA+IGJ1dCBtYXliZSB5
b3UgY291bGQgdGhpbmsgb2Ygc29tZXRoaW5nPwo+Cj4gTm8sIHNvcnJ5LiBCdXQgSSBhbHNvIGRp
ZG4ndCBhY3R1YWxseSBsb29rIGF0IHRoZSBkcml2ZXIgYXQgYWxsLgo+Cj4gPiBPdGhlcndpc2Ug
SSBndWVzcyB3ZSdsbCBiZSBmb3JjZWQgdG8gZ28gYW5kIGRvIHNvbWUgYWN0dWFsLAo+ID4gb2xk
LWZhc2hpb25lZCBkZWJ1Z2dpbmcgOykKPgo+IDopCj4KPiBqb2hhbm5lcwo+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0
CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
