Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nm.newmedia-net.de ([217.113.179.122]
 helo=webmail.newmedia-net.de)
 by casper.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPunJ-0005LA-W6
 for ath10k@lists.infradead.org; Wed, 20 Jul 2016 16:56:26 +0000
References: <20160614061728.570-1-rmanohar@qti.qualcomm.com>
 <1467218124941.40575@qti.qualcomm.com>
 <CA+BoTQkepLz55Vdr7OuMnPQPLKq_+vjZi=m2Y9rHLRgBZPsWOw@mail.gmail.com>
 <1468941948774.87860@qti.qualcomm.com>
 <CAJ-Vmon1duBNcWhjaNdANYFfd3hwQUYYHrmx7LRZvT-Ec2x1Cg@mail.gmail.com>
 <578E5AFA.4000908@candelatech.com>
 <CA+BoTQ=QMPUtY64ELCToZLcSrCPQdG=2Eg4FrsULeeDg9sFPYA@mail.gmail.com>
 <CAJ-Vmok95tiLzmnfiBnnOLQK9hXW2DfjPPVGy9yqucq32PBwJw@mail.gmail.com>
 <CA+BoTQ=ehuXpcJUOeSscLKzX9T=hZyp5i2G9GoxTVX=LAg_4hA@mail.gmail.com>
 <CAJ-Vmo=d=PgUu_AYT1C82AJcnUxKUo_VYMn_b1QF8M_T+5KpkA@mail.gmail.com>
 <CA+BoTQnN1EVGBu0J5Y7-z2=uqsG8rXS0Lvs7VAoeawv9MGuFyQ@mail.gmail.com>
 <b1cdb5c3-6ddb-8a69-d0f7-79d8e6ba23d0@dd-wrt.com>
 <CA+BoTQmrk_U8oVXxk-5hBz60=R-xR4H=2_x2pj9BVDYXPOoCGg@mail.gmail.com>
 <6487f1d3-339e-a6dd-d866-b11b37b4ddff@dd-wrt.com>
 <CA+BoTQ=yC7kN7ayWqZ9Y3SBL0jQZRkKMU2=T9Z21Vwxjp2m7uw@mail.gmail.com>
 <b08002e3-8f45-d6c2-607e-344fbddbd957@dd-wrt. com>
 <578FAA12.4020509@candelatech.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <5511d94c-3f25-a7e2-6724-2540d8cfa7f6@dd-wrt.com>
Date: Wed, 20 Jul 2016 18:50:45 +0200
MIME-Version: 1.0
In-Reply-To: <578FAA12.4020509@candelatech.com>
Subject: Re: rx rate issue
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Ben Greear <greearb@candelatech.com>, Michal Kazior <michal.kazior@tieto.com>
Cc: "Valo, Kalle" <kvalo@qca.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "nbd@nbd.name" <nbd@nbd.name>

QW0gMjAuMDcuMjAxNiB1bSAxODo0MiBzY2hyaWViIEJlbiBHcmVlYXI6Cj4KPgo+IE9uIDA3LzIw
LzIwMTYgMDQ6MTIgQU0sIFNlYmFzdGlhbiBHb3R0c2NoYWxsIHdyb3RlOgo+PiBBbSAyMC4wNy4y
MDE2IHVtIDEzOjAzIHNjaHJpZWIgTWljaGFsIEthemlvcjoKPgo+Pj4+Pj4gV0RTIEFQOgo+Pj4+
Pj4gICAgICAgICAgICAgICAgUGVlciBNQUMgYWRkcmVzcyA0MDphNTplZjo4NTo0ZDo2Zgo+Pj4+
Pj4gICAgICAgICAgICAgICAgICAgICAgICBQZWVyIFJTU0kgMTIKPj4+Pj4+ICAgICAgICAgICAg
ICAgICAgICAgUGVlciBUWCByYXRlIDE3NTUwMAo+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICBQ
ZWVyIFJYIHJhdGUgMTc1NTAwCj4+Pj4+PiAgICAgICAgICAgICAgICAgUGVlciBSWCBkdXJhdGlv
biAwCj4+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IFdEUyBTVEE6Cj4+Pj4+PiAgICAgICAgICAgICAgIFBl
ZXIgTUFDIGFkZHJlc3MgNDA6YTU6ZWY6NTE6NDk6ZGIKPj4+Pj4+ICAgICAgICAgICAgICAgICAg
ICAgICAgUGVlciBSU1NJIDEzCj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgIFBlZXIgVFggcmF0
ZSAxNzU1MDAKPj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgUGVlciBSWCByYXRlIDM1MTAwMAo+
Pj4+Pj4gICAgICAgICAgICAgICAgIFBlZXIgUlggZHVyYXRpb24gMAo+Pj4gWy4uLl0KPgo+IE9u
ZSB0aGluZywgaWYgeW91ciBzaWduYWwgaXMgcmVhbGx5IHRoaXMgaG90ICgtMTIsIC0xMyksIHRo
ZW4geW91IGFyZSAKPiBsaWtlbHkgb3Zlci1zYXR1cmF0aW5nCj4gdGhlIFJGIGxvZ2ljLiAgWW91
IG5vcm1hbGx5IGdldCBiZXN0IHJlc3VsdHMgYXQgYXJvdW5kIC00MCBzaWduYWwgCj4gbGV2ZWwu
Li4KdGhlIHBlZXIgc3NpZCBpcyBub3QgZGIuIGl0cyBtb3JlIGxpa2VsbHkgdGhlIHNuci4gYm90
aCBkZXZpY2VzIGhhdmUgMjAgCm1ldGVyIGRpc3RhbmNlIHdpdGggYSBicmljayB3YWxsIGluIGJl
dHdlZW4Kc28gaXRzIG5vdCBvdmVyIHNhdHVyYXRpbmcuIG1hYzgwMjExIHNob3dzIGFib3V0IC04
MSByc3NpIGFuZCAtOTUgbm9pc2UgCnJpZ2h0IG5vdyB3aXRoIGhlYXZ5IGZsdWN0dWF0aW9ucyB1
cCB0byAtNzAKPgo+IFRoYW5rcywKPiBCZW4KPgoKCi0tIApNaXQgZnJldW5kbGljaGVuIEdyw7xz
c2VuIC8gUmVnYXJkcwoKU2ViYXN0aWFuIEdvdHRzY2hhbGwgLyBDVE8KCk5ld01lZGlhLU5FVCBH
bWJIIC0gREQtV1JUCkZpcm1lbnNpdHo6ICBCZXJsaW5lciBSaW5nIDEwMSwgNjQ2MjUgQmVuc2hl
aW0KUmVnaXN0ZXJnZXJpY2h0OiBBbXRzZ2VyaWNodCBEYXJtc3RhZHQsIEhSQiAyNTQ3MwpHZXNj
aMOkZnRzZsO8aHJlcjogUGV0ZXIgU3RlaW5ow6R1c2VyLCBDaHJpc3RpYW4gU2NoZWVsZQpodHRw
Oi8vd3d3LmRkLXdydC5jb20KZW1haWw6IHMuZ290dHNjaGFsbEBkZC13cnQuY29tClRlbC46ICs0
OTYyNTEtNTgyNjUwIC8gRmF4OiArNDk2MjUxLTU4MjY1NjUKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vYXRoMTBrCg==
