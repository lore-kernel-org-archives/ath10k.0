Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOtGL-0006Td-Fn
 for ath10k@lists.infradead.org; Mon, 19 Nov 2018 23:47:31 +0000
Received: by mail-qk1-x743.google.com with SMTP id o125so143509qkf.3
 for <ath10k@lists.infradead.org>; Mon, 19 Nov 2018 15:47:18 -0800 (PST)
MIME-Version: 1.0
References: <1542063113-22438-1-git-send-email-rmanohar@codeaurora.org>
 <1542063113-22438-4-git-send-email-rmanohar@codeaurora.org>
 <e5344cad-2a18-a938-f2ed-43870027251c@nbd.name> <871s7nv9pl.fsf@toke.dk>
 <8e7847ff-4c88-10ae-2223-2fc7321641d9@nbd.name> <87sh02tfsp.fsf@toke.dk>
 <878t1p2bqz.fsf@taht.net> <87muq4sn50.fsf@toke.dk>
 <4DD985B6-7DBE-42F8-AC87-D6B40CEAE553@superduper.net>
In-Reply-To: <4DD985B6-7DBE-42F8-AC87-D6B40CEAE553@superduper.net>
From: Dave Taht <dave.taht@gmail.com>
Date: Mon, 19 Nov 2018 15:47:05 -0800
Message-ID: <CAA93jw4Cih5HkHYUOy7Vr5G7zi0KkKmNnNohDAVaj65goWOh+A@mail.gmail.com>
Subject: Re: [Make-wifi-fast] [PATCH v3 3/6] mac80211: Add airtime accounting
 and scheduling to TXQs
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
To: Simon Barber <simon@superduper.net>
Cc: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>, Rajkumar Manoharan <rmanohar@codeaurora.org>, Make-Wifi-fast <make-wifi-fast@lists.bufferbloat.net>, linux-wireless <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, Felix Fietkau <nbd@nbd.name>

