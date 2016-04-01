Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22a.google.com ([2a00:1450:400c:c09::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1alsUc-00027f-A6
 for ath10k@lists.infradead.org; Fri, 01 Apr 2016 06:23:38 +0000
Received: by mail-wm0-x22a.google.com with SMTP id 127so8382420wmu.1
 for <ath10k@lists.infradead.org>; Thu, 31 Mar 2016 23:23:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <56FE05B7.80104@candelatech.com>
References: <56F97F91.10007@candelatech.com>
 <CA+BoTQnzFiS2HpUweNzwhiUD3Gaa40pZq+z8GhHLn5STq1OgHQ@mail.gmail.com>
 <56FAA3D5.3070409@candelatech.com>
 <CA+BoTQkmc2z8kWu=dcHJ2WMwi631ePqcQyjj59_95kv1aLdC1g@mail.gmail.com>
 <56FD53E8.3020200@candelatech.com>
 <CA+BoTQmFhqpyH--ik7YP8rbimVJnw+aC_go3xrPmYhrLTA5KHg@mail.gmail.com>
 <56FE05B7.80104@candelatech.com>
Date: Fri, 1 Apr 2016 08:23:16 +0200
Message-ID: <CA+BoTQmTY_0LBb+gkxcvCbPGshNGT1_T++5mM2odntoX=KitZQ@mail.gmail.com>
Subject: Re: hacked 4.4.6+, 10.4.3 firmware, Running out of ring-index for
 pipe-id 3 (WMI).
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k <ath10k@lists.infradead.org>

T24gMSBBcHJpbCAyMDE2IGF0IDA3OjIzLCBCZW4gR3JlZWFyIDxncmVlYXJiQGNhbmRlbGF0ZWNo
LmNvbT4gd3JvdGU6Cj4KPgo+IE9uIDAzLzMxLzIwMTYgMTA6MTggUE0sIE1pY2hhbCBLYXppb3Ig
d3JvdGU6Cj4+Cj4+IE9uIDMxIE1hcmNoIDIwMTYgYXQgMTg6NDQsIEJlbiBHcmVlYXIgPGdyZWVh
cmJAY2FuZGVsYXRlY2guY29tPiB3cm90ZToKPj4+Cj4+PiBPbiAwMy8zMC8yMDE2IDExOjUxIFBN
LCBNaWNoYWwgS2F6aW9yIHdyb3RlOgo+Cj4KPj4+Cj4+PiBTbywgSSBhbSB1c2luZyBNU0ktWCwg
SSBndWVzcz8KPj4+Cj4+PiAjIGRtZXNnfGdyZXAgLWkgbXNpCj4+PiBbNjUyODQuODUzMzcyXSBh
dGgxMGtfcGNpIDAwMDA6MDU6MDAuMDogcGNpIGlycSBtc2kteCBpbnRlcnJ1cHRzIDEzCj4+PiBp
cnFfbW9kZQo+Pj4gMCByZXNldF9tb2RlIDAKPj4KPj4KPj4gWWVwLiBUaGlzIGF0IGxlYXN0IG1h
a2VzIGl0IHBvc3NpYmxlIGZvciB0aGlzIHdlaXJkIHByb2JsZW0gdG8gY29tZQo+PiBpbnRvIGV4
aXN0YW5jZS4gSG93ZXZlciBJIHN0aWxsIGZpbmQgaXQgYSBsaXR0bGUgaGFyZCB0byBiZWxpZXZl
IGZvcgo+PiB0YXNrbGV0cyB0byBiZSBzY2hlZHVsZWQgdGhpcyBiYWRseS4gTWF5YmUgdGhlIGRl
dmljZSBkb2Vzbid0IGFzc2VydAo+PiBpbnRlcnJ1cHRzIHByb3Blcmx5IGFzIEFkcmlhbiBzdWdn
ZXN0ZWQ/IE9yIG1heWJlIHRoZXkgYXJlIG5vdCBtYXBwZWQKPj4gcHJvcGVybHk/IEkgdGhpbmsg
eW91J3JlIGFjdHVhbGx5IHRoZSBmaXJzdCBvbmUgdG8gZXhlcmNpc2UgTVNJLXJhbmdlCj4+IHN1
cHBvcnQgb24gcWNhOTl4MC4KPgo+Cj4gSSBhcHBsaWVkIFJhamt1bWFyJ3MgcGF0Y2ggdG8gZGlz
YWJsZSBtc2kteCB0b2RheSwgc28gbWF5YmUgdGhhdCB3aWxsIGJlCj4gdGhlIGVuZCBvZiB0aG9z
ZSBwcm9ibGVtcy4KPgo+IEkgdGhpbmsgdXBzdHJlYW0gbWlnaHQgd2FudCBhIHdhcm4tb24gZm9y
IHRoYXQgd21pIGlzc3VlLCBldmVuIGlmIHlvdSBkb24ndAo+IGFkZCB0aGUgd29yay1hcm91bmQg
Y29kZSB0aG91Z2guLi5qdXN0IHRvIHNlZSBpZiBzb21lb25lIGVsc2UgaGl0cyBpdC4KCkhtLi4g
bm90IHJlYWxseSBzdXJlLiBJZiBGVyBjcmFzaGVzIHlvdSdsbCBzZWUgYSB0b24gbyB3YXJuaW5n
cy4uCgoKTWljaGHFggoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
