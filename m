Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPkyu-0007at-D6
 for ath10k@lists.infradead.org; Wed, 20 Jul 2016 06:27:45 +0000
Received: by mail-wm0-x22d.google.com with SMTP id o80so52404714wme.1
 for <ath10k@lists.infradead.org>; Tue, 19 Jul 2016 23:27:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAJ-Vmo=d=PgUu_AYT1C82AJcnUxKUo_VYMn_b1QF8M_T+5KpkA@mail.gmail.com>
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
 <CA+BoTQ=ehuXpcJUOeSscLKzX9T=hZyp5i2G9GoxTVX=LAg_4hA@mail.gmail.com>
 <CAJ-Vmo=d=PgUu_AYT1C82AJcnUxKUo_VYMn_b1QF8M_T+5KpkA@mail.gmail.com>
From: Michal Kazior <michal.kazior@tieto.com>
Date: Wed, 20 Jul 2016 08:27:22 +0200
Message-ID: <CA+BoTQnN1EVGBu0J5Y7-z2=uqsG8rXS0Lvs7VAoeawv9MGuFyQ@mail.gmail.com>
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

T24gMjAgSnVseSAyMDE2IGF0IDA4OjExLCBBZHJpYW4gQ2hhZGQgPGFkcmlhbkBmcmVlYnNkLm9y
Zz4gd3JvdGU6Cj4gSGksCj4KPiBUaGUgYXRoMTBrIG9uLWNoaXAgRE1BIGVuZ2luZSBvbmx5IGtu
b3dzIGhvdyB0byBhZGRyZXNzIHRoZSBsb3cgMzIKPiBiaXRzIG9mIHBoeXNpY2FsIGFkZHJlc3Mg
c3BhY2UuIEl0IGNhbid0IGRvIERNQSBlbHNld2hlcmUgd2l0aG91dCBhCj4gaGFyZHdhcmUgSU9N
TVUgaW4gdGhlIHN5c3RlbS4gRXZlbiB0aGVuLCBhcyBmYXIgYXMgdGhlIGRldmljZSBpcwo+IGNv
bmNlcm5lZCwgaXQncyBiZWluZyBnaXZlbiA8IDMyIGJpdCBwaHlzaWNhbCBtZW1vcnkgYWRkcmVz
c2VzIHRvIERNQQo+IGFyb3VuZC4KClN1cmUuIGF0aDEwayBldmVuIG1ha2VzIHN1cmUgdG8gdXNl
IDMyYml0IG1hc2sgZm9yIGRtYSAod2hpY2ggaXMKcmVkdW5kYW50IGJlY2F1c2UgaXQncyBhbHJl
YWR5IHRoZSBkZWZhdWx0IGluIGxpbnV4IHBjaSBzdWJzeXN0ZW0KYW55d2F5KS4KCgo+IFRoZSBs
b2NhbC9ob3N0IG1lbW9yeSBkZXNpZ25hdGlvbiBpcyBkaWZmZXJlbnQ7IElJUkMgd2hlbiB0aGUg
Q0UgaXMKPiBkb2luZyB0cmFuc2ZlcnMgYmV0d2VlbiBsb2NhbC9ob3N0IG1lbW9yeSBpdCdzIGV4
cGxpY2l0bHkgc2V0dXAgdG8gZG8KPiBzbyB3aGVuIHlvdSBzZXR1cCB0aGUgcmluZy90cmFuc2Zl
ci4gQnV0IHRob3NlIGFyZSBhbGwgMzIgYml0Cj4gYWRkcmVzc2VzIGFueXdheS4KCklzIENFIGlu
dm9sdmVkIGluIGRpcmVjdCBETUEgYWNjZXNzZXMgYXMgd2VsbD8gQW55d2F5IG15IGN1cnJlbnQK
c3VzcGljaW9uIHN0ZW1zIGZyb20gdGhpcyBjb2RlIGh1bmsgaW4gYXRoMTBrOgoKc3RhdGljIHUz
MiBhdGgxMGtfcGNpX3RhcmdfY3B1X3RvX2NlX2FkZHIoc3RydWN0IGF0aDEwayAqYXIsIHUzMiBh
ZGRyKQp7CiAgICAgICAgdTMyIHZhbCA9IDA7CgogICAgICAgIHN3aXRjaCAoYXItPmh3X3Jldikg
ewogICAgICAgIGNhc2UgQVRIMTBLX0hXX1FDQTk4OFg6CiAgICAgICAgY2FzZSBBVEgxMEtfSFdf
UUNBOTg4NzoKICAgICAgICBjYXNlIEFUSDEwS19IV19RQ0E2MTc0OgogICAgICAgIGNhc2UgQVRI
MTBLX0hXX1FDQTkzNzc6CiAgICAgICAgICAgICAgICB2YWwgPSAoYXRoMTBrX3BjaV9yZWFkMzIo
YXIsIFNPQ19DT1JFX0JBU0VfQUREUkVTUyArCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIENPUkVfQ1RSTF9BRERSRVNTKSAmCiAgICAgICAgICAgICAgICAgICAgICAg
MHg3ZmYpIDw8IDIxOwogICAgICAgICAgICAgICAgYnJlYWs7CiAgICAgICAgY2FzZSBBVEgxMEtf
SFdfUUNBOTg4ODoKICAgICAgICBjYXNlIEFUSDEwS19IV19RQ0E5OVgwOgogICAgICAgIGNhc2Ug
QVRIMTBLX0hXX1FDQTk5ODQ6CiAgICAgICAgY2FzZSBBVEgxMEtfSFdfUUNBNDAxOToKICAgICAg
ICAgICAgICAgIHZhbCA9IGF0aDEwa19wY2lfcmVhZDMyKGFyLCBQQ0lFX0JBUl9SRUdfQUREUkVT
Uyk7CiAgICAgICAgICAgICAgICBicmVhazsKICAgICAgICB9CgogICAgICAgIHZhbCB8PSAweDEw
MDAwMCB8IChhZGRyICYgMHhmZmZmZik7CiAgICAgICAgcmV0dXJuIHZhbDsKfQoKVGhpcyBpcyB1
c2VkIGZvciBDRSBkaWFnbm9zdGljIHdpbmRvdyBpbiBhdGgxMGsuIEhvd2V2ZXIgdGhlcmUgc2Vl
bXMKdG8gYmUgYSBjb3VudGVycGFydCAoQV9ETUFfQUREUi9BX0NQVV9BRERSKSBpbiBmaXJtd2Fy
ZSB0aGF0IGRvZXMKc29tZXRoaW5nIHNpbWlsYXIgYW5kIGRtYV9sb2NhbF9iaXRzIHNlZW0gdG8g
YmUgY29uc3RydWN0ZWQgaW4gYQpzaW1pbGFyIG1hbm5lciAoYXQgbGVhc3Qgb24gUUNBOTg4MCks
IGkuZS4gKCh4ID4+IDIxKSAmIDB4N2ZmKSA8PCAyMS4KClRoZSBRQ0E5OVgwIHNlZW1zIHRvIGRv
IGl0IHNsaWdodGx5IGRpZmZlcmVudGx5IChpbiBmaXJtd2FyZSBjb2RlIGFzCndlbGwpLiBQZXJo
YXBzIHRoZXJlJ3Mgc29tZSBraW5kIG9mIGJ1ZyBvciBhbiB1bmV4cGVjdGVkIG92ZXJsYXAgdGhh
dApjYXVzZSBhZGRyZXNzaW5nIHByb2JsZW1zPwoKCk1pY2hhxYIKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hdGgxMGsK
