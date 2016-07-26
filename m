Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bRzam-0002Ja-Bu
 for ath10k@lists.infradead.org; Tue, 26 Jul 2016 10:28:05 +0000
Received: by mail-wm0-x230.google.com with SMTP id f65so167967142wmi.0
 for <ath10k@lists.infradead.org>; Tue, 26 Jul 2016 03:27:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <fdb58430-e1a0-48e5-feb0-618d7bb77179@dd-wrt.com>
References: <20160614061728.570-1-rmanohar@qti.qualcomm.com>
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
 <CAJ-Vmomr7DSCEA0-i3p=tc=Kh0xCQ-gK20_c7L_=WSTQ4PLRVw@mail.gmail.com>
 <d5410503-fd51-5076-8236-c296346f5d7f@dd-wrt.com>
 <CAJ-VmokA_yNM-n+CsJgy+hVEAKCv8Kbn2EKvrKrUmabXs8=xCw@mail.gmail.com>
 <033c694a-b93e-d5fd-9930-8b69281d8b3d@dd-wrt.com>
 <5796CA3D.7010506@candelatech.com>
 <fdb58430-e1a0-48e5-feb0-618d7bb77179@dd-wrt.com>
From: Michal Kazior <michal.kazior@tieto.com>
Date: Tue, 26 Jul 2016 12:27:40 +0200
Message-ID: <CA+BoTQks2S+LM6izSxQ9mdCgt3DdMYY=o=+wwA7z4A0+vaN+kQ@mail.gmail.com>
Subject: Re: 9984 issues solution
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
Cc: Ben Greear <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Adrian Chadd <adrian@freebsd.org>, Kalle Valo <kvalo@qca.qualcomm.com>

T24gMjYgSnVseSAyMDE2IGF0IDExOjMxLCBTZWJhc3RpYW4gR290dHNjaGFsbCA8cy5nb3R0c2No
YWxsQGRkLXdydC5jb20+IHdyb3RlOgo+IGkgZm91bmQgdGhlIHJlYXNvbiBhbmQgdGhlIHNvbHV0
aW9uLiBpIGRpc2FibGVkIGFsbCBiZWFtZm9ybWluZyB2aHQgY2Fwcy4KPiB0aGlzIHdpbGwgcHJl
dmVudCB0aGUgZmlybXdhcmUgb2YgYmVlaW5nIGNyYXNoaW5nLgo+IHNvIGl0IHNlZW1zLCBiZWFt
Zm9ybWluZyBpcyByZXNwb25zaWJsZSBmb3IgaXQKPiBjb3VsZCB0aGUgZmlybXdhcmUgYmUgZml4
ZWQ/CgpUaGlzIHNvdW5kcyBhd2Z1bGx5IGZhbWlsaWFyLiBxY2E2MTc0IGh3LjIgZmlybXdhcmUg
aGFkIHRoaXMga2luZCBvZgpwcm9ibGVtIGF0IG9uZSBwb2ludCAtIGl0IHdvdWxkIGFkdmVydGlz
ZSB0eGJmIHN1cHBvcnQgZXZlbiB0aG91Z2ggaXQKbGFja2VkIGl0LiBJdCBjYXVzZWQgZmlybXdh
cmUgY3Jhc2hlcyB3aGVuZXZlciB5b3UgdHJpZWQgdG8gYXNzb2NpYXRlCnRvIGEgdHhiZiBjYXBh
YmxlIEFQLiBIb3dldmVyIHFjYTYxNzQgZmlybXdhcmUgaXMgdmVyeSBkaXN0aW5jdCBmcm9tCnFj
YTl4eHguCgpCdXQgbWF5YmUgaXQncyBqdXN0IGEgc2lsbHkgb3V0LW9mLWJvdW5kcyBvciBkZXJl
ZiBidWcgaW4gZmlybXdhcmUKdHhiZiBjb2RlLiBPciBtYXliZSB0aGUgdHhiZiB2ZGV2L3BlZXIg
cGFyYW0gQUJJIGhhcyBjaGFuZ2VkIGFuZAphdGgxMGsgc2V0cyBzb21ldGhpbmcgZWxzZSB0aGlu
a2luZyBpdCBpcyBjb25maWd1cmluZyB0eGJmLiBCZWF0cyBtZS4KCgpNaWNoYcWCCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBs
aXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
