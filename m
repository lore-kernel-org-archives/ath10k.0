Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-it0-x234.google.com ([2607:f8b0:4001:c0b::234])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bRiM6-00017L-8q
 for ath10k@lists.infradead.org; Mon, 25 Jul 2016 16:03:47 +0000
Received: by mail-it0-x234.google.com with SMTP id f6so87810655ith.1
 for <ath10k@lists.infradead.org>; Mon, 25 Jul 2016 09:03:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <6234373a-8ad9-1aec-032e-6e07b1510ef4@dd-wrt.com>
References: <20160614061728.570-1-rmanohar@qti.qualcomm.com>
 <fa3eab06-28f0-e5d4-2e92-770134b49dfa@dd-wrt.com>
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
 <73ce025f-c583-a747-ee9a-91bbfba56ff4@dd-wrt.com>
 <579625AC.107@candelatech.com>
 <6234373a-8ad9-1aec-032e-6e07b1510ef4@dd-wrt.com>
From: Adrian Chadd <adrian@freebsd.org>
Date: Mon, 25 Jul 2016 09:03:24 -0700
Message-ID: <CAJ-Vmomr7DSCEA0-i3p=tc=Kh0xCQ-gK20_c7L_=WSTQ4PLRVw@mail.gmail.com>
Subject: Re: 9984 issues
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
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Cc: Ben Greear <greearb@candelatech.com>, Kalle Valo <kvalo@qca.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

