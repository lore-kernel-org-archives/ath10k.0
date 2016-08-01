Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-it0-x244.google.com ([2607:f8b0:4001:c0b::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bU99y-00039f-EF
 for ath10k@lists.infradead.org; Mon, 01 Aug 2016 09:05:19 +0000
Received: by mail-it0-x244.google.com with SMTP id j124so11477486ith.3
 for <ath10k@lists.infradead.org>; Mon, 01 Aug 2016 02:04:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CACiydb+yNc-UKVRFR-UxTq-YFBDpEDsa1qWNBGCHpe=_zv8o7g@mail.gmail.com>
References: <1463489221-24989-1-git-send-email-michal.kazior@tieto.com>
 <1467201146-6844-1-git-send-email-michal.kazior@tieto.com>
 <87zipt1kco.fsf@kamboji.qca.qualcomm.com>
 <CACiydb+yNc-UKVRFR-UxTq-YFBDpEDsa1qWNBGCHpe=_zv8o7g@mail.gmail.com>
From: Dave Taht <dave.taht@gmail.com>
Date: Mon, 1 Aug 2016 11:04:56 +0200
Message-ID: <CAA93jw6j0pBKnm3Fs=D7V1CUsBnhZKKymbk4=UQuFWKuEAs-+Q@mail.gmail.com>
Subject: Re: [PATCH] ath10k: disable wake_tx_queue for older devices
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
To: Roman Yeryomin <leroi.lists@gmail.com>
Cc: "Valo, Kalle" <kvalo@qca.qualcomm.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "michal.kazior@tieto.com" <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gTW9uLCBBdWcgMSwgMjAxNiBhdCAxOjM1IEFNLCBSb21hbiBZZXJ5b21pbiA8bGVyb2kubGlz
dHNAZ21haWwuY29tPiB3cm90ZToKPiBPbiA3IEp1bHkgMjAxNiBhdCAxOTozMCwgVmFsbywgS2Fs
bGUgPGt2YWxvQHFjYS5xdWFsY29tbS5jb20+IHdyb3RlOgo+PiBNaWNoYWwgS2F6aW9yIDxtaWNo
YWwua2F6aW9yQHRpZXRvLmNvbT4gd3JpdGVzOgo+Pgo+Pj4gSWRlYWxseSB3YWtlX3R4X3F1ZXVl
IHNob3VsZCBiZSB1c2VkIHJlZ2FyZGxlc3MgYXMKPj4+IGl0IGlzIGEgcmVxdWlyZW1lbnQgZm9y
IHJlZHVjaW5nIGJ1ZmZlcmJsb2F0IGFuZAo+Pj4gaW1wbGVtZW50aW5nIGFpcnRpbWUgZmFpcm5l
c3MgaW4gdGhlIGZ1dHVyZS4KPj4+Cj4+PiBIb3dldmVyIHNvbWUgc2V0dXBzICh0eXBpY2FsbHkg
bG93LWVuZCBwbGF0Zm9ybXMKPj4+IGhvc3RpbmcgUUNBOTg4WCkgc3VmZmVyIHBlcmZvcm1hbmNl
IHJlZ3Jlc3Npb25zCj4+PiB3aXRoIHRoZSBjdXJyZW50IHdha2VfdHhfcXVldWUgaW1wbGVtZW50
YXRpb24uCj4+PiBUaGVyZWZvcmUgZGlzYWJsZSBpdCB1bmxlc3MgaXQgaXMgcmVhbGx5Cj4+PiBi
ZW5lZmljaWFsIHdpdGggY3VycmVudCBjb2RlYmFzZSAod2hpY2ggaXMgd2hlbgo+Pj4gZmlybXdh
cmUgc3VwcG9ydHMgc21hcnQgcHVsbC1wdXNoIHR4IHNjaGVkdWxpbmcpLgo+Pj4KPj4+IFNpZ25l
ZC1vZmYtYnk6IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGlldG8uY29tPgo+Pgo+PiBJ
IHRoaW5rIGl0J3MgdG9vIGxhdGUgdG8gc2VuZCB0aGlzIHRvIDQuNyBhbnltb3JlIChhbmQgdGhp
cyBkdWUgdG8gbXkKPj4gdmFjYXRpb24pLiBTbyBJJ20gcGxhbm5pbmcgdG8gcXVldWUgdGhpcyB0
byA0LjgsIGJ1dCBpZiB0aGUgZmVlZGJhY2sgaXMKPj4gcG9zaXRpdmUgd2UgY2FuIGFsd2F5cyBz
ZW5kIHRoaXMgdG8gYSA0Ljcgc3RhYmxlIHJlbGVhc2UuCj4+Cj4KPiBTb3JyeSBndXlzLCBkcm93
bmVkLgo+IFNvLCB5ZXMsIGFwcGx5aW5nIHRoaXMgcGF0Y2ggZG9lcyB0aGUgam9iLiBUaGF0IGlz
IGdldHMgbWUgdG8gdGhlCj4gcmVzdWx0cyBzaW1pbGFyIHRvCj4gaHR0cHM6Ly9saXN0cy5vcGVu
d3J0Lm9yZy9waXBlcm1haWwvb3BlbndydC1kZXZlbC8yMDE2LU1heS8wNDE0NDguaHRtbAo+Cj4g
R29pbmcgdG8gdHJ5IGxhdGVzdCBjb2RlIG9uIHNhbWUgc3lzdGVtLi4uCgpDYW4geW91IHRyeSBp
bmNyZWFzaW5nIHRoZSBxdWFudHVtIHRvIDE1MTQsIGFuZCByZWR1Y2luZyB0aGUgY29kZWwKdGFy
Z2V0IHRvIDVtcz8gKHdpdGhvdXQgdGhpcyBwYXRjaD8pCgo+Cj4gUmVnYXJkcywKPiBSb21hbgo+
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhdGgx
MGsgbWFpbGluZyBsaXN0Cj4gYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawoKCgotLSAKRGF2ZSBUw6Ro
dApMZXQncyBnbyBtYWtlIGhvbWUgcm91dGVycyBhbmQgd2lmaSBmYXN0ZXIhIFdpdGggYmV0dGVy
IHNvZnR3YXJlIQpodHRwOi8vYmxvZy5jZXJvd3J0Lm9yZwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2F0aDEwawo=
