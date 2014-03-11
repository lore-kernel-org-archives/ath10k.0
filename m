Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ob0-x232.google.com ([2607:f8b0:4003:c01::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNIBm-00043K-2L
 for ath10k@lists.infradead.org; Tue, 11 Mar 2014 08:37:31 +0000
Received: by mail-ob0-f178.google.com with SMTP id wp18so8139725obc.37
 for <ath10k@lists.infradead.org>; Tue, 11 Mar 2014 01:37:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87siqpi25u.fsf@kamboji.qca.qualcomm.com>
References: <CAHqTa-3o40ROJQ1=698CVMS=+nxNGT+i98nTU+sNBBG1fSHUzA@mail.gmail.com>
 <871tzq210z.fsf@kamboji.qca.qualcomm.com>
 <CAJ-VmomkfvaTm+=Du8FqCC=b=UG2d=8ixUK2tUsFj4_dsRL4Pg@mail.gmail.com>
 <CAHqTa-3O0_5OcTKNi0KLa--63ZYO4o7qK=VsN7Bsyi0nX+rF7g@mail.gmail.com>
 <CAHqTa-2kUJ1hrc8c2Kqy+cGexPJdisTMuUTH8WQ5KqV9qURwMw@mail.gmail.com>
 <871ty9jijp.fsf@kamboji.qca.qualcomm.com>
 <CAHqTa-135UdAuQ8AQZOEPqAfv2erkS-eSa1+T8skS5aMNHFp+g@mail.gmail.com>
 <CAJ-Vmo=AX9MzrCuwv_LMBkD6mT97S+c1K1cbLiJLKWx=2im5=A@mail.gmail.com>
 <87siqpi25u.fsf@kamboji.qca.qualcomm.com>
Date: Tue, 11 Mar 2014 09:37:03 +0100
Message-ID: <CA+BoTQ=YfA+G2D+V1R0UMubK-Gtvu2rWjKqM2p=WBJEU9S0-Wg@mail.gmail.com>
Subject: Re: ath10k driver crashes whenever firmware crashes on ARM SoC
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Adrian Chadd <adrian@freebsd.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Avery Pennarun <apenwarr@gmail.com>

T24gMTEgTWFyY2ggMjAxNCAwOToxMywgS2FsbGUgVmFsbyA8a3ZhbG9AcWNhLnF1YWxjb21tLmNv
bT4gd3JvdGU6Cj4gKEZpeGluZyB0b3AgcG9zdGluZykKPgo+IEFkcmlhbiBDaGFkZCA8YWRyaWFu
QGZyZWVic2Qub3JnPiB3cml0ZXM6Cj4KPj4gT24gMTEgTWFyY2ggMjAxNCAwMDo0MCwgQXZlcnkg
UGVubmFydW4gPGFwZW53YXJyQGdtYWlsLmNvbT4gd3JvdGU6Cj4+Cj4+PiBXZSBkbyBoYXZlIGEg
c2VwYXJhdGUgcmVzZXQgbGluZSBjb250cm9sbGVkIGJ5IGEgR1BJTy4gIFVzaW5nIHRoYXQKPj4+
IGNyYXNoZXMgdGhlIFNvQydzIFBDSWUgaG9zdCBpbXBsZW1lbnRhdGlvbiAod2hlZSEpLiAgQnV0
IEkgZ290IGhlbHAKPj4+IGZyb20gdGhlIFNvQyBtYW51ZmFjdHVyZXIgYW5kIHdhcyBhYmxlIHRv
IGdldCBzb21lIGluc3RydWN0aW9ucyBmb3IKPj4+IHJlc2V0dGluZyB0aGVpciBQQ0llIGhvc3Qg
Y29udHJvbGxlci4gIFdoZW4gSSBkbyBhbGwgdGhlIG1hZ2ljCj4+PiBpbmNhbnRhdGlvbnMgaW4g
dGhlIHJpZ2h0IG9yZGVyLCB0aGUgc3lzdGVtIGNhbiByZWNvdmVyLCBhbGJlaXQgd2l0aCBhCj4+
PiBmdWxseSByZXNldCBhdGgxMGsgY2hpcC4gIFRoaXMgd29ya2Fyb3VuZCBpcyB1bmZvcnR1bmF0
ZWx5IHNwZWNpZmljIHRvCj4+PiB0aGUgaG9zdCBkZXZpY2UgcGxhdGZvcm0gc28gaXQgd29uJ3Qg
ZG8geW91IG11Y2ggZ29vZC4KPj4KPj4gLi4uIGl0J3Mgbm90IGEgY29tcGxldGUgbG9zcyEKPj4K
Pj4gVGhpcyB0byBtZSBzYXlzICJ3ZSBuZWVkIGEgaG9vayBmcm9tIHRoZSBkcml2ZXIgdG8gY2Fs
bCB0aGUgaG9zdAo+PiAicmVzZXQgdGhlIGJ1cyIgdGhpbmciLgo+Pgo+PiBXZSBhbHNvIGtpbmRh
IG5lZWQgaXQgZm9yIGF0aDlrL2F0aDVrIChpZiBpdCdzIG5vdCB0aGVyZSkgc28gQUhCCj4+IGF0
dGFjaGVkIHRoaW5ncyBjYW4gYmUgcmVzZXQgYnkgYWN0dWFsbHkgcG9raW5nIGFuIFNvQyByZXNl
dCByZWdpc3Rlci4KPgo+IFllYWgsIHRoYXQga2luZCBvZiBob29rIHdvdWxkIGJlIGdvb2QgdG8g
aGF2ZS4KClRoZXJlIGlzIFBDSSBlcnJvciByZWNvdmVyeSBpbiBrZXJuZWwKKERvY3VtZW50YXRp
b24vUENJL3BjaS1lcnJvci1yZWNvdmVyeS50eHQpIGJ1dCBJIHRoaW5rIGl0J3Mgb25seQppbXBs
ZW1lbnRlZCBvbiBwcGMuIEkgd29uZGVyIGlmIHlvdSBjb3VsZCB0cnkgaG9va2luZyB1cCB3aXRo
IHRoYXQ/CgoKTWljaGHFggoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
