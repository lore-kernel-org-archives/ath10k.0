Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPofB-0002TZ-8s
 for ath10k@lists.infradead.org; Wed, 20 Jul 2016 10:23:38 +0000
Received: by mail-wm0-x22f.google.com with SMTP id f65so169532341wmi.0
 for <ath10k@lists.infradead.org>; Wed, 20 Jul 2016 03:23:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <b1cdb5c3-6ddb-8a69-d0f7-79d8e6ba23d0@dd-wrt.com>
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
 <CA+BoTQnN1EVGBu0J5Y7-z2=uqsG8rXS0Lvs7VAoeawv9MGuFyQ@mail.gmail.com>
 <b1cdb5c3-6ddb-8a69-d0f7-79d8e6ba23d0@dd-wrt.com>
From: Michal Kazior <michal.kazior@tieto.com>
Date: Wed, 20 Jul 2016 12:23:13 +0200
Message-ID: <CA+BoTQmrk_U8oVXxk-5hBz60=R-xR4H=2_x2pj9BVDYXPOoCGg@mail.gmail.com>
Subject: Re: rx rate issue
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
Cc: "Valo, Kalle" <kvalo@qca.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "nbd@nbd.name" <nbd@nbd.name>

T24gMjAgSnVseSAyMDE2IGF0IDEwOjUxLCBTZWJhc3RpYW4gR290dHNjaGFsbCA8cy5nb3R0c2No
YWxsQGRkLXdydC5jb20+IHdyb3RlOgo+IEhlbGxvCj4KPiB3aGlsZSBodW50aW5nIGEgbGluayBz
dGFiaWxpdHkgKHBhY2tldCB0cmFuc21pc3Npb24gc3RvcCkgaXNzdWUgaSBkaXNjb3ZlcmVkCj4g
YSBtYXliZSBjb3NtZXRpYywgYnV0IG1heWJlIGFscyBzZXJpb3VzIGlzc3VlLgo+IEFQIGlzIGEg
UUNBOTg4MCAzeDMgY2FyZCBjb25maWd1cmVkIGFzIFdEUyBBUAo+IFN0YXRpb24gaXMgYSBRQ0E5
ODgwIDJ4MiBjYXJkIGNvbmZpZ3VyZWQgYXMgV0RTIFNUQQo+Cj4gdGhlIFRYIHJhdGUgb2YgdGhl
IHN0YXRpb24gbWF0Y2hlcyB0byB0aGUgcnggcmF0ZSBvZiB0aGUgQVAuCj4gYnV0IHRoZSBSWCBy
YXRlIG9mIHRoZSBzdGF0aW9uIGlzIHdyb25nIGFzIGl0IHNlZW1zIHdoaWNoIG1heSBiZSBhIGNh
dXNlIG9mCj4gdGhlIGlzc3VlLgo+IGNvdWxkIHRoaXMgYmUgYSBmaXJtd2FyZSBidWcgb24gUUNB
OTg4MD8KPgo+IG91dHB1dCBvZiBmd19zdGF0cwo+Cj4gV0RTIEFQOgo+ICAgICAgICAgICAgICBQ
ZWVyIE1BQyBhZGRyZXNzIDQwOmE1OmVmOjg1OjRkOjZmCj4gICAgICAgICAgICAgICAgICAgICAg
UGVlciBSU1NJIDEyCj4gICAgICAgICAgICAgICAgICAgUGVlciBUWCByYXRlIDE3NTUwMAo+ICAg
ICAgICAgICAgICAgICAgIFBlZXIgUlggcmF0ZSAxNzU1MDAKPiAgICAgICAgICAgICAgIFBlZXIg
UlggZHVyYXRpb24gMAo+Cj4KPiBXRFMgU1RBOgo+ICAgICAgICAgICAgIFBlZXIgTUFDIGFkZHJl
c3MgNDA6YTU6ZWY6NTE6NDk6ZGIKPiAgICAgICAgICAgICAgICAgICAgICBQZWVyIFJTU0kgMTMK
PiAgICAgICAgICAgICAgICAgICBQZWVyIFRYIHJhdGUgMTc1NTAwCj4gICAgICAgICAgICAgICAg
ICAgUGVlciBSWCByYXRlIDM1MTAwMAo+ICAgICAgICAgICAgICAgUGVlciBSWCBkdXJhdGlvbiAw
CgpIbW0uLiBJbnRlcmVzdGluZy4gRldJVyB0aGVzZSBhcmUgImxhc3QgdHgvcnggcmF0ZSIuIFRo
aXMgaXNuJ3QKYXZlcmFnZSBub3IgYW55dGhpbmcgZmFuY3kgbGlrZSB0aGF0LgoKQ2FuIHlvdSBj
b21wYXJlIHRoYXQgdG8gYGl3IHdsYW5YIHN0YXRpb24gZHVtcGAsIHBsZWFzZT8gSXQgc2hvdWxk
CnJlcG9ydCBsYXN0IHJ4IGJpdHJhdGUgYXQgbGVhc3QgKHR4IGJpdHJhdGUgaXMgYnJva2VuIHNv
IGRvbid0IHJlbHkgb24KdGhhdCkuIFRoZSAxNzUuNSBhbmQgMzUxIHNlZW0gdG8gYmUgYm90aCB2
aHQgbWNzIGluZGV4PTQgYnV0IHdpdGgKZGlmZmVyZXQgbnNzIHZhbHVlcyAoMSBvciAyIHNwYXRp
YWwgc3RyZWFtcykuCgpJIGRvIHdvbmRlciBhdCB3aGF0IHJhdGUgZnJhbWVzIGFyZSBhY3R1YWxs
eSB0cmFuc21pdHRlZCBPVEEuCgpJcyB0aGlzIHJlcHJvZHVjaWJsZT8gQ2FuIHlvdSB0cnkgc2V0
dGluZyBhIGZpeGVkIHR4IGJpdHJhdGUgKGBpdwp3bGFuWCBzZXQgYml0cmF0ZXMgbGVnYWN5LTUg
aHQtbWNzIHZodC1tY3MgMTo0YCB0byBmb3JjZSB2aHQgbWNzPTQsCm5zcz0xKSB0byBzZWUgaWYg
aXQgbWFrZXMgYW55IGRpZmZlcmVuY2U/IFBlcmhhcHMgcmF0ZS1jb250cm9sIGFuZCB0eAp0cnkt
bGlzdC9zdGF0dXMgYXJlIG5vdCBwYXJzZWQgcHJvcGVybHkgKGZvciBzdGF0aXN0aWNhbCBwdXJw
b3NlcykgaW4KZmlybXdhcmUgd2hpY2ggZW5kcyB1cCB3aXRoIGludmFsaWQgcGVlci10eC1yYXRl
IG9uIFdEUyBBUC4KCgpNaWNoYcWCCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