T24gTW9uLCBOb3YgMTksIDIwMTggYXQgMzozMCBQTSBTaW1vbiBCYXJiZXIgPHNpbW9uQHN1cGVy
ZHVwZXIubmV0PiB3cm90ZToKPgo+Cj4KPiBPbiBOb3YgMTksIDIwMTgsIGF0IDI6NDQgUE0sIFRv
a2UgSMO4aWxhbmQtSsO4cmdlbnNlbiA8dG9rZUB0b2tlLmRrPiB3cm90ZToKPgo+IERhdmUgVGFo
dCA8ZGF2ZUB0YWh0Lm5ldD4gd3JpdGVzOgo+Cj4gVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIDx0
b2tlQHRva2UuZGs+IHdyaXRlczoKPgo+IEZlbGl4IEZpZXRrYXUgPG5iZEBuYmQubmFtZT4gd3Jp
dGVzOgo+Cj4gT24gMjAxOC0xMS0xNCAxODo0MCwgVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIHdy
b3RlOgo+Cj4gVGhpcyBwYXJ0IGRvZXNuJ3QgcmVhbGx5IG1ha2UgbXVjaCBzZW5zZSB0byBtZSwg
YnV0IG1heWJlIEknbQo+IG1pc3VuZGVyc3RhbmRpbmcgaG93IHRoZSBjb2RlIHdvcmtzLgo+IExl
dCdzIGFzc3VtZSB3ZSBoYXZlIGEgZHJpdmVyIGxpa2UgYXRoOWsgb3IgbXQ3Niwgd2hpY2ggdHJp
ZXMgdG8ga2VlcCBhCj4KPiDigKYuCj4KPgo+IFdlbGwsIHRoZXJlJ3MgZ29pbmcgdG8gYmUgYSBC
UUwtbGlrZSBxdWV1ZSBsaW1pdCAoYnV0IGZvciBhaXJ0aW1lKSBvbgo+IHRvcCwgd2hpY2ggZHJp
dmVycyBjYW4gb3B0LWluIHRvIGlmIHRoZSBoYXJkd2FyZSBoYXMgdG9vIG11Y2ggcXVldWVpbmcu
Cj4KPgo+IFZlcnkgaGFwcHkgdG8gcmVhZCB0aGlzIC0gSSBmaXJzdCB0YWxrZWQgdG8gRGF2ZSBU
YWh0IGFib3V0IHRoZSBuZWVkIGZvciBUaW1lIFF1ZXVlIExpbWl0cyBtb3JlIHRoYW4gNSB5ZWFy
cyBhZ28hCgpNaWNoYWwgZmFrZWQgdXAgYSBkcWwgZXN0aW1hdG9yIDMgKD8pIHllYXJzIGFnby4g
aXQgd29ya2VkLgoKaHR0cDovL2Jsb2cuY2Vyb3dydC5vcmcvcG9zdC9kcWxfb25fd2lmaV8yLwoK
QXMgYSBzaWRlIG5vdGUsIGluICphbnkqIHJlYWwgd29ybGQgd29ya2luZyBtdS1taW1vIHNpdHVh
dGlvbiBhdCBhbnkKc2NhbGUsIG9uIGFueSBlcXVpcG1lbnQsIGRvZXMgYW55b25lIGhhdmUgYW55
IHN0YXRzIG9uIGhvdyBvZnRlbiB0aGUKZmVhdHVyZSBpcyBhY3R1YWxseSB1c2VkIGFuZCB1c2Vm
dWw/CgpNeSBwZXJzb25hbCBndWVzcywgZnJvbSBsb29raW5nIGF0IHRoZSBzdGFuZGFyZCwgd2Fz
IGluIGhvbWUKc2NlbmFyaW9zLCB1c2FnZSB3b3VsZCBiZSBhYm91dC4uLiAwLCBhbmQgaW4gYSBj
b250cm9sbGVkIGVudmlyb25tZW50CmluIGEgZm9vdGJhbGwgc3RhZGl1bSwgcXVpdGUgYSBsb3Qu
CgpJbiBhIG9mZmljZSBvciBhcGFydG1lbnQgY29tcGxleCwgSSBmaWd1cmVkIGludGVyZmVyZW5j
ZSBhbmQgc28gZm9ydGgKd291bGQgbWFrZSBpdCBhIG5lZ2F0aXZlIGJlbmVmaXQgZHVlIHRvIHJl
dHJhbnNtaXRzLgoKSSBmZWx0IHdoZW4gdGhhdCBwYXJ0IG9mIHRoZSBzdGFuZGFyZCByb2xsZWQg
YXJvdW5kLi4uIHRoYXQgbXUtbWltbwp3YXMgYW4gaWRlYSB0aGF0IHNob3VsZCBuZXZlciBoYXZl
IGVzY2FwZWQgdGhlIGxhYi4gSSBjYW4gYmUgY29udmluY2VkCmJ5IGRhdGEsIHRoYXQgd2UgY2Fu
IGFpbSBmb3IgYSBoaWdoZXIgZ29hbCBoZXJlLiBCdXQgaXQgd291bGQgYmUKY29tZm9ydGluZyB0
byBoYXZlIGEgbWVhc3VyZWQgbm9uLWxhYiwgcmVhbC13b3JsZCwgYXQgcmVhbCB3b3JsZApyYXRl
cywgcmVzdWx0IGZvciBpdCwgb24gc29tZSBwbGF0Zm9ybSwgb2YgaXQgYWN0dWFsbHkgYmVpbmcg
dXNlZnVsLgoKPiBTaW1vbgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBNYWtlLXdpZmktZmFzdCBtYWlsaW5nIGxpc3QKPiBNYWtlLXdpZmktZmFz
dEBsaXN0cy5idWZmZXJibG9hdC5uZXQKPiBodHRwczovL2xpc3RzLmJ1ZmZlcmJsb2F0Lm5ldC9s
aXN0aW5mby9tYWtlLXdpZmktZmFzdAoKCgotLSAKCkRhdmUgVMOkaHQKQ1RPLCBUZWtMaWJyZSwg
TExDCmh0dHA6Ly93d3cudGVrbGlicmUuY29tClRlbDogMS04MzEtMjA1LTk3NDAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxp
c3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