aGVoLCBhZGRpbmcgIndkc2FwIiBhbmQgIndkc3N0YSIgaXMgYSBwcmV0dHkgYmlnIHBpZWNlIG9m
IGluZm9ybWF0aW9uLAp2ZXJzdXMgU1RBL0FQLgoKanVzdCBzYXlpbmchCgoKCi1hCgoKT24gMjUg
SnVseSAyMDE2IGF0IDA4OjA5LCBTZWJhc3RpYW4gR290dHNjaGFsbCA8cy5nb3R0c2NoYWxsQGRk
LXdydC5jb20+IHdyb3RlOgo+IEFtIDI1LjA3LjIwMTYgdW0gMTY6NDMgc2NocmllYiBCZW4gR3Jl
ZWFyOgo+Pgo+PiBPbiAwNy8yNS8yMDE2IDA3OjM3IEFNLCBTZWJhc3RpYW4gR290dHNjaGFsbCB3
cm90ZToKPj4+Cj4+PiBIZWxsbwo+Pj4KPj4+IGZpbmFsbHkgaSByZWNlaXZlZCA5OTg0IGRldmlj
ZXMgdG8gZm9sbG93IHVwIHdpdGggbXkgd29yayBvbiB2aHQxNjAuCj4+PiBidXQgdGhlIGJpZyBp
c3N1ZSBpcy4gdGhlIDk5ODQgd29ya3MgaW4gYXAgbW9kZSB3aXRoIGN1cnJlbnQgZmlybXdhcmUu
Cj4+PiBidXQgaW4gc3RhIG1vZGUgaXQgY3Jhc2hlcyBhZnRlciBzZWNvbmRzLCBubyBtYXR0ZXIg
d2hpY2ggb3BlcmF0aW9uIG1vZGUgaXMKPj4+IHVzZWQuCj4+PiBiZW4ncyBjdCBmaXJtd2FyZSBj
cmFzaGVzIGluIGFwIGFuZCBzdGEgbW9kZSwgc28gaSBwcmVmZXIgdG8gcnVuIHVzaW5nCj4+PiB0
aGUgb2ZmaWNhbCB2YXJpYW50LiBjYW4gc29tZW9uZSBoZWxwIGhlcmU/Cj4+Cj4+Cj4+IERvZXMg
aXQgY3Jhc2ggaWYgeW91IGNvbm5lY3QgdG8gYW4gQVAgd2l0aCA5OTgwIG9yIDk4ODA/ICBJIGFt
IGN1cmlvdXMgaWYKPj4gaXQgaXMgb25seSB3aXRoCj4+IDk5ODQgQVAgdGhhdCBjcmFzaGVzLiAg
SSBoYXZlIG9ubHkgb25lIDk5ODQgcmFkaW8gcmlnaHQgbm93LCBidXQgU1RBIG1vZGUKPj4gd2Fz
IHdvcmtpbmcgZm9yIG1lIGFnYWluc3QKPj4gOTk4MCBBUC4KPj4KPiBub3BlCj4gY3QgZmlybXdh
cmUgOTk4NCB3ZHNhcCAtPiB3ZHNzdGEgOTk4MCAtPiBhcCBjcmFzaCwgc3RhIG9rCj4gcWNhIGZp
cm13YXJlIDk5ODQgd2RzYXAgLT4gd2Rzc3RhIDk5ODAgLT4gYXAgbm8gY3Jhc2gsIHN0YSBvawo+
IGN0IGZpcm13YXJlIDk5ODQgd2RzYXAgLT4gd2Rzc3RhIG9yIHN0YSA5OTg0IC0+IHN0YSBjcmFz
aCAsIGFwIGNyYXNoCj4gcWNhIGZpcm13YXJlIDk5ODQgd2RzYXAgLT4gd2Rzc3RhIG9yIHN0YSA5
OTg0IC0+IHN0YSBjcmFzaCwgYXAgb2sgKGkgdGVzdGVkCj4gYm90aCBzdGEgYW5kIHdkc3N0YSkK
Pgo+PiBJIGFtIGp1c3QgZ2V0dGluZyBzdGFydGVkIG9uIHRoaXMsIHNvIGhvcGVmdWxseSBpdCB3
aWxsIGdldCBtb3JlIHN0YWJsZQo+PiBzb29uLi4uCj4+Cj4+IEFuZCBmb3IgdGhlIFFDQSBmaXJt
d2FyZSwgbWlnaHQgYmUgd29ydGggcG9zdGluZyBhIHN0YWNrIGR1bXAgZnJvbSB0aGUKPj4gZmly
bXdhcmUsCj4+IG1heWJlIHNvbWVvbmUgdGhlcmUgY2FuIGRlY29kZSBpdC4gIFVuZm9ydHVuYXRl
bHksIEkgY291bGQgbm90IGdldCBhCj4+IHVzZWZ1bCBkZWNvZGUKPj4gZnJvbSB0aGUgb25lIHlv
dSBzZW50IG1lIG9mIG15IGZpcm13YXJlLi4uCj4KPiBpIGp1c3Qgc2VuZGVkIHlvdSB5b3Vycy4g
c2VlbSB0byBiZSBtb3JlIHVzZWZ1bGwgc2luY2UgeW91IGNhbiBkZWNvZGUgaXQKPiB3aXRoIHlv
dXIgdG9vbHMKPj4KPj4KPj4gVGhhbmtzLAo+PiBCZW4KPj4KPj4+Cj4+PiBTZWJhc3RpYW4KPj4+
Cj4+Cj4+Cj4KPgo+IC0tCj4gTWl0IGZyZXVuZGxpY2hlbiBHcsO8c3NlbiAvIFJlZ2FyZHMKPgo+
IFNlYmFzdGlhbiBHb3R0c2NoYWxsIC8gQ1RPCj4KPiBOZXdNZWRpYS1ORVQgR21iSCAtIERELVdS
VAo+IEZpcm1lbnNpdHo6ICBCZXJsaW5lciBSaW5nIDEwMSwgNjQ2MjUgQmVuc2hlaW0KPiBSZWdp
c3RlcmdlcmljaHQ6IEFtdHNnZXJpY2h0IERhcm1zdGFkdCwgSFJCIDI1NDczCj4gR2VzY2jDpGZ0
c2bDvGhyZXI6IFBldGVyIFN0ZWluaMOkdXNlciwgQ2hyaXN0aWFuIFNjaGVlbGUKPiBodHRwOi8v
d3d3LmRkLXdydC5jb20KPiBlbWFpbDogcy5nb3R0c2NoYWxsQGRkLXdydC5jb20KPiBUZWwuOiAr
NDk2MjUxLTU4MjY1MCAvIEZheDogKzQ5NjI1MS01ODI2NTY1Cj4KPgo+Cj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhdGgxMGsgbWFpbGluZyBsaXN0
Cj4gYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEw
awo=
