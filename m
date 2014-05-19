Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x229.google.com ([2a00:1450:400c:c05::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WmUn4-0006z2-RK
 for ath10k@lists.infradead.org; Mon, 19 May 2014 21:08:11 +0000
Received: by mail-wi0-f169.google.com with SMTP id hi2so5851876wib.4
 for <ath10k@lists.infradead.org>; Mon, 19 May 2014 14:07:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAJ-Vmo=ODZMM5KRSNC087MqgHBwHT6r1AK49+i3dtJrUtoAi=g@mail.gmail.com>
References: <CAHqTa-3YUpt3jByNxiEkPGV52CoRDS-R4W33ywKVLa-Ye9d2bQ@mail.gmail.com>
 <53703B61.3050305@candelatech.com>
 <CAHqTa-3Rj-=4A3BoQoD0fb7P=jDd53KvGjxW_BnkoF_+hdWW5g@mail.gmail.com>
 <53704888.9060602@candelatech.com>
 <CAHqTa-2sG0wDVaGQVkVcPezArA=OGT+35s_GU+5AmV0TQOau7w@mail.gmail.com>
 <537056B1.6060902@candelatech.com>
 <CAHqTa-1DwKqeSQD5FwOomyhqHv1THWD__0pnEs3RktOigp70kw@mail.gmail.com>
 <CAHqTa-2y9n3AxdN--QGqGW-HRZnrBwEOhujWZ4FNZKmpU+kHMQ@mail.gmail.com>
 <CAHqTa-3gn1N8hTW4rpMos+h+K4nafoEsv94P0=0O3=Dpiaf2oA@mail.gmail.com>
 <CAA93jw6-Vu5=ySa1Oi6WO1BEo8cuAnKP3FJNJD1P=dEj_-9D3A@mail.gmail.com>
 <CAHqTa-1byQ+UHmREP5+RtikWDj-0wFbDPdPcO+HL0HnH+eDdig@mail.gmail.com>
 <CAJ-Vmo=ODZMM5KRSNC087MqgHBwHT6r1AK49+i3dtJrUtoAi=g@mail.gmail.com>
Date: Mon, 19 May 2014 14:07:46 -0700
Message-ID: <CAA93jw62Msp9p33u_bOGUfSjHrP1t=YZcf=0E3V79-haAUFybw@mail.gmail.com>
Subject: Re: Unicast packets stop being transmitted to a particular station,
 under load, when WPA2 is enabled
From: Dave Taht <dave.taht@gmail.com>
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
Cc: Ben Greear <greearb@candelatech.com>, ath10k <ath10k@lists.infradead.org>, Avery Pennarun <apenwarr@gmail.com>

ZnJvbSB3aGF0IEkgc2VlIGZyb20gcmVwb3J0cyBvbiB0aGUgYXRoOWsgbGlzdCwgYW5kIG9wZW53
cnQKSSB0ZW5kIHRvIHRoaW5rIHRoaXMgcHJvYmxlbSBpcyBlbmRlbWljLCBhbmQgbm90IGRyaXZl
ciBzcGVjaWZpYy4KCk9uIE1vbiwgTWF5IDE5LCAyMDE0IGF0IDI6MDQgUE0sIEFkcmlhbiBDaGFk
ZCA8YWRyaWFuQGZyZWVic2Qub3JnPiB3cm90ZToKPiBIaSwKPgo+IEJ1bXBpbmcgdGhpcyB1cC4K
Pgo+IFBsZWFzZSBkb24ndCBsZXQgdXMgZm9yZ2V0LiBvbmNlIEkgZ2V0IGFjY2VzcyB0byB0aGUg
ZmlybXdhcmUgc291cmNlCj4gZnJvbSBCZW4gYW5kIFFDQSBJJ2xsIGRvIGEgaGVsbCBvZiBhIGxv
dCBtb3JlIGRpZ2dpbmcuCj4KPiBUaGFua3MsCj4KPgo+Cj4gLWEKPgo+Cj4gT24gMTQgTWF5IDIw
MTQgMjM6MTIsIEF2ZXJ5IFBlbm5hcnVuIDxhcGVud2FyckBnbWFpbC5jb20+IHdyb3RlOgo+PiBP
biBXZWQsIE1heSAxNCwgMjAxNCBhdCAzOjI2IFBNLCBEYXZlIFRhaHQgPGRhdmUudGFodEBnbWFp
bC5jb20+IHdyb3RlOgo+Pj4gT24gV2VkLCBNYXkgMTQsIDIwMTQgYXQgMTI6MDcgUE0sIEF2ZXJ5
IFBlbm5hcnVuIDxhcGVud2FyckBnbWFpbC5jb20+IHdyb3RlOgo+Pj4+IGJ1dCBtZWFud2hpbGUs
IEkgdGhpbmsgSSdtIGluIGEKPj4+PiBiaWcgaHVycnkgc28gSSBwcm9iYWJseSB3YW50IHRvIGp1
c3QgcmlwIG91dCBhbGwgc3VwcG9ydCBmb3IgbWFwcGluZwo+Pj4+IGRpZmZzZXJ2IHRvIFFvUyBv
biB0aGUgYXRoMTBrIHRyYW5zbWl0IHNpZGUuICBEb2VzIGFueW9uZSBoYXZlIGFueQo+Pj4+IHN1
Z2dlc3Rpb25zIG9uIHdoZXJlIHRvIGxvb2sgZm9yIG15IGhhY2stYW5kLXNsYXNoIG9wZXJhdGlv
bj8KPj4+Cj4+PiBUaXMgZWFzeSB0byBoYWNrIGFuZCBzbGFzaCBpdCBvdXQgb2YgY2ZnODAyMTFf
Y2xhc3NpZnk4MDIxZCBpbgo+Pj4gbmV0L3dpcmVsZXNzL3V0aWwuYwo+Pj4KPj4+IFJlY2VudGx5
IHNvbWVvbmUgYWRkZWQgYSBkaXJlY3QgbWFwcGluZyBmcm9tIHZsYW4gcHJpb3JpdGllcyB0byB3
aWZpCj4+PiBxdWV1ZXMgaGVyZSAtIHdoaWNoIGlzIHN0dXBpZCwgYXMgdGhlIFZPIHF1ZXVlIGRv
ZXMgbm90IGJlaGF2ZQo+Pj4gYW55dGhpbmcgbGlrZSB0aGUgZXF1aXZhbGVudCB2bGFuIHByaW9y
aXR5IHF1ZXVlIGRvZXMuIEknZCBsaWtlIHRvIHNlZQo+Pj4gdGhhdCByZW1vdmVkIG9yIG1hcHBl
ZCBwcm9wZXJseSwgYWxzby4KPj4KPj4gWXVwLCByZXBsYWNlZCB0aGlzIGZ1bmN0aW9uIHdpdGgg
J3JldHVybiAwJyBhbmQgbXkgcHJvYmxlbXMgYXJlIGdvbmUuCj4+IChXZWxsIG9rYXksIHRoaXMg
cHJvYmxlbSBpcyBnb25lLCBhbmQgeW91J3JlIHByb2JhYmx5IG5vdCBpbnRlcmVzdGVkCj4+IGlu
IG15IHBlcnNvbmFsIHByb2JsZW1zLiA6KSkKPj4KPj4gT2J2aW91c2x5IGp1c3QgY29tcGxldGVs
eSBkaXNhYmxpbmcgUW9TIG11bHRpcGxlIHF1ZXVlcyBpcyBub3QgdGhlCj4+IHJpZ2h0IGxvbmcg
dGVybSBmaXgsIGJ1dCBhcyBEYXZlIHBvaW50ZWQgb3V0LCBpdCB3YXNuJ3QgY2xlYXIgdGhlIGNv
ZGUKPj4gdGhlcmUgd2FzIGV4YWN0bHkgd2hhdCB3ZSB3YW50IGFueXdheSwgc28gSSB3b24ndCBm
ZWVsIHRvbyBndWlsdHkKPj4gYWJvdXQgaXQuICBNZWFud2hpbGUsIGhvcGVmdWxseSBzb21lb25l
IHdpdGggZGVlcGVyIGtub3dsZWRnZSB0aGFuIG1lCj4+IGNhbiBmaWd1cmUgb3V0IHdoYXQncyB3
aXRoIHRoZSBJVnMuCj4+Cj4+IFRoYW5rcyEKPj4KPj4gQXZlcnkKPj4KPj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gYXRoMTBrIG1haWxpbmcgbGlz
dAo+PiBhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawoKCgotLSAKRGF2ZSBUw6RodAoKTlNGVzogaHR0
cHM6Ly93Mi5lZmYub3JnL0NlbnNvcnNoaXAvSW50ZXJuZXRfY2Vuc29yc2hpcF9iaWxscy9ydXNz
ZWxsXzAyOTZfaW5kZWNlbnQuYXJ0aWNsZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEw
awo=
