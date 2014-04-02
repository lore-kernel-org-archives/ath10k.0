Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x229.google.com ([2a00:1450:400c:c05::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WVDIH-0000P5-EQ
 for ath10k@lists.infradead.org; Wed, 02 Apr 2014 05:00:58 +0000
Received: by mail-wi0-f169.google.com with SMTP id hm4so5851319wib.0
 for <ath10k@lists.infradead.org>; Tue, 01 Apr 2014 22:00:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <533ABB20.3000407@candelatech.com>
References: <533A0729.4030907@candelatech.com>
 <CA+BoTQm8YEaz7B0jF1GDQrfczEA3tToJPTMx0oS-oZpH25Rkrw@mail.gmail.com>
 <533ABB20.3000407@candelatech.com>
Date: Wed, 2 Apr 2014 07:00:32 +0200
Message-ID: <CA+BoTQkn92ZOYOx37WhYpNjr0eWCW_nGSMyVX5C1p1zKV=ZPpw@mail.gmail.com>
Subject: Re: More on ath10k_flush.
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

T24gMSBBcHJpbCAyMDE0IDE1OjEyLCBCZW4gR3JlZWFyIDxncmVlYXJiQGNhbmRlbGF0ZWNoLmNv
bT4gd3JvdGU6Cj4gT24gMDMvMzEvMjAxNCAxMDo0NCBQTSwgTWljaGFsIEthemlvciB3cm90ZToK
Pj4gT24gMSBBcHJpbCAyMDE0IDAyOjI0LCBCZW4gR3JlZWFyIDxncmVlYXJiQGNhbmRlbGF0ZWNo
LmNvbT4gd3JvdGU6CgpbLi4uXQoKPj4+IERvIHdlIG5lZWQgdG8gc29tZWhvdyBzaHV0IGRvd24g
YWxsIHR4IGxvZ2ljIGR1cmluZyB0aGUgYXRoMTBrX2ZsdXNoCj4+PiBzbyB0aGF0IChvdGhlcj8p
IHN0YXRpb25zIGNhbm5vdCB0cmFuc21pdD8KPj4KPj4KPj4gVGhpcyBzZWVtcyBzdHJhbmdlLiBk
cnZfZmx1c2goKSBpcyBjYWxsZWQgd2l0aCBhbGwgdHggcXVldWVzIGJlaW5nCj4+IHN0b3BwZWQg
aW4gbWFjODAyMTEgd2l0aCBJRUVFODAyMTFfUVVFVUVfU1RPUF9SRUFTT05fRkxVU0guIEkgZ3Vl
c3MKPj4geW91IGNhbiBzdGlsbCByZWNlaXZlIGEgZmV3IGZyYW1lcyAoZHVlIHRvIFNNUCB3aXRo
IG1hbnkgaW50ZXJmYWNlcyksCj4+IGJ1dCB0aGF0J3MgaXQgKGF0IG1vc3QgbnVtX2NwdXMtMSBJ
IGd1ZXNzKS4gWW91IHNob3VsZG4ndCBiZSBzZWVpbmcKPj4gNDAwMCBmcmFtZXMgYmVpbmcgcXVl
dWVkIHdoaWxlIHlvdSBmbHVzaC4KPgo+Cj4gU3Vic2VxdWVudCBkZWJ1Z2dpbmcgbWFrZXMgbWUg
dGhpbmsgdGhlIGV4dHJhIHBhY2tldHMgYXJlIG5vdCBjb21pbmcKPiBmcm9tIHRoZSB1cHBlciBz
dGFjay4gIFBvc3NpYmx5IHRoZXJlIGFyZSBhdGgxMGs8LT5maXJtd2FyZSBtYW5hZ2VtZW50Cj4g
bWVzc2FnZXMKPiBiZWluZyBxdWV1ZWQgb3Igc29tZXRoaW5nIGxpa2UgdGhhdD8KCmF0aDEwa19m
bHVzaCgpIHdhaXRzIG9ubHkgZm9yIEhUVCBUeC4gSXQgZG9lc24ndCBldmVuIHdhaXQgZm9yCm1h
bmFnZW1lbnQgVHggKGl0IHByb2JhYmx5IHNob3VsZC4uKS4KClRoZXJlJ3MgYSBsaW1pdCB0byB0
aGUgbnVtYmVyIG9mIG91dHN0YW5kaW5nIEhUVCBUeCByZXF1ZXN0cyAtIGl0IGlzCjE0MjQgKCtu
X2NwdXMgLSAxKS4gU28gaXQgaXMgcG9zc2libGUgdG8gc2VlIGF0IG1vc3QgdGhpcyBtdWNoIGZy
YW1lcwpiZWluZyBjb21wbGV0ZWQgd2hpbGUgd2FpdGluZyBmb3IgYSBmbHVzaC4KCgpNaWNoYcWC
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsg
bWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
