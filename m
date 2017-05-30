Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x232.google.com ([2a00:1450:400c:c0c::232])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dFlmt-0002Tp-Ef
 for ath10k@lists.infradead.org; Tue, 30 May 2017 18:22:37 +0000
Received: by mail-wr0-x232.google.com with SMTP id v104so5401716wrb.0
 for <ath10k@lists.infradead.org>; Tue, 30 May 2017 11:22:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <6cadea3f-b386-7fc2-9295-720ced82631d@candelatech.com>
References: <35449B299288584097A15B3FEB9C3E5825786B4500@SBS-GHMT.ghmt.local>
 <6cadea3f-b386-7fc2-9295-720ced82631d@candelatech.com>
From: Adrian Chadd <adrian@freebsd.org>
Date: Tue, 30 May 2017 11:22:12 -0700
Message-ID: <CAJ-VmontSGS9yBCRKJu7kkjrmG6zkYV47YH6vRSpUqyUEj2nvw@mail.gmail.com>
Subject: Re: is it possible to enable dualband or even 2.4 GHz on QCA9994?
 (Compex WLE1216V5-20)
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
Cc: "Lindner, Frank" <Frank.Lindner@ghmt.de>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

aGksCgp3YWl0IC0gaXMgdGhhdCBiZXNyYT8gaWYgaXQncyBiZXNyYSB0aGVuIG5vcGUgLSA1RyBv
bmx5LiBJZiBpdCdzCmJlZWxpbmVyIG9yIGNhc2NhZGUgdGhlbiBJIHRoaW5rIHlvdSBjYW4gZG8g
MkcsIGJ1dCBubyBkeW5hbWljIDJHLzVHPwoKCi1hCgoKT24gMzAgTWF5IDIwMTcgYXQgMDk6Mjgs
IEJlbiBHcmVlYXIgPGdyZWVhcmJAY2FuZGVsYXRlY2guY29tPiB3cm90ZToKPiBJIHRoaW5rIHpj
b21heCBtYWtlcyBhIDIuNEdoeiBOSUMgd2l0aCA5OTg0IGNoaXBzZXQsIGJ1dCB0aGF0IE5JQyBj
YW5ub3QgZG8KPiA1R2h6IGFzIGZhciBhcyBJIGtub3cuCj4KPiBUaGFua3MsCj4gQmVuCj4KPgo+
Cj4gT24gMDUvMjkvMjAxNyAwODoxNSBBTSwgTGluZG5lciwgRnJhbmsgd3JvdGU6Cj4+Cj4+IFRo
aXMgY2FyZCBpcyBvbmx5IDVHSHogY2FwYWJsZS4gSXMgdGhpcyBzb21laG93IHBvc3NpYmxlIHRv
IGVuYWJsZQo+PiBkdWFsYmFuZCBvciAyLjQgR0h6IGNoYW5uZWxzLCBldmVuIHdoZW4gdGhlcmUg
aXMgbm8gc3VpdGFibGUgTE5BIG9uIHRoZQo+PiBtb2R1bGU/Cj4+IFdoZW4geWVzLCBob3cgdG8g
ZG8gdGhpcz8KPj4KPj4gVGhhbmtzCj4+Cj4+IEJlc3QgUmVnYXJkcywKPj4gRnJhbmsKPj4KPj4K
Pj4KPj4KPj4gVm9yc3RhbmRzdm9yc2l0emVuZGVyOiBEaXBsLi1JbmcuIERpcmsgV2lsaGVsbQo+
PiBBdWZzaWNodHNyYXRzdm9yc2l0emVuZGVyOiBEci4tSW5nLiBQZXRlciBIYXNzZQo+PiBIYW5k
ZWxzcmVnaXN0ZXI6IEhSQiBTYWFyYnLDvGNrZW4gTnIuIDEzMjAxCj4+IFVzdC5JRCBOci46IERF
IDE1MzgwNzYyNwo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+PiBhdGgxMGsgbWFpbGluZyBsaXN0Cj4+IGF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCj4+
Cj4KPgo+IC0tCj4gQmVuIEdyZWVhciA8Z3JlZWFyYkBjYW5kZWxhdGVjaC5jb20+Cj4gQ2FuZGVs
YSBUZWNobm9sb2dpZXMgSW5jICBodHRwOi8vd3d3LmNhbmRlbGF0ZWNoLmNvbQo+Cj4KPgo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYXRoMTBrIG1h
aWxpbmcgbGlzdAo+IGF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hdGgxMGsK
