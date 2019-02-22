Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gxAYK-0007kb-Kq
 for ath10k@lists.infradead.org; Fri, 22 Feb 2019 13:07:50 +0000
Message-ID: <a5151441bdfe02cb11043aa0786185b8ee3c3ee9.camel@sipsolutions.net>
Subject: Re: [PATCH] mac80211: Change default tx_sk_pacing_shift to 7
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 22 Feb 2019 14:07:36 +0100
In-Reply-To: <87lg28vup0.fsf@toke.dk>
References: <20190221172936.21816-1-toke@redhat.com>
 <E1gx9x3-0002j0-1J@sipsolutions.net> <87lg28vup0.fsf@toke.dk>
Mime-Version: 1.0
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
To: Toke =?ISO-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@toke.dk>
Cc: Kan Yan <kyan@google.com>, wgong@qti.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Grant Grundler <grundler@google.com>, wgong@codeaurora.org, Ben Greear <greearb@candelatech.com>, Kalle Valo <kvalo@codeaurora.org>

T24gRnJpLCAyMDE5LTAyLTIyIGF0IDE0OjA2ICswMTAwLCBUb2tlIEjDuGlsYW5kLUrDuHJnZW5z
ZW4gd3JvdGU6Cj4gSm9oYW5uZXMgQmVyZyA8am9oYW5uZXNAc2lwc29sdXRpb25zLm5ldD4gd3Jp
dGVzOgo+IAo+ID4gVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIHdyb3RlOgo+ID4gCj4gPiA+IFdo
ZW4gd2UgZGlkIHRoZSBvcmlnaW5hbCB0ZXN0cyBmb3IgdGhlIG9wdGltYWwgdmFsdWUgb2Ygc2tf
cGFjaW5nX3NoaWZ0LCB3ZQo+ID4gPiBjYW1lIHVwIHdpdGggNiBtcyBvZiBidWZmZXJpbmcgYXMg
dGhlIGRlZmF1bHQuIFNhZGx5LCA2IGlzIG5vdCBhIHBvd2VyIG9mCj4gPiA+IHR3bywgc28gd2hl
biBwaWNraW5nIHRoZSBzaGlmdCB2YWx1ZSBJIGVycmVkIG9uIHRoZSBzaXplIG9mIGxlc3MgYnVm
ZmVyaW5nCj4gPiA+IGFuZCBwaWNrZWQgNCBtcyBpbnN0ZWFkIG9mIDguIFRoaXMgd2FzIHByb2Jh
Ymx5IHdyb25nOyB0aG9zZSAyIG1zIG9mIGV4dHJhCj4gPiA+IGJ1ZmZlcmluZyBtYWtlcyBhIGxh
cmdlciBkaWZmZXJlbmNlIHRoYW4gSSB0aG91Z2h0Lgo+ID4gPiAKPiA+ID4gU28sIGNoYW5nZSB0
aGUgZGVmYXVsdCBwYWNpbmcgc2hpZnQgdG8gNywgd2hpY2ggY29ycmVzcG9uZHMgdG8gOCBtcyBv
Zgo+ID4gPiBidWZmZXJpbmcuIFRoZSBwb2ludCBvZiBkaW1pbmlzaGluZyByZXR1cm5zIHJlYWxs
eSBraWNrcyBpbiBhZnRlciA4IG1zLCBhbmQKPiA+ID4gc28gaGF2aW5nIHRoaXMgYXMgYSBkZWZh
dWx0IHNob3VsZCBjdXQgZG93biBvbiB0aGUgbmVlZCBmb3IgZXh0ZW5zaXZlCj4gPiA+IHBlci1k
ZXZpY2UgdGVzdGluZyBhbmQgb3ZlcnJpZGVzIG5lZWRlZCBpbiB0aGUgZHJpdmVycy4KPiA+ID4g
Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFRva2UgSMO4aWxhbmQtSsO4cmdlbnNlbiA8dG9rZUByZWRo
YXQuY29tPgo+ID4gCj4gPiBQYXRjaCBhcHBsaWVkIHRvIHdpcmVsZXNzLmdpdCwgdGhhbmtzLgo+
ID4gCj4gPiBhNDFmNTZiOWExN2EgKEhFQUQgLT4gbWFjODAyMTEpIG1hYzgwMjExOiBDaGFuZ2Ug
ZGVmYXVsdAo+ID4gdHhfc2tfcGFjaW5nX3NoaWZ0IHRvIDcKClRoaXMgbWVzcyBjYW1lIGZyb20g
S2FsbGUncyB0b29sIGJ0dywgc28gSSBjYW4ndCByZWFsbHkgdXNlIGl0IHlldCA6LSkKCj4gQ29v
bCwgdGhhbmtzISBXaGF0J3MgdGhlIGVhc2llc3Qgd2F5IHRvIGJhY2twb3J0IHRoaXM/IEkgZmln
dXJlIGl0J3MKPiBlYXNpZXIgdG8ganVzdCB1cGRhdGUgc2tfcGFjaW5nX3NoaWZ0X3VwZGF0ZSgp
IGluIHR4LmMgZm9yIDQuMTkgKHdoaWNoCj4gcHJlZGF0ZXMgdGhlIGFkZGl0aW9uIG9mIHRoZSBk
cml2ZXIgb3ZlcnJpZGUgaG9vayk7IHNoYWxsIEkganVzdCBzZW5kIGEKPiBzZXBhcmF0ZSBwYXRj
aCB0byBzdGFibGUgZm9yIHRoYXQ/IE9yIGRvIHdlIG5lZWQgdG8gYmFja3BvcnQgdGhlIGRyaXZl
cgo+IG92ZXJyaWRlIGhvb2sgYXMgd2VsbD8KCkp1c3QgdXBkYXRlIHRoZSB2YWx1ZSwgbm8gbmVl
ZCB0byBiYWNrcG9ydCB0aGUgaG9vay4KCmpvaGFubmVzCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2F0aDEwawo=
