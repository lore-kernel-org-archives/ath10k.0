Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x231.google.com ([2a00:1450:400c:c09::231])
 by merlin.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPkeA-0003jC-GR
 for ath10k@lists.infradead.org; Wed, 20 Jul 2016 06:06:19 +0000
Received: by mail-wm0-x231.google.com with SMTP id o80so51835808wme.1
 for <ath10k@lists.infradead.org>; Tue, 19 Jul 2016 23:05:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAJ-Vmok95tiLzmnfiBnnOLQK9hXW2DfjPPVGy9yqucq32PBwJw@mail.gmail.com>
References: <20160614061728.570-1-rmanohar@qti.qualcomm.com>
 <e05dcb58-1cb1-a33a-31bb-b8ba1edf1363@dd-wrt.com>
 <fa3eab06-28f0-e5d4-2e92-770134b49dfa@dd-wrt.com>
 <1467218124941.40575@qti.qualcomm.com>
 <CA+BoTQkepLz55Vdr7OuMnPQPLKq_+vjZi=m2Y9rHLRgBZPsWOw@mail.gmail.com>
 <1468941948774.87860@qti.qualcomm.com>
 <CAJ-Vmon1duBNcWhjaNdANYFfd3hwQUYYHrmx7LRZvT-Ec2x1Cg@mail.gmail.com>
 <578E5AFA.4000908@candelatech.com>
 <CA+BoTQ=QMPUtY64ELCToZLcSrCPQdG=2Eg4FrsULeeDg9sFPYA@mail.gmail.com>
 <CAJ-Vmok95tiLzmnfiBnnOLQK9hXW2DfjPPVGy9yqucq32PBwJw@mail.gmail.com>
From: Michal Kazior <michal.kazior@tieto.com>
Date: Wed, 20 Jul 2016 08:05:49 +0200
Message-ID: <CA+BoTQ=ehuXpcJUOeSscLKzX9T=hZyp5i2G9GoxTVX=LAg_4hA@mail.gmail.com>
Subject: Re: [PATCH] ath10k: fix system hang at qca99x0 probe on x86 platform
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
Cc: Rajkumar Manoharan <rmanohar@codeaurora.org>, "Manoharan,
 Rajkumar" <rmanohar@qti.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "Valo,
 Kalle" <kvalo@qca.qualcomm.com>, Sebastian Gottschall <s.gottschall@dd-wrt.com>, Ben Greear <greearb@candelatech.com>, "nbd@nbd.name" <nbd@nbd.name>

T24gMjAgSnVseSAyMDE2IGF0IDA3OjQ0LCBBZHJpYW4gQ2hhZGQgPGFkcmlhbkBmcmVlYnNkLm9y
Zz4gd3JvdGU6Cj4gSGksCj4KPiBkbWEgY29oZXJlbnQgZG9lc24ndCAvaGF2ZS8gdG8gbWVhbiAi
bG93IDMyIGJpdHMiLiBJdCdzIGp1c3Qgc3VwcG9zZWQKPiB0byBtZWFuICJ0cnkgcmVhbGx5IGhh
cmQgdG8gdXNlIHVuY2FjaGVkIG1lbW9yeSBvbiBwbGF0Zm9ybXMgdGhhdAo+IHN1cHBvcnQgaXQu
IgoKR29vZCBwb2ludC4gTWF5YmUgaXQgZG9lcyBvbiB4ODYsIG9yIGF0IGxlYXN0IHNvbWUgbWFj
aGluZXMuCgpAQmVuOiBDYW4geW91IHZlcmlmeSBpZiB0aGF0J3MgdGhlIGNhc2UgZm9yIHlvdT8g
Q2FuIHlvdSBzZWUgd2hhdAphZGRyZXNzIHJhbmdlcyBob3N0bWVtIGNodW5rcyBnZXQgd2l0aCBh
bmQgd2l0aG91dCB0aGUgR0ZQX0RNQTMyIChhbmQKbWF5YmUgY29tcGFyZSBpdCBhZ2FpbnN0IGEg
cmV2ZXJ0IHRvIGNvbXBhcmUgdG8gZG1hLWNvaGVyZW50IGFzIHdlbGwpPwoKCj4gVGhlIGF0aDEw
ayBoYXJkd2FyZSAoYXQgbGVhc3Qgd2hhdCBJJ3ZlIHBsYXllZCB3aXRoIHRodXMgZmFyKSBpcyBh
bGwKPiAzMiBiaXQgRE1BIGhhcmR3YXJlLCBub3QgNjQgYml0LCBzbyBpdCBjYW4ndCBiZSBoYW5k
ZWQgNjQgYml0IG1lbW9yeSAtCj4gY29udGlndW91cyBvciBvdGhlcndpc2UuCj4KPiBTbywgaWYg
ZG1hIGNvaGVyZW50IG9uIGxpbnV4IG1lYW5zIDMyIGJpdCBvbmx5IHBoeXNtZW0sIGdyZWF0Lgo+
Cj4gTm93LCBpdCBhbHNvIHR1cm5zIG91dCB0aGF0IHZhcmlvdXMgcGxhdGZvcm1zIHRoYXQgc2F5
IHRoZXkgZG8KPiBjb2hlcmVudCBtZW1vcnkgdGhlc2UgZGF5cyBkbyAibW9zdGx5IGNvaGVyZW50
IiwgYW5kIHlvdSBzdGlsbCBuZWVkCj4gc29tZSBmbHVzaC9zeW5jIG9wcy4uCgpZZWFoLCBidXQg
c2luY2UgdGhlIGRldmljZSBoYXMgaXQncyBvd24gQ1BVIGFuZCBSQU0gaXQgaGFzIHRvIGhhdmUg
YQp3YXkgdG8gZGlzdGluZ3Vpc2ggbG9jYWwgYW5kIGhvc3QgbWVtb3J5IGluIHNvbWUgd2F5IHVz
aW5nIHRoZXNlIDMyCmJpdHMsIG5vPyAodGhpbmsgYWJvdXQgZmlybXdhcmUgZ2VuZXJhdGluZyBs
b2NhbCA4MDIuMTEgZnJhbWVzIHZzCnB1c2hpbmcgZnJhbWVzIGNvbWluZyBmcm9tIGhvc3QgZHJp
dmVyKQoKCk1pY2hhxYIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
