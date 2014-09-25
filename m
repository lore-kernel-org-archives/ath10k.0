Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22c.google.com ([2a00:1450:400c:c05::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XX2Lt-0005VU-0n
 for ath10k@lists.infradead.org; Thu, 25 Sep 2014 06:16:29 +0000
Received: by mail-wi0-f172.google.com with SMTP id em10so8226989wid.11
 for <ath10k@lists.infradead.org>; Wed, 24 Sep 2014 23:16:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5422ECAA.6050600@candelatech.com>
References: <1411426820-4047-1-git-send-email-greearb@candelatech.com>
 <CA+BoTQn9sECMNZsxQpB4i3wHPxfVL+LXq9=2GBd-opH6+9TD=A@mail.gmail.com>
 <5421A44C.8080307@candelatech.com>
 <CA+BoTQ=mry3tPD-LK+gFD2bC6RU0KvY6LC9=FOAGTLi_1rzUog@mail.gmail.com>
 <5422ECAA.6050600@candelatech.com>
Date: Thu, 25 Sep 2014 08:16:03 +0200
Message-ID: <CA+BoTQnLbJ7cnyUo-o6Ebx9pAxGyAHv8W8eKE8BEd7Kh8f+uTw@mail.gmail.com>
Subject: Re: [PATCH] ath10k: use configured nss instead of max nss.
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMjQgU2VwdGVtYmVyIDIwMTQgMTg6MDksIEJlbiBHcmVlYXIgPGdyZWVhcmJAY2FuZGVsYXRl
Y2guY29tPiB3cm90ZToKPiBPbiAwOS8yNC8yMDE0IDEyOjA5IEFNLCBNaWNoYWwgS2F6aW9yIHdy
b3RlOgo+PiBPbiAyMyBTZXB0ZW1iZXIgMjAxNCAxODo0OCwgQmVuIEdyZWVhciA8Z3JlZWFyYkBj
YW5kZWxhdGVjaC5jb20+IHdyb3RlOgo+Pj4gT24gMDkvMjMvMjAxNCAwMTo1OSBBTSwgTWljaGFs
IEthemlvciB3cm90ZToKPj4+PiBPbiAyMyBTZXB0ZW1iZXIgMjAxNCAwMTowMCwgIDxncmVlYXJi
QGNhbmRlbGF0ZWNoLmNvbT4gd3JvdGU6Cj4+Pj4+IEZyb206IEJlbiBHcmVlYXIgPGdyZWVhcmJA
Y2FuZGVsYXRlY2guY29tPgo+PiBbLi4uXQo+Pj4+PiBAQCAtNDA4Niw2ICs0MDg2LDEwIEBAIGF0
aDEwa19kZWZhdWx0X2JpdHJhdGVfbWFzayhzdHJ1Y3QgYXRoMTBrICphciwKPj4+Pj4gICAgICAg
ICB1MzIgbGVnYWN5ID0gMHgwMGZmOwo+Pj4+PiAgICAgICAgIHU4IGh0ID0gMHhmZiwgaTsKPj4+
Pj4gICAgICAgICB1MTYgdmh0ID0gMHgzZmY7Cj4+Pj4+ICsgICAgICAgdTE2IG5yZiA9IGFyLT5u
dW1fcmZfY2hhaW5zOwo+Pj4+PiArCj4+Pj4+ICsgICAgICAgaWYgKGFyLT5jZmdfdHhfY2hhaW5t
YXNrKQo+Pj4+PiArICAgICAgICAgICAgICAgbnJmID0gZ2V0X25zc19mcm9tX2NoYWlubWFzayhh
ci0+Y2ZnX3R4X2NoYWlubWFzayk7Cj4+IFsuLi5dCj4+Pj4gSSB0aGluayBpdCBtaWdodCBiZSBh
IGdvb2QgaWRlYSB0byBjb252ZXkgdGhlIGxpbWl0YXRpb24gb2YgdHgvcngKPj4+PiBjaGFpbm1h
c2sgdG8gdGhlIHVzZXI6IHlvdSBjYW4ndCBjaGFuZ2UgdGhlIHR4L3J4IGNoYWlubWFzayBvbiB0
aGUgZmx5Cj4+Pj4gZWFzaWx5ICh3aGlsZSBjb25uZWN0ZWQvaGF2ZSBhc3NvY2lhdGVkIHN0YXRp
b25zKS4gT3IgZG8geW91IHBsYW4gdG8KPj4+PiBzY2hlZHVsZSBwZWVyIHJlYXNzb2MgaW4gX19h
dGgxMGtfc2V0X2FudGVubmEoKSBpbiBhIGZvbGxvdyB1cAo+Pj4+IHBhdGNoKGVzKSBsYXRlcj8K
Wy4uLl0KPiBTZWUgdGhpcyBpbiBuZXQvbWFjODAyMTEvY2ZnLmM6Cj4KPiBzdGF0aWMgaW50IGll
ZWU4MDIxMV9zZXRfYW50ZW5uYShzdHJ1Y3Qgd2lwaHkgKndpcGh5LCB1MzIgdHhfYW50LCB1MzIg
cnhfYW50KQo+IHsKPiAgICAgICAgIHN0cnVjdCBpZWVlODAyMTFfbG9jYWwgKmxvY2FsID0gd2lw
aHlfcHJpdih3aXBoeSk7Cj4KPiAgICAgICAgIGlmIChsb2NhbC0+c3RhcnRlZCkKPiAgICAgICAg
ICAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOwoKQWgsIHRoYW5rcyEgU28gbXkgYXJndW1lbnQg
aXMgaW52YWxpZCA6KQoKCj4+IEJ1dCBpdCdzIHN0aWxsIHByb2JhYmx5IGEgZ29vZCBpZGVhIHRv
IGNvbW1lbnQgdGhlIHF1b3RlZCBjb2RlIGNodW5rCj4+IGFib3ZlIGV4cGxhaW5pbmcgd2h5IG5y
ZiBpcyBvdmVycmlkZW4gYnkgY2hhaW5tYXNrIChpLmUuIGR1ZSB0bwo+PiBmaXJtd2FyZSByYXRl
IGNvbnRyb2wgaXNzdWVzLCByaWdodD8pLgo+Cj4gSSBhbSBub3QgY2VydGFpbiBpdCBpcyBhIGJ1
ZyBpbiB0aGUgZmlybXdhcmUuICBUaGUgZHJpdmVyIHNob3VsZCBub3QgY29uZmlndXJlCj4gbnNz
IGluY29ycmVjdGx5IGFzIGl0IHdhcyBkb2luZyBwcmV2aW91cyB0byBteSByZWNlbnQgcGF0Y2hl
cy4KClNpbmNlIGZpcm13YXJlIGRvZXMgcmF0ZSBjb250cm9sIGl0IGp1c3Qgc2VlbXMgcmVkdW5k
YW50IGZvciB0aGUKZHJpdmVyIHRvIHVwZGF0ZSBib3RoIGNoYWlubWFzayBhbmQgbnNzICh0aGUg
Zmlyc3QgaW1wbGllcyB0aGUgb3RoZXIpLgpCdXQgbWF5YmUgdGhhdCdzIGp1c3QgbWUuCgoKTWlj
aGHFggoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRo
MTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
