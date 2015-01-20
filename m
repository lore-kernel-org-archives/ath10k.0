Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x230.google.com ([2a00:1450:400c:c05::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YDV0C-00054M-L8
 for ath10k@lists.infradead.org; Tue, 20 Jan 2015 09:21:37 +0000
Received: by mail-wi0-f176.google.com with SMTP id em10so3643967wid.3
 for <ath10k@lists.infradead.org>; Tue, 20 Jan 2015 01:21:13 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAEFj984fjXUuRsNghr2Q4+397AS1TEO-K392YitUuZ5ztTF8iA@mail.gmail.com>
References: <54B97B96.4040903@darmstadt.freifunk.net>
 <1421658833-13311-1-git-send-email-michal.kazior@tieto.com>
 <54BDDB3B.3020902@candelatech.com>
 <CAEFj984fjXUuRsNghr2Q4+397AS1TEO-K392YitUuZ5ztTF8iA@mail.gmail.com>
Date: Tue, 20 Jan 2015 10:21:12 +0100
Message-ID: <CA+BoTQnjfsp3pjB4OyDvbqpQQ4TbYM+NHtTeNPCrgUJWfL-d+Q@mail.gmail.com>
Subject: Re: [RFC/RFT] ath10k: enable IBSS in multi-vif
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
To: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
Cc: Ben Greear <greearb@candelatech.com>, Martin Weinelt <martin@darmstadt.freifunk.net>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMjAgSmFudWFyeSAyMDE1IGF0IDEwOjE0LCBZZW9oIENodW4tWWVvdyA8eWVvaGNodW55ZW93
QGdtYWlsLmNvbT4gd3JvdGU6Cj4gRXhwZXJpZW5jZWQgZmlybXdhcmUgY3Jhc2hlZCBpbiA2MzYg
ZmlybXdhcmUgaW1tZWRpYXRlbHkgYWZ0ZXIKPiBicmluZ2luZyB1cCB0aGUgQVAgaW50ZXJmYWNl
Lgo+Cj4gVGhlIHBhcnRpYWwgbG9nIGlzIGxpc3RlZCBoZXJlOgpbLi4uXQo+IFsgIDI5MS4zODAw
MDBdIGF0aDEwa19wY2kgMDAwMDowMDowMC4wOiBmaXJtd2FyZSByZWdpc3RlciBkdW1wOgo+IFsg
IDI5MS4zODAwMDBdIGF0aDEwa19wY2kgMDAwMDowMDowMC4wOiBbMDBdOiAweDQxMDAwMTZDIDB4
MDAwMDAwMDAKPiAweDAwOUM0NTIxIDB4MDAwMDAwMDAKPiBbICAyOTEuMzkwMDAwXSBhdGgxMGtf
cGNpIDAwMDA6MDA6MDAuMDogWzA0XTogMHgwMDlDNDUyMSAweDAwMDYwMzMwCj4gMHgwMDAwMDAx
OSAweDAwOTU1QTAwCj4gWyAgMjkxLjQwMDAwMF0gYXRoMTBrX3BjaSAwMDAwOjAwOjAwLjA6IFsw
OF06IDB4MDAwNDZBNEUgMHgwMDAwMDAwMAo+IDB4MDA0MENDOTQgMHgwMDAwMDAyMAo+IFsgIDI5
MS40MTAwMDBdIGF0aDEwa19wY2kgMDAwMDowMDowMC4wOiBbMTJdOiAweDAwMDAwMDAwIDB4MDAw
MDAwMDAKPiAweDAwOTU4MzYwIDB4MDA5NTgzNkIKPiBbICAyOTEuNDIwMDAwXSBhdGgxMGtfcGNp
IDAwMDA6MDA6MDAuMDogWzE2XTogMHg4MDlBMDk3OCAweDAwNDBBRDk0Cj4gMHgwMDQzOTMwNCAw
eDAwNDBEMDc0Cj4gWyAgMjkxLjQyMDAwMF0gYXRoMTBrX3BjaSAwMDAwOjAwOjAwLjA6IFsyMF06
IDB4MDAwMEZGRkYgMHgwMDAwMDAwMAo+IDB4MDA0MUI2MTggMHgwMDAwMDAwMAo+IFsgIDI5MS40
MzAwMDBdIGF0aDEwa19wY2kgMDAwMDowMDowMC4wOiBbMjRdOiAweDgwOUEwOTc4IDB4MDA0MEFE
OTQKPiAweDAwNDM5MzA0IDB4MTFBOTNCNzcKPiBbICAyOTEuNDQwMDAwXSBhdGgxMGtfcGNpIDAw
MDA6MDA6MDAuMDogWzI4XTogMHg4MDlBRDFBMiAweDAwNDBBREU0Cj4gMHgwMDQzOTMwNCAweDAw
NDNGNjhDCj4gWyAgMjkxLjQ1MDAwMF0gYXRoMTBrX3BjaSAwMDAwOjAwOjAwLjA6IFszMl06IDB4
MDAwMDAwMDEgMHgwMDAwMDAwMAo+IDB4MDAwMDAwMDAgMHgwMDQzMEQ3NAo+IFsgIDI5MS40NjAw
MDBdIGF0aDEwa19wY2kgMDAwMDowMDowMC4wOiBbMzZdOiAweDAwMDAwMDAwIDB4MDAwMDAwMDAK
PiAweDAwMDAwMDAwIDB4MDAwMDAwMDAKPiBbICAyOTEuNDYwMDAwXSBhdGgxMGtfcGNpIDAwMDA6
MDA6MDAuMDogWzQwXTogMHgwMDAwMDAwMCAweDAwMDAwMDAwCj4gMHgwMDAwMDBBQiAweDAwNDEy
NzAwCj4gWyAgMjkxLjQ3MDAwMF0gYXRoMTBrX3BjaSAwMDAwOjAwOjAwLjA6IFs0NF06IDB4MDA0
MzlCQjggMHgwMDAwMDAwMAo+IDB4MDAwMDAwMDAgMHgwMDQwMDAwMAo+IFsgIDI5MS40ODAwMDBd
IGF0aDEwa19wY2kgMDAwMDowMDowMC4wOiBbNDhdOiAweDgwOUFFMEI0IDB4MDA0MEFFMDQKPiAw
eDAwNDAwMDAwIDB4MDA0M0Y2OEMKPiBbICAyOTEuNDkwMDAwXSBhdGgxMGtfcGNpIDAwMDA6MDA6
MDAuMDogWzUyXTogMHgwMDAwMDAwMSAweDAwMDAwMDAwCj4gMHgwMDQyMzFGMCAweDAwNDAwMDAw
Cj4gWyAgMjkxLjUwMDAwMF0gYXRoMTBrX3BjaSAwMDAwOjAwOjAwLjA6IFs1Nl06IDB4ODA5QUUx
N0UgMHgwMDQwQUU0NAo+IDB4MDA0MEZFNkMgMHgwMDQwRDMxMAoKWWVhaC4uIFRoaXMgaXMgbW9u
aXRvciB2ZGV2IHJlbGF0ZWQgY3Jhc2ggKGR1ZSB0byBicmlkZ2luZywgbm8/KS4gSQpoYXZlbid0
IGZvdW5kIGEgd2F5IGFyb3VuZCBpdC4KCgpNaWNoYcWCCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vYXRoMTBrCg==
