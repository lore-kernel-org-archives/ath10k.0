Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNALL-0005Uc-Ce
 for ath10k@lists.infradead.org; Wed, 23 Oct 2019 06:42:04 +0000
Received: by mail-lj1-x243.google.com with SMTP id q64so19772947ljb.12
 for <ath10k@lists.infradead.org>; Tue, 22 Oct 2019 23:42:00 -0700 (PDT)
MIME-Version: 1.0
References: <157148503415.2989444.7391437309981941226.stgit@toke.dk>
 <157148503865.2989444.7118792679603045723.stgit@toke.dk>
 <CA+iem5sy16=xMZjJi1nKHrxP_xWHk-86G=ZLwtMMb04EOt5tQA@mail.gmail.com>
 <871rv5ovwr.fsf@toke.dk>
In-Reply-To: <871rv5ovwr.fsf@toke.dk>
From: Kan Yan <kyan@google.com>
Date: Tue, 22 Oct 2019 23:41:47 -0700
Message-ID: <CA+iem5tZ95Jd9htLEdAJMubuFeWeUibK9MhTnTHLWNucX6_cRg@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] mac80211: Use Airtime-based Queue Limits (AQL) on
 packet dequeue
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
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc: Rajkumar Manoharan <rmanohar@codeaurora.org>, Kevin Hayes <kevinhayes@google.com>, Make-Wifi-fast <make-wifi-fast@lists.bufferbloat.net>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, John Crispin <john@phrozen.org>, Johannes Berg <johannes@sipsolutions.net>, Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>

PiA+PiArICAgICAgICAgICAgICAgaWYgKGllZWU4MDIxMV9pc19kYXRhX3FvcyhoZHItPmZyYW1l
X2NvbnRyb2wpKSB7Cj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAgcWMgPSBpZWVlODAyMTFf
Z2V0X3Fvc19jdGwoaGRyKTsKPiA+PiArICAgICAgICAgICAgICAgICAgICAgICB0aWQgPSBxY1sw
XSAmIDB4ZjsKPiA+PiArICAgICAgICAgICAgICAgICAgICAgICBhYyA9IGllZWU4MDIxMV9hY19m
cm9tX3RpZCh0aWQpOwo+ID4+ICsgICAgICAgICAgICAgICB9IGVsc2Ugewo+ID4+ICsgICAgICAg
ICAgICAgICAgICAgICAgIGFjID0gSUVFRTgwMjExX0FDX0JFOwo+ID4+ICsgICAgICAgICAgICAg
ICB9Cj4gPgo+ID4gVGhlIHRpZC9hYyBpcyBpbmNvcnJlY3QgZWl0aGVyIGhlcmUgb3IgaW4gX19p
ZWVlODAyMTFfdHhfc3RhdHVzKCkgd2hlbgo+ID4gdGVzdGVkIHdpdGggYXRoMTBrLiBUaGUgYWMg
aXMgc2V0IHRvIEFDX0JFIHdpdGggdGVzdCBkb25lIHVzaW5nIEJLCj4gPiBjbGFzcyB0cmFmZmlj
LCBoZW5jZSB0aGUgcGVuZGluZyBhaXJ0aW1lIGdldCB1cGRhdGVkIGZvciB0aGUgd3JvbmcKPiA+
IHR4cS4KPgo+IEh1aCwgd2VsbCB0aGF0IHdvbid0IGRvLCBvYnZpb3VzbHkgOikKPgo+IEFueSBp
ZGVhIHdoeSBpdCBtaWdodCBiZSB3cm9uZz8KCnNvbWVob3cgIGllZWU4MDIxMV9pc19kYXRhX3Fv
cygpIHJldHVybnMgZmFsc2UuIEJlc2lkZXMsICBxb3NfY29udHJvbApmaWVsZCBkb2Vzbid0IHNl
ZW1zIHRvIGJlIHNldCBpbiBpZWVlODAyMTFfYnVpbGRfaGRyKCkuCgo+IEhtbSwgSSBndWVzcyB3
ZSBjb3VsZCBqdXN0IGdldCB0aGUgYWMgdXNpbmcgc2tiX2dldF9xdWV1ZV9tYXBwaW5nKCkuCj4g
SSdsbCBzZW5kIGFuIHVwZGF0ZSB3aXRoIHRoaXMgZml4ZWQgZm9yIHlvdSB0byB0cnkgOikKVGhh
bmtzIGZvciB0aGUgcXVpY2sgdXBkYXRlLiBJdCBpcyBnZXR0aW5nIG11Y2ggYmV0dGVyLCBidXQK
dW5mb3J0dW5hdGVseSB0aGUgcGVuZGluZyBhaXJ0aW1lIGFjY291bnRpbmcgc29tZXRpbWVzIGlz
IHN0aWxsIG5vdApjb3JyZWN0IGFuZCBjYXVzZSB0eHEgc3R1Y2sgb2NjYXNpb25hbGx5LgoKCgoK
Ck9uIFR1ZSwgT2N0IDIyLCAyMDE5IGF0IDQ6MzUgQU0gVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu
IDx0b2tlQHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4gS2FuIFlhbiA8a3lhbkBnb29nbGUuY29tPiB3
cml0ZXM6Cj4KPiA+PiArICAgICAgICAgICAgICAgaWYgKGllZWU4MDIxMV9pc19kYXRhX3Fvcyho
ZHItPmZyYW1lX2NvbnRyb2wpKSB7Cj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAgcWMgPSBp
ZWVlODAyMTFfZ2V0X3Fvc19jdGwoaGRyKTsKPiA+PiArICAgICAgICAgICAgICAgICAgICAgICB0
aWQgPSBxY1swXSAmIDB4ZjsKPiA+PiArICAgICAgICAgICAgICAgICAgICAgICBhYyA9IGllZWU4
MDIxMV9hY19mcm9tX3RpZCh0aWQpOwo+ID4+ICsgICAgICAgICAgICAgICB9IGVsc2Ugewo+ID4+
ICsgICAgICAgICAgICAgICAgICAgICAgIGFjID0gSUVFRTgwMjExX0FDX0JFOwo+ID4+ICsgICAg
ICAgICAgICAgICB9Cj4gPgo+ID4gVGhlIHRpZC9hYyBpcyBpbmNvcnJlY3QgZWl0aGVyIGhlcmUg
b3IgaW4gX19pZWVlODAyMTFfdHhfc3RhdHVzKCkgd2hlbgo+ID4gdGVzdGVkIHdpdGggYXRoMTBr
LiBUaGUgYWMgaXMgc2V0IHRvIEFDX0JFIHdpdGggdGVzdCBkb25lIHVzaW5nIEJLCj4gPiBjbGFz
cyB0cmFmZmljLCAgaGVuY2UgdGhlIHBlbmRpbmcgYWlydGltZSBnZXQgdXBkYXRlZCBmb3IgdGhl
IHdyb25nCj4gPiB0eHEuCj4KPiBIbW0sIEkgZ3Vlc3Mgd2UgY291bGQganVzdCBnZXQgdGhlIGFj
IHVzaW5nIHNrYl9nZXRfcXVldWVfbWFwcGluZygpLgo+IEknbGwgc2VuZCBhbiB1cGRhdGUgd2l0
aCB0aGlzIGZpeGVkIGZvciB5b3UgdG8gdHJ5IDopCj4KPiAtVG9rZQo+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0
aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vYXRoMTBrCg==
